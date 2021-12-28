import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/login/LoginPage.dart';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
// import 'package:farmerp/database/DatabaseHelper.dart';
// import 'package:farmerp/dynamicUtils/DynamicViews.dart';
// import 'package:farmerp/login/LoginPage.dart';
// import 'package:farmerp/models/Custom/CommonPlotCropQRData.dart';
// import 'package:farmerp/models/Custom/CustLabourQRData.dart';
// import 'package:farmerp/models/Custom/FarmerD.dart';
// import 'package:farmerp/models/master/AD_ContractFarmingParaSetting.dart';
// import 'package:farmerp/models/master/AD_ServiceMaster.dart';
// import 'package:farmerp/models/master/AD_UserDetails.dart';
// import 'package:farmerp/models/master/M_UnitMaster.dart';
// import 'package:farmerp/models/master/UnitMaster.dart';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:image/image.dart' as im;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/database/DatabaseHelper.dart';

import 'ApiUtils.dart';
import 'Constants.dart';
import 'SessionManager.dart';
import 'Strings.dart';

class GetCountCustom {
  int cnt;
  int androidID;
  String farmName;

  GetCountCustom.withData(this.cnt, this.androidID, this.farmName);

  static List fromMap(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return GetCountCustom.withData(
        maps[i]['cnt'],
        maps[i]['androidID'],
        maps[i]['farmName'],
      );
    }).toList();
  }
}

class Utils {
  static final String FarmSurveyTableId = "18";
  static final String CropProcuremntTableId = "245";
  static final String FarmerScoreCardTableID = "664";
  static final String GoodsIssueToFarmerTableID = "240";
  static final String GoodsIssueTableId = "64";
  static final String ObservationDetailsTableId = "4";
  static final String SchemeRegistrationTableId = "25";
  static final String BeatPlanTableId = "683";

  // ignore: non_constant_identifier_names
  static final String FarmerRegistrationTableId = "101";
  static final String SymptomMasterTableId = "28";
  static final String RecordKeepingTableId = "5";
  static final String ObservationTableId = "361";
  static final String FieldScoutingTableID = "361";
  static final String FieldQCTableID = "320";
  static final String LabourRegistrationTableID = "54";
  static final String EmployeeRegistrationTableID = "54";
  static final String PostProductionTableID = "7";
  static final String CropProfileTableId = "55";
  static final String SaleBookingTableId = "47";
  static final String GoodsTrasferTableId = "67";
  static final String ExpenseDetailsTableId = "541";
  static final String TreeObservationTableId = "378";
  static final String TreeObservationChildTableId = "623";
  static final String HarvestForecastTableId = "682";
  static final String CropMasterTableId = "362";
  static final String HarvestingDetailsTableId = "497";
  static final String GoodsReceiveTableId = "59";
  static final String PartyMasterTableID = "53";
  static final String ServiceIndentTableID = "447";
  static final String DeliveryDispatchTableId = "50";
  static final String SaleGoodsReturnTableID = "89";
  static final String SoilAnalysisTableId = "86";
  static final String DealClosureTableId = "685";
  static final String FarmerVisitTableID = "684";
  static final String CropProcuremntApprovalTableId = "471";
  static const String CreateTaskTableId = "382";
  static final String Nursery_OperationTableID = "5";

  /*
  static final List<FilteringTextInputFormatter> decimalFormatter = [FilteringTextInputFormatter.allow(RegExp('[0-9.]')),];
  static final List<FilteringTextInputFormatter> mobileNoFormatter = [FilteringTextInputFormatter.allow(RegExp('[0-9]')),];
  static final List<FilteringTextInputFormatter> numberWithCharFormatter = [FilteringTextInputFormatter.allow(RegExp('[0-9]')),FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),];
  static final List<FilteringTextInputFormatter> personNameFormatter = [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),];
*/
  static final String MaterialIndentTableId = "56";
  static Localemain
      string; //  = Localizations.of<LocaleBase>(context, LocaleBase).main;
  /* Constants.ServiceIndent +
  "#" +
  Constants.HarvestingDetails +
  "#" +
  Constants.BaggingRebaggingDetails +
  "#" +
  Constants.TreewiseHarvestingActivityDetails +
  "#" +

    Constants.DeliveryandDispatch +
      "#" +
      Constants.CustomerCurrentStock +
      "#" +
      Constants.SalesGoodsReturn +
      "#" +
      Constants.MachineMaintenance +
      "#" +
      Constants.GoodsIssue +
      "#" +
      Constants.GoodsReceive +
      "#" +
      Constants.CropProfile +
      "#" +
      Constants.CreateTask +
      "#" +
      Constants.MultiplotRecordKeeping +
      "#" +
      Constants.TreeObservation +
      "#" +
      Constants.LabourAttendance +
      "#" +
   Constants.GISFarmProfile +
      "#" +
      Constants.OrganicFieldCheckList +
      "#" +
      Constants.IssueTransferGoodsReturn +
      "#" +
      Constants.AnimalRecordKeeping +
      "#" +
      Constants.FarmProfile +
      "#" +
      Constants.EmployeeAttendance +
      "#" +
      Constants.SoilAnalysis +
      "#" +
      Constants.Sampling +
      "#" +
 Constants.FarmerAnalysticDashBoarcd +
      "#" +
      Constants.ExpenseDetails +
      "#" +
      Constants.FarmerMeeting +
      "#" +
      Constants.KSKT +
      "#" +
      Constants.FieldQC +
      "#" +
      Constants.ArrivalQC +
      "#" +
      Constants.FinishedGoodQC +
      "#" +
      Constants.SalesDetails +
      "#" +
      Constants.YieldEstimation +
      "#" +
      Constants.NutrientRecommendation +
      "#" +
        Constants.PlotRegistration +
      "#" +
Constants.SalesBooking +
      "#" +
      Constants.SalesOrder +
      "#" +
      Constants.Feecollection +
      "#" +
      Constants.ContainerInOut +
      "#" +
      Constants.PortInTime +
      "#" +
      Constants.FarmerDocumentUpload +
      "#" +
       Constants.EmployeeExpenses +
      "#" +
      Constants.WaterAnalysis +
      "#" +
      Constants.SamplingIndent +
      "#" +
     "#" +
      Constants.ServiceRequest +


  */
  static String strAllServiceCode = (ApiUtils.client == Clients.NehadAgroTEST)
      ? "${Constants.ScanSticker}#"
      : (ApiUtils.client == Clients.AKF_TEST ||
              ApiUtils.client == Clients.AKF_UAT)
          ? "${Constants.LabourRegistration}#"
              "${Constants.EmployeeRegistration}#"
              "${Constants.AttendanceRecording}#"
          : "${Constants.CreateTask}#" +
              "${Constants.FieldQC}#" +
              "${Constants.GoodsIssue}#" +
              "${Constants.FieldScouting}#" +
              "${Constants.LabourRegistration}#" +
              "${Constants.AttendanceRecording}#" +
              "${Constants.EmployeeRegistration}#" +
              "${Constants.PostProductionProcess}#" +
              "${Constants.HarvestingDetails}#" +
              // Constants.RecordKeeping +
              // "#" +
              Constants.MultiplotRecordKeeping +
              "#" +
              Constants.Observation +
              "#" +
              Constants.ObservationRecording +
              "#" +
              Constants.MaterialIndent +
              "#" +
              Constants.MyStock +
              "#" +
              Constants.TaskCalendar +
              "#" +
              getFarmerSurvey() +
              "#" +
              Constants.FarmerRecordKeeping +
              "#" +
              Constants.SchemeRegistration +
              "#" +
              Constants.FarmerRegistration +
              "#" +
              Constants.CropProcurement +
              "#" +
              Constants.GoodsIssueToFarmer +
              "#" +
              Constants.FeeRefund +
              "#" +
              Constants.FarmerLog +
              "#" +
              Constants.FarmerAssessment +
              "#" +
              Constants.LabourActivityTracking +
              "#" +
              Constants.CropProfile +
              "#" +
              Constants.GoodsTransfer +
              "#" +
              Constants.SalesBooking +
              "#" +
              Constants.VendorRegistration +
              "#" +
              Constants.ExpenseDetails +
              "#" +
              Constants.Harvest_Forecast_Grower +
              "#" +
              Constants.Budget +
              "#" +
              Constants.Resource +
              "#" +
              Constants.DeliveryandDispatch +
              "#" +
              Constants.CropSchedule +
              "#" +
              Constants.TreeObservation +
              "#" +
              Constants.GoodsReceive +
              "#" +
              Constants.ProductDashboard +
              "#" +
              Constants.IssueTransferGoodsReturn +
              "#" +
              Constants.ServiceIndent +
              "#" +
              Constants.FertilizerRecommendation +
              "#" +
              Constants.ServiceRequest +
              "#" +
              Constants.MachineMaintenance +
              "#" +
              Constants.EquipmentIssueAndReturn +
              "#" +
              Constants.SoilAnalysis +
              "#" +
              Constants.FarmerVisit +
              "#" +
              Constants.SalesGoodsReturn +
              "#" +
              Constants.TappingDetails +
              "#" +
              Constants.DealClosure +
              "#" +
              Constants.BeatPlan +
      "#" +
      Constants.NurseryOperations +
      "#" +
              Constants.CropProcurementINI +
              "#" +
              Constants.NonAgriRecordKeeping +
              "#";

