import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Services/HomePage.dart';
import 'package:ecompusellcontractor/Utility/ApiUtils.dart';
import 'package:ecompusellcontractor/Utility/Constants.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/SessionManager.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:ecompusellcontractor/login/LoginBloc.dart';
import 'package:ecompusellcontractor/login/LoginPage.dart';
// import 'package:farmerp/Common/ComFarmerSelection.dart';
// import 'package:farmerp/Common/CommonSingleList.dart';
// import 'package:farmerp/dynamicUtils/AttachmentDetails.dart';
// import 'package:farmerp/dynamicUtils/CustFB.dart';
// import 'package:farmerp/dynamicUtils/DynamicViews.dart';
// import 'package:farmerp/dynamicUtils/barcodeScanner/BarcodeScanner.dart';
// import 'package:farmerp/dynamicUtils/farmerSelection/DynContractSelection.dart';
// import 'package:farmerp/dynamicUtils/moreOptions/MoreOptions.dart';
// import 'package:farmerp/login/LoginBloc.dart';
// import 'package:farmerp/login/LoginPage.dart';
// import 'package:farmerp/models/Custom/CommonPlotCropQRData.dart';
// import 'package:farmerp/models/Custom/CommonQuries.dart';
// import 'package:farmerp/models/Custom/CustLabourQRData.dart';
// import 'package:farmerp/models/Custom/CustomGradeNameList.dart';
// import 'package:farmerp/models/Custom/FarmerD.dart';
// import 'package:farmerp/models/Custom/MRKPlotDetails.dart';
// import 'package:farmerp/models/master/AD_CompanyDetails.dart';
// import 'package:farmerp/models/master/AD_FarmAttachementDetails.dart';
// import 'package:farmerp/models/master/AD_Login.dart';
// import 'package:farmerp/models/master/AD_UserDetails.dart';
// import 'package:farmerp/models/master/Plots.dart';
// import 'package:farmerp/models/transaction/AD_CommonApprovalDetails.dart';
// import 'package:farmerp/models/transaction/CF_CropProcurement.dart';
// import 'package:farmerp/models/transaction/CF_CropProcurementDetails.dart';
// import 'package:farmerp/models/transaction/CF_FarmerContract.dart';
// import 'package:farmerp/models/transaction/CF_FarmerRegistation.dart';
// import 'package:farmerp/models/transaction/CF_VehicleDetailsOfInventory.dart';
// import 'package:farmerp/models/transaction/Daily_WorkDetails.dart';
// import 'package:farmerp/models/transaction/Daily_WorkSpecific.dart';
// import 'package:farmerp/models/transaction/RK_ObservationParameter.dart';
// import 'package:farmerp/services/BudgetPL056.0/view/BudgetMainScreen.dart';
// import 'package:farmerp/services/BudgetPL056.0/view/BudgetScreen.dart';
// import 'package:farmerp/services/DeliveryDispatchSA001.2/view/DDForm.dart';
// import 'package:farmerp/services/DeliveryDispatchSA001.2/view/DDMainList.dart';
// import 'package:farmerp/services/DeliveryDispatchSA001.2/view/DDPreview.dart';
// import 'package:farmerp/services/ExpenseDetails/view/EDAddForm.dart';
// import 'package:farmerp/services/ExpenseDetails/view/EDMainList.dart';
// import 'package:farmerp/services/ExpenseDetails/view/EDPreview.dart';
// import 'package:farmerp/services/GoodsIssue/View/GIForm.dart';
// import 'package:farmerp/services/GoodsIssue/View/GIMIPreview.dart';
// import 'package:farmerp/services/GoodsIssue/View/GIMainList.dart';
// import 'package:farmerp/services/GoodsIssue/View/GIPreview.dart';
// import 'package:farmerp/services/GoodsReturnIN011.0/view/GRITForm.dart';
// import 'package:farmerp/services/GoodsReturnIN011.0/view/GRITMainList.dart';
// import 'package:farmerp/services/GoodsReturnIN011.0/view/GRITPreview.dart';
// import 'package:farmerp/services/GoodsTransferOnline/view/GTForm_ON.dart';
// import 'package:farmerp/services/GoodsTransferOnline/view/GTMIPreview_ON.dart';
// import 'package:farmerp/services/GoodsTransferOnline/view/GTMainList_ON.dart';
// import 'package:farmerp/services/GoodsTransferOnline/view/GTPreview_ON.dart';
// import 'package:farmerp/services/Help/View/HelpDetailView.dart';
// import 'package:farmerp/services/Help/View/HelpView.dart';
// import 'package:farmerp/services/LabourActTracking/Model/LATEntryModel.dart';
// import 'package:farmerp/services/LabourActTracking/View/LATActivityMain.dart';
// import 'package:farmerp/services/LabourActTracking/View/LATMainList.dart';
// import 'package:farmerp/services/LabourActTracking/View/LATPreview.dart';
// import 'package:farmerp/services/MaterialIndent/MIForm.dart';
// import 'package:farmerp/services/MaterialIndent/MIMainList.dart';
// import 'package:farmerp/services/MaterialIndent/MIPreview.dart';
// import 'package:farmerp/services/MaterialIndent/Model/MISingleTon.dart';
// import 'package:farmerp/services/NonAgri/View/NAForm.dart';
// import 'package:farmerp/services/NonAgri/View/NAMainList.dart';
// import 'package:farmerp/services/ObservationRecording_PR017.0/Model/OBRFormData.dart';
// import 'package:farmerp/services/ObservationRecording_PR017.0/View/OBRForm.dart';
// import 'package:farmerp/services/ObservationRecording_PR017.0/View/OBRList.dart';
// import 'package:farmerp/services/ObservationRecording_PR017.0/View/OBRMain.dart';
// import 'package:farmerp/services/ObservationRecording_PR017.0/View/OBRPreview.dart';
// import 'package:farmerp/services/OnlinePP/view/PPAddForm_ON.dart';
// import 'package:farmerp/services/OnlinePP/view/PPMainList_ON.dart';
// import 'package:farmerp/services/OnlinePP/view/PPPreview_ON.dart';
// import 'package:farmerp/services/SalesBookingSA006.0/view/SBForm.dart';
// import 'package:farmerp/services/SalesBookingSA006.0/view/SBMainList.dart';
// import 'package:farmerp/services/SalesBookingSA006.0/view/SBPreview.dart';
// import 'package:farmerp/services/SalesGoodsReturnSA007.0/view/SGRForm.dart';
// import 'package:farmerp/services/SalesGoodsReturnSA007.0/view/SGRMainList.dart';
// import 'package:farmerp/services/SalesGoodsReturnSA007.0/view/SGRPreview.dart';
// import 'package:farmerp/services/SchemeRegistration/models/CFSingleTon.dart';
// import 'package:farmerp/services/SchemeRegistration/view/CFForm.dart';
// import 'package:farmerp/services/SchemeRegistration/view/CFMainList.dart';
// import 'package:farmerp/services/SchemeRegistration/view/CFPreview.dart';
// import 'package:farmerp/services/ServiceRequest/View/SRMainList.dart';
// import 'package:farmerp/services/ServiceRequest/View/SRMapView.dart';
// import 'package:farmerp/services/ServiceRequest/View/SRPreview.dart';
// import 'package:farmerp/services/TappingDetails/Model/TDEntryModel.dart' as tdEntryModel;
// import 'package:farmerp/services/TappingDetails/View/TDActivityMain.dart';
// import 'package:farmerp/services/TappingDetails/View/TDMainList.dart';
// import 'package:farmerp/services/TappingDetails/View/TDPreview.dart';
// import 'package:farmerp/services/TreeObservation/models/TOEntryModels.dart';
// import 'package:farmerp/services/TreeObservation/view/TOForm.dart';
// import 'package:farmerp/services/TreeObservation/view/TOPreview.dart';
// import 'package:farmerp/services/attendanceRecording/view/ARForm.dart';
// import 'package:farmerp/services/attendanceRecording/view/ARMainList.dart';
// import 'package:farmerp/services/beatPlan/view/BPlanAdd.dart';
// import 'package:farmerp/services/beatPlan/view/BPlanMainList.dart';
// import 'package:farmerp/services/beatPlan/view/BPlanPreview.dart';
// import 'package:farmerp/services/chatSystem/view/ChatList.dart';
// import 'package:farmerp/services/chatSystem/view/UserChatList.dart';
// import 'package:farmerp/services/createTask/view/CTForm.dart';
// import 'package:farmerp/services/createTask/view/CTPreview.dart';
// import 'package:farmerp/services/createTask/view/CTMainList.dart';
// import 'package:farmerp/services/cropProcurement/Model/CPSingleTon.dart';
// import 'package:farmerp/services/cropProcurement/View/CPForm.dart';
// import 'package:farmerp/services/cropProcurement/View/CPNewMainList.dart';
// import 'package:farmerp/services/cropProcurement/View/CPPreview.dart';
// import 'package:farmerp/services/cropProfile/view/CropProfileAttachment.dart';
// import 'package:farmerp/services/cropProfile/view/CropProfileMainList.dart';
// import 'package:farmerp/services/cropProfile/view/CropProfilePreview.dart';
// import 'package:farmerp/services/cropProfile/view/CropProfilleGeoTag.dart';
// import 'package:farmerp/services/cropSchedule/view/CSMainList.dart';
// import 'package:farmerp/services/cropSchedule/view/TaskGrowthDetails.dart';
// import 'package:farmerp/services/dealClosure/model/DCForm.dart';
// import 'package:farmerp/services/dealClosure/view/DCMainList.dart';
// import 'package:farmerp/services/dealClosure/view/DCPreview.dart';
// import 'package:farmerp/services/employeeRegistration/view/ERAddForm.dart';
// import 'package:farmerp/services/employeeRegistration/view/ERMainList.dart';
// import 'package:farmerp/services/employeeRegistration/view/ERPrevie.dart';
// import 'package:farmerp/services/equipmentIssueReturn/view/EIRForm.dart';
// import 'package:farmerp/services/equipmentIssueReturn/view/EIRMainList.dart';
// import 'package:farmerp/services/equipmentIssueReturn/view/EIRPreview.dart';
// import 'package:farmerp/services/farmerAssessment/view/FAForm.dart';
// import 'package:farmerp/services/farmerAssessment/view/FAMainList.dart';
// import 'package:farmerp/services/farmerAssessment/view/FAPreview.dart';
// import 'package:farmerp/services/farmerLog/View/FLForm.dart';
// import 'package:farmerp/services/farmerLog/View/FLMainList.dart';
// import 'package:farmerp/services/farmerLog/View/FLPreview.dart';
// import 'package:farmerp/services/farmerRecordKeeping/View/FRKInfo.dart';
// import 'package:farmerp/services/farmerRecordKeeping/View/FRKMainList.dart';
// import 'package:farmerp/services/farmerRecordKeeping/View/FRKPreview.dart';
// import 'package:farmerp/services/farmerRegistration/model/FRSingleTon.dart';
// import 'package:farmerp/services/farmerRegistration/view/FRForm.dart';
// import 'package:farmerp/services/farmerRegistration/view/FRMainList.dart';
// import 'package:farmerp/services/farmerRegistration/view/FRPreview.dart';
// import 'package:farmerp/services/farmerVisit/view/FVForm.dart';
// import 'package:farmerp/services/farmerVisit/view/FVMainList.dart';
// import 'package:farmerp/services/farmerVisit/view/FVPreview.dart';
// import 'package:farmerp/services/fertilizerRecommendation/view/FREMainList.dart';
// import 'package:farmerp/services/fertilizerRecommendation/view/FRERecommendationDetails.dart';
// import 'package:farmerp/services/fieldQC/view/FQCForm.dart';
// import 'package:farmerp/services/fieldQC/view/FQCMainList.dart';
// import 'package:farmerp/services/fieldQC/view/FQCPreview.dart';
// import 'package:farmerp/services/fieldScouting/View/AFContractFarmingPlanned.dart';
// import 'package:farmerp/services/fieldScouting/View/FSMainList.dart';
// import 'package:farmerp/services/fieldScouting/View/FSPreview.dart';
// import 'package:farmerp/services/fieldScouting/View/FarmerAndPlotList.dart';
// import 'package:farmerp/services/goodsIssueToFarmer/models/GIFEntryModel.dart';
// import 'package:farmerp/services/goodsIssueToFarmer/view/GIFForm.dart';
// import 'package:farmerp/services/goodsIssueToFarmer/view/GIFMainList.dart';
// import 'package:farmerp/services/goodsIssueToFarmer/view/GIFPreview.dart';
// import 'package:farmerp/services/goodsRecieveOnline/view/GRForm.dart';
// import 'package:farmerp/services/goodsRecieveOnline/view/GRMainList.dart';
// import 'package:farmerp/services/goodsRecieveOnline/view/GRPreview.dart';
// import 'package:farmerp/services/harvestForecastGrower/view/HFGMain.dart';
// import 'package:farmerp/services/harvestForecastGrower/view/HFGMainList.dart';
// import 'package:farmerp/services/harvestForecastGrower/view/HFGPreview.dart';
// import 'package:farmerp/services/harvestingDetails/view/HRForm.dart';
// import 'package:farmerp/services/harvestingDetails/view/HRMainList.dart';
// import 'package:farmerp/services/harvestingDetails/view/HRPreview.dart';
// import 'package:farmerp/services/homePage/HomePage.dart';
// import 'package:farmerp/services/homePage/RaiseTicket.dart';
// import 'package:farmerp/services/labourRegistration/view/LRAddForm.dart';
// import 'package:farmerp/services/labourRegistration/view/LRMainList.dart';
// import 'package:farmerp/services/labourRegistration/view/LRPreview.dart';
// import 'package:farmerp/services/machineMaintenance/view/MMForm.dart';
// import 'package:farmerp/services/machineMaintenance/view/MMMainList.dart';
// import 'package:farmerp/services/machineMaintenance/view/MMPreview.dart';
// import 'package:farmerp/services/machineMaintenance/view/receive_asset/RAForm.dart';
// import 'package:farmerp/services/mapModule/view/MapPlotView.dart';
// import 'package:farmerp/services/mapPlotDetails/view/MapBloc.dart';
// import 'package:farmerp/services/myStock/MyStock.dart';
// import 'package:farmerp/services/navigationDrawer/NDPresenter.dart';
// import 'package:farmerp/services/navigationDrawer/NDView.dart';
// import 'package:farmerp/services/nurseryOperations/view/NOForm.dart';
// import 'package:farmerp/services/nurseryOperations/view/NOMainList.dart';
// import 'package:farmerp/services/observation/model/OBSEntryModel.dart';
// import 'package:farmerp/services/observation/view/OBSForm.dart';
// import 'package:farmerp/services/observation/view/OBSMainList.dart';
// import 'package:farmerp/services/observation/view/OBSPreview.dart';
// import 'package:farmerp/services/productDashboard/view/productDetails.dart';
// import 'package:farmerp/services/recordKeeping/RKForm.dart';
// import 'package:farmerp/services/recordKeeping/RKMainList.dart';
// import 'package:farmerp/services/recordKeeping/RKPreview.dart';
// import 'package:farmerp/services/recordKeeping/model/MRKSingleTon.dart';
// import 'package:farmerp/services/serviceIndent/view/SIAddForm.dart';
// import 'package:farmerp/services/serviceIndent/view/SIMainList.dart';
// import 'package:farmerp/services/serviceIndent/view/SIPreview.dart';
// import 'package:farmerp/services/serviceList/SLPresenter.dart';
// import 'package:farmerp/services/serviceList/ServiceList.dart';
// import 'package:farmerp/services/soilAnalysis/view/SAForm.dart';
// import 'package:farmerp/services/soilAnalysis/view/SAMainList.dart';
// import 'package:farmerp/services/soilAnalysis/view/SAPreview.dart';
// import 'package:farmerp/services/taskCalendar/TaskCalendar.dart';
// import 'package:farmerp/services/vendorRegistration/view/VRAddForm.dart';
// import 'package:farmerp/services/vendorRegistration/view/VRMainList.dart';
// import 'package:farmerp/services/vendorRegistration/view/VRPreview.dart';
// import 'package:farmerp/services/scanSticker/view/SSForm.dart';
// import 'package:farmerp/utility/ApiUtils.dart';
// import 'package:farmerp/utility/Constants.dart';
// import 'package:farmerp/utility/LocaleBase.dart';
// import 'package:farmerp/utility/RColors.dart';
// import 'package:farmerp/utility/SessionManager.dart';
// import 'package:farmerp/utility/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';
//
// import '../TreeObservation/view/TOMainList.dart';
// import '../chatSystem/bloc/FCMInit.dart';
// import 'AboutApp.dart';
// import 'MFPresenter.dart';
// import 'Setting.dart';

class MenuData {
  IconData iconData;
  String text;
  double angle;

  MenuData({this.iconData, this.text, this.angle});
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.menuAnimation}) : super(repaint: menuAnimation);
  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0, dy = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      // dx = context.getChildSize(i).width * i;
      dx = 200.0 * math.cos(menuItems[i].angle * (math.pi / 180));
      dy = 200.0 * math.sin(menuItems[i].angle * (math.pi / 180));
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx * menuAnimation.value,
          dy * menuAnimation.value,
          0,
        ),
      );
    }
  }
}

final List<MenuData> menuItems = <MenuData>[
  MenuData(iconData: Icons.home, text: "Home", angle: -30),
  MenuData(iconData: Icons.new_releases, text: "Release", angle: -60),
  MenuData(iconData: Icons.notifications, text: "Notification", angle: -90),
  MenuData(iconData: Icons.settings, text: "Settings", angle: -120),
  MenuData(iconData: Icons.menu, text: "Menu", angle: -150),
];

class MainFragmentSatatess extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    };
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // static MaterialLocalizations of(BuildContext context) {
    //   return Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    // }

    /// References to the localized values defined by MaterialLocalizations
    /// are typically written like this:

    // tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Compusell',
        theme: ThemeData(
//        primarySwatch:MaterialColor(0xFF880E4F, color),// const Color(0xff2980b9),//Colors.amber,
          primarySwatch: MaterialColor(0xFFE5A91B, color),
          fontFamily: 'Lato', // const Color(0xff2980b9),//Colors.amber,
        ),
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          const LocDelegate(),
          // LocDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          // const Locale('id', 'ID'),
          const Locale('mr', 'IN'),
          // const Locale('fr', ''),
        ],
        localeResolutionCallback: (
          Locale locale,
          Iterable<Locale> supportedLocales,
        ) {
          return locale;
        },

//        home: MainFragment("HomePage", "Dashboard", false));
//        home: MyHomePage(
//          title: "",
//        ));

        // home: LoginPageBloc());
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             MainFragment("HomePage", "Dashboard", false, false)));
        // home: MainFragment("HomePage", "Dashboard", false, false));
        home: MainFragment(
          serviceCode,
          title,
          showFB,
          resize,
        ));
  }

  final String serviceCode, title;
  final bool showFB, resize, showBN;

  MainFragmentSatatess(
      {this.serviceCode, this.title, this.showFB, this.resize, this.showBN});
// static LoginPageWidget of(BuildContext context) => context.findAncestorStateOfType<LoginPageWidget>();
// static LoginPageWidget of(BuildContext context) => context.findAncestorStateOfType<LoginPageWidget>();
}

class MainFragment extends StatefulWidget {
  final String serviceCode, title;
  final bool showFB, resize, showBN;

  MainFragment(this.serviceCode, this.title, this.showFB, this.resize,
      {this.showBN});

  @override
  MainFragmentState createState() =>
      MainFragmentState(serviceCode, title, showFB, resize, showBN: showBN);
}

