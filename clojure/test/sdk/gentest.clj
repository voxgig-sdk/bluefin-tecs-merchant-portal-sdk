;; BluefinTecsMerchantPortal SDK generated API tests.
(ns sdk.gentest
  (:require [sdk.api :as api]
            [sdk.config :as config]
            [sdk.testutil :as t]
            [clojure.string]
            [voxgig.struct :as vs]
            [sdk.entity.merchant_portal_api_controller :as e-merchant_portal_api_controller]
            [sdk.entity.merchant_portal_common_controller :as e-merchant_portal_common_controller]
            [sdk.entity.merchant_portal_pam_contract_controller :as e-merchant_portal_pam_contract_controller]
            [sdk.entity.merchant_portal_pam_document_controller :as e-merchant_portal_pam_document_controller]
            [sdk.entity.merchant_portal_pam_form_controller :as e-merchant_portal_pam_form_controller]
            [sdk.entity.merchant_portal_pam_mandator_controller :as e-merchant_portal_pam_mandator_controller]
            [sdk.entity.merchant_portal_pam_merchant_controller :as e-merchant_portal_pam_merchant_controller]
            [sdk.entity.merchant_portal_pam_package_controller :as e-merchant_portal_pam_package_controller]
            [sdk.entity.merchant_portal_pam_product_controller :as e-merchant_portal_pam_product_controller]
            [sdk.entity.output_add_product :as e-output_add_product]
            [sdk.entity.output_create_product :as e-output_create_product]
            [sdk.entity.output_detail :as e-output_detail]
            [sdk.entity.output_list :as e-output_list]
            [sdk.entity.output_message :as e-output_message]
            [sdk.entity.output_move_tid :as e-output_move_tid]
            [sdk.entity.output_remove_product :as e-output_remove_product]
            [sdk.entity.output_start :as e-output_start]
            [sdk.entity.output_status :as e-output_status]
            [sdk.entity.output_update_product :as e-output_update_product]))

