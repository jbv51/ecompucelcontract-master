


import 'Utils.dart';

enum Clients {
  FarmerERPDevelopment,
  FarmerERPTest,
  ANJOUFRUITSUAT,
  AKF_TEST,
  FARMERPPlantationandfarmpack,
  FarmERPASAIndiaTest,
  FarmERPGlobalSeedsLtdTest,
  FarmERPBonataEnterprisesPL,
  FarmERPBonataTest,
  FarmERPHLHalls,
  ECOZENSOLUTIONS,
  ECOZENSOLUTIONSTEST,
  FarmERPVITTHALGANGATest,
  FarmERPRALLUVIALAGRICULTURE,
  FarmERPContractfarmingPack,
  FarmERPE20InvestmentsLtdTest,
  FarmERPFoodAfricaOperation,
  FarmERPUrbanFarm,
  FarmERPThaiWah,
  VUGARQUADMULLA,
  VUGARQUADMULLATEST,
  inifarmsinternal,
  MLR_FORESTAL,
  FarmERP_CHILE,
  BENGALSEEDS,
  VARDHAN_AGROTECH,
  GOURMET_POPCORNICA_LLP,
  TRIANGLE_FARMS_TEST,
  TRIANGLE_FARMS,
  FarmERPUrbanFarmTest,
  FarmERPHallsTest,
  E20,
  AKF_UAT,
  Testlink,
  TestlinkMapModule,
  ANJOUFRUITS,
  FarmERPASAIndia,
  FarmERPGlobalSeedsLtd,
  FarmERPVITTHALGANGA,
  NehadAgroTEST,
  FarmizoReboot,
  AlMayya,
  AlMayyaTEST
}

class ApiUtils {
  static final String farmerp_download = "FarmERP/Downloads";
  static final String BASE_URL_DOWNLOAD = "WebServices/DownXML/";
  static String ClientID = "";
  static bool isMulClient = false;

  //APK_TYPE = 1 Standard , =2 Contract Farming
  static final int APK_TYPE = 1;
//change link from here
  static Clients client = Clients.FarmerERPTest;

