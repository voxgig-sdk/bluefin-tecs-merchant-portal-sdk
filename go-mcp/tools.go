package main

import (
	"context"
	"encoding/json"
	"fmt"
	"strings"

	"github.com/google/jsonschema-go/jsonschema"
	"github.com/modelcontextprotocol/go-sdk/mcp"
	sdk "github.com/voxgig-sdk/bluefin-tecs-merchant-portal-sdk/go"
)

// LoadArgs is what an agent sends to bluefin-tecs-merchant-portal_load.
type LoadArgs struct {
	Entity string         `json:"entity" jsonschema:"one of: merchant_portal_common_controller | output_detail | output_message | output_status"`
	Query  map[string]any `json:"query" jsonschema:"match map naming the record, such as {\"id\":1}"`
}

func registerTools(server *mcp.Server, client *sdk.BluefinTecsMerchantPortalSDK) {
	mcp.AddTool(server, &mcp.Tool{
		Name:        "bluefin-tecs-merchant-portal_load",
		Description: "Load one record from BluefinTecsMerchantPortal. Args: entity, query (match map naming the record, such as {\"id\":1}). Returns the record as JSON.",
		Annotations: &mcp.ToolAnnotations{ReadOnlyHint: true},
		InputSchema: entitySchema[LoadArgs]("merchant_portal_common_controller", "output_detail", "output_message", "output_status"),
	}, func(ctx context.Context, req *mcp.CallToolRequest, args LoadArgs) (*mcp.CallToolResult, any, error) {
		return runOp(ctx, client, "load", args.Entity, args.Query)
	})
}

// entitySchema is the schema inferred from In, its entity limited to the
// entities the tool serves.
func entitySchema[In any](names ...string) *jsonschema.Schema {
	schema, err := jsonschema.For[In](nil)
	if err != nil {
		panic(err)
	}
	enum := make([]any, len(names))
	for i, name := range names {
		enum[i] = name
	}
	schema.Properties["entity"].Enum = enum
	return schema
}

func runOp(_ context.Context, client *sdk.BluefinTecsMerchantPortalSDK, op string, entity string, input map[string]any) (*mcp.CallToolResult, any, error) {
	ent, err := entityFor(client, entity)
	if err != nil {
		return toolError(err.Error())
	}

	var result any
	switch op {
	case "list":
		result, err = ent.List(input, nil)
	case "load":
		result, err = ent.Load(input, nil)
	case "create":
		result, err = ent.Create(input, nil)
	case "update":
		result, err = ent.Update(input, nil)
	case "patch":
		result, err = ent.Patch(input, nil)
	case "remove":
		result, err = ent.Remove(input, nil)
	default:
		return toolError(fmt.Sprintf("unknown op %q", op))
	}
	if err != nil {
		return toolError(err.Error())
	}

	// SDK returns *Entity wrappers; unwrap each via .Data() to get a
	// plain map[string]any (or []any of maps for list) suitable for
	// JSON marshalling.
	data := extractData(result)
	body, err := json.MarshalIndent(data, "", "  ")
	if err != nil {
		return toolError(fmt.Sprintf("marshal: %v", err))
	}
	return &mcp.CallToolResult{
		Content: []mcp.Content{
			&mcp.TextContent{Text: string(body)},
		},
	}, data, nil
}

// entityFor dispatches on the lowercase entity name. The generator
// emits one `case "<name>":` per entity defined in the SDK model.
func entityFor(client *sdk.BluefinTecsMerchantPortalSDK, name string) (sdk.BluefinTecsMerchantPortalEntity, error) {
	switch strings.ToLower(name) {
	case "merchant_portal_api_controller":
		return client.MerchantPortalApiController(nil), nil
	case "merchant_portal_common_controller":
		return client.MerchantPortalCommonController(nil), nil
	case "merchant_portal_pam_contract_controller":
		return client.MerchantPortalPamContractController(nil), nil
	case "merchant_portal_pam_document_controller":
		return client.MerchantPortalPamDocumentController(nil), nil
	case "merchant_portal_pam_form_controller":
		return client.MerchantPortalPamFormController(nil), nil
	case "merchant_portal_pam_mandator_controller":
		return client.MerchantPortalPamMandatorController(nil), nil
	case "merchant_portal_pam_merchant_controller":
		return client.MerchantPortalPamMerchantController(nil), nil
	case "merchant_portal_pam_package_controller":
		return client.MerchantPortalPamPackageController(nil), nil
	case "merchant_portal_pam_product_controller":
		return client.MerchantPortalPamProductController(nil), nil
	case "output_add_product":
		return client.OutputAddProduct(nil), nil
	case "output_create_product":
		return client.OutputCreateProduct(nil), nil
	case "output_detail":
		return client.OutputDetail(nil), nil
	case "output_list":
		return client.OutputList(nil), nil
	case "output_message":
		return client.OutputMessage(nil), nil
	case "output_move_tid":
		return client.OutputMoveTid(nil), nil
	case "output_remove_product":
		return client.OutputRemoveProduct(nil), nil
	case "output_start":
		return client.OutputStart(nil), nil
	case "output_status":
		return client.OutputStatus(nil), nil
	case "output_update_product":
		return client.OutputUpdateProduct(nil), nil
	}
	return nil, fmt.Errorf("unknown entity %q", name)
}

func extractData(x any) any {
	switch v := x.(type) {
	case sdk.Entity:
		return extractData(v.Data())
	case []any:
		out := make([]any, len(v))
		for i, e := range v {
			out[i] = extractData(e)
		}
		return out
	case map[string]any:
		out := make(map[string]any, len(v))
		for k, vv := range v {
			out[k] = extractData(vv)
		}
		return out
	}
	return x
}

func toolError(msg string) (*mcp.CallToolResult, any, error) {
	return &mcp.CallToolResult{
		IsError: true,
		Content: []mcp.Content{
			&mcp.TextContent{Text: msg},
		},
	}, nil, nil
}

// hint is an MCP annotation that defaults to true unless stated.
func hint(b bool) *bool {
	return &b
}