(defn run [rec]
  (t/run-check rec "gen-exists-merchant_portal_api_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_api_controller sdk nil)) "merchant_portal_api_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_api_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_api_controller sdk nil)]
             (let [res (e-merchant_portal_api_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_api_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_api_controller/create (api/merchant_portal_api_controller client nil) (vs/jm "account_number" "x" "business_reg_number" "x" "city" "x" "country" "x" "currency" "x" "merchant_category_code" 1 "merchant_name" "x" "packageid" "x" "packageorderuuid" "x" "reason_deactivation" "x" "reason_reactivation" "x" "street" "x" "terminal_country_code" "x" "terminal_language_code" "x" "terminal_location" "x" "terminal_serial_number" "x" "terminalid" 1 "vu_nummer" "x" "zipcode" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-merchant_portal_common_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_common_controller sdk nil)) "merchant_portal_common_controller accessor present"))))
  (t/run-check rec "gen-exists-merchant_portal_pam_contract_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_contract_controller sdk nil)) "merchant_portal_pam_contract_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_contract_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_contract_controller sdk nil)]
             (let [res (e-merchant_portal_pam_contract_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_pam_contract_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_pam_contract_controller/create (api/merchant_portal_pam_contract_controller client nil) (vs/jm "language" 1 "productOrderUUID" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-merchant_portal_pam_document_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_document_controller sdk nil)) "merchant_portal_pam_document_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_document_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_document_controller sdk nil)]
             (let [res (e-merchant_portal_pam_document_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_pam_document_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_pam_document_controller/create (api/merchant_portal_pam_document_controller client nil) (vs/jm "appFormFieldDescUUID" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-merchant_portal_pam_form_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_form_controller sdk nil)) "merchant_portal_pam_form_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_form_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_form_controller sdk nil)]
             (let [res (e-merchant_portal_pam_form_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_pam_form_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_pam_form_controller/create (api/merchant_portal_pam_form_controller client nil) (vs/jm "appFormFieldsDescUUID" 1 "language" "x" "packageOrderUUID" "x" "reasonOfReopening" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-merchant_portal_pam_mandator_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_mandator_controller sdk nil)) "merchant_portal_pam_mandator_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_mandator_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_mandator_controller sdk nil)]
             (let [res (e-merchant_portal_pam_mandator_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_pam_mandator_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_pam_mandator_controller/create (api/merchant_portal_pam_mandator_controller client nil) (vs/jm "clientSecret" 1 "mandatorName" "x" "packageUUID" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-merchant_portal_pam_merchant_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_merchant_controller sdk nil)) "merchant_portal_pam_merchant_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_merchant_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_merchant_controller sdk nil)]
             (let [res (e-merchant_portal_pam_merchant_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_pam_merchant_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_pam_merchant_controller/create (api/merchant_portal_pam_merchant_controller client nil) (vs/jm "businessRegistrationNumber" 1 "companyName" "x" "corporateUUID" "x" "currency" "x" "email" "x" "language" "x" "login" "x" "mandator" "x" "merchantContractNumber" "x" "packageorderuuid" "x" "phoneNumber" "x" "productid_acquirer" "x" "vu_nummer" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-merchant_portal_pam_package_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_package_controller sdk nil)) "merchant_portal_pam_package_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_package_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_package_controller sdk nil)]
             (let [res (e-merchant_portal_pam_package_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_pam_package_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_pam_package_controller/create (api/merchant_portal_pam_package_controller client nil) (vs/jm "consumerUUID" 1 "language" "x" "packageUUID" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-merchant_portal_pam_product_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_product_controller sdk nil)) "merchant_portal_pam_product_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_product_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_product_controller sdk nil)]
             (let [res (e-merchant_portal_pam_product_controller/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-merchant_portal_pam_product_controller"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-merchant_portal_pam_product_controller/create (api/merchant_portal_pam_product_controller client nil) (vs/jm "consumerUUID" 1 "packageOrderUUID" "x" "productOrderUUID" "x" "productUUID" "x" "reason_decline" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_add_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_add_product sdk nil)) "output_add_product accessor present"))))
  (t/run-check rec "gen-smoke-output_add_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_add_product sdk nil)]
             (let [res (e-output_add_product/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-output_add_product"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_add_product/create (api/output_add_product client nil) (vs/jm "packageUUID" 1 "productUUIDs" "x" "responseCode" 1 "responseMessage" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_create_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_create_product sdk nil)) "output_create_product accessor present"))))
  (t/run-check rec "gen-smoke-output_create_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_create_product sdk nil)]
             (let [res (e-output_create_product/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-output_create_product"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_create_product/create (api/output_create_product client nil) (vs/jm "acquirerId" 1 "allowMultipleOrders" true "appFormTemplateName" "x" "contractNeeded" true "descriptionKey" "x" "nameKey" "x" "prescreeningAllowed" true "productName" "x" "responseCode" 1 "responseMessage" "x" "terminalTemplateName" "x" "vendorName" "x" "xmlTemplateFile" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_detail"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_detail sdk nil)) "output_detail accessor present"))))
  (t/run-check rec "gen-validate-output_detail"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_detail/load (api/output_detail client nil) (vs/jm "id" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_list"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_list sdk nil)) "output_list accessor present"))))
  (t/run-check rec "gen-smoke-output_list"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_list sdk nil)]
             (let [res (e-output_list/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-output_list"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_list/create (api/output_list client nil) (vs/jm "pagination" "x" "responseCode" "x" "responseMessage" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_message"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_message sdk nil)) "output_message accessor present"))))
  (t/run-check rec "gen-validate-output_message"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_message/load (api/output_message client nil) (vs/jm "id" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_move_tid"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_move_tid sdk nil)) "output_move_tid accessor present"))))
  (t/run-check rec "gen-smoke-output_move_tid"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_move_tid sdk nil)]
             (let [res (e-output_move_tid/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-output_move_tid"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_move_tid/create (api/output_move_tid client nil) (vs/jm "productOrderUUIDs" "x" "responseCode" "x" "responseMessage" "x" "targetPackageOrderUUID" "x" "targetProductOrderUUID" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_remove_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_remove_product sdk nil)) "output_remove_product accessor present"))))
  (t/run-check rec "gen-smoke-output_remove_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_remove_product sdk nil)]
             (let [res (e-output_remove_product/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-output_remove_product"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_remove_product/create (api/output_remove_product client nil) (vs/jm "packageUUID" 1 "productUUIDs" "x" "responseCode" 1 "responseMessage" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_start"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_start sdk nil)) "output_start accessor present"))))
  (t/run-check rec "gen-smoke-output_start"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_start sdk nil)]
             (let [res (e-output_start/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-output_start"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_start/create (api/output_start client nil) (vs/jm "id" 1 "responseCode" 1 "responseMessage" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_status"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_status sdk nil)) "output_status accessor present"))))
  (t/run-check rec "gen-validate-output_status"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_status/load (api/output_status client nil) (vs/jm "id" 1) nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-exists-output_update_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_update_product sdk nil)) "output_update_product accessor present"))))
  (t/run-check rec "gen-smoke-output_update_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_update_product sdk nil)]
             (let [res (e-output_update_product/create ent (vs/jm "name" "smoke") nil)
                   rec (if (map? res) ((:data-get res)) res)]
               ;; create resolves to the ENTITY; the record is data-get.
               (t/is-true (vs/ismap rec) "create resolves to an entity carrying a record")
               (t/is-true (some? (vs/getprop rec "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-validate-output_update_product"
    (fn [] (when (vs/getpath (config/make-config) "feature.validate")
             (let [client (api/test-sdk nil (vs/jm "feature" (vs/jm "validate" (vs/jm "active" true))))]
               (t/is-throws (fn [] (e-output_update_product/create (api/output_update_product client nil) (vs/jm "allowMultipleOrders" "x" "productUUID" "x" "responseCode" 1 "responseMessage" "x") nil))
                            "validate_failed" "validate refuses an invalid request")))))
  (t/run-check rec "gen-prepare-merchant_portal_common_controller"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/merchant_portal_common_controller" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-merchant_portal_common_controller"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/merchant_portal_common_controller" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-output_detail"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/output_detail" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-output_detail"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/output_detail" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-output_message"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/output_message" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-output_message"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/output_message" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (t/run-check rec "gen-prepare-output_status"
    (fn [] (let [client (api/make-sdk (vs/jm "base" "http://example.test"))
                 fetchdef (api/prepare client (vs/jm "path" "/api/output_status" "method" "GET"))]
             (t/is-true (vs/ismap fetchdef) "prepare returns a fetchdef map")
             (t/is-some (vs/getprop fetchdef "url") "fetchdef carries a url")
             (t/is-eq (vs/getprop fetchdef "method") "GET" "fetchdef preserves the method"))))
  (t/run-check rec "gen-direct-output_status"
    (fn [] (let [fetch (fn [_url _fetchdef]
                         [(vs/jm "status" 200 "statusText" "OK" "headers" (vs/jm)
                                 "json" (fn [] (vs/jm "id" "d1"))) nil])
                 client (api/make-sdk (vs/jm "base" "http://example.test"
                                             "system" (vs/jm "fetch" fetch)))
                 result (api/direct client (vs/jm "path" "/api/output_status" "method" "GET"))]
             (t/is-true (vs/ismap result) "direct returns a result map")
             (t/is-true (vs/getprop result "ok") "direct 200 => ok true")
             (t/is-eq (vs/getprop result "status") 200 "direct surfaces the status"))))
  (letfn [(fence-pat [] (re-pattern (apply str (repeat 3 (char 96)))))
          (fence-count [text] (count (re-seq (fence-pat) text)))
          (clj-blocks [text]
            (let [parts (clojure.string/split text (fence-pat))]
              (->> parts
                   (map-indexed vector)
                   (filter (fn [[i _]] (odd? i)))
                   (map (fn [[_ seg]] seg))
                   (filter (fn [seg]
                             (= "clojure"
                                (clojure.string/trim (first (clojure.string/split-lines seg))))))
                   (map (fn [seg]
                          (clojure.string/join "\n"
                            (rest (clojure.string/split-lines seg))))))))]
    (doseq [[label path] [["root-README" "../README.md"]
                          ["README" "README.md"]
                          ["REFERENCE" "REFERENCE.md"]]]
      (t/run-check rec (str "gen-readme-examples-" label)
        (fn []
          (if-not (.exists (java.io.File. ^String path))
            (t/is-true true (str label " absent (skipped)"))
            (let [text (slurp path)]
              ;; A code fence opened but never closed leaves an ODD number of
              ;; fence markers; the split-on-fence then captures the trailing
              ;; prose (everything after the last opener) as if it were a
              ;; clojure block, which can parse cleanly and pass silently. Fail
              ;; on the malformed doc instead. (Count markers directly rather
              ;; than split parts: split drops trailing empty segments, so a
              ;; closing fence at EOF would be miscounted.)
              (t/is-true (even? (fence-count text))
                         (str label " code fences balanced (no unclosed fence)"))
              (let [blocks (clj-blocks text)]
                (doseq [b blocks]
                  (binding [*read-eval* false]
                    (read-string (str "[\n" b "\n]"))))
                (t/is-true true (str label " clojure blocks parse cleanly")))))))))
  nil)