  static String getMainLink({bool linkOnly}) {
    if (linkOnly == null) linkOnly = false;

    if (isMulClient)
      switch (ClientID.toUpperCase()) {
        // case "ANJLIVE":
        //   client = Clients.ANJOUFRUITS;
        //   break;
        case "ANJUAT":
          client = Clients.ANJOUFRUITSUAT;
          break;
        case "DEVELOPMENT":
          client = Clients.FarmerERPDevelopment;
          break;
        case "AKFTEST":
          client = Clients.AKF_TEST;
          break;

        case "TEST":
          client = Clients.FarmerERPTest;
          break;
        // case "E20LIVE":
        //   client = E20;
        //   break;
        case "PNFTEST":
          client = Clients.FARMERPPlantationandfarmpack;
          break;
        // case "ASAI":
        //   client = FarmERPASAIndia;
        //   break;
        case "ASAITEST":
          client = Clients.FarmERPASAIndiaTest;
          break;
        // case "GSLIVE":
        //   client = FarmERPGlobalSeedsLtd;
        //   break;
        case "FarmERPGlobalSeedsLtdTest":
          client = Clients.FarmERPGlobalSeedsLtdTest;
          break;
        case "GSTEST":
          client = Clients.FarmERPGlobalSeedsLtdTest;
          break;
        case "BONATALIVE":
          client = Clients.FarmERPBonataEnterprisesPL;
          break;
        case "BONATATEST":
          client = Clients.FarmERPBonataTest;
          break;
        case "HALLSTEST":
          client = Clients.FarmERPHLHalls;
          break;
        case "ECOZEN":
          client = Clients.ECOZENSOLUTIONS;
          break;
        case "ECOZENTEST":
          client = Clients.ECOZENSOLUTIONSTEST;
          break;
        case "HALLS":
          client = Clients.FarmERPHLHalls;
          break;
          // case "VITTHALGANGA":
          //   client = FarmERPVITTHALGANGA;
          break;
        case "VITTHALGANGATEST":
          client = Clients.FarmERPVITTHALGANGATest;
          break;
        case "RALLUVIALAGRICULTURE":
          client = Clients.FarmERPRALLUVIALAGRICULTURE;
          break;
        case "PACK":
          client = Clients.FarmERPContractfarmingPack;
          break;
        case "E20INVESTMENTSLTDTEST":
          client = Clients.FarmERPE20InvestmentsLtdTest;
          break;
        case "FOODAFRICAOPERATION":
          client = Clients.FarmERPFoodAfricaOperation;
          break;
        case "URBANFARM":
          client = Clients.FarmERPUrbanFarm;
          break;
        case "THAIWAH":
          client = Clients.FarmERPThaiWah;
          break;
        case "VUGARQUADMULLA":
          client = Clients.VUGARQUADMULLA;
          break;
        case "VUGARQUADMULLATEST":
          client = Clients.VUGARQUADMULLATEST;
          break;
        case "inifarmsinternal":
          client = Clients.inifarmsinternal;
          break;
        case "MLR_FORESTAL":
          client = Clients.MLR_FORESTAL;
          break;
        case "FarmERP_CHILE":
          client = Clients.FarmERP_CHILE;
          break;
        case "BENGALSEEDS":
          client = Clients.BENGALSEEDS;
          break;
        case "VARDHAN_AGROTECH":
          client = Clients.VARDHAN_AGROTECH;
          break;
        case "GOURMET_POPCORNICA_LLP":
          client = Clients.GOURMET_POPCORNICA_LLP;
          break;
        case "TRIANGLE_FARMS_TEST":
          client = Clients.TRIANGLE_FARMS_TEST;
          break;
        case "TRIANGLE_FARMS":
          client = Clients.TRIANGLE_FARMS;
          break;
        case "FarmERPUrbanFarmTest":
          client = Clients.FarmERPUrbanFarmTest;
          break;
          case "FarmERPHallsTest":
          client = Clients.FarmERPHallsTest;
          break;
          case "AlMayyaTEST":
          client = Clients.AlMayyaTEST;
          break;
        // default:
        //   client = "";
        //   break;
      }

    String link = "";
    switch (client) {
      case Clients.FarmerERPDevelopment:
        return linkOnly
            ? "http://online3.farmerp.com/FarmERPContractFarmingMobileTest/"
            : "http://online3.farmerp.com/FarmERPContractFarmingMobileTest/api/";

      case Clients.AKF_TEST:
        link = "http://192.168.0.114/FarmERPAKF/api/";
        break;
      case Clients.AKF_UAT:
        link = "https://online.farmerp.com/ANILKRISHIUAT/api/";
        break;
      case Clients.Testlink:
        link = "http://3.6.238.135/Farmizo/api/";
        break;
      case Clients.FarmerERPTest:
        link = "http://115.112.181.13/FarmERPTest/api/";
        break;
      case Clients.TestlinkMapModule:
        link = "http://115.112.181.13/FarmERPRebootMap/api/";
        break;
      case Clients.ANJOUFRUITS:
        link = "https://anjoufruits.farmerp.com/api/";
        break;
      case Clients.ANJOUFRUITSUAT:
        link = "https://online3.farmerp.com/FarmERPANJOUFRUITSUAT/api/";
        break;
      case Clients.E20:
        link = "https://e20.farmerp.com/api/";
        break;
      case Clients.FARMERPPlantationandfarmpack:
        link = "https://demo.farmerp.com/FARMERPPlantationandfarmpack/api/";
        break;
      case Clients.ECOZENSOLUTIONS:
        link = "http://online2.farmerp.com/FarmERPEcozenSolution/api/";
        break;
      case Clients.ECOZENSOLUTIONSTEST:
        link = "https://online2.farmerp.com/FarmERPEcozenSolutionTest/api/";
        break;
      case Clients.FarmERPASAIndia:
        link = "https://demo.farmerp.com/FarmERPASAIndia/api/";
        break;
      case Clients.FarmERPASAIndiaTest:
        link = "https://demo.farmerp.com/FarmERPASAIndiaTest/api/";
        break;
      case Clients.FarmERPGlobalSeedsLtd:
        link = "https://demo.farmerp.com/FarmERPGlobalSeedsLtd/api/";
        break;
      case Clients.FarmERPGlobalSeedsLtdTest:
        link = "https://demo.farmerp.com/FarmERPGlobalSeedsLtdTest/api/";
        break;
      case Clients.FarmERPBonataEnterprisesPL:
        link = "http://www.online6.farmerp.com/FarmERPBonataEnterprisesPL/api/";
        break;
      case Clients.FarmERPBonataTest:
        link = "http://online6.farmerp.com/FarmERPBonataEnterprisesPLTest/api/";
        break;
      case Clients.FarmERPHLHalls:
        link = "https://demo.farmerp.com/FarmERPHLHalls/api/";
        break;
      case Clients.FarmERPVITTHALGANGA:
        link = "https://demo.farmerp.com/FarmERPVITTHALGANGA/api/";
        break;
      case Clients.FarmERPVITTHALGANGATest:
        link = "https://demo.farmerp.com/FarmERPVITTHALGANGATest/api/";
        break;
      case Clients.FarmERPRALLUVIALAGRICULTURE:
        link = "http://exports.farmerp.com/FarmERPRALLUVIALAGRICULTURE/api/";
        break;
      case Clients.FarmERPContractfarmingPack:
        link = "https://demo.farmerp.com/FarmERPContractfarmingPack/api/";
        break;
      case Clients.FarmERPE20InvestmentsLtdTest:
        link = "http://115.112.181.13/FarmERPE20InvestmentsLtdTest/api/";
        break;
      case Clients.FarmERPFoodAfricaOperation:
        link = "http://exports.farmerp.com/FarmERPFoodAfricaOperation/api/";
        break;
      case Clients.FarmERPUrbanFarm:
        link = "https://demo.farmerp.com/FarmERPUrbanFarm/api/";
        break;
      case Clients.FarmERPThaiWah:
        link = "https://demo.farmerp.com/FarmERPThaiWah/api/";
        break;
      case Clients.VUGARQUADMULLA:
        link = "http://www.online6.farmerp.com/FarmERPVugarQadmulla/api/";
        break;
      case Clients.VUGARQUADMULLATEST:
        link = "http://www.online6.farmerp.com/FarmERPVugarQadmullaTest/api/";
        break;
      case Clients.inifarmsinternal:
        link = "http://exports.farmerp.com/FarmERPINIFarmsInternal/api/";
        break;
      case Clients.MLR_FORESTAL:
        link = "http://www.online6.farmerp.com/FarmERPMLRForestal/api/";
        break;
      case Clients.FarmERP_CHILE:
        link = "https://demo.farmerp.com/FarmERPChile/api/";
        break;
      case Clients.VARDHAN_AGROTECH:
        link = "http://exports.farmerp.com/FarmERPVardanAgrotech/api/";
        break;
      case Clients.BENGALSEEDS:
        link = "http://exports.farmerp.com/FarmERPBengalSeed/api/";
        break;
     case Clients.NehadAgroTEST:
        link = "http://192.168.0.114/FarmERPNehadAgro/api/";
        break;
      case Clients.GOURMET_POPCORNICA_LLP:
        link = "https://demo.farmerp.com/FarmERPPopcornTest/api/";
        break;
      case Clients.TRIANGLE_FARMS_TEST:
        link = "http://exports.farmerp.com/FarmERPTriangleFarmsTest/api/";
        break;
      case Clients.TRIANGLE_FARMS:
        link = "http://exports.farmerp.com/FarmERPTriangleFarms/api/";
        break;
      case Clients.FarmERPUrbanFarmTest:
        link = "https://demo.farmerp.com/FarmERPUrbanFarmtest/api/";
        break;
        case Clients.FarmERPHallsTest:
        link = "https://demo.farmerp.com/FarmERPHallsTest/api/";
        break;
        case Clients.FarmizoReboot:
        link = "https://online3.farmerp.com/FarmizoReboot/api/";
        break;
        case Clients.AlMayya:
        link = "http://online6.farmerp.com/FarmERPAlMayya/api/";
        break;
        case Clients.AlMayyaTEST:
        link = "http://online6.farmerp.com/FarmERPAlMayyaTest/api/";
        break;
      default:
        link = "";
        break;
    }
    return Utils.checkString(link)
        ? ""
        : linkOnly
            ? link.split("api/")[0]
            : link;
  }