  static String GoodsITReturnTableId = "70";

  static String getFarmerSurvey() {
//    if (Constant.FLV_SAHYADRI=="" || Constant.FLV_Shivanjali=="") {
//      return "";
//    } else {
    return Constants.FarmerSurvey;
//    }
  }

  static const PrimaryColor = Color(0xFFE5A91B);
  static String sqlDateFormat = "yyyy-MM-dd HH:mm:ss";
  static String chatTime = "E h:mm a";
  static String displayDateTime = "dd-MMM-yyyy HH:mm";
  static String yyyymmdd = "yyyy-MM-dd";
  static String yyyymmddslash = "yyyy/MM/dd";
  static String viewDateFormat = "dd-MMM-yy";
  static String viewDateFormat2 = "dd MMM yy";
  static String ddmmyyyy = "dd-MM-yyyy";
  static String mmddYYYY = "MM/dd/yyyy";
  static String SyncSettingsDateFormat = "dd/MM/yyyy";
  static String ddmmyyyyDateFormat = "yyyy-MM-dd";
  static String displayFormatDate = "dd MMM yyyy";
  static String displayTimeFormat = "h:mm a";
  static String sqlTimeFormat = "HH:mm";
  static String sqlTimeFormatSeconds = "HH:mm:ss";
  static String cropageFormat = "dd MMM yy";
  static String sqlDateFormatonly = "yyyy-MM-dd";
  static String textmonthFormat = "MMMM dd yyyy";
  static String ddmmmFormat = "dd MMM";
  static String CANCELLED_STATUS_FOR_TASK_CALENDAR = "7";

