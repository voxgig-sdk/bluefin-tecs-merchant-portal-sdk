package core

type BluefinTecsMerchantPortalError struct {
	IsBluefinTecsMerchantPortalError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewBluefinTecsMerchantPortalError(code string, msg string, ctx *Context) *BluefinTecsMerchantPortalError {
	return &BluefinTecsMerchantPortalError{
		IsBluefinTecsMerchantPortalError: true,
		Sdk:              "BluefinTecsMerchantPortal",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *BluefinTecsMerchantPortalError) Error() string {
	return e.Msg
}