class MainFragmentState extends State<MainFragment>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  String serviceCode, title, flag;
  bool showFB, resize, showBN;
  String qrResult;
  String URL = '';
  static bool isAppUpdateVisible = false;
  WebViewController controllerLocal;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  SessionManager sessionManager = new SessionManager();

  // VoidCallback _showPersBottomSheetCallBack;

  // Localemain string;

  MainFragmentState(this.serviceCode, this.title, this.showFB, this.resize,
      {bool showBN}) {
    // if (!serviceCode.contains("MapPlotDetails")) {
    //   MapBloc.mapFilter = MapFilter();
    // }
    if (serviceCode.contains("Form"))
      this.showABShadow = false;
    else if (serviceCode.contains("MapPlotDetails") ||
        serviceCode.contains("MapPlotDetails"))
      this.showABShadow = false;
    else
      this.showABShadow = true;

    if (serviceCode.contains("HomePage")) {
      showBN = true;
    }

    this.showBN = showBN == null ? false : showBN;
  }

  init() async {
    // position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    await getuserdetals(sessionManager);
  }

  @override
  Future<void> initState() {
    super.initState();
    // AD_CommonApprovalDetails();
    // _showPersBottomSheetCallBack = _showAttachmentSheet(null,null,null ,null,null);
    //floating start
    // initFCM();
    // init();

    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    menuAnimation.addListener(() {
      setState(() {});
    });
    //floating end
    /*
    Added by :Rohit Kurzekar
    Date :01-03-2021
    */
    if (Constants.RELEASE_APK_UPDATE && Platform.isAndroid) {
      print('--------ANDROID INIT---------');
      checkAPKVersion();
    }
    WidgetsBinding.instance.addObserver(this);
    // Code Added for Play Store App Update by Rohit 10-08-2021
    if (Constants.RELEASE_APK_UPDATE_ON_PLAYSTORE && Platform.isAndroid) {
      checkForPlayStoreAPKUpdate();
    }
  }

  // Code Added for Play Store App Update by Rohit 10-08-2021
  checkForPlayStoreAPKUpdate() async {
    String apiAppVersion;
    try {
      String url = "https://farmerp-faa4d-default-rtdb.asia-southeast1.firebasedatabase.app/data.json";
      Uri uri = Uri.parse(url);
      Utils.showLog("FirebaseDatabaseAPPVersionURI", url);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Utils.showLog("APPVersionResponse", response.body);
        // Step 1 : After publishing App to play store for the new client
        // Step 2 : Add new version in firebase realtime database in firebase  "https://console.firebase.google.com/project/farmerp-faa4d/database/farmerp-faa4d-default-rtdb/data"
        // Step 3 : Add new case below for the new client
        // Step 4 : Change the APPVersion class as per the new JSON
        switch (ApiUtils.client) {
          case Clients.FarmerERPTest:
            {
              apiAppVersion = AppVersion.fromJsonAppVersion(json.decode(response.body)).farmErp;
            }
            break;
          case Clients.E20:
            {
              apiAppVersion = AppVersion.fromJsonAppVersion(json.decode(response.body)).farmErpe20;
            }
            break;
        }

        Utils.showLog("APIAPPVersionNumberResponse", apiAppVersion.toString());
        apiVersion = apiAppVersion.toString();
        Utils.showLog("APK VERSION", Constants.AppVersion);
        appVersion = Constants.AppVersion;
      }
    } catch (e,s){
      Utils.showException(e, s);
    }

    if(!Utils.checkString(apiVersion)) {

      List apiVersionSplit = apiVersion.split('.');
      List appVersionSplit = appVersion.split('.');

      if (int.parse(apiVersionSplit[0]) > int.parse(appVersionSplit[0])) {
        isAppUpdateVisible = true;
      } else if (int.parse(apiVersionSplit[1]) > int.parse(appVersionSplit[1])) {
        isAppUpdateVisible = true;
      } else if (int.parse(apiVersionSplit[2]) > int.parse(appVersionSplit[2])) {
        isAppUpdateVisible = true;
      } else if (int.parse(apiVersionSplit[3]) > int.parse(appVersionSplit[3])) {
        isAppUpdateVisible = true;
      }
      // else if (int.parse(apiVersionSplit[4]) > int.parse(appVersionSplit[4])) {
      //   isAppUpdateVisible = true;
      // } else if (int.parse(apiVersionSplit[5]) > int.parse(appVersionSplit[5])) {
      //   isAppUpdateVisible = true;
      // }
    }
  }

  askPlayStoreAPKDownloadDialog() {
    return showDialog(
        context: context,
        builder: (context) => WillPopScope(
            onWillPop: () {
              Utils.showToast("Click on download button to upgrade !");
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                child: Container(
                    height: Utils.getSize(200.0),
//                margin: const EdgeInsets.only(left: 26, right: 26),
                    child: Card(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: Utils.getSize(20.0)),
                                padding: EdgeInsets.only(left: Utils.getSize(20.0)),
                                child: DynamicViews().text(
                                    context,
                                    string.UpdateAvailable,
                                    22,
                                    FontWeight.bold,
                                    RColors.black,
                                    TextAlign.start),
                              ),
                          Container(
                            margin: EdgeInsets.only(top: Utils.getSize(20.0)),
                            padding: EdgeInsets.only(left: Utils.getSize(20.0)),
                            child: DynamicViews().text(
                                context,
                                string.NewVersionAvailable,
                                16,
                                FontWeight.normal,
                                RColors.black,
                                TextAlign.start),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: Utils.getSize(15.0)),
                            margin: EdgeInsets.only(
                                top: Utils.getSize(40.0),
                                // bottom: Utils.getSize(30.0),
                                left: Utils.getSize(10.0),
                                right: Utils.getSize(10.0)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ButtonTheme(
                                      minWidth: 100.0,
                                      child: RaisedButton(
                                          onPressed: () {
                                            platform.invokeMethod(
                                                'playStoreAutoUpdate');
                                            // Navigator.of(context).pop(false);
                                            Navigator.pop(context);
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                          ),
                                          textColor: Colors.white,
                                          color: RColors.PrimaryColor,
                                          padding: EdgeInsets.all(
                                              Utils.getSize(5.0)),
                                          child: new Text(
                                            string.Update,
                                            style: new TextStyle(
                                              fontSize: Utils.getSize(16.0),
                                              color: Colors.white,
                                            ),
                                          )))
                                ]),
                          ),
                        ]))))));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (Constants.RELEASE_APK_UPDATE && Platform.isAndroid && autoDownload) {
        print('--------ANDROID RESUMED---------');
        checkAPKVersion();
      }
      if (Constants.RELEASE_APK_UPDATE_ON_PLAYSTORE && Platform.isAndroid) {
        checkForPlayStoreAPKUpdate();
      }
    }
  }

  static double per;
  // MFPresenter mfPresenter = MFPresenter();

  var currentState;

//  OnDownButtonPressed onDownButtonPressed = OnDownButtonPressed();
  void Function() onBackPressed, onFloatingButtonPressed;
  bool showABShadow = true;
  bool showAppBar = true;

  callFragment(String serviceCode, String title, bool showFB, bool resize,
      {String flag, bool showBN, bool showAppBar}) {
    this.serviceCode = serviceCode;
    this.title = title;
    this.showFB = showFB;
    this.resize = resize;
    this.flag = flag;
    if (serviceCode.contains("HomePage")) {
      showBN = true;
    }
    this.showBN = showBN == null ? false : showBN;
    if (serviceCode.contains("Form") ||
        serviceCode.contains("MapPlotDetails") ||
        serviceCode.contains("AboutApp"))
      this.showABShadow = false;
    else
      this.showABShadow = true;
    this.showAppBar = showAppBar ?? true;
    setState(() {});
  }

  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  bool floatNormal = false;
  bool vertical = true;
  static double camFBSize = 44;
  static double BNHeight = 56.0;
  static double notchMargin = 5;
  static double rightOffset = 300;
  var setStateAPKProgressDialog;

  Localemain string;
  bool isRTL() => Directionality.of(context)
      .toString()
      .contains(TextDirection.RTL.value.toLowerCase());
  @override
  Widget build(BuildContext context) {
    if(isRTL())
      rightOffset = 300;
    else
      rightOffset = 10;
    string = Localizations.of<LocaleBase>(context, LocaleBase).main;
    // string = Localizations.of<LocaleBase>(context, LocaleBase).main;

    initializePresenter();
    per = (((MediaQuery.of(context).size.width) / 360) * 100);
    if ("HomePage" == serviceCode) {
      selectedNavigationBar = 1;
      title = "Dashboard";
    } else if (Constants.TaskCalendar == serviceCode) {
      selectedNavigationBar = 3;
      showFB = false;
    } else if ("MapPlotDetails" == serviceCode)
      selectedNavigationBar = 2;
    else if (Constants.ProductDashboard == serviceCode) {
      // selectedNavigationBar = 3;
      showFB = false;
    } else if (Constants.IssueTransferGoodsReturn == serviceCode) {
     title=string.GoodsReturnIssueTransfer;
    } else
      selectedNavigationBar = 0;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //vertical floating bar
  /*  List<CustChildFB> childButtons =[];

    childButtons.add(CustChildFB(
        hasLabel: true,
        labelHasShadow: false,
        labelText: "Barcode",
        labelBackgroundColor: Colors.white,
        currentButton: FloatingActionButton(
          backgroundColor: RColors.bgBottomNavigation,
          mini: true,
          // child: Container(
          child: DynamicViews().svgImageAsset(
              context,
              "assets/rebootDesign/svgImgs/Artboard_Merged 2_Barcode Scanner.svg",
              12,
              color: RColors.white),
          // ),
          // Icon(Icons.train),
          onPressed: () async {
            qrResult = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => BarcodeScanner()));
            try {
              if (qrResult != null) {
                setPlotData(qrResult);
              } else {
                Utils.showToast("QR code doesn't match with Plots");
              }
            } catch (e) {
              print(e);
            }
          },
        )));

    childButtons.add(CustChildFB(
        hasLabel: true,
        labelHasShadow: false,
        labelText: "Camera",
        labelBackgroundColor: Colors.white,
        currentButton: FloatingActionButton(
          onPressed: () async {
            PickedFile file =
                await ImagePicker().getImage(source: ImageSource.camera);
            AttachmentDetailsState.attachmentList = List();
            if (AttachmentDetailsState.attachmentList.length >= 12) {
              Utils.showToast("Can not select more than 12 attachements.");
            } else {
              await onImageSelected(File(file.path));
              _showAttachmentSheet(
                  "'" +
                      Constants.FarmerRecordKeeping +
                      "','" +
                      Constants.ObservationRecording +
                      "','" +
                      Constants.CropProcurement +
                      "','" +
                      Constants.Observation +
                      "','" +
                      Constants.FarmerRegistration +
                      "','" +
                      Constants.SchemeRegistration +
                      "','" +
                      Constants.MaterialIndent +
                      "','" +
                      Constants.MultiplotRecordKeeping +
                      "','" +
                      Constants.TreeObservation +
                      "','" +
                      Constants.GoodsIssueToFarmer +
                      "'",
                  "2",
                  "Attachment",
                  "",
                  File(file.path));
            }
          },
          // heroTag: "airplane",
          backgroundColor: RColors.bgBottomNavigation,
          mini: true,
          child: Container(
            child: DynamicViews().svgImageAsset(
                context,
                "assets/rebootDesign/svgImgs/Artboard_Merged 2_Select Attachment from Camera .svg",
                10,
                color: RColors.white),
          ),
          heroTag: "btn10",
        )));*/

    /*
                  Commented to hide Assistant and terms condition
                  Date :14th Maech 2021
                  By : Sumit
                  * */
    // childButtons.add(CustChildFB(
    //     hasLabel: true,
    //     labelHasShadow: false,
    //     labelText: "Assistant",
    //     labelBackgroundColor: Colors.white,
    //     currentButton: FloatingActionButton(
    //       // heroTag: "airplane",
    //       backgroundColor: RColors.bgBottomNavigation,
    //       mini: true,
    //       child: Container(
    //         child: DynamicViews().imageAsset2(
    //             context,
    //             "assets/rebootDesign/bottomNav/scale300/Active_More@3x.png",
    //             10,
    //             RColors.white),
    //       ),
    //       heroTag: "btn11",
    //     )));

    // childButtons.add(UnicornButton(
    //     labelHasShadow: false,
    //     currentButton: FloatingActionButton(
    //         heroTag: "directions",
    //         backgroundColor: Colors.blueAccent,
    //         mini: true,
    //         child: Icon(Icons.directions_car))));
    if (true)
      return WillPopScope(
          onWillPop: () async {
            if (Scaffold.of(dContext).isDrawerOpen)
              Scaffold.of(dContext).openEndDrawer();
            else {
              try {
                if (bottomSheetConext != null) {
                  Navigator.pop(bottomSheetConext);
                }
                // else if (cameraSheetConext != null) {
                //   Navigator.pop(cameraSheetConext);
                // }
                else {
                  onBackPressed();
                }
              } catch (e) {
                print(e);
              }
            }
            return false;
          },
          //code block added by Sumit 26 May 2021
          child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                resizeToAvoidBottomInset: resize,
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(0.0),
                    // here the desired height
                    child: AppBar(title: Text(""))),
                body: Builder(
                    builder: (context) => Stack(
                          children: [
                            Container(
                                color: "HomePage" == serviceCode
                                    ? RColors.bgColor
                                    : Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    if (showAppBar) appBar(context, title),
                                    Expanded(
                                      child: service(),
                                    ),
                                  ],
                                )),
                            if (showBN)
                              Align(
                                child: ClipPath(
                                  clipper: NotchD2(),
                                  // clipper: CircularNotchedRectangle(),
                                  child: Container(
                                    // margin: EdgeInsets.only(
                                    //   bottom: Utils.getSize(56.0),
                                    // ),
                                    height: Utils.getSize(BNHeight),
                                    // color: RColors.greenishBlue,
                                    // color: RColors.bluishGreen,
                                    // color: RColors.pink,
                                    color: Colors.transparent,
                                    // child: DynamicViews().navigationBar(context,
                                    //     selectedNavigationBar, string, this,isRTL()),
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                            if (showBN)
                              Align(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: Utils.getSize(
                                        BNHeight - ((camFBSize / 2))),
                                    right: Utils.getSize(
                                        notchMargin + rightOffset),
                                  ),
                                  // child:
                                  //     // FloatingActionButton(
                                  //     //   backgroundColor: RColors.bluishGreen,
                                  //     //   child:
                                  //     CustFloatingButton(
                                  //         backgroundColor: Colors.transparent,
                                  //         // Color.fromRGBO(255, 255, 255, 0.6),
                                  //         parentButtonBackground:
                                  //             RColors.bgBottomNavigation,
                                  //         orientation:
                                  //             UnicornOrientation.VERTICAL,
                                  //         hasNotch: true,
                                  //         // childPadding: Utils.getSize(30),
                                  //         parentButton: Icon(Icons.add),
                                  //         animationDuration: 10,
                                  //         childPadding: 15,
                                  //         childButtons: childButtons),
                                  // //   onPressed: () {},
                                  // // )
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                          ],
                        )),
                extendBody: true,
                bottomNavigationBar: Container(height: 0),
                  /*  ? BottomAppBar(
                        // color: Colors.blue,
                        color: Colors.transparent,
                        notchMargin: Utils.getSize(5.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: DynamicViews().isBarCode
                            ? CircularNotchedRectangle()
                            : null,
                        // child: ClipPath(
                        //   clipper: NotchD2(),
                        // clipper: CircularNotchedRectangle(),
                        child: Container(
                          height: Utils.getSize(showBN ? 56.0 : 0),
                          // color: RColors.greenishBlue,
                          // color: RColors.bluishGreen,
                          // color: RColors.pink,
                          color: Colors.transparent,
                          child: DynamicViews().navigationBar(
                              context, selectedNavigationBar, string, this,isRTL()),
                        ),
                        // ),
                        // BottomNavigationBar(
                        //   items: const <BottomNavigationBarItem>[
                        //     BottomNavigationBarItem(
                        //       icon: Icon(Icons.home),
                        //       label: 'Home',
                        //     ),
                        //     BottomNavigationBarItem(
                        //       icon: Icon(Icons.business),
                        //       label: 'Business',
                        //     ),
                        //     BottomNavigationBarItem(
                        //       icon: Icon(Icons.school),
                        //       label: 'School',
                        //     ),
                        //   ],
                        // ),
                      )
                    : Container(height: 0),*/

                floatingActionButtonLocation: showFB
                    ? FloatingActionButtonLocation.endFloat
                    : FloatingActionButtonLocation.endDocked,
                floatingActionButton: showFB
                    ? FloatingActionButton(
                        backgroundColor: RColors.bluishGreen,
                        onPressed: () {
                          onFloatingButtonPressed();
                        },
                        tooltip: 'Increment',
                        heroTag: "btn12",
                        child: Icon(Icons.add))
                    : showBN && false
                        ? !floatNormal
                            ? vertical
                                ? Container(
                                    height: Utils.getSize(40),
                                    width: Utils.getSize(40),
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: [
                                        // Container(
                                        //   height: Utils.getSize(48),
                                        //   width: Utils.getSize(48),
                                        //   // padding: EdgeInsets.all(Utils.getSize(15)),
                                        //   alignment: Alignment.center,
                                        //   decoration: BoxDecoration(
                                        //     color: Colors.redAccent,
                                        //     shape: BoxShape.circle,
                                        //   ),
                                        //
                                        //   child:
                                        // ),

                        // Align(
                        //   alignment: Alignment.center,
                        //   child: CustFloatingButton(
                        //       backgroundColor:
                        //       Colors.transparent,
                        //       // Color.fromRGBO(255, 255, 255, 0.6),
                        //       parentButtonBackground:
                        //       RColors.bgBottomNavigation,
                        //       orientation:
                        //       UnicornOrientation.VERTICAL,
                        //       hasNotch: true,
                        //       // childPadding: Utils.getSize(30),
                        //       parentButton: Icon(Icons.add),
                        //       childButtons: childButtons),
                        // ),
                        // IgnorePointer(
                        //     child: Container(
                        //         height: Utils.getSize(40),
                        //         width: Utils.getSize(40),
                        //         // padding: EdgeInsets.all(Utils.getSize(15)),
                        //         alignment: Alignment.center,
                        //         decoration: BoxDecoration(
                        //           color: RColors.bgBottomNavigation,
                        //           shape: BoxShape.circle,
                        //         ),
                        //         child: Icon(
                        //           Icons.add,
                        //           size: Utils.getSize(20),
                        //           color: Colors.white,
                        //         ))),
                      ],
                    ))
                    : Container()
                // : Container(
                //     color: RColors.blue,
                //     alignment: Alignment.bottomCenter,
                //     margin: EdgeInsets.all(Utils.getSize(20)),
                //     child: FabCircularMenu(
                //       key: fabKey,
                //       // Cannot be `Alignment.center`
                //       alignment: Alignment.bottomCenter,
                //       ringColor: Colors.transparent,
                //       //Colors.white.withAlpha(25),
                //       ringDiameter: 500.0,
                //       ringWidth: 150.0,
                //       fabSize: 64.0,
                //       // fabElevation: 8.0,
                //       fabIconBorder: CircleBorder(),
                //       // Also can use specific color based on wether
                //       // the menu is open or not:
                //       // fabOpenColor: Colors.white
                //       // fabCloseColor: Colors.white
                //       // These properties take precedence over fabColor
                //       fabColor: Colors.white,
                //       // final primaryColor = Theme.of(context).primaryColor;
                //       fabOpenIcon: Icon(Icons.menu, color: RColors.blue),
                //       fabCloseIcon: Icon(Icons.close, color: RColors.blue),
                //       // fabMargin:
                //       // const EdgeInsets.all(16.0),
                //       animationDuration: const Duration(milliseconds: 800),
                //       animationCurve: Curves.easeInOutCirc,
                //       onDisplayChange: (isOpen) {
                //         _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
                //       },
                //       children: <Widget>[
                //         RawMaterialButton(
                //           onPressed: () {
                //             _showSnackBar(context, "You pressed 1");
                //           },
                //           shape: CircleBorder(),
                //           padding: const EdgeInsets.all(24.0),
                //           child: Icon(Icons.looks_one, color: Colors.white),
                //         ),
                //         RawMaterialButton(
                //           onPressed: () {
                //             _showSnackBar(context, "You pressed 2");
                //           },
                //           shape: CircleBorder(),
                //           padding: const EdgeInsets.all(24.0),
                //           child: Icon(Icons.looks_two, color: Colors.white),
                //         ),
                //         RawMaterialButton(
                //           onPressed: () {
                //             _showSnackBar(context, "You pressed 3");
                //           },
                //           shape: CircleBorder(),
                //           padding: const EdgeInsets.all(24.0),
                //           child: Icon(Icons.looks_3, color: Colors.white),
                //         ),
                //         RawMaterialButton(
                //           onPressed: () {
                //             _showSnackBar(context, "You pressed 4. This one closes the menu on tap");
                //             fabKey.currentState.close();
                //           },
                //           shape: CircleBorder(),
                //           padding: const EdgeInsets.all(24.0),
                //           child: Icon(Icons.looks_4, color: Colors.white),
                //         )
                //       ],
                //     ))
                    : Container(
                  width: Utils.getSize(52.0),
                  height: Utils.getSize(52.0),
                  child: RawMaterialButton(
                    // fillColor: RColors.bluishGreen,
                    fillColor: RColors.white,
                    shape: new CircleBorder(),
                    elevation: 0.0,
                    child: DynamicViews().svgImageAsset(
                        context,
                        "assets/rebootDesign/svgImgs/Artboard_Merged 2_Barcode Scanner.svg",
                        24,
                        color: RColors.greenishBlue),
                    // Icon(
                    //   Icons.add,
                    //   color: Colors.white,
                    // ),
                    onPressed: () {
                      onFloatingButtonPressed();
                    },
                  ),
                )
                // : Container()
                    : Container(),
                drawerEnableOpenDragGesture: showAppBar ?? true,

                drawer: SafeArea(
                    child: Container(
                        width: Utils.getSize(300.0), child: drawer())),
// Populate the Drawer in the next step.
              ))
        //block ended
      );