  static Future<bool> isEmpty(String tableName) async {
    Database db = await DatabaseHelper().db;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT COUNT (*) as cnt FROM $tableName");
/*/*await db.close();*/*/
    GetCountCustom getCountCustom =
        maps.isNotEmpty ? GetCountCustom.fromMap(maps)[0] : GetCountCustom;

    if (getCountCustom.cnt == 0) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getServicePermission(
      //other table code
      String userId,
      String loginId,
      String serviceCode) async {
    String query = "Select "
            "DISTINCT ifnull(AD_ServiceMaster.[ServiceCode],'0') as UserServiceCode" +
        ",ifnull(AD_ServiceMaster.[MobileService],AD_ServiceMaster.[ServiceName]) as MobileService" +
        ",ifnull(AD_ServiceMaster.[ServiceId],'0') as androidID" + //only this required
        " ,ifnull(AD_ServiceAcess.[IsView],'0') as IsView" +
        ",ifnull(AD_ServiceAcess.[IsAdd],'0') as IsAdd," +
        " ifnull(AD_ServiceAcess.[IsApprove],'0') as IsApprove " +
        " from AD_ServiceMaster" +
        " inner join AD_ServiceAcess on AD_ServiceAcess.[ServiceId]= AD_ServiceMaster.[ServiceId]" +
        " and AD_ServiceAcess.login_id=" +
        loginId +
        " and AD_ServiceAcess.UserId=" +
        userId +
        " and AD_ServiceAcess.[Status]=1" +
        " where AD_ServiceMaster.[ServiceCode] ='" +
        serviceCode +
        "' and  AD_ServiceMaster.[Status]=1   ";

    try {
      Database db = await DatabaseHelper().db;
      final List<Map<String, dynamic>> maps = await db.rawQuery(query);
      List<GetCountCustom> list =
          maps.isNotEmpty ? GetCountCustom.fromMap(maps) : [];
      if (list != null && list.length > 0)
        return Utils.checkString(list[0].androidID.toString())
            ? "0"
            : list[0].androidID.toString();
      else
        return "0";
    } catch (e, s) {
      Utils.showException(e, s);
      return "0";
    }
  }

  static deleteConflictItemByService(
      String androidID, String serviceName) async {
    try {
      Database db = await DatabaseHelper().db;
      await db.rawQuery("delete from AD_MobConflictDetails \n"
          " where Conflict_ID = $androidID \n"
          " and Service_Name = '$serviceName' ");
    } catch (e, s) {
      Utils.showException(e, s);
    }
  }

  static String getCurrentDateWithTime() {
    return new DateFormat(sqlDateFormat).format(DateTime.now());
  }

  static String getCurrentDate() {
    return new DateFormat(SyncSettingsDateFormat).format(DateTime.now());
  }

  static String dynamicCurrentDate(String format) {
    return new DateFormat(format).format(DateTime.now());
  }

  static String getCurrentTime(bool isAdd, minu) {
    if (isAdd == true) {
      DateTime now = DateTime.now();
      DateTime dateTime =
          DateTime(now.year, now.month, now.day, now.hour, now.minute + minu);
      return DateFormat.Hm().format(dateTime);
    } else {
      print(DateFormat.Hm().format(DateTime.now()) + " Curretn time");
      return DateFormat.Hm().format(DateTime.now());
    }
  }

  static String getOneminahead(bool isAdd, minu, hour, min) {
    if (isAdd == true) {
      DateTime now = DateTime.now();
      DateTime dateTime =
          DateTime(now.year, now.month, now.day, hour, min + minu);
      return DateFormat.Hm().format(dateTime);
    } else {
      print(DateFormat.Hm().format(DateTime.now()) + " Curretn time");
      return DateFormat.Hm().format(DateTime.now());
    }
  }

  static String getyyyymmddDate() {
    return new DateFormat(yyyymmdd).format(DateTime.now());
  }

  static String getyyyymmddslashDate() {
    return new DateFormat(yyyymmddslash).format(DateTime.now());
  }

  static String getCurrentDateByF(String dateFormate) {
    return new DateFormat(dateFormate).format(DateTime.now());
  }

  // static getFarmerdetail(String qrResult) async {
  //   final Map<String, dynamic> data = json.decode(qrResult);
  //   return FarmerD.fromJson(data);
  // }
  //
  // static getLabourParsedDetail(String qrResult) async {
  //   final Map<String, dynamic> data = json.decode(qrResult);
  //   return await CustLabourQRData.fromJson(data);
  // }
  //
  // static getPlotParsedDetail(String qrResult) async {
  //   final Map<String, dynamic> data = json.decode(qrResult);
  //   return await CommonPlotCropQRData.fromJson(data);
  // }

  // static Future<File> compressImage(File imageFile, int quality) async {
  //   // final path = tempDir.path;
  //   // int rand = new math.Random().nextInt(10000);
  //
  //   im.Image image = im.decodeImage(imageFile.readAsBytesSync());
  //   // im.Image smallerImage = im.copyResize(
  //   //     image); //500 // choose the size here, it will maintain aspect ratio
  //
  //   var compressedImage = new File(imageFile.path) //'$path/img_$rand.jpg')
  //     ..writeAsBytesSync(im.encodeJpg(image, quality: quality));
  //   return compressedImage;
  // }

  static double getSize(double size) {
//    showLog("size", size.toString());
    double sizeN = size;
//    if (MainFragmentState.per != 100) {
//      sizeN = ((size * MainFragmentState.per) / 100).round()*1.0;
//    }
    if (LoginPage.per != 100) {
      sizeN = (size * LoginPage.per) / 100;
    }
//    showLog("sizeN", sizeN.toString());
    return sizeN;
  }

  static double shrinkRate = 1;
  static double getSizeWS(double size) {
//    showLog("size", size.toString());
    double sizeN = size;
//    if (MainFragmentState.per != 100) {
//      sizeN = ((size * MainFragmentState.per) / 100).round()*1.0;
//    }
    if (LoginPage.per != 100) {
      sizeN = (size * LoginPage.per) / 100;
    }
//    showLog("sizeN", sizeN.toString());
    return sizeN*shrinkRate;
  }

  static String getCurrentDateNew() {
    return new DateFormat(sqlDateFormatonly).format(DateTime.now());
  }

  static String getCurrentNextDate() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return new DateFormat(sqlDateFormatonly).format(tomorrow);
  }

  static String getCurrentBeforeDate() {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    return new DateFormat(sqlDateFormatonly).format(yesterday);
  }

  static bool checkString(String check, {String also, String also2}) {
    if (check == null ||
        check == "" ||
        check.length == 0 ||
        check == "null" ||
        check == "NULL" ||
        check == (also ?? "") ||
        check == (also2 ?? "")) {
      return true;
    } else
      return false;
  }

  static bool checkNullOnly(String check, {String also}) {
    if (check == null ||
            check.length == 0 ||
            check == "null" ||
            check == "NULL" ||
            check == also ??
        "") {
      return true;
    } else
      return false;
  }

  static DateTime getDateTimeFormat(String date) {
    var myDate = date.split("-");
    return new DateTime(
        int.parse(myDate[0]), int.parse(myDate[1]), int.parse(myDate[2]));
  }

//  static String getFarmerSurvey() {
//    if (BuildConfig.FLAVOR.equalsIgnoreCase(Constant.FLV_SAHYADRI)
//        || BuildConfig.FLAVOR.equalsIgnoreCase(Constant.FLV_Shivanjali)) {
//      return "";
//    } else {
//      return Constant.SER_FARMER_SURVEY + "#";
//    }
//  }

  static String getBlankIfNull(String check,
      {String pre, String post, String placeHolder, bool withZero}) {
    if (check == null ||
        check == "" ||
        check.length == 0 ||
        check == "null" ||
        check == "NULL" ||
        ((withZero ?? false) && (check == "0" || check == "0.0"))) {
      return "" + (placeHolder ?? "");
    } else
      return (pre ?? "") + check + (post ?? "");
  }

  static double parseDouble(String check, {double placeHolder}) {
    if (check == null ||
        check == "" ||
        check.length == 0.0 ||
        check == "null" ||
        check == "NULL" ||
        check == "0" ||
        check == "0.0") {
      return 0.0 + (placeHolder ?? 0.0);
    } else {
      try {
        return double.parse(check);
      } catch (e) {
        print(e);
        return 0.0;
      }
    }
  }

  static String getNAIfNull(String check) {
    if (check == null ||
        check == "" ||
        check.length == 0 ||
        check == "null" ||
        check == "NULL") {
      return "NA";
    } else
      return check;
  }

  static bool checkStringWithZero(String check) {
    if (check == null ||
        check == "" ||
        check.length == 0 ||
        check == "null" ||
        check == "0" ||
        check == "0.0" ||
        check == "0.00" ||
        check == "00.00" ||
        check == "NULL") {
      return true;
    } else
      return false;
  }

  static String getZeroIfNull(String check) {
    if (check == null ||
        check == "" ||
        check.length == 0 ||
        check == "null" ||
        check == "NULL" ||
        check == "0") {
      return "0";
    } else
      return check;
  }

  static int getIntZeroIfNull(int check) {
    if (check == null) {
      return 0;
    } else
      return check;
  }

  static String getBlankIfNull_0_0(String check, {String pre, String post}) {
    if (check == null ||
        check == "" ||
        check.length == 0 ||
        check == "null" ||
        check == "NULL" ||
        check == "0.0" ||
        check == "0.0") {
      return "";
    } else
      return (pre ?? "") + check + (post ?? "");
  }

  static String getNAIfNull_0_0(String check, {String pre, String post}) {
    if (check == null ||
        check == "" ||
        check.length == 0 ||
        check == "null" ||
        check == "NULL" ||
        check == "0.0" ||
        check == "0") {
      return "NA";
    } else
      return (pre ?? "") + check + (post ?? "");
  }

