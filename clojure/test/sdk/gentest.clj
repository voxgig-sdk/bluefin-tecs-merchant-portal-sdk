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
             (let [res (e-merchant_portal_api_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-merchant_portal_common_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_common_controller sdk nil)) "merchant_portal_common_controller accessor present"))))
  (t/run-check rec "gen-exists-merchant_portal_pam_contract_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_contract_controller sdk nil)) "merchant_portal_pam_contract_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_contract_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_contract_controller sdk nil)]
             (let [res (e-merchant_portal_pam_contract_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-merchant_portal_pam_document_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_document_controller sdk nil)) "merchant_portal_pam_document_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_document_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_document_controller sdk nil)]
             (let [res (e-merchant_portal_pam_document_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-merchant_portal_pam_form_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_form_controller sdk nil)) "merchant_portal_pam_form_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_form_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_form_controller sdk nil)]
             (let [res (e-merchant_portal_pam_form_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-merchant_portal_pam_mandator_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_mandator_controller sdk nil)) "merchant_portal_pam_mandator_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_mandator_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_mandator_controller sdk nil)]
             (let [res (e-merchant_portal_pam_mandator_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-merchant_portal_pam_merchant_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_merchant_controller sdk nil)) "merchant_portal_pam_merchant_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_merchant_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_merchant_controller sdk nil)]
             (let [res (e-merchant_portal_pam_merchant_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-merchant_portal_pam_package_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_package_controller sdk nil)) "merchant_portal_pam_package_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_package_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_package_controller sdk nil)]
             (let [res (e-merchant_portal_pam_package_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-merchant_portal_pam_product_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/merchant_portal_pam_product_controller sdk nil)) "merchant_portal_pam_product_controller accessor present"))))
  (t/run-check rec "gen-smoke-merchant_portal_pam_product_controller"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/merchant_portal_pam_product_controller sdk nil)]
             (let [res (e-merchant_portal_pam_product_controller/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-output_add_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_add_product sdk nil)) "output_add_product accessor present"))))
  (t/run-check rec "gen-smoke-output_add_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_add_product sdk nil)]
             (let [res (e-output_add_product/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-output_create_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_create_product sdk nil)) "output_create_product accessor present"))))
  (t/run-check rec "gen-smoke-output_create_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_create_product sdk nil)]
             (let [res (e-output_create_product/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-output_detail"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_detail sdk nil)) "output_detail accessor present"))))
  (t/run-check rec "gen-exists-output_list"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_list sdk nil)) "output_list accessor present"))))
  (t/run-check rec "gen-smoke-output_list"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_list sdk nil)]
             (let [res (e-output_list/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-output_message"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_message sdk nil)) "output_message accessor present"))))
  (t/run-check rec "gen-exists-output_move_tid"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_move_tid sdk nil)) "output_move_tid accessor present"))))
  (t/run-check rec "gen-smoke-output_move_tid"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_move_tid sdk nil)]
             (let [res (e-output_move_tid/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-output_remove_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_remove_product sdk nil)) "output_remove_product accessor present"))))
  (t/run-check rec "gen-smoke-output_remove_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_remove_product sdk nil)]
             (let [res (e-output_remove_product/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-output_start"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_start sdk nil)) "output_start accessor present"))))
  (t/run-check rec "gen-smoke-output_start"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_start sdk nil)]
             (let [res (e-output_start/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
  (t/run-check rec "gen-exists-output_status"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_status sdk nil)) "output_status accessor present"))))
  (t/run-check rec "gen-exists-output_update_product"
    (fn [] (let [sdk (api/test-sdk nil nil)]
             (t/is-true (some? (api/output_update_product sdk nil)) "output_update_product accessor present"))))
  (t/run-check rec "gen-smoke-output_update_product"
    (fn [] (let [sdk (api/test-sdk nil nil)
                 ent (api/output_update_product sdk nil)]
             (let [res (e-output_update_product/create ent (vs/jm "name" "smoke") nil)]
               (t/is-true (vs/ismap res) "create returns a record map")
               (t/is-true (some? (vs/getprop res "id")) "created record has an id"))
             )))
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
  (letfn [(clj-blocks [text]
            (let [fence (apply str (repeat 3 (char 96)))
                  parts (clojure.string/split text (re-pattern fence))]
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
            (let [blocks (clj-blocks (slurp path))]
              (doseq [b blocks]
                (binding [*read-eval* false]
                  (read-string (str "[\n" b "\n]"))))
              (t/is-true true (str label " clojure blocks parse cleanly"))))))))
  nil)
