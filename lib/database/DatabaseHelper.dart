import 'dart:async';
import 'dart:io';

import 'package:ecompusellcontractor/Utility/ApiUtils.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';


import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'DBCreateQueries.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper _singleton = DatabaseHelper._();

  factory DatabaseHelper() {
    return _singleton;
  }

  static Database _database;

  Future<Database> get db async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  // static String dbName = "FarmERP_Mobile_${ApiUtils.client}.db";
 // static const String dbName = "FarmERP_MobileAKF2.db";
  static const String dbName = "FarmERP_Mobile115.db";
  // static const String vugarDBName = "FarmERP_Mobile_VugarSync.db";

  initDB() async {
    ApiUtils.getMainLink();
    String myDBName = dbName;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "";

    if (ApiUtils.client == Clients.VUGARQUADMULLATEST ||
        ApiUtils.client == Clients.VUGARQUADMULLA) {
      path = join(documentsDirectory.path, myDBName);
      // Only copy if the database doesn't exist
      if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
        // Load database from assets and copy
        ByteData data =
            await rootBundle.load(join('assets', join('database', myDBName)));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        // Save copied assets to documents
        await new File(path).writeAsBytes(bytes);
      }
      Utils.showLog("path if", path);
      return await openDatabase(path);
    } else {
      path = join(documentsDirectory.path, myDBName);
      Utils.showLog("path else", path);

      return await openDatabase(path, version: 6, onOpen: (db) {},
          onCreate: (Database db, int version) async {
        await executeDBQuery(db);
        await executeDBQuery3(db);
        try {
          await db.execute(DBCreateQueries().myQuery352);
        } catch (e) {
          print(e);
        }
      }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion <= 2) {
          //sumit 01-06-2021
          // try{await db.execute(DBCreateQueries().GIS_CategoryDetails);} catch(e){print(e);}
          // try{await db.execute(DBCreateQueries().GIS_GeoTaggingDetails);} catch(e){print(e);}
          //end

          // await db.execute("ALTER TABLE Product ADD NewCol1 TEXT;");
          await db.execute("ALTER TABLE M_DiseasesMaster ADD ColorCode TEXT;");
          try {
            await db.execute(DBCreateQueries().myQuery352);
          } catch (e) {
            print(e);
          }
        } else if (oldVersion <= 5) {
          await executeDBQuery3(db);
          // await db.execute("ALTER TABLE Product ADD NewCol2 TEXT;");
        } else if (oldVersion <= 4) {
          //Code block added by Sumit 30-08-2021
          try {
            await db.execute(DBCreateQueries().AD_UserFaceRecognition);
          } catch (e) {
            print(e);
          }
        } else if (oldVersion <= 5) {
          //Sumit::table new created 08-09-2021
          try {
            await db.execute(DBCreateQueries().ChatMessages);
          } catch (e) {
            print(e);
          }
        }else if (oldVersion <= 6) {
          //Sumit::table new created 08-09-2021
          try {
            await db.execute(DBCreateQueries().RK_RecordKeepingLabourSelectionDetails);
          } catch (e) {
            print(e);
          }
        } else if (oldVersion <= 7) {
          try {
            await db.execute("ALTER TABLE Daily_TreeSelectionDetails ADD [Row_Id] [nvarchar];");
          } catch (e) {
            print(e);
          }
          await db.execute("ALTER TABLE ChatMessages ADD FilePath TEXT;");

        }
      });
    }
  }

  //Code block added by Sumit
  executeDBQuery3(Database db) async {
    //Sumit::table new created 08-09-2021
    try {
      await db.execute(DBCreateQueries().ChatMessages);
    } catch (e) {
      print(e);
    }

    try {
      await db.execute(DBCreateQueries().PP_ProcessDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().PP_ProductionDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().PP_InputProductionDetails);
    } catch (e) {
      print(e);
    }

// add by Bapurao
    try {
      await db.execute(DBCreateQueries().PP_ActivitywiseProcessParameterValue);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().ST_CurrentStockStore);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().ST_InventoryTransaction);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().PP_ProcessItemUsed);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(
          DBCreateQueries().PP_PostProductionItemUsedTransactiondetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().PP_ProcessHRUsed);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().PP_ProcessRentedMachineryDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().PP_ProcessLabourDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db
          .execute(DBCreateQueries().ST_GoodsReceiptItemsInspectionparameter);
    } catch (e) {
      print(e);
    }