//     else
//       return MaterialApp(
//         localizationsDelegates: [
//           // ... app-specific localization delegate[s] here
//           const LocDelegate(),
//           // LocDelegate(),
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: [
//           const Locale('en', 'US'),
//           // English, no country code
//           const Locale('id', 'ID'),
//           // English UK
//           const Locale('mr', 'IN'),
//           const Locale('fr', 'ID'),
//           // English UK
//           // const Locale('he', ''), // Hebrew, no country code
//           // const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
//           // ... other locales the app supports
//         ],
//         // localizationsDelegates: [
//         //   const LocDelegate(),
//         //   GlobalMaterialLocalizations.delegate,
//         //   GlobalWidgetsLocalizations.delegate,
//         // ],
//         // supportedLocales: [
//         //   const Locale('en', 'US'), // English US
//         //   const Locale('id', 'ID'), // English UK
//         //   const Locale('mr', 'MR'), // English UK
//         //   // ... other locales the app supports
//         // ],
// //      title: 'Flutter Demo',
//         theme: ThemeData(
//           primaryColor: Colors.white,
//         ),
//         home: WillPopScope(
//             onWillPop: () async {
//               if (Scaffold
//                   .of(dContext)
//                   .isDrawerOpen)
//                 Scaffold.of(dContext).openEndDrawer();
//               else {
//                 try {
//                   if (bottomSheetConext != null) {
//                     Navigator.pop(bottomSheetConext);
//                   } else if (cameraSheetConext != null) {
//                     Navigator.pop(cameraSheetConext);
//                   } else {
//                     onBackPressed();
//                   }
//                 } catch (e) {
//                   print(e);
//                 }
//               }
//               return false;
//             },
//             child: Scaffold(
//               key: scaffoldKey,
//               resizeToAvoidBottomInset: resize,
//               appBar: PreferredSize(
//                   preferredSize: Size.fromHeight(0.0),
//                   // here the desired height
//                   child: AppBar(title: Text(""))),
//               body: Builder(
//                   builder: (context) =>
//                       Stack(
//                         children: [
//                           Container(
//                               color: "HomePage" == serviceCode
//                                   ? RColors.bgColor
//                                   : Colors.white,
//                               child: Column(
//                                 children: <Widget>[
//                                   if (showAppBar) appBar(context, title),
//                                   Expanded(
//                                     child: service(),
//                                   ),
//                                 ],
//                               )),
//                           if (showBN)
//                           //todo:notch demo for manual
//                             Align(
//                               child: ClipPath(
//                                 clipper: NotchD2(),
//                                 // clipper: CircularNotchedRectangle(),
//                                 child: Container(
//                                   // margin: EdgeInsets.only(
//                                   //   bottom: Utils.getSize(56.0),
//                                   // ),
//                                   height: Utils.getSize(BNHeight),
//                                   // color: RColors.greenishBlue,
//                                   // color: RColors.bluishGreen,
//                                   // color: RColors.pink,
//                                   color: Colors.transparent,
//                                   child: DynamicViews().navigationBar(
//                                       context,
//                                       selectedNavigationBar,
//                                       string,
//                                       this,
//                                       isRTL()),
//                                 ),
//                               ),
//                               alignment: Alignment.bottomCenter,
//                             ),
//                           if (showBN)
//                             Align(
//                               child: Container(
//                                 margin: EdgeInsets.only(
//                                   bottom: Utils.getSize(
//                                       BNHeight - ((camFBSize / 2))),
//                                   right:
//                                   Utils.getSize(notchMargin + rightOffset),
//                                 ),
//                                 child:
//                                 // FloatingActionButton(
//                                 //   backgroundColor: RColors.bluishGreen,
//                                 //   child:
//                                 CustFloatingButton(
//                                     backgroundColor: Colors.transparent,
//                                     // Color.fromRGBO(255, 255, 255, 0.6),
//                                     parentButtonBackground:
//                                     RColors.bgBottomNavigation,
//                                     orientation:
//                                     UnicornOrientation.VERTICAL,
//                                     hasNotch: true,
//                                     // childPadding: Utils.getSize(30),
//                                     parentButton: Icon(Icons.add),
//                                     animationDuration: 10,
//                                     childPadding: 15,
//                                     childButtons: childButtons),
//                                 //   onPressed: () {},
//                                 // )
//                               ),
//                               alignment: Alignment.bottomRight,
//                             ),
//                         ],
//                       )),
//               extendBody: true,
//               bottomNavigationBar: false
//                   ? BottomAppBar(
//                 // color: Colors.blue,
//                 color: Colors.transparent,
//                 notchMargin: Utils.getSize(5.0),
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 shape: DynamicViews().isBarCode
//                     ? CircularNotchedRectangle()
//                     : null,
//                 // child: ClipPath(
//                 //   clipper: NotchD2(),
//                 // clipper: CircularNotchedRectangle(),
//                 child: Container(
//                   height: Utils.getSize(showBN ? 56.0 : 0),
//                   // color: RColors.greenishBlue,
//                   // color: RColors.bluishGreen,
//                   // color: RColors.pink,
//                   color: Colors.transparent,
//                   child: DynamicViews().navigationBar(context,
//                       selectedNavigationBar, string, this, isRTL()),
//                 ),
//                 // ),
//                 // BottomNavigationBar(
//                 //   items: const <BottomNavigationBarItem>[
//                 //     BottomNavigationBarItem(
//                 //       icon: Icon(Icons.home),
//                 //       label: 'Home',
//                 //     ),
//                 //     BottomNavigationBarItem(
//                 //       icon: Icon(Icons.business),
//                 //       label: 'Business',
//                 //     ),
//                 //     BottomNavigationBarItem(
//                 //       icon: Icon(Icons.school),
//                 //       label: 'School',
//                 //     ),
//                 //   ],
//                 // ),
//               )
//                   : Container(height: 0),
//
//               floatingActionButtonLocation: showFB
//                   ? FloatingActionButtonLocation.endFloat
//                   : FloatingActionButtonLocation.endDocked,
//               floatingActionButton: showFB
//                   ? FloatingActionButton(
//                   backgroundColor: RColors.bluishGreen,
//                   onPressed: () {
//                     onFloatingButtonPressed();
//                   },
//                   tooltip: 'Increment',
//                   heroTag: "btn12",
//                   child: Icon(Icons.add))
//                   : showBN && false
//                   ? !floatNormal
//                   ? vertical
//                   ? Container(
//                   height: Utils.getSize(40),
//                   width: Utils.getSize(40),
//                   alignment: Alignment.center,
//                   child: Stack(
//                     children: [
//                       // Container(
//                       //   height: Utils.getSize(48),
//                       //   width: Utils.getSize(48),
//                       //   // padding: EdgeInsets.all(Utils.getSize(15)),
//                       //   alignment: Alignment.center,
//                       //   decoration: BoxDecoration(
//                       //     color: Colors.redAccent,
//                       //     shape: BoxShape.circle,
//                       //   ),
//                       //
//                       //   child:
//                       // ),
//
//                       Align(
//                         alignment: Alignment.center,
//                         child: CustFloatingButton(
//                             backgroundColor: Colors.transparent,
//                             // Color.fromRGBO(255, 255, 255, 0.6),
//                             parentButtonBackground:
//                             RColors.bgBottomNavigation,
//                             orientation:
//                             UnicornOrientation.VERTICAL,
//                             hasNotch: true,
//                             // childPadding: Utils.getSize(30),
//                             parentButton: Icon(Icons.add),
//                             childButtons: childButtons),
//                       ),
//                       // IgnorePointer(
//                       //     child: Container(
//                       //         height: Utils.getSize(40),
//                       //         width: Utils.getSize(40),
//                       //         // padding: EdgeInsets.all(Utils.getSize(15)),
//                       //         alignment: Alignment.center,
//                       //         decoration: BoxDecoration(
//                       //           color: RColors.bgBottomNavigation,
//                       //           shape: BoxShape.circle,
//                       //         ),
//                       //         child: Icon(
//                       //           Icons.add,
//                       //           size: Utils.getSize(20),
//                       //           color: Colors.white,
//                       //         ))),
//                     ],
//                   ))
//                   : Container()
//                   : Container(
//                 width: Utils.getSize(52.0),
//                 height: Utils.getSize(52.0),
//                 child: RawMaterialButton(
//                   // fillColor: RColors.bluishGreen,
//                   fillColor: RColors.white,
//                   shape: new CircleBorder(),
//                   elevation: 0.0,
//                   child: DynamicViews().svgImageAsset(
//                       context,
//                       "assets/rebootDesign/svgImgs/Artboard_Merged 2_Barcode Scanner.svg",
//                       24,
//                       color: RColors.greenishBlue),
//                   // Icon(
//                   //   Icons.add,
//                   //   color: Colors.white,
//                   // ),
//                   onPressed: () {
//                     onFloatingButtonPressed();
//                   },
//                 ),
//               )
//               // : Container()
//                   : Container(),
//
//               drawer: SafeArea(
//                   child:
//                   Container(width: Utils.getSize(300.0), child: drawer())),
// // Populate the Drawer in the next step.
//             )),
//       );
  }

  // MRKPlotDetails mData = null;
  //
  // CF_FarmerContract cfFarmerContract;
  // CustLabourQRData modelLabour = null;
  //
  // FarmerD model = null;
  //
  // CommonPlotCropQRData modelPlot = null;

  // void setPlotData(String qrResult) async {
  //   String mToast = "";
  //   SessionManager sessionManager = new SessionManager();
  //
  //   if (!Utils.checkString(qrResult)) {
  //     print(qrResult);
  //     String str = qrResult.toString();
  //     String mText1 = "",
  //         mText2 = "";
  //
  //     if (str.contains(" >> ")) {
  //       mToast = "QR code doesn't match with Plots";
  //       var mQRParts = str.split(" >> ");
  //
  //       if (mQRParts != null && mQRParts.length == 5) {
  //         var mQRSubPlotName = mQRParts[2].trim();
  //         Utils.printWrapped("Inside subName ", "subName ");
  //
  //         if (mQRSubPlotName != null) {
  //           SessionManager sessionManager = SessionManager();
  //
  //           List<MRKPlotDetails> mPlotData = await Plots.getCropProfilePlotList(
  //               await sessionManager.getUserID(),
  //               await sessionManager.getLoginID(),
  //               mQRSubPlotName,
  //               Constants.ALL_SITE_PLOT_LIST);
  //
  //           if (mPlotData != null && mPlotData.length > 0) {
  //             Utils.printWrapped("Inside qr ", "qtr ");
  //             mData = mPlotData[0];
  //             mText1 = mData.Name.toString();
  //             _showBottomSheet("'PR019.6','PR016.0'", "1", mText1, mText2);
  //             // _showPersBottomSheetCallBack ;
  //           } else {
  //             Utils.showToast(mToast);
  //           }
  //         } else {
  //           Utils.showToast(mToast);
  //         }
  //       } else {
  //         Utils.showToast(mToast);
  //       }
  //     } else {
  //       String decoded = "";
  //       try {
  //         decoded = utf8.decode(base64Url.decode(qrResult));
  //       } catch (e) {
  //         decoded = "";
  //         print(e);
  //       }
  //       if (!Utils.checkStringWithZero(decoded)) {
  //         try {
  //           model = await Utils.getFarmerdetail(decoded);
  //         } catch (e) {
  //           Utils.printWrapped("Exception Triggered -", decoded);
  //           print(e);
  //         }
  //         if (model == null ||
  //             (model != null &&
  //                 Utils.checkStringWithZero(model
  //                     .Contract_Id))) // if Farmer QR fail then parse to Plot
  //         {
  //           modelPlot = await Utils.getPlotParsedDetail(decoded);
  //         }
  //         try {
  //           Utils.printWrapped("Plotdata", modelPlot.SubPlotName);
  //         } catch (e) {
  //           print(e);
  //         }
  //         // if (model == null) // if null with contract model then check with other
  //         // {
  //         //   modelLabour = null ;
  //         //   modelLabour = await Utils.getLabourParsedDetail(decoded);
  //         // }
  //         if (model != null && !Utils.checkStringWithZero(model.Contract_Id)) {
  //           mText1 = model.Farmer_Name.toString();
  //           mText2 = model.Crop_name.toString();
  //
  //           cfFarmerContract = await CF_FarmerContract.getPlotDetailsRecord(
  //               await sessionManager.getLoginID(),
  //               await sessionManager.getCompanyId(),
  //               model.Contract_Id.toString(),
  //               model.Farmer_Id.toString());
  //           if (cfFarmerContract != null) {
  //             cfFarmerContract.farmerName = model.Farmer_Name.toString();
  //             // Utils.printWrapped("Famrername", cfFarmerContract.farmerName  );
  //             // cfFarmerContract.Crop_Name = cfFarmerContract.Crop_Name.toString();
  //             cfFarmerContract.Contract_Id = model.Contract_Id.toString();
  //             try {
  //               cfFarmerContract.Work_Date =
  //                   Utils.getBlankIfNull(Utils.getCurrentDateWithTime());
  //             } catch (e) {
  //               print(e);
  //             }
  //
  //             String fDate = "";
  //             if (model.Sowing_Date.toString() != null) {
  //               try {
  //                 DateTime dateTimefrom =
  //                 new DateFormat(Utils.displayFormatDate)
  //                     .parse(model.Sowing_Date.toString());
  //                 fDate =
  //                     new DateFormat(Utils.sqlDateFormat).format(dateTimefrom);
  //                 cfFarmerContract.Sowing_Pruning_Date = fDate;
  //               } catch (e) {
  //                 print(e);
  //               }
  //             }
  //
  //             _showBottomSheet(
  //                 "'" +
  //                     Constants.FarmerRecordKeeping +
  //                     "','" +
  //                     Constants.ObservationRecording +
  //                     "','" +
  //                     Constants.CropProcurement +
  //                     "','" +
  //                     Constants.GoodsIssueToFarmer +
  //                     "'",
  //                 "2",
  //                 mText1,
  //                 mText2);
  //           } else {
  //             mToast = "No QR data found";
  //             Utils.showToast(mToast);
  //           }
  //         } else if (modelPlot != null &&
  //             !Utils.checkString(modelPlot.SubPlotName)) {
  //           var mQRSubPlotName = modelPlot.SubPlotName;
  //
  //           if (mQRSubPlotName != null) {
  //             SessionManager sessionManager = SessionManager();
  //
  //             List<MRKPlotDetails> mPlotData =
  //                 await Plots.getCropProfilePlotList(
  //                     await sessionManager.getUserID(),
  //                     await sessionManager.getLoginID(),
  //                     mQRSubPlotName,
  //                     Constants.ALL_SITE_PLOT_LIST);
  //
  //             if (mPlotData != null && mPlotData.length > 0) {
  //               Utils.printWrapped("Inside qr ", "qtr ");
  //               mData = mPlotData[0];
  //               mText1 = mData.Name.toString();
  //               _showBottomSheet("'PR019.6','PR016.0'", "1", mText1, mText2);
  //               // _showPersBottomSheetCallBack ;
  //             } else {
  //               Utils.showToast(mToast);
  //             }
  //           }
  //         } else
  //         // if (modelLabour != null && !Utils.checkStringWithZero(modelLabour.UserId.toString()))
  //         {
  //           modelLabour = await Utils.getLabourParsedDetail(decoded);
  //           mText1 = modelLabour.UserName.toString() +
  //               " (" +
  //               modelLabour.UserCode.toString() +
  //               ") ";
  //           _showBottomSheet("'" + Constants.LabourActivityTracking+"','"+Constants.TappingDetails + "'", "3",
  //               mText1, mText2);
  //         }
  //       } else {
  //         Utils.showToast("QR code doesn't match");
  //       }
  //     }
  //   } else {
  //     mToast = "No QR data";
  //     Utils.showToast(mToast + " 3");
  //   }
  // }

  BuildContext bottomSheetConext;
  //
  // void _showBottomSheet(String mServiceCodes, String mQRDataType, String mText1,
  //     String mText2) async {
  //   Utils.printWrapped("Inside sheet", "Sheet ");
  //   setState(() {
  //     // _showPersBottomSheetCallBack = null;
  //   });
  //   await getServiceListData(mServiceCodes, 1);
  //
  //   scaffoldKey.currentState
  //       .showBottomSheet((context) {
  //         bottomSheetConext = context;
  //
  //         return new Container(
  //           margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
  //           padding: const EdgeInsets.all(10),
  //           height: MediaQuery.of(context).size.height - 200.0,
  //           // color: Colors.white,
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.all(Radius.circular(15)),
  //               boxShadow: [
  //                 BoxShadow(
  //                     blurRadius: 10, color: Colors.grey[400], spreadRadius: 5)
  //               ]),
  //           child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       GestureDetector(
  //                         child: DynamicViews().svgImageAsset(
  //                             context,
  //                             "assets/rebootDesign/svgImgs/Artboard_Merged 2_Remove The selected.svg",
  //                             20),
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                       ),
  //                     ]),
  //                 SizedBox(
  //                   height: 20.0,
  //                 ),
  //                 DynamicViews().text(context, mText1, 14, FontWeight.bold,
  //                     RColors.black, TextAlign.start),
  //                 SizedBox(
  //                   height: 5.0,
  //                 ),
  //                 DynamicViews().text(context, mText2, 14, FontWeight.bold,
  //                     RColors.textColorlight, TextAlign.start),
  //                 SizedBox(
  //                   height: 15.0,
  //                 ),
  //                 //   new Center(
  //                 //   child: Column(
  //                 //   mainAxisSize: MainAxisSize.max,
  //                 //   mainAxisAlignment: MainAxisAlignment.center,
  //                 //   children: <Widget> [
  //                 list(1)
  //                 //   ]
  //                 // ),
  //                 // ),
  //               ]),
  //         );
  //       })
  //       .closed
  //       .whenComplete(() {
  //         if (mounted) {
  //           setState(() {
  //             // _showPersBottomSheetCallBack = _showBottomSheet("","");
  //           });
  //         }
  //       });
  // }

  // list(int mType) {
  //   return filterList == null || (filterList != null && filterList.length <= 0)
  //       ? Container(
  //           alignment: Alignment.center,
  //           child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   height: Utils.getSize(100.0),
  //                 ),
  //                 DynamicViews().text(context, "No Service Found", 18,
  //                     FontWeight.bold, RColors.black, TextAlign.center),
  //               ]),
  //         )
  //       : Expanded(
  //           child: ListView.builder(
  //           shrinkWrap: true,
  //           itemBuilder: (BuildContext context, int index) {
  //             return singleServiceItem(filterList[index], index, mType);
  //           },
  //           itemCount: filterList.length,
  //         ));
  // }

  // void callObservation() async {
  //   if (mData != null) {
  //     OBSEntryModel().clear();
  //     OBSEntryModel _obsSinglton = new OBSEntryModel();
  //
  //     MRKPlotDetails value = mData;
  //
  //     _obsSinglton.mainDataModel.Plot_Name = value.Site_Name +
  //         " - " +
  //         value.Plot_Name +
  //         " - " +
  //         value.SubPlot_Name +
  //         " - " +
  //         value.Crop_Name +
  //         " - " +
  //         value.Variety_Name;
  //
  //     _obsSinglton.mainDataModel.Farm_Id = value.Farm_ID.toString();
  //     _obsSinglton.mainDataModel.Plot_Id = value.Plot_ID.toString();
  //     _obsSinglton.mainDataModel.UserCropProfileId =
  //         value.UserCropProfileId.toString();
  //     _obsSinglton.mainDataModel.AreaCovered = value.CropArea.toString();
  //     _obsSinglton.mainDataModel.CropArea = value.CropArea.toString();
  //     _obsSinglton.mainDataModel.Site_ID = value.Site_ID.toString();
  //     _obsSinglton.mainDataModel.Crop_ID = value.CropId.toString();
  //     _obsSinglton.mainDataModel.Crop_Name = value.CropId.toString();
  //     _obsSinglton.mainDataModel.Variety_ID = value.Variety.toString();
  //     _obsSinglton.mainDataModel.Variety_Name = value.Variety_Name.toString();
  //     _obsSinglton.mainDataModel.SubPlot_Name = value.SubPlot_Name.toString();
  //     _obsSinglton.mainDataModel.Unit_Id = value.CropAreaUnitId.toString();
  //     _obsSinglton.mainDataModel.Unit = value.Unit.toString();
  //
  //     if (Utils.checkString(_obsSinglton.mainDataModel.Unit.toString())) {
  //       _obsSinglton.mainDataModel.Unit = "Acre";
  //     }
  //
  //     try {
  //       if ((_obsSinglton.cropQaulityParam != null &&
  //           _obsSinglton.cropQaulityParam.length == 0) ||
  //           _obsSinglton.cropQaulityParam == null) {
  //         _obsSinglton.cropQaulityParam =
  //         await RK_ObservationParameter.getParamUsingCropIdandTypeandFor(
  //             _obsSinglton.mainDataModel.Crop_ID.toString(),
  //             Constants.OBSERVATION_PARAMETER,
  //             Constants.TYPE_GENERAL);
  //         SessionManager sessionManager  = new SessionManager();
  //         String mCropID = await sessionManager.getValueOf(Constants.LAST_SELETED_CROP_IDS);
  //         String mParamsID =  await sessionManager.getValueOf(Constants.LAST_SELETED_PARAMS_IDS);
  //         Utils.printWrapped("ResultLen",  _obsSinglton.cropQaulityParam.length.toString() +" "+mCropID +" "+ mParamsID);
  //         if(!Utils.checkStringWithZero(mParamsID) && !Utils.checkStringWithZero(mCropID) && Utils.equalsIgnoreCase( _obsSinglton.mainDataModel.Crop_ID.toString(),mCropID)) {
  //
  //           if (_obsSinglton.cropQaulityParam != null && _obsSinglton.cropQaulityParam.length > 0) {
  //             List<String> localIDs = mParamsID.split(",");
  //
  //             for(int i=0;i<_obsSinglton.cropQaulityParam.length;i++)
  //             {
  //               bool isFound = false ;
  //               if (_obsSinglton.cropQaulityParam[i].ISMandatory == "true" ||
  //                   _obsSinglton.cropQaulityParam[i].ISMandatory == "1") {
  //
  //                 isFound = true ;
  //               }else {
  //                 for (int k = 0; k < localIDs.length; k++) {
  //                   if (Utils.equalsIgnoreCase(
  //                       _obsSinglton.cropQaulityParam[i].ObservationParameter_ID
  //                           .toString(), localIDs[k].toString())) {
  //                     isFound = true;
  //                   }
  //                   // _obsSinglton.cropQaulityParam.forEach((f) => f.Checked = true);
  //                 }
  //
  //               }
  //               _obsSinglton.cropQaulityParam[i].Checked = isFound;
  //             }
  //           }
  //         }else{
  //           if (_obsSinglton.cropQaulityParam != null && _obsSinglton.cropQaulityParam.length > 0) {
  //             _obsSinglton.cropQaulityParam.forEach((f) => f.Checked = true);
  //           }
  //         }
  //
  //
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //
  //     if (_obsSinglton.cropQaulityParam == null) {
  //       _obsSinglton.cropQaulityParam = new List();
  //     }
  //
  //     callFragment("OBSForm", "Observation", false, false);
  //   }
  // }

  // Position position = null;
  //
  // onImageSelected(File file) async {
  //   var size = await file.length();
  //   SessionManager sessionManager = SessionManager();
  //   String CompanyID = await sessionManager.getCompanyId();
  //
  //   // Position position =
  //   // await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   if (position == null)
  //     position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //
  //   AttachmentDetailsState.attachmentList.add(AD_FarmAttachementDetails(
  //       Table_ID: "",
  //       File_Name: path.basename(file.path),
  //       File_Size: size,
  //       File_Path: file.path,
  //       File_Type: "image",
  //       Created_By: CompanyID,
  //       Caption: "",
  //       Latitude: position.latitude.toString(),
  //       Longitude: position.longitude.toString()));
  // }
  //
  // BuildContext cameraSheetConext;
  //
  // // void _showAttachmentSheet(String mServiceCodes, String mQRDataType,
  // //     String mText1, String mText2, File attachmentFile) async {
  // //   Utils.printWrapped("Inside sheet", "Sheet ");
  // //
  // //   await getServiceListData(mServiceCodes, 2);
  // //
  // //   scaffoldKey.currentState
  // //       .showBottomSheet((context)  {
  // //         cameraSheetConext = context;
  // //         return StatefulBuilder(
  // //             builder: (BuildContext context, setState) =>
  // //             new Container(
  // //                 margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
  // //                 padding: const EdgeInsets.all(5),
  // //                 height: MediaQuery.of(context).size.height - 200.0,
  // //                 decoration: BoxDecoration(
  // //                     color: Colors.white,
  // //                     borderRadius: BorderRadius.all(Radius.circular(15)),
  // //                     boxShadow: [
  // //                       BoxShadow(
  // //                           blurRadius: 10,
  // //                           color: Colors.grey[400],
  // //                           spreadRadius: 5)
  // //                     ]),
  // //                 child: Column(children: <Widget>[
  // //                   Row(
  // //                       mainAxisAlignment: MainAxisAlignment.end,
  // //                       crossAxisAlignment: CrossAxisAlignment.end,
  // //                       children: <Widget>[
  // //                   GestureDetector(
  // //                     child: DynamicViews().svgImageAsset(
  // //                         context,
  // //                         "assets/rebootDesign/svgImgs/Artboard_Merged 2_Remove The selected.svg",
  // //                         20),
  // //                     onTap: () {
  // //                       Navigator.pop(context);
  // //                     },
  // //                   ),
  // //                   ]),
  // //                   Row(
  // //                     mainAxisAlignment :MainAxisAlignment.start ,
  // //                     crossAxisAlignment :CrossAxisAlignment.start ,
  // //                     mainAxisSize: MainAxisSize.min,
  // //                     children: [
  // //                       Container(
  // //                         alignment: Alignment.centerLeft,
  // //                         height: Utils.getSize(50.0),
  // //                         width: Utils.getSize(50.0),
  // //                         decoration: new BoxDecoration(
  // //                           color: Colors.grey[100],
  // //                           // color: getColor(index),
  // //                           shape: BoxShape.circle,
  // //                         ),
  // //                         child: Align(
  // //                         child: ClipRRect(
  // //                           borderRadius: BorderRadius.circular(50.0),
  // //                           child: GestureDetector(
  // //                             child:
  // //                             // DynamicViews().svgImageAsset(
  // //                             //     context,
  // //                             //     "assets/rebootDesign/svgImgs/Artboard_Merged 2_Remove The selected.svg",
  // //                             //     20  ),
  // //                             Icon(Icons.add),
  // //                             onTap: () async {
  // //                               PickedFile file = await ImagePicker()
  // //                                   .getImage(source: ImageSource.camera);
  // //                               if (AttachmentDetailsState.attachmentList ==
  // //                                   null) {
  // //                                 AttachmentDetailsState.attachmentList = List();
  // //                               }
  // //                               if (AttachmentDetailsState
  // //                                   .attachmentList.length >=
  // //                                   12) {
  // //                                 Utils.showToast(
  // //                                     "Can not select more than 12 attachements.");
  // //                               } else {
  // //                                 await onImageSelected(File(file.path));
  // //                                 print(AttachmentDetailsState
  // //                                     .attachmentList.length.toString()+" size");
  // //                                 setState(() {});
  // //                               }
  // //                             },
  // //                           ),
  // //                         )),
  // //                       ),
  // //
  // //                       ],),
  // //                     SizedBox(
  // //                       height: 2.0,
  // //                     ),
  // //                     new Container(
  // //                         margin: EdgeInsets.symmetric(vertical: 2.0),
  // //                         height: 120.0,
  // //                         child: new ListView(
  // //                           scrollDirection: Axis.horizontal,
  // //                           children: <Widget>[
  // //                             for (int i = 0;
  // //                             i < AttachmentDetailsState.attachmentList.length;
  // //                             i++)
  // //                               setImage(i),
  // //                           ],
  // //                         )),
  // //                   SizedBox(
  // //                     height: 5.0,
  // //                   ),
  // //                   attachmentServicelist(2)
  // //                 ]))
  // //         );
  // //       })
  // //       .closed
  // //       .whenComplete(() {
  // //         if (mounted) {
  // //           setState(() {
  // //             /*_showPersBottomSheetCallBack =  _showAttachmentSheet(mServiceCodes, mQRDataType,
  // //                 mText1, mText2, attachmentFile);*/
  // //           });
  // //         }
  // //       });
  // //
  // //
  // // }
  // void _showAttachmentSheet(String mServiceCodes, String mQRDataType,
  //     String mText1, String mText2, File attachmentFile) async {
  //   Utils.printWrapped("Inside sheet", "Sheet ");
  //
  //   await getServiceListData(mServiceCodes, 2);
  //
  //   scaffoldKey.currentState
  //       .showBottomSheet((context) {
  //     cameraSheetConext = context;
  //     return StatefulBuilder(
  //         builder: (BuildContext context, setState) =>
  //         new Container(
  //             margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
  //             padding: const EdgeInsets.all(5),
  //             height: MediaQuery
  //                 .of(context)
  //                 .size
  //                 .height - 200.0,
  //             decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.all(Radius.circular(15)),
  //                 boxShadow: [
  //                   BoxShadow(
  //                       blurRadius: 10,
  //                       color: Colors.grey[400],
  //                       spreadRadius: 5)
  //                 ]),
  //             child: Column(children: <Widget>[
  //               Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: <Widget>[
  //                     GestureDetector(
  //                       child: DynamicViews().svgImageAsset(
  //                           context,
  //                           "assets/rebootDesign/svgImgs/Artboard_Merged 2_Remove The selected.svg",
  //                           20),
  //                       onTap: () {
  //                         Navigator.pop(context);
  //                       },
  //                     ),
  //                   ]),
  //               SizedBox(
  //                 height: 5.0,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Container(
  //                     alignment: Alignment.center,
  //                     height: Utils.getSize(50.0),
  //                     width: Utils.getSize(50.0),
  //                     decoration: new BoxDecoration(
  //                       color: Colors.grey[100],
  //                       // color: getColor(index),
  //                       shape: BoxShape.circle,
  //                     ),
  //                     child: Align(
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(50.0),
  //                           child: GestureDetector(
  //                             child:
  //                             // DynamicViews().svgImageAsset(
  //                             //     context,
  //                             //     "assets/rebootDesign/svgImgs/Artboard_Merged 2_Remove The selected.svg",
  //                             //     20  ),
  //                             Icon(Icons.add),
  //                             onTap: () async {
  //                               PickedFile file = await ImagePicker()
  //                                   .getImage(source: ImageSource.camera);
  //                               if (AttachmentDetailsState.attachmentList ==
  //                                   null) {
  //                                 AttachmentDetailsState.attachmentList =
  //                                     List();
  //                               }
  //                               if (AttachmentDetailsState
  //                                   .attachmentList.length >=
  //                                   12) {
  //                                 Utils.showToast(
  //                                     "Can not select more than 12 attachements.");
  //                               } else {
  //                                 await onImageSelected(File(file.path));
  //                                 print(AttachmentDetailsState
  //                                     .attachmentList.length
  //                                     .toString() +
  //                                     " size");
  //                                 setState(() {});
  //                               }
  //                             },
  //                           ),
  //                         )),
  //                   ),
  //                   SizedBox(
  //                     width: 5.0,
  //                   ),
  //                   Expanded(
  //                     child: new Container(
  //                         margin: EdgeInsets.symmetric(vertical: 2.0),
  //                         height: 120.0,
  //                         child: new ListView(
  //                           scrollDirection: Axis.horizontal,
  //                           children: <Widget>[
  //                             for (int i = AttachmentDetailsState
  //                                 .attachmentList.length -
  //                                 1;
  //                             i >= 0;
  //                             i--)
  //                               setImage(i),
  //                           ],
  //                         )),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 2.0,
  //               ),
  //               // new Container(
  //               //     margin: EdgeInsets.symmetric(vertical: 2.0),
  //               //     height: 120.0,
  //               //     child: new ListView(
  //               //       scrollDirection: Axis.horizontal,
  //               //       children: <Widget>[
  //               //         for (int i = 0;
  //               //         i < AttachmentDetailsState.attachmentList.length;
  //               //         i++)
  //               //           setImage(i),
  //               //       ],
  //               //     )),
  //               SizedBox(
  //                 height: 5.0,
  //               ),
  //               attachmentServicelist(2)
  //             ])));
  //   })
  //       .closed
  //       .whenComplete(() {
  //     if (mounted) {
  //       setState(() {
  //         /*_showPersBottomSheetCallBack =  _showAttachmentSheet(mServiceCodes, mQRDataType,
  //                 mText1, mText2, attachmentFile);*/
  //       });
  //     }
  //   });
  // }
  //
  // attachmentServicelist(int mType) {
  //   return filterAttachSerList == null ||
  //       (filterAttachSerList != null && filterAttachSerList.length <= 0)
  //       ? Container(
  //     alignment: Alignment.center,
  //     child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           SizedBox(
  //             height: Utils.getSize(100.0),
  //           ),
  //           DynamicViews().text(context, "No Service Found", 18,
  //               FontWeight.bold, RColors.black, TextAlign.center),
  //         ]),
  //   )
  //       : Expanded(
  //       child: ListView.builder(
  //         shrinkWrap: true,
  //         itemBuilder: (BuildContext context, int index) {
  //           return singleServiceItem(
  //               filterAttachSerList[index], index, mType);
  //         },
  //         itemCount: filterAttachSerList.length,
  //       ));
  // }
  //
  // attachmentListView() {
  //   List<AD_FarmAttachementDetails> attachmentList =
  //       AttachmentDetailsState.attachmentList;
  //   Utils.printWrapped("Attach size - ", attachmentList.length.toString());
  //   if (attachmentList == null)
  //     attachmentList = List<AD_FarmAttachementDetails>();
  //
  //   return attachmentList == null ||
  //       (attachmentList != null && attachmentList.length <= 0)
  //       ? Container(
  //     alignment: Alignment.center,
  //     child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           SizedBox(
  //             height: Utils.getSize(100.0),
  //           ),
  //           DynamicViews().text(context, "No Attachment Found", 18,
  //               FontWeight.bold, RColors.black, TextAlign.center),
  //         ]),
  //   )
  //       : Expanded(
  //       child: ListView.builder(
  //         primary: false,
  //         // scrollDirection: Axis.horizontal,
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         itemBuilder: (BuildContext context, int index) {
  //           // return singleAttachmentItem(attachmentList[index],index);
  //           File attachmentFile = null;
  //           try {
  //             AD_FarmAttachementDetails attachmentDetails =
  //             AttachmentDetailsState.attachmentList[index];
  //             attachmentFile = File(attachmentDetails.File_Path);
  //           } catch (e) {
  //             print(e);
  //           }
  //           return Image.file(
  //             attachmentFile,
  //             fit: BoxFit.contain,
  //             height: 80,
  //             width: 80,
  //           );
  //         },
  //         itemCount: attachmentList.length,
  //         // scrollDirection: Axis.horizontal,
  //       ));
  // }
  //
  // setImage(int index) {
  //   File attachmentFile = null;
  //
  //   try {
  //     AD_FarmAttachementDetails attachmentDetails =
  //     AttachmentDetailsState.attachmentList[index];
  //     attachmentFile = File(attachmentDetails.File_Path);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return Container(
  //       decoration: BoxDecoration(
  //         color: Colors.grey[300],
  //         borderRadius: BorderRadius.all(Radius.circular(15)),
  //         // boxShadow: [
  //         //   BoxShadow(
  //         //       blurRadius: 1, color: Colors.grey[400], spreadRadius: 1)
  //         // ]
  //       ),
  //       // padding: const EdgeInsets.all(5),
  //       margin: const EdgeInsets.only(right: 8),
  //
  //       // Container(
  //       //     alignment: Alignment.centerLeft,
  //       //     padding: const EdgeInsets.all(5),
  //       //     margin: const EdgeInsets.all(5),
  //       //     height: Utils.getSize(120.0),
  //       //     width: Utils.getSize(80.0),
  //       //     decoration: new BoxDecoration(
  //       //       color: Colors.grey[100],
  //       //       // color: getColor(index),
  //       //       shape: BoxShape.circle,
  //       //     ),
  //       //     child: Align(
  //       //     child:
  //       //   Padding(
  //       //     padding: const EdgeInsets.all(8.0),
  //       child: ClipRRect(
  //           borderRadius: BorderRadius.circular(15.0),
  //           child: Image.file(
  //             attachmentFile,
  //             fit: BoxFit.cover,
  //             height: 120.0,
  //             width: 80,
  //           )))
  //   // ),
  //   // )
  //       ;
  // }


  //floating start
  verticleCircle() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Flow(
            delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
            children: menuItems
                .map<Widget>((MenuData menuData) => flowMenuItem(menuData))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget flowMenuItem(MenuData menuData) {
    return Row(
      children: <Widget>[
        RawMaterialButton(
          fillColor:
          lastTapped == menuData.iconData ? Colors.amber[700] : Colors.blue,
          splashColor: Colors.amber[100],
          shape: CircleBorder(),
          onPressed: () {
            _updateMenu(menuData.iconData);
            menuAnimation.status == AnimationStatus.completed
                ? menuAnimation.reverse()
                : menuAnimation.forward();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              menuData.iconData,
              color: Colors.white,
              size: 45.0,
            ),
          ),
        ),
        Transform.scale(
          scale: menuAnimation.value,
          child: Opacity(
            opacity: menuAnimation.value,
            child: Text(menuData.text),
          ),
        ),
      ],
    );
  }

  AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) setState(() => lastTapped = icon);
  }