  static getOrgID() {
    String orgID = "";
    switch (client) {
      case Clients.FarmerERPDevelopment:
        orgID = "001";
        break;

      case Clients.Testlink:
        orgID = "002";
        break;
      case Clients.TestlinkMapModule:
        orgID = "003";
        break;
      case Clients.TestlinkMapModule:
        orgID = "004";
        break;
      case Clients.ANJOUFRUITS:
        orgID = "005";
        break;
      case Clients.ANJOUFRUITSUAT:
        orgID = "006";
        break;
      case Clients.E20:
        orgID = "007";
        break;
      case Clients.FARMERPPlantationandfarmpack:
        orgID = "008";
        break;
      case Clients.ECOZENSOLUTIONS:
        orgID = "009";
        break;
      case Clients.FarmERPASAIndia:
        orgID = "010";
        break;
      case Clients.FarmERPGlobalSeedsLtd:
        orgID = "011";
        break;
      case Clients.FarmERPGlobalSeedsLtdTest:
        orgID = "012";
        break;
      case Clients.FarmERPBonataEnterprisesPL:
        orgID = "013";
        break;
      case Clients.FarmERPBonataTest:
        orgID = "014";
        break;
      case Clients.FarmERPHLHalls:
        orgID = "015";
        break;
      case Clients.FarmERPVITTHALGANGA:
        orgID = "016";
        break;
      case Clients.FarmERPASAIndiaTest:
        orgID = "017";
        break;
      case Clients.FarmERPVITTHALGANGATest:
        orgID = "018";
        break;
      case Clients.FarmERPRALLUVIALAGRICULTURE:
        orgID = "019";
        break;
      case Clients.FarmERPContractfarmingPack:
        orgID = "020";
        break;
      case Clients.FarmERPE20InvestmentsLtdTest:
        orgID = "021";
        break;
      case Clients.FarmERPFoodAfricaOperation:
        orgID = "022";
        break;
      case Clients.FarmerERPTest:
        orgID = "023";
        break;
      case Clients.FarmERPUrbanFarm:
        orgID = "024";
        break;
      case Clients.FarmERPThaiWah:
        orgID = "025";
        break;
      case Clients.VUGARQUADMULLA:
        orgID = "026";
        break;
      case Clients.VUGARQUADMULLATEST:
        orgID = "027";
        break;
      case Clients.inifarmsinternal:
        orgID = "028";
        break;
      case Clients.MLR_FORESTAL:
        orgID = "029";
        break;
      case Clients.FarmERP_CHILE:
        orgID = "030";
        break;
      case Clients.VARDHAN_AGROTECH:
        orgID = "031";
        break;
      case Clients.BENGALSEEDS:
        orgID = "032";
        break;
      case Clients.NehadAgroTEST:
        orgID = "033";
        break;
      case Clients.GOURMET_POPCORNICA_LLP:
        orgID = "033";
        break;
      case Clients.TRIANGLE_FARMS_TEST:
        orgID = "034";
        break;
      case Clients.TRIANGLE_FARMS:
        orgID = "035";
        break;
      case Clients.FarmERPUrbanFarmTest:
        orgID = "036";
        break;
        case Clients.FarmERPHallsTest:
        orgID = "037";
        break;
        case Clients.FarmizoReboot:
        orgID = "038";
        break;
        case Clients.AlMayya:
        orgID = "039";
        break;
        case Clients.AlMayyaTEST:
        orgID = "040";
        break;

      default:
        orgID = "";
        break;
    }
    return orgID;
  }
}
