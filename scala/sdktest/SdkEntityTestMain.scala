// Aggregating entry point for the generated per-entity SDK tests. Drives
// every <Entity>EntityTest / <Entity>DirectTest object through one shared
// SdkTestReport and exits non-zero on any failure.
// Run: scala-cli run . --main-class SdkEntityTestMain

object SdkEntityTestMain {

  def main(args: Array[String]): Unit = {
    val rep = new SdkTestReport()

    MerchantPortalApiControllerEntityTest.run(rep)
    MerchantPortalCommonControllerEntityTest.run(rep)
    MerchantPortalCommonControllerDirectTest.run(rep)
    MerchantPortalPamContractControllerEntityTest.run(rep)
    MerchantPortalPamDocumentControllerEntityTest.run(rep)
    MerchantPortalPamFormControllerEntityTest.run(rep)
    MerchantPortalPamMandatorControllerEntityTest.run(rep)
    MerchantPortalPamMerchantControllerEntityTest.run(rep)
    MerchantPortalPamPackageControllerEntityTest.run(rep)
    MerchantPortalPamProductControllerEntityTest.run(rep)
    OutputAddProductEntityTest.run(rep)
    OutputCreateProductEntityTest.run(rep)
    OutputDetailEntityTest.run(rep)
    OutputDetailDirectTest.run(rep)
    OutputListEntityTest.run(rep)
    OutputMessageEntityTest.run(rep)
    OutputMessageDirectTest.run(rep)
    OutputMoveTidEntityTest.run(rep)
    OutputRemoveProductEntityTest.run(rep)
    OutputStartEntityTest.run(rep)
    OutputStatusEntityTest.run(rep)
    OutputStatusDirectTest.run(rep)
    OutputUpdateProductEntityTest.run(rep)

    ReadmeExamplesTest.run(rep)

    rep.finish("ENTITY")
  }
}