  static bool checkStringWithDot(String check, {String also}) {
    if (check == null ||
            check == "" ||
            check.length == 0 ||
            check == "null" ||
            check == "NULL" ||
            check == "." ||
            check == also ??
        "") {
      return true;
    } else
      return false;
  }

  static bool isToastShowing = false;

  static showToast(String msg, {Color bgColor, Color textColor}) {
    bgColor = bgColor ?? Colors.black38;
    textColor = textColor ?? Colors.white;
    if (isToastShowing) return;
    isToastShowing = true;
    print(msg);
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: 16.0);
    Future.delayed(const Duration(milliseconds: 1500), () async {
      isToastShowing = false;
    });
  }

  static showLog(tag, msg) {
    // if(!kReleaseMode)
    print(tag + " : " + msg);
  }

  static showException(e, s) {
//    if (BuildConfig.DEBUG)
    print(s.toString());
  }

  static DateTime parseSQLFormatDate(String date) {
    return new DateFormat(sqlDateFormat).parse(date);
  }

  static DateTime parseDate(String date, String format) {
    try {
      return new DateFormat(format).parse(date);
    } catch (e, s) {
      showException(e, s);
      return DateTime.now();
    }
  }

  static String formatDate(DateTime date, String format) {
    try {
      return new DateFormat(format).format(date);
    } catch (e, s) {
      showException(e, s);
      return "";
    }
  }

  static String getSQLFormatDate(DateTime fromDate) {
    return new DateFormat(sqlDateFormat).format(fromDate);
  }

  static String getDisplayFormatDate(DateTime fromDate) {
    return new DateFormat(displayFormatDate).format(fromDate);
  }

  static String getDisplayFormatDate2(DateTime fromDate) {
    return new DateFormat(SyncSettingsDateFormat).format(fromDate);
  }

  static String getDisplayFormatTime(DateTime fromDate) {
    return new DateFormat(displayTimeFormat).format(fromDate);
  }

  static Future<dynamic> isNetWorkConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else
        return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  static write(String className, String text) async {
    if (!kReleaseMode) {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/$className.txt');
      await file.writeAsString(text);
    }
  }

  static bool checkZeroValue(String num) {
    if (num != null &&
        num.isNotEmpty &&
        (num == "0" || num == "0.0" || double.parse(num) == 0.0)) {
      return true;
    } else {
      return false;
    }
  }

  static void printWrapped(String tag, String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(tag + " : \n" + text)
        .forEach((match) => print(match.group(0)));
  }

  static String getURLforImages(String path) {
    String mFileURLPath = ApiUtils.getMainLink().replaceAll("/api/", "") +
        path
            .toString()
            .replaceAll("~", "")
            .replaceAll("..", "")
            .replaceAll(" ", "%20");
    return mFileURLPath.replaceAll("\\\\", "/");
  }

  static Future<String> getPath() async {
    String dir = await (await getApplicationDocumentsDirectory()).path +
        "/" +
        ApiUtils.farmerp_download;
    String path =
        dir + "/" + DateFormat("yyyyMMddHHmmss").format(DateTime.now());
    bool isPresent = await Directory(dir + "/").exists();
    if (isPresent) {
      return path;
    } else {
//      final Directory directory = await Directory('$dir/CapturedImages').create(recursive: true);
//      print("The directory $directory is created");
      Directory(dir + "/").create(recursive: true).then((Directory directory) {
        showLog("directory.path", directory.path);
        return directory.path;
      });
    }
  }

  static bool isPathFromInternalStorage(String path) {
    if (!checkString(path) &&
        (path.contains("data") || path.contains("storage")))
      return true;
    else
      return false;
  }

  static String getTimeDiffrence(String st, String end) {
    print(st + "Time" + end);
    DateTime date1 = null, date2 = null;
    int min, hours;

    DateFormat simpleDateFormat = DateFormat("HH:mm");

    try {
      date1 = simpleDateFormat.parse(st);
      date2 = simpleDateFormat.parse(end);
      hours = date2.difference(date1).inHours;

      if (date2.difference(date1).inMinutes == 0)
        min = 0;
      else {
        double def = date2.difference(date1).inMinutes / 60;
        if (def > 0 && def.toString().contains(".")) {
          min = (date2.difference(date1).inMinutes -
                  double.parse(def.toString().split(".")[0]) * 60)
              .round();
        } else
          min = 0;
      }
    } catch (e) {
      print(e);
    }

    String sHour = "00";
    if (hours < 10) {
      sHour = "0" + hours.toString();
    } else {
      sHour = hours.toString();
    }

    String sMinute = "00";
    if (min < 10) {
      sMinute = "0" + min.toString();
    } else {
      sMinute = min.toString();
    }
    String duration = "";
    if (sHour.contains("-")) {
      duration = "-" + sHour.replaceAll("-", "") + "." + sMinute;
    } else {
      duration = sHour + "." + sMinute;
    }
    return duration;
  }

  static Future<String> dbName() async {
    Database db = await DatabaseHelper().db;
    Utils.printWrapped("DB Path", db.path);
    var file = File(db.path);
    Utils.printWrapped("DB Path", (await file.length()).toString());
    // final newFile = await file.copy("/data/user/0/com.farmerp.farmerp/FarmERP_Mobile_1.0.db");  working
    final newFile = await file.copy("/sdcard/FarmERP_Mobile_1.0.db");

    Utils.showToast(
        "Backup Placed successfully"); // + "\n" + "/sdcard/FarmERP_Mobile_1.0.db");
    try {
      if (newFile != null) {
        return newFile.path;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  static String getFarmerInitials(String name) {
    try {
      var farmerName = name.split(" ");
      if (farmerName == null) {
        String myName1 =
            Utils.getBlankIfNull(name.toString().substring(0, 1).toUpperCase());
        return myName1;
      }
      try {
        String myName = Utils.getBlankIfNull(
                farmerName[0].toString().substring(0, 1).toUpperCase()) +
            Utils.getBlankIfNull(
                farmerName[1].toString().substring(0, 1).toUpperCase());
        return myName;
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  static Color getTaskCalendarStatus(String status, String workDate, int days,
      String requestStatus, String activityName) {
    Utils.showLog("FarmerVistList", activityName + " " + requestStatus);

    if (!Utils.checkString(activityName.toString()) &&
        (Utils.equalsIgnoreCase(activityName, Strings.FARMER_VISIT) ||
            Utils.equalsIgnoreCase(activityName, Strings.cropProcurement))) {
      if (requestStatus == "2") {
        if (days < 0)
          return RColors.pendingTaskColor;
        else
          return RColors.plannedTaskColor;
      } else if (requestStatus == "7") {
        return RColors.green;
      }
    } else if (status == "1" || status == "0") {
      try {
        // int days = printDifferenceBetweenTwoDays(
        //     workDate, Utils.dynamicCurrentDate(yyyymmdd));

        if (days < 0)
          return RColors.pendingTaskColor;
        else
          return RColors.plannedTaskColor;
      } catch (e) {
        print(e);
      }
    } else if (status == "3") {
      return RColors.green;
    } else if (status == "2") {
      return RColors.partialTaskColor;
    }
  }

  static int printDifferenceBetweenTwoDays(
      String workdate, String currentDate) {
    try {
      DateTime dateTimeCreatedAt = DateTime.parse(workdate);
      DateTime dateTimeCreatedAt1 = DateTime.parse(currentDate);
      Utils.printWrapped("Difference",
          dateTimeCreatedAt1.difference(dateTimeCreatedAt).inDays.toString());
      return dateTimeCreatedAt1.difference(dateTimeCreatedAt).inDays;
    } catch (e) {
      print(e);
    }
  }

  static int DifferenceBetweenTwoDays(String workdate, String currentDate) {
    try {
      DateTime dateTimeCreatedAt = DateTime.parse(workdate);
      DateTime dateTimeCreatedAt1 = DateTime.parse(currentDate);
      Utils.printWrapped("Difference",
          dateTimeCreatedAt1.difference(dateTimeCreatedAt).inDays.toString());
      return dateTimeCreatedAt1.difference(dateTimeCreatedAt).inDays;
    } catch (e) {
      return 0;
    }
  }

  // static Future<String> getMobilePin() async {
  //   String strMobilePin = "";
  //   SessionManager mSession = new SessionManager();
  //   try {
  //     // String macAddress = null,
  //     //     strSERIAL = null;
  //     // WifiManager wifiManager = (WifiManager) mContext.getSystemService(
  //     //     Context.WIFI_SERVICE);
  //     // WifiInfo wInfo = wifiManager.getConnectionInfo();
  //
  //     // try {
  //     //   macAddress = wInfo.getMacAddress();
  //     // }
  //     // catch
  //     // (
  //     // e, s) {
  //     //   Utils.showException(e, s);
  //     // }
  //     // try {
  //     //   strSERIAL = Build.SERIAL;
  //     // }
  //     // catch
  //     // (
  //     // e, s) {
  //     // Utils.showException(e, s);
  //     // }
  //
  //     // if (macAddress == null || macAddress.toString().trim().equalsIgnoreCase("") || macAddress.toString().trim().length() < 5 || macAddress.toString().trim().equalsIgnoreCase("null")) {
  //     // macAddress = "0";
  //     // }
  //
  //     // if (strSERIAL == null || strSERIAL.toString().trim().equalsIgnoreCase("") || strSERIAL.toString().trim().equalsIgnoreCase("unknown")) {
  //     // strSERIAL = "0";
  //     // }
  //     String loginID = await mSession.getLoginID();
  //     String userID = await mSession.getUserID();
  //     String userName =
  //         await AD_UserDetails.getUserNameUsingUserId(userID.toString());
  //     strMobilePin = "Mobile_PIN" +
  //         "_" +
  //         userName.replaceAll(" ", "_") +
  //         "_" +
  //         loginID +
  //         "_" +
  //         userID +
  //         "_" +
  //         Constants.AppVersion.replaceAll(".", "_") +
  //         "_" +
  //         DateTime.now()
  //             .millisecondsSinceEpoch
  //             .toString(); //+ "_" + macAddress + "_" + strSERIAL + "_" + BuildConfig.VERSION_NAME + "_" + BuildConfig.VERSION_CODE + "_" + BuildConfig.FLAVOR + mContext.getResources().getString(R.string.built_no);
  //
  //   } catch (e, s) {
  //     Utils.showException(e, s);
  //   }
  //   return strMobilePin;
  // }

  static Future<String> getMobilePinUsingValues(
      String loginID, String userID) async {
    String strMobilePin = "";
    try {
      // String userName = await AD_UserDetails.getUserNameUsingUserId(userID.toString());
      strMobilePin = "Mobile_PIN" +
          "_" +
          // userName.replaceAll(" ", "_") +
          // "_" +
          loginID +
          "_" +
          userID +
          "_" +
          Constants.AppVersion.replaceAll(".", "_") +
          "_" +
          DateTime.now()
              .millisecondsSinceEpoch
              .toString(); //+ "_" + macAddress + "_" + strSERIAL + "_" + BuildConfig.VERSION_NAME + "_" + BuildConfig.VERSION_CODE + "_" + BuildConfig.FLAVOR + mContext.getResources().getString(R.string.built_no);

    } catch (e, s) {
      Utils.showException(e, s);
    }
    return strMobilePin;
  }

  static Future<String> getLastInsertAndroidWorkIdOBR() async {
    try {
      String query =
          "SELECT Android_ObservationRecording_Id as androidID FROM RK_ObservationRecording ORDER BY Android_ObservationRecording_Id DESC LIMIT 1;";

      Utils.printWrapped("Query Logs 801 ", query);
      Database db = await DatabaseHelper().db;
      final List<Map<String, dynamic>> maps = await db.rawQuery(query);

      return maps != null && maps.isNotEmpty && maps.length > 0
          ? GetCountCustom.fromMap(maps)[0].androidID.toString()
          : "0";
    } catch (e, s) {
      Utils.showException(e, s);
      return "0";
    }
  }

  static Future<String> getLastInsertedIdByTableName(mTableName) async {
    try {
      String query =
          "select seq as androidID from sqlite_sequence where name='" +
              mTableName +
              "' ";

      Utils.printWrapped("Query Logs 801 ", query);
      Database db = await DatabaseHelper().db;
      final List<Map<String, dynamic>> maps = await db.rawQuery(query);

      return maps != null && maps.isNotEmpty && maps.length > 0
          ? GetCountCustom.fromMap(maps)[0].androidID.toString()
          : "0";
    } catch (e, s) {
      Utils.showException(e, s);
      return "0";
    }
  }

  static Future<String> getLastInsertAndroidWorkIdRecordKeeping() async {
    try {
      String query =
          " SELECT Android_WORK_ID as androidID FROM Daily_WorkDetails ORDER BY Android_WORK_ID DESC LIMIT 1; ";

      Utils.printWrapped("Query Logs 801 ", query);
      Database db = await DatabaseHelper().db;
      final List<Map<String, dynamic>> maps = await db.rawQuery(query);

      return maps != null && maps.isNotEmpty && maps.length > 0
          ? GetCountCustom.fromMap(maps)[0].androidID.toString()
          : "0";
    } catch (e, s) {
      Utils.showException(e, s);
      return "0";
    }
  }

  static String checkIfNullReturnNA(String value) {
    if (!checkString(value)) {
      return value;
    } else {
      return Constants.KEY_NOT_AVAILABLE;
    }
  }

  static String getBlankIfZero(String value) {
    if (!checkString(value) && !checkZeroValue(value)) {
      return value;
    } else {
      return "";
    }
  }

  static String checkIfNullReturnBlank(String value) {
    if (!checkString(value) && value != "0") {
      return value;
    } else {
      return "";
    }
  }

  // static Future<String> checkIsAdd(String serviceCode) async {
  //   try {
  //     String userID = await SessionManager().getUserID();
  //     String loginID = await SessionManager().getLoginID();
  //     AD_ServiceMaster serviceName =
  //         await AD_ServiceMaster.getServicePermissionNew(
  //             loginID, serviceCode, userID);
  //     if (serviceName != null && serviceName.IsAdd.toString() == "1") {
  //       return "1";
  //     } else {
  //       return "0";
  //     }
  //   } catch (e) {
  //     print(e);
  //     return "0";
  //   }
  // }

  static String convertDateFormat(
      String date, String currentFormat, String requiredFormat) {
    if (!checkString(date)) {
      try {
        DateTime tempDate = new DateFormat(currentFormat).parse(date);
        return new DateFormat(requiredFormat).format(tempDate);
      } catch (e) {
        print(e);
        return "";
      }
    } else
      return "";
  }

  static String getAge(String sDate, String wDate) {
    try {
      final soingdate = DateTime.parse(sDate);
      final workdate = DateTime.parse(wDate);
      ;
      final difference = workdate.difference(soingdate).inDays;

      return (difference.toString());
    } catch (Exception) {
      return "0";
    }
  }

  // static Future<bool> getConfigSetting(String id) async {
  //   try {
  //     SessionManager sessionManager = new SessionManager();
  //
  //     String result =
  //         await AD_ContractFarmingParaSetting.getContratcFarmingSettingFlag(
  //             await sessionManager.getCompanyId(), id);
  //     if (result != null && result != "0" && result != "false")
  //       return true;
  //     else
  //       return false;
  //   } catch (Exception) {
  //     return false;
  //   }
  // }

  static getLatLong() async {
    Position position = null;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print(e);
    }
    return position;
  }

//  static String getAge(String current, String lastdate) {
//   String originalFormat = DateFormat.Hm().format("dd MMM yy");
//   DateTime dateTime =await   DateFormat("yyyyMMddHHmmss").format(DateTime.now());
//   try {
//     DateTime dateCurrent = originalFormat.parse(current);
//     DateTime datePreveous = originalFormat.parse(lastdate);
//     long diff = datePreveous.getTime() - dateCurrent.getTime();
//     return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS) + " days";
//   } catch (ParseException e) {
//   return 0 + " Days";
//   }
// }
  static generate() {
    String vv =
        "Android_Plan_ID,Plan_ID,Plan_Date,Document_No,Activity_ID,Farmer_ID,Farmer_First_Name,Farmer_Middle_Name,Farmer_Last_Name,Field_Supervisor_ID,Collection_Center_ID,Plan_VisitDate,Plan_Time,Village_ID,Numberofplants,ExpectedQuantity,Qty_Unit_ID,Login_Id,Active_Status,Delete_Status,Language_ID,Organization_ID,Modified_By,Modified_Date,Upload_Status,Upload_by,Upload_Date,Download_Status,Download_By,Download_Date,Approved_Status,Approved_By,Approved_Date,Request_Status,Remark,Mobile_PIN,Latitude,Longitude,Mobile_No";

    List<String> variables = vv.split(",");

    String clone = "", fromMap = "", toMap = "";
    String className = "PL_BeatPlan";

    for (int i = 0; i < variables.length; i++) {
      if (i == 0) {
        fromMap = fromMap +
            "  static List fromMap(List<Map<String, dynamic>> maps) {return List.generate(maps.length, (i) {return $className(";
      }
      fromMap = fromMap + variables[i] + ": maps[i]['" + variables[i] + "'],";
      if (i == variables.length - 1) {
        fromMap = fromMap + " );}).toList();}";
      }
    }

    for (int i = 0; i < variables.length; i++) {
      if (i == 0) {
        clone = clone + " $className.clone($className model) : this(";
      }
      clone = clone + variables[i] + ": model." + variables[i] + ",";

      if (i == variables.length - 1) {
        clone = clone + ");";
      }
    }
    for (int i = 0; i < variables.length; i++) {
      if (i == 0) {
        toMap = toMap + " Map<String, dynamic> toMap() {return {";
      }
      toMap = toMap + "'" + variables[i] + "':" + variables[i] + ",";

      if (i == variables.length - 1) {
        toMap = toMap + "};}";
      }
    }

    Utils.write(className, fromMap + "\n\n" + clone + "\n\n" + toMap + "\n\n");
  }

  // static Future<String> calculateTotalNumberOfCropsbyUnit(
  //     String value1,
  //     String value2,
  //     String plotArea,
  //     String unitRowToRow,
  //     String unitPlantToPlant,
  //     String unitId) async {
  //   String calculation = "";
  //   try {
  //     double dou = double.parse(await M_UnitMaster.getConversionValue(unitId));
  //     double main = double.parse(await M_UnitMaster.getConversionValue("1"));
  //
  //     plotArea = (double.parse(plotArea) * (dou / main)).toString();
  //
  //     String rowToRowDistance =
  //         await getUnitConversionInMeter(value1, unitRowToRow);
  //     String plantToPlantDistance =
  //         await getUnitConversionInMeter(value2, unitPlantToPlant);
  //     double plantToPlant = double.parse(rowToRowDistance.toString());
  //     double rowToRow = double.parse(plantToPlantDistance.toString());
  //     double mulTiplication = plantToPlant * rowToRow;
  //     double popPerHector = (10000.0 / mulTiplication);
  //     calculation =
  //         ((popPerHector * (double.parse(plotArea) * 0.404686)).roundToDouble())
  //             .toString();
  //   } catch (e) {
  //     print(e);
  //   }
  //   Utils.showLog("tag", "calculation=" + calculation);
  //   return calculation;
  // }
  //
  // static Future<String> getUnitConversionInMeter(
  //     String value, String unitId) async {
  //   String calculation = "0";
  //
  //   try {
  //     if (unitId != null &&
  //         !checkString(
  //             await UnitMaster.getUnitNameUsingUnitId(unitId).toString())) {
  //       String unitName = await UnitMaster.getUnitNameUsingUnitId(unitId);
  //       if (!Utils.checkString(unitName)) {
  //         unitName = unitName.toLowerCase();
  //       }
  //
  //       if (unitName == "Centimeter" ||
  //           unitName == ("Centi meter") ||
  //           unitName == ("CM") ||
  //           unitName == "centimeter" ||
  //           unitName == ("centi meter") ||
  //           unitName == ("cm")) {
  //         calculation = (double.parse(value) * 0.01).toString();
  //       } else if (unitName == ("foot") || unitName == ("feet")) {
  //         calculation = (double.parse(value) * 0.3048).toString();
  //       } else if (unitName == ("inch") || unitName == ("in")) {
  //         calculation = (double.parse(value) * 0.0254).toString();
  //       } else if (unitName == ("kilometer") ||
  //           unitName == ("km") ||
  //           unitName == ("kilo meter")) {
  //         calculation = (double.parse(value) * 1000).toString();
  //       } else if (unitName.toLowerCase() == ("meter") || unitName == ("m")) {
  //         calculation = (double.parse(value)).toString();
  //       } else if (unitName == ("mi") || unitName == ("mile")) {
  //         calculation = (double.parse(value) * 1609.34).toString();
  //       } else if (unitName == ("millimeter") || unitName == ("mm")) {
  //         calculation = (double.parse(value) * 0.001).toString();
  //       } else if (unitName == ("yard") || unitName == ("yd")) {
  //         calculation = (double.parse(value) * 0.9144).toString();
  //       }
  //     }
  //   } catch (e) {}
  //
  //   return calculation;
  // }

  static List<String> getPreveousThreeYears() {
    List<String> arrayList = new List<String>();
    int year = DateTime.now().year;
    arrayList.add((year - 1).toString());
    arrayList.add((year - 2).toString());
    arrayList.add((year - 3).toString());
    return arrayList;
  }

  static String addDot(String check) {
    print(check);
    if (!checkString(check)) {
      if (check.length > 10) {
        check = check.substring(0, 7).toString() + "...";
        return check;
      } else {
        return check;
      }
    } else {
      return "";
    }
  }

//   static Future<bool> getLandMarkAgriSettingOn(
//       SessionManager sessionManager) async {
// //        return true;
//     try {
//       String result =
//           await AD_ContractFarmingParaSetting.getContratcFarmingSettingFlag(
//               await sessionManager.getCompanyId(),
//               Constants.CONFIG_LAND_MARK_AGRI);
//       return result != null && result != ("0") && result != ("false");
//     } catch (e) {
//       return false;
//     }
//   }
//
//   static getPremiumRateForFarmerSettingOn(SessionManager sessionManager) async {
// //        return true;
//     try {
//       String result =
//           await AD_ContractFarmingParaSetting.getContratcFarmingSettingFlag(
//               await sessionManager.getCompanyId(),
//               Constants.PREMIUM_RATE_FOR_FARMER);
//       return result != null && result != ("0") && result != ("false");
//     } catch (e) {
//       return false;
//     }
//   }
//
//   static Future<bool> getBiotechProcessSettingOn(
//       SessionManager sessionManager) async {
// //        return true;
//     try {
//       String result =
//           await AD_ContractFarmingParaSetting.getContratcFarmingSettingFlag(
//               await sessionManager.getCompanyId(),
//               Constants.CONFIG_BIOTECH_PROCESS);
//       return result != null && result != ("0") && result != ("false");
//     } catch (e) {
//       return false;
//     }
//   }

  static showNoData(BuildContext context) {
    Localemain string = Localizations.of<LocaleBase>(context, LocaleBase).main;
    return Container(
      alignment: Alignment.center,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Utils.getSize(100.0),
            ),
            DynamicViews().text(context, string.norecordfound, 18,
                FontWeight.bold, RColors.black, TextAlign.center),
          ]),
    );
  }

  showNoDataColumn(BuildContext context) {
    Localemain string = Localizations.of<LocaleBase>(context, LocaleBase).main;
    return Container(
      child: Column(children: [
        SizedBox(
          height: Utils.getSize(50.0),
        ),
        DynamicViews().text(context, string.norecordfound, 18,
            FontWeight.normal, RColors.black, TextAlign.center),
      ]),
    );
  }

  static String getAddedDateForAllByDaysAdd(activityDate, int daydifference) {
    var date1 = DateTime.parse(activityDate);

    var newDate = date1.add(Duration(days: daydifference));
    return newDate.toString();
  }

  static String getDateAfterDays(int daydifference) {
    var newDate = DateTime.now().subtract(Duration(days: daydifference));
    return new DateFormat(SyncSettingsDateFormat).format(newDate);
  }

  static bool equalsIgnoreCase(String string1, String string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }

  static Future<String> getDataVeiwPermissionLoginId() async {
    SessionManager sessionManager = new SessionManager();
    return "(" +
        await sessionManager.getSharedPermissionDataViewLoginIds() +
        ")";
  }

  static Future<String> getDataVeiwPermissionUserId() async {
    SessionManager sessionManager = new SessionManager();
    return "(" +
        await sessionManager.getSharedPermissionDataViewUserIds() +
        ")";
  }

  static Future<DateTime> getDatePicker(BuildContext context,
      {DateTime initialDate, DateTime firstDate, DateTime lastDate}) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate == null ? DateTime.now() : initialDate,
      firstDate: firstDate == null ? DateTime(1901, 1) : firstDate,
      lastDate: lastDate == null ? DateTime(2099, 1) : lastDate,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
              primary: RColors.bluishGreenLL,
              onPrimary: RColors.white,
              surface: RColors.bluishGreenLL,
              onSurface: RColors.black,
            ),
            dialogBackgroundColor: RColors.white,
            splashColor: RColors.black,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
  }

  static Future<DateTime> getTimePicker(BuildContext context,
      {TimeOfDay initialTime, DateTime firstDate, DateTime lastDate}) async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: initialTime);

    // TimeOfDay(
    //     hour:time .hour, minute: time .minute);

    DateTime date = new DateTime.now();
    return new DateTime(
        date.year, date.month, date.day, time.hour, time.minute);

    // (
    // context: context,
    // initialDate: initialDate == null ? DateTime.now() : initialDate,
    // firstDate: firstDate == null ? DateTime(1901, 1) : firstDate,
    // lastDate: lastDate == null ? DateTime(2099, 1) : lastDate,
    // builder: (BuildContext context, Widget child) {
    //   return Theme(
    //     data: ThemeData().copyWith(
    //       colorScheme: ColorScheme.light(
    //         primary: RColors.bluishGreenLL,
    //         onPrimary: RColors.white,
    //         surface: RColors.bluishGreenLL,
    //         onSurface: RColors.black,
    //       ),
    //       dialogBackgroundColor: RColors.white,
    //       splashColor: RColors.black,
    //       buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    //     ),
    //     child: child,
    //   );
    // },
    // );
  }

  static File createZipFile(String fileName) {
    // _appDataDir.path
    final zipFilePath = "${"/sdcard//Download"}/$fileName";
    final zipFile = File(zipFilePath);
    branchMethodDemo() {}

    if (zipFile.existsSync()) {
      print("Deleting existing zip file: ${zipFile.path}");
      zipFile.deleteSync();
    }
    return zipFile;
  }

  // static Future<int> getNameCount(String flag, String companyId) async {
  //   int count = 0;
  //   switch (flag) {
  //     case "1":
  //       // First Name
  //       try {
  //         count = int.parse(
  //             (await AD_ContractFarmingParaSetting.getQauntityOrPercentage(
  //                     Constants.ID_FARMER_FIRST_NAME_COMPULSORY_CHARACTER,
  //                     companyId))
  //                 .toString());
  //       } catch (e) {
  //         print(e);
  //       }
  //       break;
  //
  //     case "2":
  //       // Middle Name
  //       try {
  //         count = int.parse(
  //             (await AD_ContractFarmingParaSetting.getQauntityOrPercentage(
  //                     Constants.ID_FARMER_MIDDLE_NAME_COMPULSORY_CHARACTER,
  //                     companyId))
  //                 .toString());
  //       } catch (e) {
  //         print(e);
  //       }
  //       break;
  //
  //     case "3":
  //       // Last Name
  //       count = int.parse(
  //           (await AD_ContractFarmingParaSetting.getQauntityOrPercentage(
  //                   Constants.ID_FARMER_LAST_NAME_COMPULSORY_CHARACTER,
  //                   companyId))
  //               .toString());
  //       break;
  //   }
  //   return count;
  // }

  static List<WeekDetails> getNumberOfWeeks(String month, String year) {
    var date = new DateTime(int.parse(year), int.parse(month) + 1, 0);
    print(date.day);

    final endDate = DateTime.parse('$year-$month-${date.day} 00:00:00.887');

    final monthStartDate = DateTime.parse('$year-$month-01 00:00:00.887');
    var startOfWeekDate = getDate(
        monthStartDate.subtract(Duration(days: monthStartDate.weekday - 1)));
    var endOfWeekDate = getDate(monthStartDate
        .add(Duration(days: DateTime.daysPerWeek - monthStartDate.weekday)));
    int numberOfWeek = 1;
    List<WeekDetails> list = [];

    list.add(WeekDetails(
        "Week 1", monthStartDate.toString(), endOfWeekDate.toString()));

    for (int i = 0; i < 7; i++) {
      try {
        var addition = endOfWeekDate.day + 1;
        var dateString = "";

        if (addition.toString().length == 1)
          dateString = "0" + addition.toString();
        else
          dateString = addition.toString();
        var temp1 = DateTime.parse('$year-$month-$dateString 00:00:00.887');
        startOfWeekDate =
            getDate(temp1.subtract(Duration(days: temp1.weekday - 1)));
        endOfWeekDate = getDate(
            temp1.add(Duration(days: DateTime.daysPerWeek - temp1.weekday)));
        numberOfWeek = numberOfWeek + 1;
        if (startOfWeekDate.isAfter(endDate)) {
          break;
        } else if (endOfWeekDate.isAfter(endDate)) {
          list.add(WeekDetails("Week $numberOfWeek", startOfWeekDate.toString(),
              endDate.toString()));
          break;
        } else {
          list.add(WeekDetails("Week $numberOfWeek", startOfWeekDate.toString(),
              endOfWeekDate.toString()));
        }
      } catch (e) {
        print(e);
        break;
      }
    }

    return list;
  }

  static DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  static getcurrentmonth() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM').format(now);
    return formattedDate;
  }

  static String getcurrentyear() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy').format(now);
    return formattedDate;
  }

  static String getmonthnumber() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM').format(now);
    return formattedDate;
  }

  // static Future<bool> showTaskUsingDataViewPermission() async {
  //   /*return true;*/
  //   try {
  //     SessionManager sessionManager = new SessionManager();
  //
  //     if (sessionManager == null) sessionManager = new SessionManager();
  //
  //     String result =
  //         await AD_ContractFarmingParaSetting.getContratcFarmingSettingFlag(
  //             await sessionManager.getCompanyId(),
  //             Constants.CONFIG_TASK_CALENDAR_DATA_VIEW);
  //     return result != null && result != "0" && result != false;
  //   } catch (e, s) {
  //     Utils.showException(e, s);
  //     return false;
  //   }
  // }

  // if( getcurrentmonth()=="january")
  //   { return 0;}
  // else if ( getcurrentmonth()=="februray")
  // {return 1;}
  // else if ( getcurrentmonth()=="march")
  //   {return 2;}
  // else if ( getcurrentmonth()=="april")
  // {return 3;}
  // else if ( getcurrentmonth()=="may")
  // {return 4;}
  // else if ( getcurrentmonth()=="june")
  // {return 5;}
  // else if ( getcurrentmonth()=="july")
  // {return 6;}
  // else if ( getcurrentmonth()=="august")
  // {return 7;}
  // else if ( getcurrentmonth()=="september")
  // {return 8;}
  // else if ( getcurrentmonth()=="october")
  // {return 9;}
  // else if ( getcurrentmonth()=="november")
  // {return 10;}
  // else if ( getcurrentmonth()=="december")
  // {return 11;}
  // else
  //   return getcurrentmonth();
  // }

  static String mImageFile = "";
  static bool isDataLoaded = false;

  static Widget showImagesOffline(
      String fileName, String serverFilePath, void setState) {
    if (!isDataLoaded) {
      loadImage(fileName, serverFilePath, setState);
      return Center(child: DynamicViews.progressBar(20, 20));
    } else {
      return Container(
        width: Utils.getSize(60),
        height: Utils.getSize(60),
        margin: EdgeInsets.only(
            right: Utils.getSize(10.0),
            top: Utils.getSize(10.0),
            left: Utils.getSize(10.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
            image: FileImage(File(mImageFile)),
            fit: BoxFit.fill,
          ),
        ),
      );
    }
  }

  static Future<String> getFile(String ImageName, String mFilePath) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    File attachmentFile = File(path +
        "/" +
        ImageName.toString().replaceAll('/', '').replaceAll('\\', ''));

    if (await attachmentFile.exists()) {
      Utils.showLog("ImageExist1 -", attachmentFile.path.toString());
      return attachmentFile.path.toString();
    } else {
      try {
        await Dio().download(
            Utils.getURLforImages(mFilePath), "${attachmentFile.path}");
        if (attachmentFile != null && await attachmentFile.exists()) {
          Utils.showLog("ImageExist Dio -", attachmentFile.path.toString());
          // getFile(ImageName, mFilePath);

          // await DatabaseHelper().updateFilePath( attachmentFile.path.toString(),id);
        }
      } catch (e) {
        print(e);
      }
    }
    Utils.showLog("ImageExist Dio 2-", attachmentFile.path.toString());
    return attachmentFile.path.toString();
  }

  //  static Future <bool> showTaskUsingDataViewPermission() async{
  //   /*return true;*/
  //   try {
  //     SessionManager sessionManager = new SessionManager();
  //
  //     if (sessionManager == null)
  //       sessionManager = new SessionManager();
  //
  //     String result = await AD_ContractFarmingParaSetting.getContratcFarmingSettingFlag(await sessionManager.getCompanyId(),
  //         Constants.CONFIG_TASK_CALENDAR_DATA_VIEW);
  //     return result != null && !result.equalsIgnoreCase("0")
  //         && !result.equalsIgnoreCase("false");
  //   } catch (Exception e) {
  //   Utils.showException(e);
  //   return false;
  //   }
  // }

  static void loadImage(
      String fileName, String serverFilePath, void setState) async {
    mImageFile = await getFile(fileName, serverFilePath);
    isDataLoaded = true;
    setState;
  }
}

class WeekDetails {
  String weekNo, fromDate, toDate;

  WeekDetails(this.weekNo, this.fromDate, this.toDate);
}
