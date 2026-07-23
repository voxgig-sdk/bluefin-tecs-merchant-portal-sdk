-- Generated model-driven entity + direct tests.
{-# LANGUAGE ScopedTypeVariables #-}

module SdkGenTests (genTests) where

import Control.Exception (SomeException, try)
import Data.IORef

import VoxgigStruct (Value (..), emptyMap, keysof, ismap, islist, isNoval, clone)
import SdkTypes
import SdkHelpers
import qualified SdkFeatures as F
import qualified SdkClient as C
import qualified TReadmeExamples
import Testutil
import TestJson (jsonRead)

-- Load an entity fixture (../.sdk/test/entity/<name>/<Name>TestData.json).
loadFixture :: String -> IO Value
loadFixture entName = do
  -- The fixture DIRECTORY is the snake_case entity name (create_result), so a
  -- plain lowercase of the CamelCase entName (createresult) misses the
  -- underscores for multi-word entities. Convert CamelCase -> snake_case.
  let lname = camelToSnake entName
  raw <- readFile ("../.sdk/test/entity/" ++ lname ++ "/" ++ entName ++ "TestData.json")
  jsonRead raw
  where
    toLowerCh ch = if ch >= 'A' && ch <= 'Z' then toEnum (fromEnum ch + 32) else ch
    camelToSnake [] = []
    camelToSnake (c0 : rest) = toLowerCh c0 : go rest
    go [] = []
    go (c : cs)
      | c >= 'A' && c <= 'Z' = '_' : toLowerCh c : go cs
      | otherwise = c : go cs

-- The first new-ref data map for an entity (fixture.new.<entity>.<ref0>).
newRefData :: Value -> String -> IO Value
newRefData fixture entName = do
  newEnts <- getpathS fixture ("new." ++ entName)
  refs <- keysof newEnts
  case refs of
    [] -> emptyMap
    (r0 : _) -> do d <- getp newEnts r0; clone d

genTests :: Counters -> IO ()
genTests c = do
  TReadmeExamples.tests c
  merchant_portal_api_controllerInstanceTest c
  merchant_portal_api_controllerBasicTest c
  merchant_portal_api_controllerDirectTest c
  merchant_portal_common_controllerInstanceTest c
  merchant_portal_common_controllerBasicTest c
  merchant_portal_common_controllerDirectTest c
  merchant_portal_pam_contract_controllerInstanceTest c
  merchant_portal_pam_contract_controllerBasicTest c
  merchant_portal_pam_contract_controllerDirectTest c
  merchant_portal_pam_document_controllerInstanceTest c
  merchant_portal_pam_document_controllerBasicTest c
  merchant_portal_pam_document_controllerDirectTest c
  merchant_portal_pam_form_controllerInstanceTest c
  merchant_portal_pam_form_controllerBasicTest c
  merchant_portal_pam_form_controllerDirectTest c
  merchant_portal_pam_mandator_controllerInstanceTest c
  merchant_portal_pam_mandator_controllerBasicTest c
  merchant_portal_pam_mandator_controllerDirectTest c
  merchant_portal_pam_merchant_controllerInstanceTest c
  merchant_portal_pam_merchant_controllerBasicTest c
  merchant_portal_pam_merchant_controllerDirectTest c
  merchant_portal_pam_package_controllerInstanceTest c
  merchant_portal_pam_package_controllerBasicTest c
  merchant_portal_pam_package_controllerDirectTest c
  merchant_portal_pam_product_controllerInstanceTest c
  merchant_portal_pam_product_controllerBasicTest c
  merchant_portal_pam_product_controllerDirectTest c
  output_add_productInstanceTest c
  output_add_productBasicTest c
  output_add_productDirectTest c
  output_create_productInstanceTest c
  output_create_productBasicTest c
  output_create_productDirectTest c
  output_detailInstanceTest c
  output_detailBasicTest c
  output_detailDirectTest c
  output_listInstanceTest c
  output_listBasicTest c
  output_listDirectTest c
  output_messageInstanceTest c
  output_messageBasicTest c
  output_messageDirectTest c
  output_move_tidInstanceTest c
  output_move_tidBasicTest c
  output_move_tidDirectTest c
  output_remove_productInstanceTest c
  output_remove_productBasicTest c
  output_remove_productDirectTest c
  output_startInstanceTest c
  output_startBasicTest c
  output_startDirectTest c
  output_statusInstanceTest c
  output_statusBasicTest c
  output_statusDirectTest c
  output_update_productInstanceTest c
  output_update_productBasicTest c
  output_update_productDirectTest c

merchant_portal_api_controllerInstanceTest :: Counters -> IO ()
merchant_portal_api_controllerInstanceTest c = runTest c "merchant_portal_api_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_api_controller sdk VNoval
  pure (eName ent == "merchant_portal_api_controller")

merchant_portal_api_controllerBasicTest :: Counters -> IO ()
merchant_portal_api_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalApiController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_api_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_api_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_api_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_api_controllerDirectTest :: Counters -> IO ()
merchant_portal_api_controllerDirectTest c = runTest c "merchant_portal_api_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_api_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_common_controllerInstanceTest :: Counters -> IO ()
merchant_portal_common_controllerInstanceTest c = runTest c "merchant_portal_common_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_common_controller sdk VNoval
  pure (eName ent == "merchant_portal_common_controller")

merchant_portal_common_controllerBasicTest :: Counters -> IO ()
merchant_portal_common_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalCommonController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_common_controller.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_common_controller sdk VNoval
    entmap <- getp existing "merchant_portal_common_controller"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

merchant_portal_common_controllerDirectTest :: Counters -> IO ()
merchant_portal_common_controllerDirectTest c = runTest c "merchant_portal_common_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_common_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_pam_contract_controllerInstanceTest :: Counters -> IO ()
merchant_portal_pam_contract_controllerInstanceTest c = runTest c "merchant_portal_pam_contract_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_pam_contract_controller sdk VNoval
  pure (eName ent == "merchant_portal_pam_contract_controller")

merchant_portal_pam_contract_controllerBasicTest :: Counters -> IO ()
merchant_portal_pam_contract_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalPamContractController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_pam_contract_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_pam_contract_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_pam_contract_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_pam_contract_controllerDirectTest :: Counters -> IO ()
merchant_portal_pam_contract_controllerDirectTest c = runTest c "merchant_portal_pam_contract_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_pam_contract_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_pam_document_controllerInstanceTest :: Counters -> IO ()
merchant_portal_pam_document_controllerInstanceTest c = runTest c "merchant_portal_pam_document_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_pam_document_controller sdk VNoval
  pure (eName ent == "merchant_portal_pam_document_controller")

merchant_portal_pam_document_controllerBasicTest :: Counters -> IO ()
merchant_portal_pam_document_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalPamDocumentController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_pam_document_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_pam_document_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_pam_document_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_pam_document_controllerDirectTest :: Counters -> IO ()
merchant_portal_pam_document_controllerDirectTest c = runTest c "merchant_portal_pam_document_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_pam_document_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_pam_form_controllerInstanceTest :: Counters -> IO ()
merchant_portal_pam_form_controllerInstanceTest c = runTest c "merchant_portal_pam_form_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_pam_form_controller sdk VNoval
  pure (eName ent == "merchant_portal_pam_form_controller")

merchant_portal_pam_form_controllerBasicTest :: Counters -> IO ()
merchant_portal_pam_form_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalPamFormController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_pam_form_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_pam_form_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_pam_form_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_pam_form_controllerDirectTest :: Counters -> IO ()
merchant_portal_pam_form_controllerDirectTest c = runTest c "merchant_portal_pam_form_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_pam_form_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_pam_mandator_controllerInstanceTest :: Counters -> IO ()
merchant_portal_pam_mandator_controllerInstanceTest c = runTest c "merchant_portal_pam_mandator_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_pam_mandator_controller sdk VNoval
  pure (eName ent == "merchant_portal_pam_mandator_controller")

merchant_portal_pam_mandator_controllerBasicTest :: Counters -> IO ()
merchant_portal_pam_mandator_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalPamMandatorController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_pam_mandator_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_pam_mandator_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_pam_mandator_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_pam_mandator_controllerDirectTest :: Counters -> IO ()
merchant_portal_pam_mandator_controllerDirectTest c = runTest c "merchant_portal_pam_mandator_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_pam_mandator_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_pam_merchant_controllerInstanceTest :: Counters -> IO ()
merchant_portal_pam_merchant_controllerInstanceTest c = runTest c "merchant_portal_pam_merchant_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_pam_merchant_controller sdk VNoval
  pure (eName ent == "merchant_portal_pam_merchant_controller")

merchant_portal_pam_merchant_controllerBasicTest :: Counters -> IO ()
merchant_portal_pam_merchant_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalPamMerchantController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_pam_merchant_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_pam_merchant_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_pam_merchant_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_pam_merchant_controllerDirectTest :: Counters -> IO ()
merchant_portal_pam_merchant_controllerDirectTest c = runTest c "merchant_portal_pam_merchant_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_pam_merchant_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_pam_package_controllerInstanceTest :: Counters -> IO ()
merchant_portal_pam_package_controllerInstanceTest c = runTest c "merchant_portal_pam_package_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_pam_package_controller sdk VNoval
  pure (eName ent == "merchant_portal_pam_package_controller")

merchant_portal_pam_package_controllerBasicTest :: Counters -> IO ()
merchant_portal_pam_package_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalPamPackageController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_pam_package_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_pam_package_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_pam_package_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_pam_package_controllerDirectTest :: Counters -> IO ()
merchant_portal_pam_package_controllerDirectTest c = runTest c "merchant_portal_pam_package_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_pam_package_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

merchant_portal_pam_product_controllerInstanceTest :: Counters -> IO ()
merchant_portal_pam_product_controllerInstanceTest c = runTest c "merchant_portal_pam_product_controller.instance" $ do
  sdk <- C.testSdk0
  ent <- C.merchant_portal_pam_product_controller sdk VNoval
  pure (eName ent == "merchant_portal_pam_product_controller")

merchant_portal_pam_product_controllerBasicTest :: Counters -> IO ()
merchant_portal_pam_product_controllerBasicTest c = do
  fixture <- loadFixture "MerchantPortalPamProductController"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "merchant_portal_pam_product_controller.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.merchant_portal_pam_product_controller sdk VNoval
    d <- newRefData fixture "merchant_portal_pam_product_controller"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

merchant_portal_pam_product_controllerDirectTest :: Counters -> IO ()
merchant_portal_pam_product_controllerDirectTest c = runTest c "merchant_portal_pam_product_controller.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/merchant_portal_pam_product_controller/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_add_productInstanceTest :: Counters -> IO ()
output_add_productInstanceTest c = runTest c "output_add_product.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_add_product sdk VNoval
  pure (eName ent == "output_add_product")

output_add_productBasicTest :: Counters -> IO ()
output_add_productBasicTest c = do
  fixture <- loadFixture "OutputAddProduct"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_add_product.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_add_product sdk VNoval
    d <- newRefData fixture "output_add_product"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

output_add_productDirectTest :: Counters -> IO ()
output_add_productDirectTest c = runTest c "output_add_product.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_add_product/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_create_productInstanceTest :: Counters -> IO ()
output_create_productInstanceTest c = runTest c "output_create_product.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_create_product sdk VNoval
  pure (eName ent == "output_create_product")

output_create_productBasicTest :: Counters -> IO ()
output_create_productBasicTest c = do
  fixture <- loadFixture "OutputCreateProduct"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_create_product.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_create_product sdk VNoval
    d <- newRefData fixture "output_create_product"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

output_create_productDirectTest :: Counters -> IO ()
output_create_productDirectTest c = runTest c "output_create_product.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_create_product/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_detailInstanceTest :: Counters -> IO ()
output_detailInstanceTest c = runTest c "output_detail.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_detail sdk VNoval
  pure (eName ent == "output_detail")

output_detailBasicTest :: Counters -> IO ()
output_detailBasicTest c = do
  fixture <- loadFixture "OutputDetail"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_detail.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_detail sdk VNoval
    entmap <- getp existing "output_detail"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

output_detailDirectTest :: Counters -> IO ()
output_detailDirectTest c = runTest c "output_detail.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_detail/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_listInstanceTest :: Counters -> IO ()
output_listInstanceTest c = runTest c "output_list.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_list sdk VNoval
  pure (eName ent == "output_list")

output_listBasicTest :: Counters -> IO ()
output_listBasicTest c = do
  fixture <- loadFixture "OutputList"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_list.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_list sdk VNoval
    d <- newRefData fixture "output_list"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

output_listDirectTest :: Counters -> IO ()
output_listDirectTest c = runTest c "output_list.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_list/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_messageInstanceTest :: Counters -> IO ()
output_messageInstanceTest c = runTest c "output_message.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_message sdk VNoval
  pure (eName ent == "output_message")

output_messageBasicTest :: Counters -> IO ()
output_messageBasicTest c = do
  fixture <- loadFixture "OutputMessage"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_message.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_message sdk VNoval
    entmap <- getp existing "output_message"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

output_messageDirectTest :: Counters -> IO ()
output_messageDirectTest c = runTest c "output_message.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_message/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_move_tidInstanceTest :: Counters -> IO ()
output_move_tidInstanceTest c = runTest c "output_move_tid.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_move_tid sdk VNoval
  pure (eName ent == "output_move_tid")

output_move_tidBasicTest :: Counters -> IO ()
output_move_tidBasicTest c = do
  fixture <- loadFixture "OutputMoveTid"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_move_tid.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_move_tid sdk VNoval
    d <- newRefData fixture "output_move_tid"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

output_move_tidDirectTest :: Counters -> IO ()
output_move_tidDirectTest c = runTest c "output_move_tid.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_move_tid/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_remove_productInstanceTest :: Counters -> IO ()
output_remove_productInstanceTest c = runTest c "output_remove_product.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_remove_product sdk VNoval
  pure (eName ent == "output_remove_product")

output_remove_productBasicTest :: Counters -> IO ()
output_remove_productBasicTest c = do
  fixture <- loadFixture "OutputRemoveProduct"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_remove_product.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_remove_product sdk VNoval
    d <- newRefData fixture "output_remove_product"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

output_remove_productDirectTest :: Counters -> IO ()
output_remove_productDirectTest c = runTest c "output_remove_product.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_remove_product/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_startInstanceTest :: Counters -> IO ()
output_startInstanceTest c = runTest c "output_start.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_start sdk VNoval
  pure (eName ent == "output_start")

output_startBasicTest :: Counters -> IO ()
output_startBasicTest c = do
  fixture <- loadFixture "OutputStart"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_start.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_start sdk VNoval
    d <- newRefData fixture "output_start"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

output_startDirectTest :: Counters -> IO ()
output_startDirectTest c = runTest c "output_start.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_start/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_statusInstanceTest :: Counters -> IO ()
output_statusInstanceTest c = runTest c "output_status.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_status sdk VNoval
  pure (eName ent == "output_status")

output_statusBasicTest :: Counters -> IO ()
output_statusBasicTest c = do
  fixture <- loadFixture "OutputStatus"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_status.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_status sdk VNoval
    entmap <- getp existing "output_status"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

output_statusDirectTest :: Counters -> IO ()
output_statusDirectTest c = runTest c "output_status.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_status/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

output_update_productInstanceTest :: Counters -> IO ()
output_update_productInstanceTest c = runTest c "output_update_product.instance" $ do
  sdk <- C.testSdk0
  ent <- C.output_update_product sdk VNoval
  pure (eName ent == "output_update_product")

output_update_productBasicTest :: Counters -> IO ()
output_update_productBasicTest c = do
  fixture <- loadFixture "OutputUpdateProduct"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "output_update_product.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.output_update_product sdk VNoval
    d <- newRefData fixture "output_update_product"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

output_update_productDirectTest :: Counters -> IO ()
output_update_productDirectTest c = runTest c "output_update_product.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/output_update_product/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)