//floating end
  int selectedNavigationBar = 0;

  String userName = ""; // = Utils.getPath()+"";

  initializePresenter() async {
    // ndPresenter = NDPresenter();
    // await ndPresenter.init();
    // if (!getDataC) await getData();
  }

  // NDPresenter ndPresenter;
  bool getDataC = false;
  File profileImage;
  bool imageExist = false;

//   getData() async {
//     if (!getDataC) {
//       getDataC = true;
//       await ndPresenter.getUserDetails().then((Model model) async {
//         this.userName = model.userName;
//         profileImage = await ndPresenter.getImageToShow(model.profileImage);
//         imageExist = await profileImage.exists();
//         if (this.mounted) setState(() {});
//       });
//     }
//
// //    userName = await ndPresenter.getUserName().whenComplete(() => {userName});
//   }

  drawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
//             Container(
//               // padding: EdgeInsets.only(
//               //     top: Utils.getSize(25.0),
//               //      left: Utils.getSize(25.0),
//               //     bottom: Utils.getSize(20.0)),
//               padding:
//               EdgeInsetsDirectional.only(start: 25, bottom: 20, top: 25),
// //              height: 250,
//               color: RColors.bluishGreen,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     height: Utils.getSize(125.0),
//                     width: Utils.getSize(125.0),
//                     child: Stack(
//                       children: <Widget>[
//                         Align(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(125.0),
//                             child: imageExist
//                                 ? Image.file(
//                               profileImage,
//                               fit: BoxFit.cover,
//                               width: Utils.getSize(130.0),
//                               height: Utils.getSize(130.0),
//                             )
//                                 : Container(),
// //                            https://phoenix.farmerp.app/Farmizo/Attachments/HRManagement/UserRegistration/IMG2020073018363663732680736403.jpg
//                           ),
//                           alignment: Alignment.centerLeft,
//                         ),
//                         Align(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                             ),
//                             child: DynamicViews(
//                               onTap: () {
//                                 Scaffold.of(dContext).openEndDrawer();
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => NDView()));
//                               },
//                             ).imageAsset(
//                                 context,
//                                 "assets/rebootDesign/EditProfile@3x.png",
//                                 30,
//                                 isRTL()),
//                           ),
//                           alignment: Alignment.bottomRight,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: Utils.getSize(15.0),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Utils.showToast(
//                           "Link : " + ApiUtils.getMainLink(linkOnly: true));
//                     },
//                     child: DynamicViews().text(
//                         context,
//                         userName,
//                         24,
//                         FontWeight.normal,
//                         RColors.textColorDark,
//                         TextAlign.left),
//                   )
//
// //                  FutureBuilder<String>(
// //                    future: userName,
// //                    initialData: "",
// //                    builder: (context, snapshot) {
// //                      return snapshot.hasData
// //                          ? DynamicViews().text(
// //                              context,
// //                          userName,
// //                              24,
// //                              FontWeight.normal,
// //                              RColors.textColorDark,
// //                              TextAlign.left)
// //                          : Center(
// //                              child: CircularProgressIndicator(),
// //                            );
// //                    },
// //                  ),
//
// //                  DynamicViews().text(context, "Name", 24,
// //                      FontWeight.normal, RColors.textColorDark, TextAlign.left),
// //                  SizedBox(
// //                    height: 2,
// //                  ),
// //                  DynamicViews().text(context, "M.C.Deff, - Mer", 14,
// //                      FontWeight.normal, RColors.textColorDark, TextAlign.left),
//                 ],
//               ),
//             ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  // left: Utils.getSize(25.0),
                  top: Utils.getSize(15.0),
                  // right: Utils.getSize(25.0),
                ),
                padding: EdgeInsetsDirectional.only(start: 25),
                child: ListView(
                  children: <Widget>[
                    singleItem("assets/rebootDesign/svgImgs/F_Home.svg",
                        "HomePage", "Dashboard", false, true),
                    singleItem("assets/rebootDesign/svgImgs/service.svg",
                        "ServiceList", "Services", false, true),
                    // singleItem("assets/rebootDesign/APKDownload@3x.png",
                    //     "APKDownload", "APK Download", false),
                    // singleItem(
                    //     "assets/rebootDesign/Farmer Record Keepinmg@3x.png",
                    //     "RKMainList",
                    //     "Record Keeping",
                    //     true),
                    // singleItem("assets/rebootDesign/homePage/De_Material.png",
                    //     "MIMainList", "Material Indent", true),
                    // singleItem("assets/rebootDesign/image/iconh_mystock.png", "MyStock",
                    //     "My Stock", false),
                    // singleItem("assets/rebootDesign/Task Calendar@3x.png",
                    //     "TaskCalendar", "Task Calendar", false),

                    /*
                  Commented to hide conflicts and terms condition
                  Date :14th Maech 2021
                  By : Sumit
                  * */
                    // singleItem(
                    //     "assets/rebootDesign/svgImgs/navigationDr/Artboard_Merged_Conflict Contract Farming.svg",
                    //     "Conflict",
                    //     "Conflicts",
                    //     false,
                    //     true),
                    // singleItem(
                    //     "assets/rebootDesign/svgImgs/Artboard_Merged 2_Term and Condition.svg",
                    //     "TermsAndCondition",
                    //     "Term and Condition",
                    //     false,
                    //     true),
                    singleItem("assets/rebootDesign/svgImgs/F_About App.svg",
                        "AboutApp", "AboutApp", false, true),
                    //Code block added by Sumit for PostProductionAccess
                    // singleItem("assets/rebootDesign/svgImgs/F_About App.svg", Constants.PostProductionProcess,
                    //     string.PostProductionProcess, false, true),
                    //Code Block ended

                    singleItem("assets/rebootDesign/svgImgs/F_Settings.svg",
                        "Setting", "Setting", false, true),

                    //if(goodsTransfer_ON)
                    // singleItem("assets/rebootDesign/svgImgs/F_Settings.svg", "GTMainList_ON",
                    //     "GoodsTransfer", false, true),
                    // singleItem("assets/rebootDesign/svgImgs/F_Settings.svg", "GIForm",
                    //     "Goods Issue", false, true),
                    // singleItem("assets/rebootDesign/svgImgs/F_Settings.svg", "GIMainList",
                    //     "Goods Issue", false, true),

                    //Code commented by Amit to hide Analytics Dashboard
                    // singleItem(
                    //     "assets/rebootDesign/svgImgs/ic_dashboard.svg",
                    //     "AnalyticsDashboard",
                    //     string.AnalyticsDashboard,
                    //     false,
                    //     true),

                    Logout("assets/rebootDesign/svgImgs/F_LogOut.svg",
                        "Logout", true),
                    // singleItem("assets/rebootDesign/svgImgs/F_Settings.svg", "CSMainList",
                    //     string.cropSchedule, false, true),
                    // singleItem("assets/rebootDesign/svgImgs/F_LogOut.svg", "Logout",string.Logout,false, true),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  singleItem(image, className, title, ftButton, isSVG) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
//          scaffoldKey.currentState.openEndDrawer();
          Scaffold.of(dContext).openEndDrawer();
//          Navigator.pushReplacement(
//              context,
//              MaterialPageRoute(
//                  builder: (context) =>
//                      MainFragment(className, title, ftButton)));
          if (className == "HomePage") {
            setState(() {
              serviceCode = className;
              this.title = title;
              //todo:the homepage barcode floating button
              showFB = false; //ftButton;
              showBN = true;
              showAppBar = true;
            });
          } else if (className == "ServiceList") {
            setState(() {
              serviceCode = className;
              this.title = title;
              showFB = false;
              showBN = false;
            });

            // } else if (className == "APKDownload") {
            //   Utils.showToast("Work Under Progress");
          } else if (className == "Conflict") {
            Utils.showToast("Work Under Progress");
          } else if (className == "TermsAndCondition") {
            Utils.showToast("Work Under Progress");
          } else if (className == "Setting") {
            setState(() {
              serviceCode = className;
              this.title = title;
              //todo:the homepage barcode floating button
              showFB = false; //ftButton;
              showBN = false;
            });
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));

          }
        /*  else if (className == "AnalyticsDashboard") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RaiseTicket(URL)));
          } */
          else if (className == "AboutApp") {
            // tring serviceCode, String title, bool showFB, bool resize, {String flag, bool showBN, bool showAppBar
            callFragment(className, title, false, false);
            // setState(() {
            //   serviceCode = className;
            //   this.title = title;
            //   //todo:the homepage barcode floating button
            //   showFB = false; //ftButton;
            //   showBN = false;
            // });
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp()));
          } else {
            setState(() {
              serviceCode = className;
              this.title = title;
              showFB = true;
              showBN = false;
            });
          }
        },
        child: Container(
            child: Column(
              children: <Widget>[
                Container(
//      height: 55,
                  margin: EdgeInsets.only(
                    top: Utils.getSize(18.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: Utils.getSize(16.0),
                            child: DynamicViews().imageAsset2(
                                context, image, 16, Colors.black,
                                isSVG: isSVG),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DynamicViews().text(
                              context,
                              title == "Dashboard" ? "Home" : title,
                              16,
                              FontWeight.normal,
                              RColors.textColorDark,
                              TextAlign.left),
                        ],
                      ),
                    ],
                  ),
                ),
                seperator(),
              ],
            )));
  }

  Logout(image, title, isSVG) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Future.delayed(Duration.zero, () {
          showDialog(
              context: context,
              builder: (context) =>
              // WillPopScope(
              // onWillPop: () {
              //   Navigator.pop(context, true);
              // },
              // child:
              Dialog(
                  elevation: 0.0,
                  insetPadding: EdgeInsets.all(Utils.getSize(32.0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
//            elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  child: Container(
//                height: Utils.getSize(172.0),
//                             width: Utils.getSize(100.0),
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(4),
//            side: BorderSide(color: Colors.red)
                        color: RColors.white,
                      ),
                      padding: EdgeInsets.all(Utils.getSize(14.0)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: Utils.getSize(16.0),
                          ),
                          DynamicViews().text(
                              context,
                              "Are you Sure.\nYou want to Logout from FarmERP?",
                              16,
                              FontWeight.bold,
                              RColors.textColorDark,
                              TextAlign.center),
                          SizedBox(
                            height: Utils.getSize(16.0),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DynamicViews(
                                    onTap: () async {
                                      SessionManager.clearSession();

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPageWidget(
                                                      title: "",
                                                      state: LoginState.Login)));
                                    },
                                    title: string.Yes,
                                    context: context,
                                    bgColor: RColors.yellow)
                                    .button(),
                                flex: 1,
                              ),
                              DynamicViews.sizedBox(width: 14),
                              Expanded(
                                child: DynamicViews(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    title: string.Cancel,
                                    context: context,
                                    bgColor: RColors.yellow)
                                    .button(),
                                flex: 1,
                              ),
                            ],
                          )
                        ],
                      ))))
          // )
              ;
        });
      },
      child: Column(
        children: <Widget>[
          Container(
//      height: 55,
            margin: EdgeInsets.only(
              top: Utils.getSize(18.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    DynamicViews().imageAsset2(context, image, 16, Colors.black,
                        isSVG: isSVG),
                    SizedBox(
                      width: 10,
                    ),
                    DynamicViews().text(context, title, 16, FontWeight.normal,
                        RColors.textColorDark, TextAlign.left),
                  ],
                ),
              ],
            ),
          ),
          seperator(),
        ],
      ),
    );
  }

  seperator() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: Utils.getSize(15.0),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  // GlobalKey<ScaffoldState> scaffoldKey;