//Harvest forcast
    try {
      await db.execute(DBCreateQueries().CF_HarvestForecastbyGrower);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().CF_HarvestForecastbyGrowerDetails);
    } catch (e) {
      print(e);
    }
    // Vendor Registration
    try {
      await db.execute(DBCreateQueries().M_UserBankAccountDetails);
    } catch (e) {
      print(e);
    }
    //Service Request
    try {
      await db.execute(DBCreateQueries().IN_ServiceRequest);
    } catch (e) {
      print(e);
    }
    //VendorRegistration
    try {
      await db.execute(DBCreateQueries().IN_VendorProductDetails);
    } catch (e) {
      print(e);
    }
    //EquipmentIssueAndReturn
    try {
      await db.execute(DBCreateQueries().ST_EquipmentIssue);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().ST_EquipmentIssuedItems);
    } catch (e) {
      print(e);
    }
    //Non Agri
    try {
      await db.execute(DBCreateQueries().RK_NonAgriWorkDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().RK_NonAgriHRUsed);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().RK_NonAgriItemUsed);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().RK_NonAgriWorkItem_TransactionDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().RK_NonAgriRentedMachineryDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().RK_NonAgriWorkSpecific);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().RK_NonAgriLabourDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(
          DBCreateQueries().RK_NonAgriRecordKeepingServiceContractDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().RK_TemperatureMoistureDetails);
    } catch (e) {
      print(e);
    }
  }

  executeDBQuery(Database db) async {
    // Database db = await DatabaseHelper().db;
    // try{await db.execute(DBCreateQueries().myQuery);} catch(e){print(e);}
    try {
      await db.execute(DBCreateQueries().AD_UserFaceRecognition);
    } catch (e) {
      print(e);
    }
  try {
      await db.execute(DBCreateQueries().AD_StickerPrintingForNehad);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().GIS_CategoryDetails);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().GIS_GeoTaggingDetails);
    } catch (e) {
      print(e);
    }
    try{await db.execute(DBCreateQueries().CF_RateProfile);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().CF_GradeTemplateForRP);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().CF_RateProfileDetails);} catch(e){print(e);}

    try{await db.execute(DBCreateQueries().PL_BeatPlan);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().CF_Farmer_Visit);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().CF_Farmer_Visit_YieldDetails);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().CF_Deal_Closure);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().CF_Deal_GradeDetails);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().AD_CommonApprovalDetails);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().Ad_CommonReverseApproval);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().PL_FarmerHarvestPlanning);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().PL_FarmerHarvest_ItemDetails);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().PL_HarvestPlanning_GradeDetails);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().AD_PushMessageNotification);} catch(e){print(e);}
    try{await db.execute(DBCreateQueries().AD_PushMessageNotificationDetails);} catch(e){print(e);}

    try {
      await db.execute(DBCreateQueries().myQuery1);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery2);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery3);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery4);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery5);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery6);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery7);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery8);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery9);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery10);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery11);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery12);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery13);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery14);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery15);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery16);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery17);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery18);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery19);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery20);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery21);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery22);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery23);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery24);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery25);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery26);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery27);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery28);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery29);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery30);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery31);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery32);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery33);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery34);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery35);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery36);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery37);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery38);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery39);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery40);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery41);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery42);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery43);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery44);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery45);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery46);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery47);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery48);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery49);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery50);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery51);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery52);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery53);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery54);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery55);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery56);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery57);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery58);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery59);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery60);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery61);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery62);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery63);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery64);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery65);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery66);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery67);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery68);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery69);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery70);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery71);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery72);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery73);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery74);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery75);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery76);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery77);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery78);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery79);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery80);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery81);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery82);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery83);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery84);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery85);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery86);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery87);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery88);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery89);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery90);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery91);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery92);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery93);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery94);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery95);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery96);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery97);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery98);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery99);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery100);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery101);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery102);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery103);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery104);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery105);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery106);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery107);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery108);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery109);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery110);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery111);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery112);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery113);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery114);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery115);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery116);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery117);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery118);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery119);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery120);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery121);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery122);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery123);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery124);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery125);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery126);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery127);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery128);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery129);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery130);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery131);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery132);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery133);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery134);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery135);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery136);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery137);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery138);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery139);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery140);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery141);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery142);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery143);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery144);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery145);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery146);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery147);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery148);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery149);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery150);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery151);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery152);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery153);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery154);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery155);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery156);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery157);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery158);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery159);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery160);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery161);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery162);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery163);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery164);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery165);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery166);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery167);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery168);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery169);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery170);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery171);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery172);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery173);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery174);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery175);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery176);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery177);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery178);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery179);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery180);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery181);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery182);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery183);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery184);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery185);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery186);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery187);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery188);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery189);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery190);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery191);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery192);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery193);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery194);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery195);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery196);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery197);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery198);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery199);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery200);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery201);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery202);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery203);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery204);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery205);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery206);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery207);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery208);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery209);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery210);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery211);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery212);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery213);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery214);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery215);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery216);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery217);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery218);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery219);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery220);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery221);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery222);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery223);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery224);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery225);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery226);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery227);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery228);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery229);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery230);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery231);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery232);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery233);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery234);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery235);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery236);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery237);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery238);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery239);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery240);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery241);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery242);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery243);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery244);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery245);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery246);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery247);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery248);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery249);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery250);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery251);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery252);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery253);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery254);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery255);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery256);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery257);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery258);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery259);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery260);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery261);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery262);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery263);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery264);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery265);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery266);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery267);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery268);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery269);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery270);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery271);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery272);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery273);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery274);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery275);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery276);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery277);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery278);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery279);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery280);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery281);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery282);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery283);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery284);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery285);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery286);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery287);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery288);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery289);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery290);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery291);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery292);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery293);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery294);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery295);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery296);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery297);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery298);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery299);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery300);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery301);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery302);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery303);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery304);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery305);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery306);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery307);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery308);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery309);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery310);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery311);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery312);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery313);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery314);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery315);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery316);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery317);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery318);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery319);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery320);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery321);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery322);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery323);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery324);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery325);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery326);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery327);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery328);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery329);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery330);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery331);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery332);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery333);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery334);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery335);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery336);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery337);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery338);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery339);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery340);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery341);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery342);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery343);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery344);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery345);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery346);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery347);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery348);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery349);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery350);
    } catch (e) {
      print(e);
    }
    try {
      await db.execute(DBCreateQueries().myQuery351);
    } catch (e) {
      print(e);
    }

    try {
      await db.execute(DBCreateQueries().RK_RecordKeepingLabourSelectionDetails);
    } catch (e) {
      print(e);
    }
  }
}
