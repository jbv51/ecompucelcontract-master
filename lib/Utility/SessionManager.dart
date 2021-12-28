
import 'package:ecompusellcontractor/database/DatabaseHelper.dart';
import 'package:sqflite/sqlite_api.dart';
import 'Constants.dart';
import 'Utils.dart';

class SessionManager {
  int id;
  String key, value;

  SessionManager();

  SessionManager.withData(this.id, this.key, this.value);

  Future<void> setValue(String key, String value) async {
    Database db = await DatabaseHelper().db;
    db.insert(
      "SessionManager",
      toMap(key, value),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
//    db.close();

//    Database db2 = await DatabaseHelper().db;
//    await db2.insert(
//      "SessionManager",
//      toMap(key+"1", value),
//      conflictAlgorithm: ConflictAlgorithm.replace,
//    );
//    await db2.close();
//
//    Database db3 = await DatabaseHelper().db;
//    await db3.insert(
//      "SessionManager",
//      toMap(key+"2", value),
//      conflictAlgorithm: ConflictAlgorithm.replace,
//    );
//    await db3.close();
  }

  static String SHARED_DATAVIEW_PERMISSION_USER_IDS =
      "DataViewPermissionUserIds";
  static String SHARED_DATAVIEW_PERMISSION_LOGIN_IDS =
      "DataViewPermissionLoginIds";
  static String CURRENT_TEMPERATURE = "currentTemperature";

  static String UserID = "UserID",
      LoginID = "LoginID",
      CompanyID = "CompanyID",
      ClientID = "ClientID",
      EmailId = "EmailId",
      LastDownloadDate = "LastDownloadDate",
      LastDownloadDateAndTime = "LastDownloadDateAndTime",
      KeyLanguageId = "KeyLanguageId",
      KEY_DW = "KEY_DW",
      Language = "Language",
      isLoggedIn = "isLoggedIn",
      FarmerID = "FarmerID",
      FCMToken = "FCMToken";

  //Map Module
  static String mapWaterResourceAccess = "mapWaterResourceAccess",
      mapPropertyTypeAccess = "mapPropertyTypeAccess",
      mapCropProfileAccess = "mapCropProfileAccess",
      mapFarmerContractAccess = "mapFarmerContractAccess";

  static String Sales_Booking_Number_Count = "Sales_Booking_Number_Count",
      Goods_Return_Number_Count = "Goods_Return_Number_Count",
      DD_Number_Count = "DD_Number_Count",
      Sales_Goods_Return_Number_Count = "Sales_Goods_Return_Number_Count";

  //Online services Item List
  static String favoriteItems = "favoriteItems", recentItems = "recentItems";
  static String favoriteMachine = "favoriteMachine",
      recentMachine = "recentMachine";
  static String favoriteLabour = "favoriteLabour",
      recentLabour = "recentLabour";

  addItemInRecent(String itemCode) async {
    String recentItemIds = "",
        temp = Utils.getBlankIfNull(await getValueOf(recentItems), pre: ",");
    if (!temp.contains(itemCode)) {
      temp = "$itemCode" + temp;
    }

    int count = 1;
    for (String item in temp.split(",")) {
      if (count > 10) break;
      count++;
      recentItemIds = Utils.getBlankIfNull(recentItemIds, post: ",") + item;
    }
    await setValue(recentItems, recentItemIds);
  }

  addItemInFavorite(String itemCode) async {
    String favoriteItemIds;
    favoriteItemIds =
        Utils.getBlankIfNull(await getValueOf(favoriteItems), post: ",") +
            "$itemCode";
    await setValue(favoriteItems, favoriteItemIds);
  }

  addInRecent(String itemCode, String recentType) async {
    String recentIds = "",
        temp = Utils.getBlankIfNull(await getValueOf(recentType), pre: ",");
    if (!temp.contains(itemCode)) {
      temp = "$itemCode" + temp;
    }

    int count = 1;
    for (String item in temp.split(",")) {
      if (count > 10) break;
      count++;
      recentIds = Utils.getBlankIfNull(recentIds, post: ",") + item;
    }
    await setValue(recentType, recentIds);
  }

  addInFavorite(String itemCode, String favoriteType) async {
    String favoriteIds;
    favoriteIds =
        Utils.getBlankIfNull(await getValueOf(favoriteType), post: ",") +
            "$itemCode";
    await setValue(favoriteType, favoriteIds);
  }

  Future<String> getUserID() async {
    return await getValueOf(UserID);
  }

  Future<String> getIsLoggedIn() async {
    return await getValueOf(isLoggedIn);
  }

  Future<String> getKeyLanguageId() async {
    return await getValueOf(KeyLanguageId);
  }

  Future<String> getLanguage() async {
    return await getValueOf(Language);
  }

  Future<String> getLoginID() async {
    return await getValueOf(LoginID);
  }

  Future<String> getCompanyId() async {
    return await getValueOf(CompanyID);
  }

  Future<String> getFarmerID() async {
    return await getZeroDefault(FarmerID);
  }

  Future<String> getSales_Booking_Number_Count() async {
    return await getZeroDefault(Sales_Booking_Number_Count);
  }

  Future<String> getGoods_Return_Number_Count() async {
    return await getZeroDefault(Goods_Return_Number_Count);
  }
  Future<String> getDD_Number_Count() async {
    return await getZeroDefault(DD_Number_Count);
  }
 Future<String> getSales_Goods_Return_Number_Count() async {
    return await getZeroDefault(Sales_Goods_Return_Number_Count);
  }

  Future<String> getValueOf(key) async {
    try {
      Database db = await DatabaseHelper().db;
//    final List<Map<String, dynamic>> maps = await db.query(AllSyncFilesTN);
      final List<Map<String, dynamic>> maps =
          await db.rawQuery("SELECT * FROM SessionManager WHERE key = '$key'");
/*/*await db.close();*/*/
      return maps.isNotEmpty ? fromMap(maps)[0].value : "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> getZeroDefault(key) async {
    Database db = await DatabaseHelper().db;
//    final List<Map<String, dynamic>> maps = await db.query(AllSyncFilesTN);
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM SessionManager WHERE key = '$key'");
/*/*await db.close();*/*/
    return maps.isNotEmpty ? fromMap(maps)[0].value : "0";
  }

  static Future<void> clearSession() async {
    Database db = await DatabaseHelper().db;
    await db.delete("SessionManager");
    await db.delete("App_SyncSetting");
/*/*await db.close();*/*/
  }

  Future<void> updateValue(String key, String value) async {
    Database db = await DatabaseHelper().db;
    await db.rawQuery(" UPDATE SessionManager\n" + " SET  $key= '$value'");
/*/*await db.close();*/*/
  }

  Map<String, dynamic> toMap(key, value) {
    return {
//      'id': id,
      'key': key,
      'value': value,
    };
  }

  List<SessionManager> fromMap(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return SessionManager.withData(
        maps[i]['id'],
        maps[i]['key'],
        maps[i]['value'],
      );
    }).toList();
  }

  Future<String> getSharedPermissionDataViewUserIds() async {
    return await getValueOf(SHARED_DATAVIEW_PERMISSION_USER_IDS);
  }

  Future<String> getSharedPermissionDataViewLoginIds() async {
    return await getValueOf(SHARED_DATAVIEW_PERMISSION_LOGIN_IDS);
  }

  String getSharedPermissionDataViewUserIdsJP() {
    return Constants.SHARED_Permission_UserIDs;
  }

  Future<String> getCurrentTemperature() async {
    return await getValueOf(KEY_DW);
  }
// String getCurrentTemperature() {
//   return pref.getString(HOME_CURRENT_TEMPERATURE, "");
// }
}