//servicePageCall
  service() {
    switch (serviceCode) {
      case "HomePage":
        return HomePageReboot(mainFragmentState: this);
/*      case "MapPlotDetails":
        return MapPlotView(mainFragmentState: this);

      case "ComFarmerSelection":
        return ComFarmerSelection(
            mainFragmentState: this, serviceFlag: flag, title: title);

      case "UserChatList":
        return UserChatList(mainFragmentState: this);
      case "ChatList":
        return ChatList(mainFragmentState: this);

      case "MoreOptions":
        return MoreOptions(mainFragmentState: this);

      case "DynContractSelection":
        return DynContractSelection(
            mainFragmentState: this, serviceFlag: flag, title: title);

      case Constants.AttendanceRecording:
        return ARMainList(mainFragmentState: this);
    // case "GIFPreview":
    //   return GIFPreview(mainFragmentState: this);
      case "ARForm":
        return ARForm(mainFragmentState: this);
    //    when you want Online Post Production Process then  uncommented  bellow commented part
      case Constants.PostProductionProcess:
        return PPMainList_ON(mainFragmentState: this);
      case "PPPreview_ON":
        return PPPreview_ON(mainFragmentState: this);
      case "PPAddForm_ON":
        return PPAddForm_ON(mainFragmentState: this);
// when you want offline Post Production Process then  uncommented  bellow commented part
    //   case Constants.PostProductionProcess:
    //   return PPMainList(mainFragmentState: this);
    // case "PPPreview":
    //   return PPPreview(mainFragmentState: this);
    // case "PPAddForm":
    //   return PPAddForm(mainFragmentState: this);

      case Constants.ScanSticker:
        return SSForm(mainFragmentState: this);
      // case "SSList":
      //   return SSList(mainFragmentState: this);

      case Constants.GoodsIssueToFarmer:
        return GIFMainList(mainFragmentState: this);
      case "GIFPreview":
        return GIFPreview(mainFragmentState: this);
      case "GIFForm":
        return GIFForm(mainFragmentState: this);

      case Constants.CreateTask:
      // return ARMainList(mainFragmentState: this);
        return CTMainList(mainFragmentState: this);
      case "CTForm":
        return CTForm(mainFragmentState: this);
      case "CTPreview":
        return CTPreview(mainFragmentState: this);

      case Constants.FieldQC:
      // return ARMainList(mainFragmentState: this);
        return FQCMainList(mainFragmentState: this);
      case "FQCForm":
        return FQCForm(mainFragmentState: this);
      case "FQCPreview":
        return FQCPreview(mainFragmentState: this);

      case Constants.GoodsIssue:
        return GIMainList(mainFragmentState: this);
      case "GIForm":
        return GIForm(mainFragmentState: this);
      case "GIPreview":
        return GIPreview(mainFragmentState: this);
      case "GIMIPreview":
        return GIMIPreview(mainFragmentState: this);
      case "HRForm":
        return HRForm(mainFragmentState: this);
      case "GRForm":
        return GRForm(mainFragmentState: this);
      case "GRPreview":
        return GRPreview(mainFragmentState: this);
      case "HRPreview":
        return HRPreview(mainFragmentState: this);
      case Constants.FarmerAssessment:
        return FAMainList(mainFragmentState: this);
      case "FAPreview":
        return FAPreview(mainFragmentState: this);
      case "FAForm":
        return FAForm(mainFragmentState: this);
      case Constants.CropProcurement:
        return CPNewMainList(mainFragmentState: this);
      case Constants.CropProcurementINI:
        return CPNewMainList(mainFragmentState: this);
      case "CPPreview":
        return CPPreview(mainFragmentState: this);
      case "CPForm":
        return CPForm(mainFragmentState: this);
      case Constants.FarmerRegistration:
        return FRMainList(mainFragmentState: this);
      case Constants.FarmerRecordKeeping:
        return FRKMainList(mainFragmentState: this);
      case "FRKPreview":
        return FRKPreview(mainFragmentState: this);
      case "FRKInfo":
        return FRKInfo(mainFragmentState: this, serviceFlag: flag);

      case Constants.FarmerLog:
        return FLMainList(mainFragmentState: this);
      case "FLPreview":
        return FLPreview(mainFragmentState: this);
      case "FLForm":
        return FLForm(mainFragmentState: this);
      case "FRForm":
        return FRForm(mainFragmentState: this);
      case "SBForm":
        return SBForm(mainFragmentState: this);
      case "FRPreview":
        return FRPreview(mainFragmentState: this);
      case Constants.GoodsReceive:
        return GRMainList(mainFragmentState: this);
      case Constants.BeatPlan:
        return BPlanMainList(mainFragmentState: this);
      case "BPlanAdd":
        return BPlanAdd(mainFragmentState: this);
      case "BPlanPreview":
        return BPlanPreview(mainFragmentState: this);
      case Constants.HarvestingDetails:
        return HRMainList(mainFragmentState: this);
      case Constants.ObservationRecording:
        return OBRList(mainFragmentState: this);
      case "OBRPreview":
        return OBRPreview(mainFragmentState: this);
      case "OBRForm":
        return OBRForm(mainFragmentState: this, serviceFlag: flag);
      case Constants.Observation:
        return OBSMainList(mainFragmentState: this);
      case "OBSPreview":
        return OBSPreview(mainFragmentState: this);
      case "OBSForm":
        return OBSForm(mainFragmentState: this);

      case "ServiceList":
        return ServiceList(mainFragmentState: this);
    // return ViewHelpFile(mainFragmentState: this);

      case Constants.MaterialIndent:
        return MIMainList(mainFragmentState: this);
      case "MIPreview":
        return MIPreview(mainFragmentState: this);
      case "MIForm":
        return MIForm(mainFragmentState: this);

      case Constants.MyStock:
        return MyStock(mainFragmentState: this);

      case Constants.TaskCalendar:
        TaskCalendarState.ClearTaskCalender();
        return TaskCalendar(mainFragmentState: this);

    // case Constants.RecordKeeping:
      case Constants.MultiplotRecordKeeping:
        return RKMainList(mainFragmentState: this);
      case "RKPreview":
        return RKPreview(type: 1, mainFragmentState: this);
      case "RKForm":
        return RKForm(mainFragmentState: this);

      case Constants.SchemeRegistration:
        return CFMainList(mainFragmentState: this);
      case "CFForm":
        return CFForm(mainFragmentState: this);
      case "CFPreview":
        return CFPreview(mainFragmentState: this);

      case Constants.FieldScouting:
        return FSMainList(mainFragmentState: this);
      case "FarmerAndPlotList":
        return FarmerAndPlotList(mainFragmentState: this);
      case "AFContractFarmingPlanned":
        return AFContractFarmingPlanned(mainFragmentState: this);
      case "FSPreview":
        return FSPreview(mainFragmentState: this);

      case Constants.LabourRegistration:
        return LRMainList(mainFragmentState: this);
      case "LRAddForm":
        return LRAddForm(mainFragmentState: this);
      case "LRPreview":
        return LRPreview(mainFragmentState: this);

      case Constants.EmployeeRegistration:
        return ERMainList(mainFragmentState: this);
      case "ERAddForm":
        return ERAddForm(mainFragmentState: this);
      case "ERPreview":
        return ERPreview(mainFragmentState: this);
      case Constants.CropProfile:
        return CropProfileMainList(mainFragmentState: this);
      case "CropProfileAttachment":
        return CropProfileAttachment(mainFragmentState: this);
      case "CropProfilePreview":
        return CropProfilePreview();
      //mainFragmentState: this
      case "CropProfilleGeoTag":
        return CropProfilleGeoTag(mainFragmentState: this);
      // case "CropProfileValveDetails":
      //   return CropProfileValveDetails(mainFragmentState: this);
      case Constants.LabourActivityTracking:
        Utils.printWrapped("Test", "Worked");
        return LATMainList(mainFragmentState: this);

      case "LATMainList":
        return LATMainList(mainFragmentState: this);

      case "LATPreview":
        return LATPreview(mainFragmentState: this);

      case "LATActivityMain":
        return LATActivityMain(mainFragmentState: this);

      case Constants.TappingDetails:
        return TDMainList(mainFragmentState: this);

      case "TDMainList":
        return TDMainList(mainFragmentState: this);

      case "TDPreview":
        return TDPreview(mainFragmentState: this);

      case "TDActivityMain":
        return TDActivityMain(mainFragmentState: this);

      case "GTForm_ON":
        return GTForm_ON(mainFragmentState: this);

      case Constants.GoodsTransfer:
        return GTMainList_ON(mainFragmentState: this);
      case "GTPreview_ON":
        return GTPreview_ON(mainFragmentState: this);
      case "GTMIPreview_ON":
        return GTMIPreview_ON(mainFragmentState: this);

      case Constants.SalesBooking:
        return SBMainList(mainFragmentState: this);
      case "SBPreview":
        return SBPreview(mainFragmentState: this);
      case Constants.IssueTransferGoodsReturn:
        return GRITMainList(mainFragmentState: this);
      case "GRITForm":
        return GRITForm(mainFragmentState: this);
      case "GRITPreview":
        return GRITPreview(mainFragmentState: this);

      case Constants.Budget:
        return DynContractSelection(
            mainFragmentState: this, serviceFlag: string.Budget, title: title);

      case "BudgetMainScreen":
        return BudgetMainScreen(mainFragmentState: this);

      case "BudgetScreen":
        return BudgetScreen(mainFragmentState: this, title: title);
      case Constants.Resource:
        return DynContractSelection(
            mainFragmentState: this,
            serviceFlag: string.Resource,
            title: title);

      case Constants.DeliveryandDispatch:
        return DDMainlist(mainFragmentState: this);

      case "DDForm":
        return DDForm(mainFragmentState: this);
      case "DDPreview":
        return DDPreview(mainFragmentState: this);

      case Constants.SalesGoodsReturn:
        return SGRMainList(mainFragmentState: this);

      case "SGRForm":
        return SGRForm(mainFragmentState: this);
      case "SGRPreview":
        return SGRPreview(mainFragmentState: this);

      case Constants.VendorRegistration:
        return VRMainList(mainFragmentState: this);

      case "VRPreview":
        return VRPreview(mainFragmentState: this);

      case "VRAddForm":
        return VRAddForm(mainFragmentState: this);

      case Constants.CropSchedule:
        return CSMainList(mainFragmentState: this);
      case "TaskGrowthDetails":
        return TaskGrowthDetails(mainFragmentStateNew: this);

      case Constants.FertilizerRecommendation:
        return FREMainList(mainFragmentState:this);
      case "FRERecommendationDetails":
        return FRERecommendationDetails(mainFragmentStateNew: this);
      case "Setting":
        return Setting(mainFragmentState: this);

      case "AboutApp":
        return AboutApp(mainFragmentState: this);
      case "HelpView":
        return HelpView(mainFragmentState: this);

      case "HelpDetailView":
        return HelpDetailView(mainFragmentState: this);

      case Constants.ExpenseDetails:
        return EDMainList(mainFragmentState: this);

      case "EDAddForm":
        return EDAddForm(mainFragmentState: this);

      case "EDPreview":
        return EDPreview(mainFragmentState: this);

      case Constants.TreeObservation:
        return TOMainList(mainFragmentState: this);

      case "TOPreview":
        return TOPreview(
          mainFragmentState: this,
          type: 1,
        );

      case "TOPreviewForm":
        return TOPreview(
          mainFragmentState: this,
          type: 2,
        );

      case "TOForm":
        return TOForm(mainFragmentState: this);

      case Constants.Harvest_Forecast_Grower:
        return HFGMainList(mainFragmentState: this);

      case "HFGMain":
        return HFGMain(mainFragmentState: this);

      case Constants.ProductDashboard:
        return productDetails(mainFragmentState: this);

      case "HFGPreview":
        return HFGPreview(mainFragmentState: this);

      case Constants.ServiceIndent:
        return SIMainList(mainFragmentState: this);

      case "SIPreview":
        return SIPreview(mainFragmentState: this);

      case "SIAddForm":
        return SIAddForm(mainFragmentState: this);

      case Constants.ServiceRequest:
        return SRMainList(mainFragmentState: this);

      case "SRMapView":
        return SRMapView(mainFragmentState: this);

      case "SRPreview":
        return SRPreview(mainFragmentState: this);

      // case "SROrder":
      //   return SROrder(mainFragmentState: this);
      //
      case Constants.MachineMaintenance:
        return MMMainList(mainFragmentState: this);

      case "MMPreview":
        return MMPreview(mainFragmentState: this);

      case "MMForm":
        return MMForm(mainFragmentState: this);

      case "RAForm":
        return RAForm(mainFragmentState: this);

      case Constants.EquipmentIssueAndReturn:
        return EIRMainList(mainFragmentState: this);

      case "EIRForm":
        return EIRForm(mainFragmentState: this);

      case "EIRPreview":
        return EIRPreview(mainFragmentState: this);

      case Constants.SoilAnalysis:
        return SAMainList(mainFragmentState: this);

      case "SAForm":
        return SAForm(mainFragmentState: this);

      case "SAPreview":
        return SAPreview(mainFragmentState: this);

      case Constants.FarmerVisit:
        return FVMainList(mainFragmentState: this);
      case "FVForm":
        return FVForm(mainFragmentState: this);
      case "FVPreview":
        return FVPreview(mainFragmentState: this);

      case Constants.NonAgriRecordKeeping:
        return NAMainList(mainFragmentState: this);
      case "NAForm":
        return NAForm(mainFragmentState: this);

      case Constants.DealClosure:
        return DCMainList(mainFragmentState: this);

      case "DCForm":
        return DCForm(mainFragmentState: this);

      case "DCPreview":
        return DCPreview(mainFragmentState: this);


      case Constants.NurseryOperations:
        return NOMainList(mainFragmentState: this);
      //
      // case "NOPreview":
      //   return NOPreview(mainFragmentState: this);

      case "NOForm":
        return NOForm(mainFragmentState: this);*/

      default:
        return HomePageReboot(mainFragmentState: this);
    }
  }

  BuildContext dContext;

  appBar(context, title) {
    dContext = context;
    return Container(
        margin:
        EdgeInsets.only(bottom: showABShadow ? Utils.getSize(10.0) : 0.0),
        padding: EdgeInsets.only(
            left: Utils.getSize(16.0),
            right: Utils.getSize(20.0),
            top: Utils.getSize(8.0)),
        height: Utils.getSize(64.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 4.0,
              offset: const Offset(0.0, 3.0),
            ),
          ],
        ),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
//              _scaffoldKey.currentState.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  size: Utils.getSize(24.0),
                ),
              ),
              SizedBox(
                width: Utils.getSize(16.0),
              ),
              Container(
                width: Utils.getSize(180.0),
                child: Text(
                  (title??"").replaceAll(' ', '\u00A0'),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: Utils.getSize(20.0),
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      color: RColors.bgAppBar),
                ),
              ),
            ],
          ),
          SizedBox(
            width: Utils.getSize(4.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
//                  Navigator.pushReplacement(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) =>
//                              MainFragment("ServiceList", "Services", false)));
                  setState(() {
                    serviceCode = "ServiceList";
                    this.title = string.Services;
                    showFB = false;
                    showBN = false;
                  });
                },
                child: DynamicViews().svgImageAsset(
                  context,
                  "assets/rebootDesign/svgImgs/service.svg",
                  23.0,
                ),
                // Image.asset(
                //   "assets/rebootDesign/homePage/scale300/Settings@3x.png",
                //   height: Utils.getSize(24.0),
                //   fit: BoxFit.contain,
                // ),
              ),
              SizedBox(
                width: Utils.getSize(14.0),
              ),
              GestureDetector(
                onTap: () {
                  //Code commented by amit to disable click
                  // callFragment("HelpView", "Help", false, false);
                  //callFragment("GTMainList_ON", "Help", false, false);
                },
                child: DynamicViews().svgImageAsset(
                  context,
                  "assets/rebootDesign/svgImgs/Artboard_Merged_Help.svg",
                  25.0,
                ),
              ),
              SizedBox(
                width: Utils.getSize(12.0),
              ),
              GestureDetector(
                onTap: () {},
                child: DynamicViews().svgImageAsset(
                  context,
                  "assets/rebootDesign/svgImgs/Artboard_Merged 2_Notification.svg",
                  26.0,
                ),
              ),
            ],
          )
        ]));
  }

  showList() {
    return Expanded(
        child:
//        FutureBuilder<List<Product>>(
//            future: productList,
//            future: presenter.getFarmerList(null, null, null, null, null, null),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                return
        ListView.builder(
          shrinkWrap: true,
//                              padding: const EdgeInsets.all(8),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: GestureDetector(
                    onTap: () {},
                    child: Card(
//                            child: Text("main data list")));
                        child: Container(
                            padding: EdgeInsets.all(Utils.getSize(10.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("List index : " + index.toString())
                              ],
                            )))));
          },
        ));
  }

  // SLPresenter slPresenter;
  // List<ServiceModel> filterList, filterAttachSerList;
  //
  // getServiceListData(String mServiceCodes, int mReqQueryFor) async {
  //   slPresenter = new SLPresenter();
  //   if (mReqQueryFor == 1) {
  //     filterList = await slPresenter.getServiceList(mServiceCodes);
  //     if (filterList == null) {
  //       filterList = List();
  //     }
  //   } else if (mReqQueryFor == 2) {
  //     filterAttachSerList = await slPresenter.getServiceList(mServiceCodes);
  //     if (filterAttachSerList == null) {
  //       filterAttachSerList = List();
  //     }
  //   }
  // }

  var designType = 3;

  /*singleServiceItem(ServiceModel filterList, int index, int mType) {
    String path = ServiceListState.getPath(filterList.ServiceCode);

    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          if (mType == 1) {
            ClearAttachmentData();
            switchForQRCalls(filterList.ServiceCode);
          } else {
            switchForAttachmentCalls(filterList.ServiceCode);
          }
        },
        child: Container(
          padding: EdgeInsets.all(Utils.getSize(4.0)),
          margin: EdgeInsets.only(
              bottom: Utils.getSize(8.0),
              right: Utils.getSize(8.0),
              left: Utils.getSize(8.0)),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: getColor(index),
            // border: Border.all(
            // color: Colors.grey[200], //                   <--- border color
            // width: 1.0,
            // ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
//            spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: Utils.getSize(50.0),
                width: Utils.getSize(50.0),
                decoration: new BoxDecoration(
                  color: Colors.grey[100],
                  // color: getColor(index),
                  shape: BoxShape.circle,
                ),
                child: Align(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(125.0),
                      child: path.contains(".svg")
                          ? DynamicViews().svgImageAsset(
                        context,
                        path,
                        Utils.getSize(30.0),
                        // color: designType == 3
                        //     ? RColors.white
                        //     : getColor(index),
                        color: getColor(index),
                        // color: RColors.white,
                      )
                          : Image.asset(
                        path,
                        // color: RColors.white,
                        color: getColor(index),
                        height: Utils.getSize(20.0),
                        fit: BoxFit.contain,
                      )),
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: Utils.getSize(16.0)),
                    alignment: Alignment.centerLeft,
                    child: DynamicViews().text(
                        context,
                        filterList.MobileService,
                        16,
                        FontWeight.bold,
                        RColors.white,
                        TextAlign.start)),
              )
            ],
          ),
        ));
  }*/

  getColor(index) {
    return colors[index % colors.length];
  }

  List<Color> colors = [
    RColors.pink,
    RColors.bluishGreenD,
    RColors.yellow,
    RColors.blue,
    RColors.purple,
    RColors.bluishGreenDD,
    RColors.orange,
    Colors.blue,
    RColors.lightGreen
  ];

/*
  void callMRKForm() {
    if (mData != null &&
        mData.Site_ID != null &&
        !Utils.checkStringWithZero(mData.Site_ID.toString())) {
      RKMainListState.clearAllData();
      MRKSingleTon().clear();

      MRKSingleTon mrkSingleTon = new MRKSingleTon();

      mrkSingleTon.clear(); // Clear data

      mrkSingleTon.ActivityId = "2";
      mrkSingleTon.ActivityName = "Agro-Chemical";
      mrkSingleTon.SiteId = mData.Site_ID.toString();
      mrkSingleTon.SiteName = Utils.getBlankIfNull(mData.Farm_Name) +
          "-" +
          Utils.getBlankIfNull(mData.Site_Name);

      MRKPlotDetails mrkPlotDetails = mData;
      mrkPlotDetails.RecordKeepingArea = mData.AvailableArea.toString();
      mrkSingleTon.plotList.add(mrkPlotDetails);

      callFragment("RKForm", "Record Keeping", false, false,
          flag: Constants.TaskCalendar);
    }
  }

  void callCropProcurement(CF_FarmerContract model) async {
    CPSingleTon _mainModel = new CPSingleTon();
    _mainModel.cf_cropProcurement = CF_CropProcurement();
    _mainModel.cf_cropProcurementDetails = CF_CropProcurementDetails();
    _mainModel.cf_vehicleDetailsOfInventory = CF_VehicleDetailsOfInventory();
    _mainModel.gradeList = List();
    _mainModel.cropQaulityParam = List();
    SessionManager sessionManager = SessionManager();

    _mainModel.cf_cropProcurement.Currency =
    await CommonQuries.getCompanyCurrency();

    _mainModel.cf_cropProcurement.FarmerName = model.farmerName;

    _mainModel.cf_cropProcurement.Date = Utils.convertDateFormat(
        Utils.getCurrentDate(),
        Utils.SyncSettingsDateFormat,
        Utils.sqlDateFormat);

    _mainModel.cf_cropProcurement.BuyerName =
    await AD_UserDetails.getUserNameUsingUserId(
        await sessionManager.getUserID());
    _mainModel.cf_cropProcurement.Buyer_Id = await sessionManager.getUserID();

    _mainModel.cf_cropProcurement.MainContractName =
    await CF_FarmerContract.getMainContractNameUsingMainContractID(
        model.MainContract_Id.toString());
    _mainModel.cf_cropProcurement.MainContract_Id =
        model.MainContract_Id.toString();
    _mainModel.cf_cropProcurement.RateProfile_ID =
        model.RateProfile_ID.toString();

    _mainModel.cf_cropProcurement.Collection_CenterId =
        model.Collection_Center_ID;
    CommonSingleList collectionModel =
    await CommonQuries.getCollectionCenterNameUsingId(
        model.Collection_Center_ID.toString());
    if (collectionModel != null)
      _mainModel.cf_cropProcurement.CollectionCenterName = collectionModel.Name;

    _mainModel.cf_cropProcurement.ManualDocument_No = "";
    _mainModel.cf_cropProcurementDetails.Farmer_Id = model.Farmer_Id.toString();
    _mainModel.cf_cropProcurementDetails.Contract_Id =
        model.Contract_Id.toString();

    CommonSingleList villageModel =
    await CF_FarmerRegistation.getVillageNameUsingFarmerId(model.Farmer_Id);

    if (villageModel != null) {
      _mainModel.cf_cropProcurement.Village_Id = villageModel.Id.toString();
      _mainModel.cf_cropProcurement.VillageName = villageModel.Name.toString();
    }

    _mainModel.cropQaulityParam =
    await RK_ObservationParameter.getParamUsingCropIdandType(
        model.CropId.toString(), "2");

    try {
      _mainModel.gradeList = await CustomGradeNameList
          .getRateProfileItemUsingMainContractAndRateProfile(
          model.RateProfile_ID.toString(),
          model.MainContract_Id.toString());
    } catch (e) {
      print(e);
    }

    _mainModel.isEditRate = await Utils.getConfigSetting("179");
    _mainModel.isRecoverPercentEnable = await Utils.getConfigSetting("180");

    callFragment("CPForm", "Farmer Details", false, true);
  }

  fetchInProcessData(Daily_WorkDetails model, int i) async {
    LATEntryModel mSingleModel = new LATEntryModel();
    mSingleModel.clear();

    String androidWorkId = model.Android_WORK_ID.toString();

    mSingleModel.AllSiteLabour = await Utils.getConfigSetting("85");
    mSingleModel.AutoPackhouseReceive = await Utils.getConfigSetting("49");

    List<Daily_WorkDetails> _mainList =
    await Daily_WorkDetails.getLATEntryByAId(androidWorkId, "");

    if (_mainList != null && _mainList.length > 0) {
      try {
        // Utils.printWrapped(
        //     "All data save ",
        //     "Plot " +
        //         _mainList[0].SubPlot_Name.toString() +
        //         " sub code " +
        //         _mainList[0].Sub_Plot_Code.toString() +
        //         " Variety  " +
        //         _mainList[0].Variety_Name);
        mSingleModel.mainModel.Android_WORK_ID =
            _mainList[0].Android_WORK_ID.toString();
        mSingleModel.mainModel.Work_Date = _mainList[0].Work_Date.toString();
        mSingleModel.mainModel.Work_Date = _mainList[0].Work_Date.toString();
        mSingleModel.mainModel.Activity_ID =
            _mainList[0].Activity_ID.toString();
        mSingleModel.mainModel.ActivityName =
            _mainList[0].ActivityName.toString();
        mSingleModel.mainModel.Labour_Id = _mainList[0].Labour_Id.toString();
        mSingleModel.mainModel.LabourName = _mainList[0].LabourName.toString();
        mSingleModel.mainModel.Site_ID = _mainList[0].Site_ID.toString();

        mSingleModel.labourList.add(LabourDetails(
            Labour_Id: mSingleModel.mainModel.Labour_Id.toString(),
            LabourName: mSingleModel.mainModel.LabourName.toString(),
            LabourCode: "",
            SiteID: mSingleModel.mainModel.Site_ID.toString()));

        mSingleModel.mainModel.Site_Name = _mainList[0].Site_Name.toString();
        mSingleModel.mainModel.SiteCode = _mainList[0].SiteCode.toString();
        mSingleModel.mainModel.SubPlot_Name =
            _mainList[0].SubPlot_Name.toString();
        mSingleModel.mainModel.Sub_Plot_Code =
            _mainList[0].Sub_Plot_Code.toString();

        mSingleModel.mainModel.CropId = _mainList[0].CropId.toString();
        mSingleModel.mainModel.Crop_Name = _mainList[0].Crop_Name.toString();
        mSingleModel.mainModel.Variety = _mainList[0].Variety.toString();
        mSingleModel.mainModel.Variety_Name =
            _mainList[0].Variety_Name.toString();

        mSingleModel.mainModel.Plot_Id = _mainList[0].Plot_Id.toString();
        mSingleModel.mainModel.Plot_Name = _mainList[0].Plot_Name;
        mSingleModel.mainModel.Plot_Code = _mainList[0].Plot_Code;
        mSingleModel.mainModel.UserCropProfileId =
            _mainList[0].UserCropProfileId.toString();
        mSingleModel.mainModel.CropArea = _mainList[0].Area_Covered.toString();
        mSingleModel.mainModel.Area_Covered =
            _mainList[0].Area_Covered.toString();
        mSingleModel.mainModel.Area_Unit_Id =
            _mainList[0].Area_Unit_Id.toString();
        mSingleModel.mainModel.Unit = _mainList[0].Unit;

        mSingleModel.mainModel.Remark = _mainList[0].Remark;

        mSingleModel.mainModel.Mobile_PIN = _mainList[0].Mobile_PIN;
        mSingleModel.mainModel.Created_Date = _mainList[0].Created_Date;
        mSingleModel.mainModel.Created_By = _mainList[0].Created_By;
        // mSingleModel.mainModel.Latitude = _mainList[0].Latitude;
        // mSingleModel.mainModel.Longitute = _mainList[0].Longitute;
        mSingleModel.mainModel.Work_LocationID = _mainList[0].Work_LocationID;
        mSingleModel.mainModel.Login_Id = _mainList[0].Login_Id;
        mSingleModel.mainModel.Language_ID = _mainList[0].Language_ID;
        mSingleModel.mainModel.Work_Status = _mainList[0].Work_Status;
        mSingleModel.mainModel.Approved_Status = _mainList[0].Approved_Status;
      } catch (e) {}

      if (Utils.checkString(mSingleModel.mainModel.Unit)) {
        mSingleModel.mainModel.Unit = "Acre";
      }

      Daily_WorkSpecific mSpecificData =
      await Daily_WorkSpecific.getLATApplicationDataById(
          _mainList[0].Android_WORK_ID.toString(),
          _mainList[0].Work_ID.toString());

      // if (mSpecificData != null) {
      //   List<M_UnitMaster> harvestUnit = await M_UnitMaster.getUnitByUnitId(mSpecificData.HarvestUnit_ID.toString());
      //   if (harvestUnit != null && harvestUnit.length > 0) {
      //     mSpecificData.HarvestUnit = harvestUnit[0].Unit.toString();
      //   }
      // }
      mSingleModel.appSpecificModel = mSpecificData;

      if (Utils.equalsIgnoreCase(
          mSingleModel.mainModel.Activity_ID.toString(), "4")) {
        List<CommonSingleList> mUnitList =
        await CommonSingleList.getUnitsListWeightNumberType("");
        if (mUnitList != null && mUnitList.length > 0) {
          mSingleModel.appSpecificModel.HarvestUnit_ID =
              mUnitList[0].Id.toString();
          mSingleModel.appSpecificModel.HarvestUnit =
              mUnitList[0].Name.toString();
        }
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MainFragmentSatatess(
                      serviceCode: "LATActivityMain",
                      title: "Labour Activity Tracking",
                      showFB: false,
                      resize: false)));
      // callFragment("LATActivityMain", string.LabourActivityTracking, false, false);
    }
  }

  Future<void> setInitialData(String mLabourId) async {
    LATEntryModel().clear();

    LATEntryModel mSingleModel = new LATEntryModel();
    mSingleModel.AllSiteLabour = await Utils.getConfigSetting("85");

    // mSingleModel.AllSiteLabour = true ;
    SessionManager sessionManager = SessionManager();

    List<CommonSingleList> mList =
    await CommonSingleList.getLabourNameList(sessionManager, mLabourId);
    if (mList != null && mList.length > 0) {
      CommonSingleList model = mList[0];
      if (model != null) {
        if (Utils.equalsIgnoreCase(model.SubName, "true")) {
          mSingleModel.mainModel.Labour_Id = model.Id.toString();
          mSingleModel.mainModel.LabourName = model.Name.toString();

          mSingleModel.labourList.add(LabourDetails(
              Labour_Id: mSingleModel.mainModel.Labour_Id,
              LabourName: mSingleModel.mainModel.LabourName,
              LabourCode: "",
              SiteID: model.SubId.toString()));

          List<CommonSingleList> _mainList =
          await CommonSingleList.getSitesList(
              sessionManager, model.SubId.toString());
          if (_mainList != null && _mainList.length > 0) {
            CommonSingleList model = _mainList[0];
            if (model != null) {
              mSingleModel.mainModel.Site_Name =
              model.Name.toString().split(" - ")[0];
              mSingleModel.mainModel.SiteCode =
              model.Name.toString().split(" - ")[1];
              mSingleModel.mainModel.Site_ID = model.Id.toString();
            }
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MainFragmentSatatess(
                          serviceCode: "LATActivityMain",
                          title: "Labour Activity Tracking",
                          showFB: false,
                          resize: false)));
        } else
          // if(Utils.equalsIgnoreCase(model.SubName, "true"))
            {
          Utils.showToast("No farm wise user access. ");
        }

        // Utils.printWrapped("Site ", mSingleModel.mainModel.Site_Name + mSingleModel.mainModel.Site_ID  );
        */
/*     if (!Utils.equalsIgnoreCase(Utils.getZeroIfNull(mSingleModel.mainModel.Site_ID), Utils.getZeroIfNull(model.SubId.toString())) ||
            !Utils.equalsIgnoreCase(Utils.getZeroIfNull(mSingleModel.mainModel.Plot_Id), Utils.getZeroIfNull(model.SubName.toString()))) {
          mSingleModel.mainModel.Site_ID = model.SubId.toString();
          try {
            mSingleModel.mainModel.Plot_Id = Utils.getZeroIfNull(model.SubName.toString()); //  subname gives Plot Id
          } catch (e) {
            print(e);
          }

          if (!Utils.checkStringWithZero(mSingleModel.mainModel.Site_ID) || !Utils.checkStringWithZero(mSingleModel.mainModel.Plot_Id)) {
            List<MRKPlotDetails> _mainList = await Plots.getSitePlotAndSubPlotList(
                await sessionManager.getUserID(),
                await sessionManager.getLoginID(),
                "",
                Constants.ALL_SITE_PLOT_LabourAssign,
                mSingleModel.mainModel.Site_ID,
                mSingleModel.mainModel.Plot_Id);

            if (_mainList != null && _mainList.length > 0) {
              try {
                mSingleModel.mainModel.Site_Name = _mainList[0].Site_Name.toString();
                mSingleModel.mainModel.SiteCode = _mainList[0].SiteCode.toString();
                mSingleModel.mainModel.SubPlot_Name = _mainList[0].SubPlot_Name.toString();
                mSingleModel.mainModel.Sub_Plot_Code = _mainList[0].Sub_Plot_Code.toString();

                mSingleModel.mainModel.CropId = _mainList[0].CropId.toString();
                mSingleModel.mainModel.Crop_Name = _mainList[0].Crop_Name.toString();
                mSingleModel.mainModel.Variety = _mainList[0].Variety.toString();
                mSingleModel.mainModel.Variety_Name = _mainList[0].Variety_Name.toString();

                mSingleModel.mainModel.Plot_Id = _mainList[0].Plot_ID.toString();
                mSingleModel.mainModel.Plot_Name = _mainList[0].Plot_Name;
                mSingleModel.mainModel.Plot_Code = _mainList[0].Plot_Code;
                mSingleModel.mainModel.UserCropProfileId = _mainList[0].UserCropProfileId.toString();
                mSingleModel.mainModel.CropArea = _mainList[0].CropArea.toString();
                mSingleModel.mainModel.Area_Covered = _mainList[0].CropArea.toString();
                mSingleModel.mainModel.Area_Unit_Id = _mainList[0].CropAreaUnitId;
                mSingleModel.mainModel.Unit = _mainList[0].Unit;

                Utils.printWrapped("mData- ", mSingleModel.mainModel.Crop_Name + " " + mSingleModel.mainModel.Variety);
              } catch (e) {}

              if (Utils.checkString(mSingleModel.mainModel.Unit)) {
                mSingleModel.mainModel.Unit = "Acre";
              }


            }
          }
        }*//*

        // callFragment("LATActivityMain", "Labour Activity Tracking", false, false);
      } else {
        Utils.showToast(string.invalid_qr_code);
      }
    } else {
      Utils.showToast("Labour Not Found. Kindly Sync App");
    }
  }

  fetchInProcessDataTD(Daily_WorkDetails model, int i) async {
    tdEntryModel.TDEntryModel mSingleModel = new tdEntryModel.TDEntryModel();
    mSingleModel.clear();

    String androidWorkId = model.Android_WORK_ID.toString();

    mSingleModel.AllSiteLabour = await Utils.getConfigSetting("85");
    mSingleModel.AutoPackhouseReceive = await Utils.getConfigSetting("49");

    List<Daily_WorkDetails> _mainList =
    await Daily_WorkDetails.getLATEntryByAId(androidWorkId, "");

    if (_mainList != null && _mainList.length > 0) {
      try {
        mSingleModel.mainModel.Android_WORK_ID =
            _mainList[0].Android_WORK_ID.toString();
        mSingleModel.mainModel.Work_Date = _mainList[0].Work_Date.toString();
        mSingleModel.mainModel.Work_Date = _mainList[0].Work_Date.toString();
        mSingleModel.mainModel.Activity_ID =
            _mainList[0].Activity_ID.toString();
        mSingleModel.mainModel.ActivityName =
            _mainList[0].ActivityName.toString();
        mSingleModel.mainModel.Labour_Id = _mainList[0].Labour_Id.toString();
        mSingleModel.mainModel.LabourName = _mainList[0].LabourName.toString();
        mSingleModel.mainModel.Site_ID = _mainList[0].Site_ID.toString();

        mSingleModel.labourList.add(tdEntryModel.LabourDetails(
            Labour_Id: mSingleModel.mainModel.Labour_Id.toString(),
            LabourName: mSingleModel.mainModel.LabourName.toString(),
            LabourCode: "",
            SiteID: mSingleModel.mainModel.Site_ID.toString()));

        mSingleModel.mainModel.Site_Name = _mainList[0].Site_Name.toString();
        mSingleModel.mainModel.SiteCode = _mainList[0].SiteCode.toString();
        mSingleModel.mainModel.SubPlot_Name =
            _mainList[0].SubPlot_Name.toString();
        mSingleModel.mainModel.Sub_Plot_Code =
            _mainList[0].Sub_Plot_Code.toString();

        mSingleModel.mainModel.CropId = _mainList[0].CropId.toString();
        mSingleModel.mainModel.Crop_Name = _mainList[0].Crop_Name.toString();
        mSingleModel.mainModel.Variety = _mainList[0].Variety.toString();
        mSingleModel.mainModel.Variety_Name =
            _mainList[0].Variety_Name.toString();

        mSingleModel.mainModel.Plot_Id = _mainList[0].Plot_Id.toString();
        mSingleModel.mainModel.Plot_Name = _mainList[0].Plot_Name;
        mSingleModel.mainModel.Plot_Code = _mainList[0].Plot_Code;
        mSingleModel.mainModel.UserCropProfileId =
            _mainList[0].UserCropProfileId.toString();
        mSingleModel.mainModel.CropArea = _mainList[0].Area_Covered.toString();
        mSingleModel.mainModel.Area_Covered =
            _mainList[0].Area_Covered.toString();
        mSingleModel.mainModel.Area_Unit_Id =
            _mainList[0].Area_Unit_Id.toString();
        mSingleModel.mainModel.Unit = _mainList[0].Unit;

        mSingleModel.mainModel.Remark = _mainList[0].Remark;

        mSingleModel.mainModel.Mobile_PIN = _mainList[0].Mobile_PIN;
        mSingleModel.mainModel.Created_Date = _mainList[0].Created_Date;
        mSingleModel.mainModel.Created_By = _mainList[0].Created_By;
        // mSingleModel.mainModel.Latitude = _mainList[0].Latitude;
        // mSingleModel.mainModel.Longitute = _mainList[0].Longitute;
        mSingleModel.mainModel.Work_LocationID = _mainList[0].Work_LocationID;
        mSingleModel.mainModel.Login_Id = _mainList[0].Login_Id;
        mSingleModel.mainModel.Language_ID = _mainList[0].Language_ID;
        mSingleModel.mainModel.Work_Status = _mainList[0].Work_Status;
        mSingleModel.mainModel.Approved_Status = _mainList[0].Approved_Status;
      } catch (e) {}

      if (Utils.checkString(mSingleModel.mainModel.Unit)) {
        mSingleModel.mainModel.Unit = "Acre";
      }

      Daily_WorkSpecific mSpecificData =
      await Daily_WorkSpecific.getTDApplicationDataById(
          _mainList[0].Android_WORK_ID.toString(),
          _mainList[0].Work_ID.toString());

      mSingleModel.appSpecificModel = mSpecificData;

      if (Utils.equalsIgnoreCase(mSingleModel.mainModel.Activity_ID.toString(),
          Constants.TAPPING_ACTIVITY_ID)) {
        List<CommonSingleList> mUnitList =
            await CommonSingleList.getUnitsListUsingTypeId("3");
        if (mUnitList != null && mUnitList.length > 0) {
          mSingleModel.appSpecificModel.HarvestUnit_ID =
              mUnitList[0].Id.toString();
          mSingleModel.appSpecificModel.HarvestUnit =
              mUnitList[0].Name.toString();
        }

        List<CommonSingleList> mUnitList1 =
            await CommonSingleList.getUnitsListUsingTypeId("4");
        if (mUnitList1 != null && mUnitList1.length > 0) {
          mSingleModel.appSpecificModel.NoOfcasesUintID =
              mUnitList[0].Id.toString();
          mSingleModel.appSpecificModel.NoOfCasesUnit =
              mUnitList[0].Name.toString();
        }
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainFragmentSatatess(
                  serviceCode: "TDActivityMain",
                  title: string.TappingDetails,
                  showFB: false,
                  resize: false)));
    }
  }

  Future<void> setInitialDataTD(String mLabourId) async {
    tdEntryModel.TDEntryModel().clear();

    tdEntryModel.TDEntryModel mSingleModel = new tdEntryModel.TDEntryModel();
    mSingleModel.AllSiteLabour = await Utils.getConfigSetting("85");
    SessionManager sessionManager = SessionManager();

    List<CommonSingleList> mList =
        await CommonSingleList.getLabourNameList(sessionManager, mLabourId,isAttendence: true);
    if (mList != null && mList.length > 0) {
      CommonSingleList model = mList[0];
      if (model != null) {
        if (Utils.equalsIgnoreCase(model.SubName, "true")) {
          mSingleModel.mainModel.Labour_Id = model.Id.toString();
          mSingleModel.mainModel.LabourName = model.Name.toString();

          mSingleModel.labourList.add(tdEntryModel.LabourDetails(
              Labour_Id: mSingleModel.mainModel.Labour_Id,
              LabourName: mSingleModel.mainModel.LabourName,
              LabourCode: "",
              SiteID: model.SubId.toString()));

          List<CommonSingleList> _mainList =
          await CommonSingleList.getSitesList(
              sessionManager, model.SubId.toString());
          if (_mainList != null && _mainList.length > 0) {
            CommonSingleList model = _mainList[0];
            if (model != null) {
              mSingleModel.mainModel.Site_Name =
              model.Name.toString().split(" - ")[0];
              mSingleModel.mainModel.SiteCode =
              model.Name.toString().split(" - ")[1];
              mSingleModel.mainModel.Site_ID = model.Id.toString();
            }
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MainFragmentSatatess(
                          serviceCode: "TDActivityMain",
                          title: string.TappingDetails,
                          showFB: false,
                          resize: false)));
        } else {
          Utils.showToast("No farm wise user access. ");
        }
      } else {
        Utils.showToast(string.invalid_qr_code);
      }
    } else {
      Utils.showToast("Labour Not Found or Attendence not marked. Kindly Sync App");
    }
  }
*/

  /*
   Added by :Rohit Kurzekar
   Date :01-03-2021
   */
  var apiVersion, appVersion, apkPath;
  bool downloading = false;
  bool autoDownload = true;
  var progressString = "0";
  File attachmentApk;

  checkAPKVersion() async {
    SessionManager sessionManager = new SessionManager();
    String companyId = await sessionManager.getCompanyId();
    String loginId = await sessionManager.getLoginID();
    int apkType = ApiUtils.APK_TYPE;
    // print("ROHITDownload$companyId,$loginId,$apkType");
    Dio dio = Dio();
    dio.options.baseUrl = ApiUtils.getMainLink();

    Response<dynamic> response = await dio
        .get("/Api_FarmERPMobDownLoad/FM_GetAPKVersion", queryParameters: {
      'OrganizationID': companyId,
      'LoginID': loginId,
      'Apk_type': apkType
    });
    // Response<dynamic> response = await dio.get("/Api_FarmERPMobDownLoad/FM_GetAPKVersion?OrganizationID=3&LoginID=3&Apk_type=1");
    if (response.statusCode == 200) {
      Utils.showLog("RESPONSE", response.toString());
      Utils.showLog("DownloadAPKUrl:", "url= " + response.realUri.toString());
      // print("Response Data: ${response.data["MobileVersion"].toString()}");
      var data = ApkApiResponse.fromJson(json.decode(response.toString()));
      Utils.showLog("MobileVersion response", data.mobileVersion);
      apiVersion = data.mobileVersion;
      // apkPath = ApiUtils.getMainLink() +
      //     data.apkPath.replaceAll('../', '');

      apkPath = ApiUtils.getMainLink() + data.apkPath;

      Utils.showLog("APK_PATH", apkPath);
    } else {
      Utils.showToast("FAILED API CALL");
    }
    Utils.showLog("APK VERSION", Constants.AppVersion);
    appVersion = Constants.AppVersion;

    List appVersionSplit = appVersion.split('.');
    List apiVersionSplit = apiVersion.split('.');

    if (int.parse(apiVersionSplit[0]) > int.parse(appVersionSplit[0])) {
      askDownloadDialog();
    } else if (int.parse(apiVersionSplit[1]) > int.parse(appVersionSplit[1])) {
      askDownloadDialog();
    } else if (int.parse(apiVersionSplit[2]) > int.parse(appVersionSplit[2])) {
      askDownloadDialog();
    } else if (int.parse(apiVersionSplit[3]) > int.parse(appVersionSplit[3])) {
      askDownloadDialog();
    } else if (int.parse(apiVersionSplit[4]) > int.parse(appVersionSplit[4])) {
      askDownloadDialog();
    } else if (int.parse(apiVersionSplit[5]) > int.parse(appVersionSplit[5])) {
      askDownloadDialog();
    }
  }

  askDownloadDialog() {
    return showDialog(
        context: context,
        builder: (context) =>
            WillPopScope(
                onWillPop: () {
                  Utils.showToast("Click on download button to upgrade !");
                },
                child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    child: Container(
                        height: Utils.getSize(200.0),
//                margin: const EdgeInsets.only(left: 26, right: 26),
                    child: Card(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: Utils.getSize(20.0)),
                                padding: EdgeInsets.only(left: Utils.getSize(20.0)),
                                child: DynamicViews().text(
                                    context,
                                    string.UpdateAvailable,
                                    22,
                                    FontWeight.bold,
                                    RColors.black,
                                    TextAlign.start),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: Utils.getSize(20.0)),
                                padding: EdgeInsets.only(left: Utils.getSize(20.0)),
                                child: DynamicViews().text(
                                    context,
                                    string.NewVersionAvailable,
                                    16,
                                    FontWeight.normal,
                                    RColors.black,
                                    TextAlign.start),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: Utils.getSize(15.0)),
                                margin: EdgeInsets.only(
                                    top: Utils.getSize(40.0),
                                    // bottom: Utils.getSize(30.0),
                                    left: Utils.getSize(10.0),
                                    right: Utils.getSize(10.0)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      ButtonTheme(
                                          minWidth: 100.0,
                                          child: RaisedButton(
                                              onPressed: () {
                                                downloadPath();
                                                Navigator.pop(context);
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(5.0),
                                              ),
                                              textColor: Colors.white,
                                              color: RColors.PrimaryColor,
                                              padding: EdgeInsets.all(
                                                  Utils.getSize(5.0)),
                                              child: new Text(
                                                string.Update,
                                                style: new TextStyle(
                                                  fontSize: Utils.getSize(16.0),
                                                  color: Colors.white,
                                                ),
                                              )))
                                    ]),
                              ),
                            ]))))));
  }

  BuildContext progressContext;

  showDownloadProgressDialog() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext progressContext) {
          this.progressContext = progressContext;
          return StatefulBuilder(builder: (context, setStateAPKProgressDialog) {
            this.setStateAPKProgressDialog = setStateAPKProgressDialog;
            return Container(
              margin: EdgeInsets.all(Utils.getSize(5.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
//        margin: EdgeInsets.only(bottom: Utils.getSize(context, 50.0)),
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      insetPadding: EdgeInsets.all(Utils.getSize(9.0)),
                      backgroundColor: Colors.white,
                      child: Column(
//          mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: Utils.getSize(25.0)),
                          new Image.asset(
                            'assets/rebootDesign/image/farmerplogonew.png',
                            width: Utils.getSize(150.0),
                            height: Utils.getSize(80.0),
                          ),
                          SizedBox(height: Utils.getSize(50.0)),
                          new Container(
                            child: CircularStepProgressIndicator(
                              totalSteps: 100,
                              currentStep: int.parse(progressString),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  progressString + "%",
                                  style: TextStyle(
                                    fontSize: 34.0,
                                    fontWeight: FontWeight
                                        .bold, // insert your font size here
                                  ),
                                ),
                              ),
                              stepSize: 15,
                              selectedColor: Colors.orangeAccent,
                              unselectedColor: Colors.grey[200],
                              padding: 0,
                              width: Utils.getSize(150.0),
                              height: Utils.getSize(150.0),
                              selectedStepSize: 20,
                            ),
                          ),
                          SizedBox(height: Utils.getSize(60.0)),
                          isExtract
                              ? Container(
                                  child: DynamicViews().text(
                                      context,
                                      "Wait redirecting to installation page...",
                                      14,
                                      FontWeight.normal,
                                      Colors.black38,
                                      TextAlign.center),
                                )
                              : Container(),
                          SizedBox(height: Utils.getSize(20.0)),
                          new Container(
                            alignment: Alignment.bottomCenter,
                            color: Colors.black12,
                            padding: EdgeInsets.only(
                                top: Utils.getSize(10.0),
                                bottom: Utils.getSize(10.0),
                                left: Utils.getSize(8.0),
                                right: Utils.getSize(8.0)),
                            child: new Row(children: <Widget>[
                              Expanded(
                                  child: Row(mainAxisSize: MainAxisSize.max,
                                      // To make the card compact
                                      children: <Widget>[
                                    DynamicViews().text(
                                        context,
                                        "Note :\n",
                                        13,
                                        FontWeight.normal,
                                        RColors.textColorlight,
                                        TextAlign.start),
                                    DynamicViews().text(
                                        context,
                                        "Please do not press back or close the app \nwhile downloading",
                                        13,
                                        FontWeight.normal,
                                        RColors.textColorlight,
                                        TextAlign.left),
                                  ])),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  Directory dir;

  Future<void> downloadPath() async {
    Dio dio = Dio();
    try {
      // Directory dir = await getApplicationDocumentsDirectory();
      dir = await getExternalStorageDirectory();
      showDownloadProgressDialog();
      setState(() {
        downloading = true;
        autoDownload = false;
      });
      print("path ${dir.path}");
      // print('new path'+ '${dir.path}/FarmERP.zip');
      await dio.download(apkPath, "${dir.path}/FarmERP.zip",
          onReceiveProgress: (rcv, total) {
        setStateAPKProgressDialog(() {
          progressString = ((rcv / total) * 100).toStringAsFixed(0);
        });
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      downloading = false;
      autoDownload = true;
      // progressString = "Completed";
      // print(progressString);
    });
    if (progressContext != null) {
      print('IN THE PROGRESS-CONTEXT');
      Navigator.pop(progressContext);
    }

    print("Download completed $downloading");
    await zipExtract();
    // waitMethod();
  }

  // Timer timer;
  // waitMethod() {
  //   timer = new Timer(const Duration(seconds: 1), () {
  //     print("This line will print after one seconds");
  //     zipExtract();
  //   });
  // }

  var apkLocalFilePath;
  bool isExtract = false;

  zipExtract() {
    final bytes = File('${dir.path}/FarmERP.zip').readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);
    for (final file in archive) {
      final filename = file.name;
      setState(() {
        isExtract = true;
        print("IS EXTRACT---> $isExtract");
      });

      print('FILE NAME: $filename');

      if (file.isFile) {
        final data = file.content as List<int>;
        File('${dir.path}/' + filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
        // print("THIS__________________>" + '${dir.path}/' + filename);
        apkLocalFilePath = '${dir.path}/' + filename;
        setState(() {
          isExtract = false;
          print("IS EXTRACT---> $isExtract");
        });
        apkInstall();
      } else {
        Directory('${dir.path}/' + filename)..create(recursive: true);
        setState(() {
          isExtract = false;
        });
        apkInstall();
      }
    }
  }

  static const platform = const MethodChannel('install_plugin');

  // static const platform2 = const MethodChannel('install_plugin2');

  apkInstall() async {
    if (apkLocalFilePath.isEmpty) {
      print('make sure the apk file is set');
      return;
    }
    try {
      Map<String, String> params = {
        "filePath": apkLocalFilePath,
        "appId": "com.farmerp.farmerp"
      };
      await platform.invokeMethod('installApk', params);
    } on PlatformException catch (e) {}

    /*InstallPlugin.installApk(apkLocalFilePath, 'com.farmerp.farmerp')
        .then((result) => print('install apk $result'))
        .catchError((error) {
      print('install apk error: $error');
    });*/
  }

  // void ClearAttachmentData() {
  //   AttachmentDetailsState.attachmentList = List();
  //   AttachmentDetailsState.remarkStr = "";
  // }

 /* switchForQRCalls(String mServiceName) async {
    switch (mServiceName) {
      case Constants.MultiplotRecordKeeping:
        // callMRKForm();
        Navigator.pop(bottomSheetConext);
        break;

      case Constants.Observation:
        // callObservation();
        Navigator.pop(bottomSheetConext);

        break;

      case Constants.FarmerRecordKeeping:
        if (cfFarmerContract != null) {
          FRKInfoState frkInfoState = new FRKInfoState(this, "");
          frkInfoState.resetdata();
          ComFarmerSelectionState.gFarmerData = cfFarmerContract;
          callFragment("FRKInfo", "Farmer Record Keeping", false, false);
          Navigator.pop(bottomSheetConext);
        } else {
          Utils.showToast("No Data found");
        }
        break;

      case Constants.ObservationRecording:
        try {
          OBRMainState.resetdata();
          OBRFormData model = new OBRFormData();
          model.clear();
        } catch (e) {
          print(e);
        }
        if (cfFarmerContract != null) {
          ComFarmerSelectionState.gFarmerData = cfFarmerContract;
          callFragment("OBRForm", "Observation Recording", false, false);
          Navigator.pop(bottomSheetConext);
        } else {
          Utils.showToast("No Data found");
        }
        break;

      case Constants.CropProcurement:
        if (cfFarmerContract != null) {
          CPSingleTon main = new CPSingleTon();
          main.clear();
          main.isEditRate = await Utils.getConfigSetting("179");
          main.isRecoverPercentEnable = await Utils.getConfigSetting("180");
          callCropProcurement(cfFarmerContract);
          Navigator.pop(bottomSheetConext);
        } else {
          Utils.showToast("No Data found");
        }
        break;

      case Constants.GoodsIssueToFarmer:
        if (cfFarmerContract != null) {
          GIFEntryModel().clear();
          GIFEntryModel().mainDataModel.Contract_Id =
              cfFarmerContract.Contract_Id;
          callFragment("GIFForm", "Goods Issue To Farmer", false, false);
          Navigator.pop(bottomSheetConext);
        } else {
          Utils.showToast("No Data found");
        }
        break;

      case Constants.LabourActivityTracking:
        if (modelLabour != null) {
          List<Daily_WorkDetails> _mainList =
          await Daily_WorkDetails.getLATEntryByAId(
              "", modelLabour.UserId.toString());
          Navigator.pop(bottomSheetConext);

          if (_mainList != null && _mainList.length > 0) {
            if (!Utils.checkStringWithZero(_mainList[0].IsEnded) &&
                Utils.equalsIgnoreCase(_mainList[0].IsEnded, "false")) {
              Daily_WorkDetails model = Daily_WorkDetails();
              model.Android_WORK_ID = _mainList[0].Android_WORK_ID.toString();
              fetchInProcessData(model, 0);
            } else {
              setInitialData(modelLabour.UserId.toString());
            }
          } else {
            setInitialData(modelLabour.UserId.toString());
          }
          modelLabour = null;
        }
        break;

      case Constants.TappingDetails:
        if (modelLabour != null) {
          List<Daily_WorkDetails> _mainList =
          await Daily_WorkDetails.getTDEntryByAId(
              "", modelLabour.UserId.toString());
          Navigator.pop(bottomSheetConext);

          if (_mainList != null && _mainList.length > 0) {
            if (!Utils.checkStringWithZero(_mainList[0].IsEnded) &&
                Utils.equalsIgnoreCase(_mainList[0].IsEnded, "false")) {
              Daily_WorkDetails model = Daily_WorkDetails();
              model.Android_WORK_ID = _mainList[0].Android_WORK_ID.toString();
              fetchInProcessDataTD(model, 0);
            } else {
              setInitialDataTD(modelLabour.UserId.toString());
            }
          } else {
            setInitialDataTD(modelLabour.UserId.toString());
          }
          modelLabour = null;
        }
        break;
    }
  }

  void switchForAttachmentCalls(String mServiceName) {
    Constants.IsHomeScreenAttachment = true;
    switch (mServiceName) {
      case Constants.MultiplotRecordKeeping:
        clearCallMRKAttach();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.Observation:
        clearCallAttachObservation();
        Navigator.pop(cameraSheetConext);

        break;

      case Constants.FarmerRecordKeeping:
        clearCallAttachFarmerRecordKeeping();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.ObservationRecording:
        clearCallAttachObservationRecording();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.CropProcurement:
        clearCallAttachCropProcure();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.GoodsIssueToFarmer:
        clearCallAttachGoodsIssueFarmer();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.FarmerRegistration:
        clearCallAttachFarmerRegistration();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.SchemeRegistration:
        clearCallAttachSchemeRegistration();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.MaterialIndent:
        clearCallAttachMaterialIndent();
        Navigator.pop(cameraSheetConext);
        break;

      case Constants.TreeObservation:
        clearCallTreeObservation();
        Navigator.pop(cameraSheetConext);
        break;
    }
  }

  void clearCallMRKAttach() {
    RKMainListState.clearAllData();
    MRKSingleTon().clear();
    MRKSingleTon mrkSingleTon = MRKSingleTon();
    mrkSingleTon.SiteId = "";
    mrkSingleTon.SiteName = "";
    mrkSingleTon.ActivityId = "";
    mrkSingleTon.ActivityName = "";
    callFragment("RKForm", "Record Keeping", false, false);
  }

  void clearCallAttachObservation() async {
    OBSEntryModel().clear();
    SessionManager sessionManager = SessionManager();
    List<MRKPlotDetails> _mainList = await Plots.getCropProfilePlotList(
        await sessionManager.getUserID(),
        await sessionManager.getLoginID(),
        "",
        Constants.ALL_SITE_PLOT_LIST);

    if (_mainList != null && _mainList.length > 0) {
      MRKPlotDetails value = _mainList[0];
      OBSEntryModel _obsSinglton = new OBSEntryModel();
      _obsSinglton.mainDataModel.Plot_Name = value.Site_Name +
          " - " +
          value.Plot_Name +
          " - " +
          value.SubPlot_Name +
          " - " +
          value.Crop_Name +
          " - " +
          value.Variety_Name;

      _obsSinglton.mainDataModel.Plot_Id = value.Plot_ID.toString();
      _obsSinglton.mainDataModel.Farm_Id = value.Farm_ID.toString();

      _obsSinglton.mainDataModel.UserCropProfileId =
          value.UserCropProfileId.toString();
      _obsSinglton.mainDataModel.AreaCovered = value.CropArea.toString();
      _obsSinglton.mainDataModel.CropArea = value.CropArea.toString();
      _obsSinglton.mainDataModel.Site_ID = value.Site_ID.toString();
      _obsSinglton.mainDataModel.Crop_ID = value.CropId.toString();
      _obsSinglton.mainDataModel.Crop_Name = value.CropId.toString();
      _obsSinglton.mainDataModel.Variety_ID = value.Variety.toString();
      _obsSinglton.mainDataModel.Variety_Name = value.Variety_Name.toString();
      _obsSinglton.mainDataModel.SubPlot_Name = value.SubPlot_Name.toString();
      _obsSinglton.mainDataModel.Unit_Id = value.CropAreaUnitId.toString();
      _obsSinglton.mainDataModel.Unit = value.Unit.toString();

      if (Utils.checkString(_obsSinglton.mainDataModel.Unit)) {
        _obsSinglton.mainDataModel.Unit = "Acre";
      }

      _obsSinglton.mainDataModel.ActivityName = "Agro-Chemical";
      _obsSinglton.mainDataModel.Activity_Id = "2";

      try {
        if ((_obsSinglton.cropQaulityParam != null &&
            _obsSinglton.cropQaulityParam.length == 0) ||
            _obsSinglton.cropQaulityParam == null) {
          _obsSinglton.cropQaulityParam =
          await RK_ObservationParameter.getParamUsingCropIdandTypeandFor(
              _obsSinglton.mainDataModel.Crop_ID.toString(),
              Constants.OBSERVATION_PARAMETER,
              Constants.TYPE_GENERAL);

          SessionManager sessionManager  = new SessionManager();
          String mCropID = await sessionManager.getValueOf(Constants.LAST_SELETED_CROP_IDS);
          String mParamsID =  await sessionManager.getValueOf(Constants.LAST_SELETED_PARAMS_IDS);
          Utils.printWrapped("ResultLen",  _obsSinglton.cropQaulityParam.length.toString() +" "+mCropID +" "+ mParamsID);
          if(!Utils.checkStringWithZero(mParamsID) && !Utils.checkStringWithZero(mCropID) && Utils.equalsIgnoreCase( _obsSinglton.mainDataModel.Crop_ID.toString(),mCropID)) {

            if (_obsSinglton.cropQaulityParam != null && _obsSinglton.cropQaulityParam.length > 0) {
              List<String> localIDs = mParamsID.split(",");

              for(int i=0;i<_obsSinglton.cropQaulityParam.length;i++)
              {
                bool isFound = false ;
                if (_obsSinglton.cropQaulityParam[i].ISMandatory == "true" ||
                    _obsSinglton.cropQaulityParam[i].ISMandatory == "1") {

                  isFound = true ;
                }else {
                  for (int k = 0; k < localIDs.length; k++) {
                    if (Utils.equalsIgnoreCase(
                        _obsSinglton.cropQaulityParam[i].ObservationParameter_ID
                            .toString(), localIDs[k].toString())) {
                      isFound = true;
                    }
                    // _obsSinglton.cropQaulityParam.forEach((f) => f.Checked = true);
                  }

                }
                _obsSinglton.cropQaulityParam[i].Checked = isFound;
              }
            }
          }else{
            if (_obsSinglton.cropQaulityParam != null && _obsSinglton.cropQaulityParam.length > 0) {
              _obsSinglton.cropQaulityParam.forEach((f) => f.Checked = true);
            }
          }
        }
      } catch (e) {
        print(e);
      }

      if (_obsSinglton.cropQaulityParam == null) {
        _obsSinglton.cropQaulityParam = new List();
      }

      callFragment("OBSForm", "Observation", false, false);
    }
  }

  void clearCallAttachFarmerRecordKeeping() {
    FRKInfoState frkInfoState = new FRKInfoState(this, "");
    frkInfoState.resetdata();
    callFragment("ComFarmerSelection", "Farmer Record Keeping", false, true,
        flag: "FRK");
  }

  void clearCallAttachObservationRecording() {
    OBRMainState.resetdata();
    try {
      OBRFormData model = new OBRFormData();
      model.clear();
    } catch (e) {
      print(e);
    }
    callFragment("ComFarmerSelection", "Observation Recording", false, true,
        flag: "OBR");
  }*/
/*
  clearCallAttachCropProcure() async {
    CPSingleTon main = new CPSingleTon();
    main.clear();

    main.isEditRate = await Utils.getConfigSetting("179");
    main.isRecoverPercentEnable = await Utils.getConfigSetting("180");

    callFragment("ComFarmerSelection", "Contract Selection", false, true,
        flag: "CropProcurement");
  }

  void clearCallAttachGoodsIssueFarmer() {
    GIFEntryModel().clear();
    callFragment("ComFarmerSelection", "Goods Issue To Farmer", false, true,
        flag: Constants.GoodsIssueToFarmer);
  }

  singleAttachmentItem(AD_FarmAttachementDetails attachmentList, int index) {
    File attachmentFile = null;
    try {
      AD_FarmAttachementDetails attachmentDetails =
      AttachmentDetailsState.attachmentList[index];
      attachmentFile = File(attachmentDetails.File_Path);
    } catch (e) {
      print(e);
    }

    return attachmentFile != null
        ? GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {},
        child: Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(Utils.getSize(4.0)),
          margin: EdgeInsets.only(bottom: Utils.getSize(4.0)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            // border: Border.all(
            // color: Colors.grey[200], //                   <--- border color
            // width: 1.0,
            // ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
//            spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: Image.file(
            attachmentFile,
            fit: BoxFit.contain,
            height: 80,
            width: 80,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
          //     Container(
          //       alignment: Alignment.centerLeft,
          //       height: Utils.getSize(50.0),
          //       width: Utils.getSize(50.0),
          //       decoration: new BoxDecoration(
          //         color: Colors.grey[100],
          //         // color: getColor(index),
          //         shape: BoxShape.circle,
          //       ),
          //       child :
          //       Align(
          //         child:
          //         ClipRRect(
          //             borderRadius: BorderRadius.circular(125.0),
          //             child:
          //             ),
          //       ),
          //     ),
          //   ],
          // ),
        ))
        : Utils.showNoData(context);
  }

  void clearCallAttachFarmerRegistration() {
    FRSingleTon main = new FRSingleTon();
    main.clear();
    AttachmentDetailsState.geoLocationCon.text = "";
    AttachmentDetailsState.remarkCon.text = "";
    callFragment("FRForm", "Personal Information", false, true);
  }

  void clearCallAttachSchemeRegistration() {
    CFSingleTon cfSingleTon = new CFSingleTon();

    cfSingleTon.clearData();

    callFragment("ComFarmerSelection", "Farmer Selection", false, true,
        flag: "SchemeRegistration");
  }

  Future<void> clearCallAttachMaterialIndent() async {
    MISingleTon model = new MISingleTon();
    model.clear();
    *//*Allow plot wise Material Indent Request*//*
    model.isPlotwise = await Utils.getConfigSetting("63");
    callFragment("MIForm", "Material Indent", false, false);
  }

  setLocation() async {
    TOEntryModels model = new TOEntryModels();
    try {
      model.location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      model.location = Position();
    }

    print(model.location);
  }

  Future<void> clearCallTreeObservation() async {
    TOMainListState.clearAllData();
    TOEntryModels model = new TOEntryModels();
    model.clearHome();
    TOFormState.pageType = 1;
    model.backDaysAllowed =
        (await AD_CompanyDetails.getBackDaysEntryCount()).toString();
    setLocation();

    callFragment("TOForm", string.TreeObservation, false, false);
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }*/

  //progress
  BuildContext loadingContext;

  showProgress(String msg) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((BuildContext loadingContext) {
          this.loadingContext = loadingContext;
          return Dialog(
            child: Container(
              height: Utils.getSize(65),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
                // borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
              ),
              padding:
              // EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              EdgeInsets.all(16.0),
              child: Center(
                child: new Row(
                  children: [
                    Expanded(
                      child: DynamicViews().text(
                          context,
                          msg,
                          16,
                          FontWeight.normal,
                          RColors.textColorDark,
                          TextAlign.left),
                    ),
                    DynamicViews.sizedBox(width: 16),
                    CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            RColors.bluishGreen),
                        strokeWidth: 4.0),
                    DynamicViews.sizedBox(width: 16),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  dismissProgress() {
    try {
      if (loadingContext != null) Navigator.pop(loadingContext);
      loadingContext = null;
    } catch (e) {
      print(e);
    }
  }

  void getuserdetals(SessionManager sessionManager) async {
    String username = "",
        password = "";
    // AD_Login model =
    // await AD_Login.getuserdetals(await sessionManager.getUserID());
    // username = await sessionManager.getUserID();
    // password =await  sessionManager.;

    if (!Utils.checkStringWithZero(username) &&
        !Utils.checkStringWithZero(password)) {
      URL = ApiUtils.getMainLink(linkOnly: true) +
          'Login.aspx?Username=' +
          username +
          '&passwordnew=' +
          password +
          '&MobDashBoard=0';
      Utils.printWrapped("DashboardURL", URL);
    }
  }



  // initFCM() async {
  //   fcmInit.initToken();
  //   fcmInit.initNotification();
  // }
}

ApkApiResponse apkApiResponseFromJson(String str) =>
    ApkApiResponse.fromJson(json.decode(str));

String apkApiResponseToJson(ApkApiResponse data) => json.encode(data.toJson());

class ApkApiResponse {
  ApkApiResponse({
    this.apkImportId,
    this.date,
    this.documentNo,
    this.webVersion,
    this.mobileVersion,
    this.apkPath,
    this.isMandatory,
    this.remark,
    this.loginId,
    this.languageId,
    this.organizationId,
    this.deleteStatus,
    this.createdBy,
    this.approvedStatus,
    this.activeStatus,
    this.requestStatus,
    this.apkToken,
    this.apkType,
    this.expiryDate,
    this.currentDate,
  });

  String apkImportId;
  String date;
  String documentNo;
  String webVersion;
  String mobileVersion;
  String apkPath;
  String isMandatory;
  String remark;
  String loginId;
  String languageId;
  String organizationId;
  String deleteStatus;
  String createdBy;
  String approvedStatus;
  String activeStatus;
  String requestStatus;
  String apkToken;
  String apkType;
  String expiryDate;
  String currentDate;

  factory ApkApiResponse.fromJson(Map<String, dynamic> json) =>
      ApkApiResponse(
        apkImportId: json["APKImport_ID"],
        date: json["Date"],
        documentNo: json["Document_No"],
        webVersion: json["WebVersion"],
        mobileVersion: json["MobileVersion"],
        apkPath: json["APKPath"],
        isMandatory: json["IsMandatory"],
        remark: json["Remark"],
        loginId: json["Login_ID"],
        languageId: json["Language_ID"],
        organizationId: json["Organization_ID"],
        deleteStatus: json["Delete_Status"],
        createdBy: json["Created_By"],
        approvedStatus: json["Approved_Status"],
        activeStatus: json["Active_Status"],
        requestStatus: json["Request_Status"],
        apkToken: json["APK_Token"],
        apkType: json["Apk_type"],
        expiryDate: json["ExpiryDate"],
        currentDate: json["CurrentDate"],
      );

  Map<String, dynamic> toJson() =>
      {
        "APKImport_ID": apkImportId,
        "Date": date,
        "Document_No": documentNo,
        "WebVersion": webVersion,
        "MobileVersion": mobileVersion,
        "APKPath": apkPath,
        "IsMandatory": isMandatory,
        "Remark": remark,
        "Login_ID": loginId,
        "Language_ID": languageId,
        "Organization_ID": organizationId,
        "Delete_Status": deleteStatus,
        "Created_By": createdBy,
        "Approved_Status": approvedStatus,
        "Active_Status": activeStatus,
        "Request_Status": requestStatus,
        "APK_Token": apkToken,
        "Apk_type": apkType,
        "ExpiryDate": expiryDate,
        "CurrentDate": currentDate,
      };
}

class NotchD2 extends CustomClipper<Path> {
  NotchD2();

  /// The number of points of the star
  // final int numberOfPoints;

  @override
  Path getClip(Size size) {
    final double notchRadius = Utils.getSize(
        MainFragmentState.camFBSize + (MainFragmentState.notchMargin * 2)) /
        2.0;

    // We build a path for the notch from 3 segments:
    // Segment A - a Bezier curve from the host's top edge to segment B.
    // Segment B - an arc with radius notchRadius.
    // Segment C - a Bezier curve from segment B back to the host's top edge.
    //
    // A detailed explanation and the derivation of the formulas below is
    // available at: https://goo.gl/Ufzrqn

    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    // final double b = host.top - guest.center.dy;
    final double b = 0; //- 0;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset> p = List<Offset>.filled(6, null, growable: false);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1)
      p[i] = p[i] +
          Offset(
              size.width -
                  (notchRadius + Utils.getSize(MainFragmentState.rightOffset)),
              0);

    return Path()
      ..moveTo(0, 0)
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(size.width, 0)..lineTo(size.width, size.height)..lineTo(
          0, size.height)
      ..close();

    // return path;
  }

  num _degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // StarClipper oldie = oldClipper as StarClipper;
    return true;
  }
}

class AppVersion {
  AppVersion({
    this.farmErp,
    this.farmErpe20,
  });

  String farmErp;
  String farmErpe20;

  factory AppVersion.fromJsonAppVersion(Map<String, dynamic> json) => AppVersion(
    farmErp: json["FarmERP"],
    farmErpe20: json["FarmERPE20"],
  );

  Map<String, dynamic> toJson() => {
    "FarmERP": farmErp,
    "FarmERPE20": farmErpe20,
  };
}

