import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:dotted_line/dotted_line.dart';
import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Services/MainFragment.dart';
import 'package:ecompusellcontractor/Utility/ApiUtils.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/SessionManager.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
// import 'package:farmerp/dynamicUtils/AttachmentDetails.dart';
// import 'package:farmerp/dynamicUtils/CustFB.dart';
// import 'package:farmerp/dynamicUtils/DynamicViews.dart';
// import 'package:farmerp/model/weather10Days.dart';
// import 'package:farmerp/models/master/AD_UserDataViewPermissionDetails.dart';
// import 'package:farmerp/services/MainFragment/MainFragment.dart';
// import 'package:farmerp/services/homePage/PlotDetailsHomePage.dart';
// import 'package:farmerp/services/homePage/RaiseTicket.dart';
// import 'package:farmerp/services/homePage/StockGraph.dart';
// import 'package:farmerp/syncLogic/SyncData.dart';
// import 'package:farmerp/syncLogic/SyncView.dart';
// import 'package:farmerp/utility/ApiUtils.dart';
// import 'package:farmerp/utility/LocaleBase.dart';
// import 'package:farmerp/utility/RColors.dart';
// import 'package:farmerp/utility/SessionManager.dart';
// import 'package:farmerp/utility/Utils.dart';
// import 'package:farmerp/utility/api_keys.dart';
// import 'package:farmerp/view/HomeScreen/CommonModel.dart';
// import 'package:farmerp/view/HomeScreen/HomeScreenQuries.dart';
// import 'package:farmerp/view/HomeScreen/weather_api_client.dart';
// import 'package:farmerp/view/HomeScreen/weather_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

//import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageReboot extends StatefulWidget {
  final MainFragmentState mainFragmentState;

  const HomePageReboot({Key key, this.mainFragmentState}) : super(key: key);

  @override
  HomePageState createState() => HomePageState(mainFragmentState);
}

//  List<StockDetails> data;
String progress = "0", step = "";
int progressInt = 0;
int selectedIcon = 1, materialAndLabourOpt = 1;
final materialReq = 1, labour = 2, graph = 3;
//  List<StockDetails> data;

final int MainPage = 1, FloatingButtonPage = 2;
int state = MainPage;
// StockGraph stock;

bool isCalled = false;
bool isWeatherApiCalled = false;
// List<Weather10Days> list;

String historyTask = "0";
String pendingTask = "0";
String upcomingTask = "0";



// class FlowMenuDelegate extends FlowDelegate {
//   FlowMenuDelegate({this.menuAnimation}) : super(repaint: menuAnimation);
//
//   final Animation<double> menuAnimation;
//
//   @override
//   bool shouldRepaint(FlowMenuDelegate oldDelegate) {
//     return menuAnimation != oldDelegate.menuAnimation;
//   }
//
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     double dx = 0.0, dy = 0.0;
//     for (int i = 0; i < context.childCount; ++i) {
//       // dx = context.getChildSize(i).width * i;
//       dx = 200.0 * math.cos(menuItems[i].angle * (math.pi / 180));
//       dy = 200.0 * math.sin(menuItems[i].angle * (math.pi / 180));
//       context.paintChild(
//         i,
//         transform: Matrix4.translationValues(
//           dx * menuAnimation.value,
//           dy * menuAnimation.value,
//           0,
//         ),
//       );
//     }
//   }
// }


class HomePageState extends State<HomePageReboot>
    with SingleTickerProviderStateMixin {
  int selectedIcon = 1, materialAndLabourOpt = 1;
  final materialReq = 1, labour = 2, graph = 3;
  SessionManager sessionManager;
  String loginId;
  String qrResult;
  String URL = 'http://www.support.farmerp.com/index.php';
  final MainFragmentState mainFragmentState;

  HomePageState(this.mainFragmentState) {
    mainFragmentState.onBackPressed = onBackPressed;
  }

  static clearDataOnLangChange() {
    supDetails = null;
  }

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

    if (dailyWeather == null || dailyWeather.length == 0) makeWeatherList("");



  }

  // final List<MenuData> menuItems = <MenuData>[
  //   MenuData(iconData: Icons.home, text: "Home", angle: -60),
  //   MenuData(iconData: Icons.new_releases, text: "Release", angle: -30),
  //   MenuData(iconData: Icons.notifications, text: "Notification", angle: 0),
  //   MenuData(iconData: Icons.settings, text: "Settings", angle: 30),
  //   MenuData(iconData: Icons.menu, text: "Menu", angle: 60),
  // ];

  // verticleCircle() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.max,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       Expanded(
  //         child: Flow(
  //           delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
  //           children: menuItems
  //               .map<Widget>((MenuData menuData) => flowMenuItem(menuData))
  //               .toList(),
  //         ),
  //       ),
  //     ],
  //   );
  // }




  static Localemain string;
  static const platform = const MethodChannel('install_plugin');
  @override
  Widget build(BuildContext context) {
    string = Localizations.of<LocaleBase>(context, LocaleBase).main;

    if (sessionManager == null) sessionManager = new SessionManager();

    if (!isWeatherApiCalled) {
      // callWeatherApi();
      setState(() {});
    } /*else if (SyncView.syncDone) {
      SyncView.syncDone = false;
      setWeather(2);
      setState(() {});
    }*/

    //vertical floating bar
  /*  var childButtons = List<CustChildFB>();

    childButtons.add(CustChildFB(
        hasLabel: true,
        labelHasShadow: false,
        labelText: string.Barcode,
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
            // qrResult = await FlutterBarcodeScanner.scanBarcode(
            //     "#ff6666", "Cancel", true, ScanMode.QR);
            // try {
            //   if(qrResult!=null ) {
            //     setPlotData(qrResult);
            //   }else{
            //     Utils.showToast(string.invalid_scanned_qr);
            //   }
            // } catch (e) {
            //   print(e);
            // }
          },
        )));
    childButtons.add(CustChildFB(
        hasLabel: true,
        labelHasShadow: false,
        labelText: string.Camera,
        labelBackgroundColor: Colors.white,
        currentButton: FloatingActionButton(
          onPressed: () async {
            if (AttachmentDetailsState.attachmentList.length >= 12) {
              Utils.showToast(string.Cannotselectmorethan12attachements);
            } else {
              // mainFragmentState.onImageSelected(File(file.path));
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

    // double size = 360;
    // if(true) return verticleCircle();
    //     else
    return Center(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: Utils.getSize(5.0),
              ),
              Expanded(
                child: ListView(shrinkWrap: true,
//                padding: const EdgeInsets.all(20.0),
                    children: <Widget>[
//                      mainContainer(),
//                      gradientBox(),
//                     ClipPath(
//                       // clipper: StarClipper(5),
//                       clipper: DiagonalPathClipperOne(),
//                       child: Container(
//                         height: 600,
//                         width: 500  ,
//                         color: Colors.pink,
//                         child: Center(child: Text("SideCutClipper()")),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(Utils.getSize(16)),
//                       color: Colors.blue,
//                       child:ClipPath(
//                         clipper: NotchD2(),
//                         // clipper: CircularNotchedRectangle(),
//                         child: Container(
//                           height: 70,
//                           width: 360  ,
//                           color: Colors.pink,
//                           child: Center(child: Text("SideCutClipper()")),
//                         ),
//                       ),),

                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: Utils.getSize(16.0),
                      //       bottom: Utils.getSize(16.0),
                      //       top: Utils.getSize(6.0),
                      //       right: Utils.getSize(16.0)),
                      //   child: Align(
                      //     child: DynamicViews().imageAsset(
                      //         context,
                      //         "assets/rebootDesign/homePage/scale300/SelectiveTemplate@3x.png",
                      //         24),
                      //     alignment: Alignment.topRight,
                      //   ),
                      // ),

                      weatherPages(context),
                      if (MainFragmentState.isAppUpdateVisible)
                        Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: Utils.getSize(20.0),
                                // bottom: Utils.getSize(12.0),
                                right: Utils.getSize(20.0),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.,
                                  children: <Widget>[
                                    DynamicViews().text2(
                                        context,
                                        string.UpdateAppForLatestVersion,
                                        14,
                                        FontWeight.bold,
                                        RColors.black,
                                        TextAlign.start),
                                    ButtonTheme(
                                        minWidth: 100.0,
                                        child: RaisedButton(
                                            onPressed: () {
                                              platform.invokeMethod(
                                                  'playStoreAutoUpdate');
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
                                              string.UpdateApp,
                                              style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Utils.getSize(14.0),
                                                color: Colors.white,
                                              ),
                                            )))
                                  ]),
                            ),
                          ],
                        ),
                      ),

                      if (!MainFragmentState.isAppUpdateVisible)
                      Container(
                        padding: EdgeInsets.only(
                            top: Utils.getSize(12.0),
                            bottom: Utils.getSize(12.0)),
                        child: DynamicViews().text(
                            context,
                            /*
                            * Heading "FIELD SUPERVISOR is removed"
                            * as discussed with Mandar
                            * Date: 20th April 2021
                            * */
                            // "FIELD SUPERVISOR",
                            "",
                            14,
                            FontWeight.bold,
                            RColors.textColorDark,
                            TextAlign.center),
                      ),
                      superVisorInfo(context, string),

                      Container(
                        padding: EdgeInsets.only(
                            top: Utils.getSize(12.0),
                            bottom: Utils.getSize(12.0)),
                        child: DynamicViews().text(
                            context,
                            "string.TASK",
                            14,
                            FontWeight.bold,
                            RColors.textColorDark,
                            TextAlign.center),
                      ),
                      taskDetails(context, string),

                      Container(
                        padding: EdgeInsets.only(
                            top: Utils.getSize(20.0),
                            bottom: Utils.getSize(12.0)),
                        child: DynamicViews().text(
                            context,
                            string.PLOTDETAILSCONTRACTDETAILS,
                            14,
                            FontWeight.bold,
                            RColors.textColorDark,
                            TextAlign.center),
                      ),
                      plotAndContractDetails(),

                      threeIcons(),
                      selectedIcon == materialReq
                          ? materialReqPage()
                          : selectedIcon == labour
                              ? labourDetailsPage()
                              : //stock
    /*StockGraph(
                                Utils.getSize(455.0),
                                RColors.bluishGreen,
                                top5HighStock,
                                top5HighStockLabel,
                                top5LowStock,
                                top5LowStockLabel)*/


//                              : StockGraph(context).showGraph(),
// commented to hide need help option on 14th March 2021 by Sumit
                      needHelp(),
                      DynamicViews.sizedBox(height: 56)
                    ]),
              )
            ],
          ),
        ],
      ),
    );

    /* return Center(
      child: Container(
        color: RColors.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: Utils.getSize(10.0),
            ),
            Expanded(
              child: ListView(shrinkWrap: true,
//                padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
//                      mainContainer(),
//                      gradientBox(),

                    Container(
                      padding: EdgeInsets.all(Utils.getSize(16.0)),
                      child: Align(
                        child: DynamicViews().imageAsset(
                            context,
                            "assets/rebootDesign/homePage/scale300/SelectiveTemplate@3x.png",
                            24),
                        alignment: Alignment.topRight,
                      ),
                    ),

                    weatherPages(context),

                    Container(
                      padding: EdgeInsets.only(
                          top: Utils.getSize(12.0),
                          bottom: Utils.getSize(12.0)),
                      child: DynamicViews().text(
                          context,
                          "FIELD SUPERVISOR",
                          14,
                          FontWeight.bold,
                          RColors.textColorDark,
                          TextAlign.center),
                    ),
                    superVisorInfo(context),

                    Container(
                      padding: EdgeInsets.only(
                          top: Utils.getSize(12.0),
                          bottom: Utils.getSize(12.0)),
                      child: DynamicViews().text(
                          context,
                          "TASK",
                          14,
                          FontWeight.bold,
                          RColors.textColorDark,
                          TextAlign.center),
                    ),
                    taskDetails(context),

                    Container(
                      padding: EdgeInsets.only(
                          top: Utils.getSize(20.0),
                          bottom: Utils.getSize(12.0)),
                      child: DynamicViews().text(
                          context,
                          "PLOT DETAILS/CONTRACT DETAILS",
                          14,
                          FontWeight.bold,
                          RColors.textColorDark,
                          TextAlign.center),
                    ),
                    plotAndContractDetails(),

                    threeIcons(),
                    selectedIcon == materialReq
                        ? materialReqPage()
                        : selectedIcon == labour
                            ? labourDetailsPage()
                            : stock */ /*StockGraph(
                                Utils.getSize(455.0),
                                RColors.bluishGreen,
                                top5HighStock,
                                top5HighStockLabel,
                                top5LowStock,
                                top5LowStockLabel)*/ /*
                    ,

//                              : StockGraph(context).showGraph(),

                    needHelp(),
                  ]),
            )
          ],
        ),
      ),
    );*/
  }

  onBackPressed() {
    Utils.showLog("onBackPressed", "HomePageState");
    // if (SyncView.state == 2) {
    return showDialog(
        context: context,
        builder: (context) => WillPopScope(
            onWillPop: () {
              Utils.showToast(string.Closedialoguefirst);
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
                            children: <Widget>[
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.0),
                            color: RColors.greenishBlue,
                            child: DynamicViews().text(
                                context,
                                string.Areyousure,
                                16,
                                FontWeight.normal,
                                RColors.white,
                                TextAlign.center),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: Utils.getSize(20.0)),
                            padding: EdgeInsets.all(10.0),
                            child: DynamicViews().text(
                                context,
                                string.DoyouwanttoexitanApp,
                                14,
                                FontWeight.normal,
                                RColors.textColorlight,
                                TextAlign.start),
                          )),
                          Container(
                            margin: EdgeInsets.only(
                                top: Utils.getSize(5.0),
                                bottom: Utils.getSize(30.0),
                                left: Utils.getSize(10.0),
                                right: Utils.getSize(10.0)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  button2(string.Yes, 1, context),
                                  SizedBox(
                                    width: Utils.getSize(20.0),
                                  ),
                                  button2(string.Cancel, 2, context),
                                ]),
                          ),
                        ]))))));

    /*  showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: new Text('Yes'),
                  ),
                ],
              ));*/
    // } else {
    //   Utils.showToast("can't back upto complete sync process!");
    // }
  }

  button2(String text, int onPressed, BuildContext context) {
    return ButtonTheme(
        minWidth: 100.0,
        child: RaisedButton(
            onPressed: () {
//              Navigator.pop(context, true);
              Utils.showLog("onPressed", "called here");
              if (onPressed == 1) {
                Navigator.pop(context, true);
                // SystemNavigator.pop();
                exit(0);
              } else if (onPressed == 2) {
                Navigator.of(context).pop(false);
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
//            side: BorderSide(color: Colors.red)
            ),
            textColor: Colors.white,
            color: RColors.PrimaryColor,
            padding: EdgeInsets.all(Utils.getSize(5.0)),
            child: new Text(
              text,
              style: new TextStyle(
                fontSize: Utils.getSize(16.0),
                color: Colors.white,
              ),
            )));
  }

/*  Future<String> callWeatherApi() async {
    isWeatherApiCalled = true;
    if (loginId == null) loginId = await sessionManager.getLoginID();
    bool isConnected = await Utils.isNetWorkConnected();
    if (isConnected) {
      Position position;
      PermissionStatus status = await Permission.location.status;
      if (!status.isGranted) {
        await Permission.location.request();
        PermissionStatus status = await Permission.location.status;
        if (status.isGranted) {
          position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
        }
      } else {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      }
      String data = "";

      if (position != null) {
        print("api call called");
        WeatherRepository wether = new WeatherRepository(
            weatherApiClient: WeatherApiClient(
                httpClient: http.Client(), apiKey: ApiKey.OPEN_WEATHER_MAP));
        data = await wether.getWeather(null,
            latitude: position.latitude, longitude: position.longitude);
        try {
          await SessionManager().setValue(SessionManager.KEY_DW, data);
        } catch (e) {
          print(e);
        }
      } else {
        print("api call called");
      }
      setWeather(1);
      return data;
    } else {
      setWeather(1);
      return null;
    }
  }

  void setWeather(int type) async {
    if (loginId == null) loginId = await sessionManager.getLoginID();

    try {
      String temp = await SessionManager().getValueOf(SessionManager.KEY_DW);
      if (temp != null && temp.length > 10) {
        print("Jsonweather " + temp);
        List<Weather10Days> list =
            Weather10Days.decodeJsonFromDB(json.decode(temp));
        DateTime now = DateTime.now();
        DateTime oneday = DateTime(now.year, now.month, now.day + 1);
        DateTime twoday = DateTime(now.year, now.month, now.day + 2);
        DateTime threeday = DateTime(now.year, now.month, now.day + 3);
        DateTime fourday = DateTime(now.year, now.month, now.day + 4);
        DateTime fiveday = DateTime(now.year, now.month, now.day + 5);
        DateTime day6 = DateTime(now.year, now.month, now.day + 6);
        DateTime day7 = DateTime(now.year, now.month, now.day + 7);
        DateTime day8 = DateTime(now.year, now.month, now.day + 8);
        DateTime day9 = DateTime(now.year, now.month, now.day + 9);
        DateTime day10 = DateTime(now.year, now.month, now.day + 10);
        DateTime day11 = DateTime(now.year, now.month, now.day + 11);
        DateTime day12 = DateTime(now.year, now.month, now.day + 12);
        DateTime day13 = DateTime(now.year, now.month, now.day + 13);
        DateTime day14 = DateTime(now.year, now.month, now.day + 14);
        DateTime day15 = DateTime(now.year, now.month, now.day + 15);

        var formate = DateFormat('yyyy-MM-dd');
        String todaysDate = formate.format(now);
        String oneDate = formate.format(oneday);
        String twoDate = formate.format(twoday);
        String threeDate = formate.format(threeday);
        String fourDate = formate.format(fourday);
        String fiveDate = formate.format(fiveday);
        String date6 = formate.format(day6);
        String date7 = formate.format(day7);
        String date8 = formate.format(day8);
        String date9 = formate.format(day9);
        String date10 = formate.format(day10);
        String date11 = formate.format(day11);
        String date12 = formate.format(day12);
        String date13 = formate.format(day13);
        String date14 = formate.format(day14);
        String date15 = formate.format(day15);

        dailyWeather = List<DailyWeather>();
        makeWeatherList("");

        for (int i = 0; i < list.length; i++) {
          var date = new DateTime.fromMillisecondsSinceEpoch(
              int.parse(list[i].time) * 1000);
          String formattedDate = formate.format(date);
          if (todaysDate == formattedDate) {
            dailyWeather[0].image = list[i].iconCode;
            dailyWeather[0].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[0].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[0].day =
                DateFormat('EEEE').format(now).substring(0, 3);
            dailyWeather[0].date = DateFormat('MM/dd/yyyy').format(now);
            dailyWeather[0].location = Utils.addDot(list[i].location);
          } else if (oneDate == formattedDate) {
            dailyWeather[1].image = list[i].iconCode;
            dailyWeather[1].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[1].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[1].day =
                DateFormat('EEEE').format(oneday).substring(0, 3);
            dailyWeather[1].date = DateFormat('MM/dd/yyyy').format(oneday);
            dailyWeather[1].location = Utils.addDot(list[i].location);
          } else if (twoDate == formattedDate) {
            dailyWeather[2].image = list[i].iconCode;
            dailyWeather[2].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[2].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[2].day =
                DateFormat('EEEE').format(twoday).substring(0, 3);
            dailyWeather[2].date = DateFormat('MM/dd/yyyy').format(twoday);
            dailyWeather[2].location = Utils.addDot(list[i].location);
          } else if (threeDate == formattedDate) {
            dailyWeather[3].image = list[i].iconCode;
            dailyWeather[3].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[3].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[3].day =
                DateFormat('EEEE').format(threeday).substring(0, 3);
            dailyWeather[3].date = DateFormat('MM/dd/yyyy').format(threeday);
            dailyWeather[3].location = Utils.addDot(list[i].location);
          } else if (fourDate == formattedDate) {
            dailyWeather[4].image = list[i].iconCode;
            dailyWeather[4].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[4].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[4].day =
                DateFormat('EEEE').format(fourday).substring(0, 3);
            dailyWeather[4].date = DateFormat('MM/dd/yyyy').format(fourday);
            dailyWeather[4].location = Utils.addDot(list[i].location);
          } else if (fiveDate == formattedDate) {
            dailyWeather[5].image = list[i].iconCode;
            dailyWeather[5].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[5].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[5].day =
                DateFormat('EEEE').format(fiveday).substring(0, 3);
            dailyWeather[5].date = DateFormat('MM/dd/yyyy').format(fiveday);
            dailyWeather[5].location = Utils.addDot(list[i].location);
          } else if (date6 == formattedDate) {
            dailyWeather[6].image = list[i].iconCode;
            dailyWeather[6].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[6].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[6].day =
                DateFormat('EEEE').format(day6).substring(0, 3);
            dailyWeather[6].date = DateFormat('MM/dd/yyyy').format(day6);
            dailyWeather[6].location = Utils.addDot(list[i].location);
          } else if (date7 == formattedDate) {
            dailyWeather[7].image = list[i].iconCode;
            dailyWeather[7].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[7].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[7].day =
                DateFormat('EEEE').format(day7).substring(0, 3);
            dailyWeather[7].date = DateFormat('MM/dd/yyyy').format(day7);
            dailyWeather[7].location = Utils.addDot(list[i].location);
          } else if (date8 == formattedDate) {
            dailyWeather[8].image = list[i].iconCode;
            dailyWeather[8].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[8].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[8].day =
                DateFormat('EEEE').format(day8).substring(0, 3);
            dailyWeather[8].date = DateFormat('MM/dd/yyyy').format(day8);
            dailyWeather[8].location = Utils.addDot(list[i].location);
          } else if (date9 == formattedDate) {
            dailyWeather[9].image = list[i].iconCode;
            dailyWeather[9].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[9].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[9].day =
                DateFormat('EEEE').format(day9).substring(0, 3);
            dailyWeather[9].date = DateFormat('MM/dd/yyyy').format(day9);
            dailyWeather[9].location = Utils.addDot(list[i].location);
          } else if (date10 == formattedDate) {
            dailyWeather[10].image = list[i].iconCode;
            dailyWeather[10].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[10].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[10].day =
                DateFormat('EEEE').format(day10).substring(0, 3);
            dailyWeather[10].date = DateFormat('MM/dd/yyyy').format(day10);
            dailyWeather[10].location = Utils.addDot(list[i].location);
          } else if (date11 == formattedDate) {
            dailyWeather[11].image = list[i].iconCode;
            dailyWeather[11].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[11].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[11].day =
                DateFormat('EEEE').format(day11).substring(0, 3);
            dailyWeather[11].date = DateFormat('MM/dd/yyyy').format(day11);
            dailyWeather[11].location = Utils.addDot(list[i].location);
          } else if (date12 == formattedDate) {
            dailyWeather[12].image = list[i].iconCode;
            dailyWeather[12].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[12].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[12].day =
                DateFormat('EEEE').format(day12).substring(0, 3);
            dailyWeather[12].date = DateFormat('MM/dd/yyyy').format(day12);
            dailyWeather[12].location = Utils.addDot(list[i].location);
          } else if (date13 == formattedDate) {
            dailyWeather[13].image = list[i].iconCode;
            dailyWeather[13].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[13].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[13].day =
                DateFormat('EEEE').format(day13).substring(0, 3);
            dailyWeather[13].location = Utils.addDot(list[i].location);
          } else if (date14 == formattedDate) {
            dailyWeather[14].image = list[i].iconCode;
            dailyWeather[14].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[14].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[14].day =
                DateFormat('EEEE').format(day14).substring(0, 3);
            dailyWeather[14].date = DateFormat('MM/dd/yyyy').format(day14);
            dailyWeather[14].location = Utils.addDot(list[i].location);
          } else if (date15 == formattedDate) {
            dailyWeather[15].image = list[i].iconCode;
            dailyWeather[15].max =
                (double.parse(list[i].maxTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[15].min =
                (double.parse(list[i].minTemperature) - 273.15)
                        .toStringAsFixed(0) +
                    "°C";
            dailyWeather[15].day =
                DateFormat('EEEE').format(day15).substring(0, 3);
            dailyWeather[15].date = DateFormat('MM/dd/yyyy').format(day15);
            dailyWeather[15].location = Utils.addDot(list[i].location);
          }
        }
      }
    } catch (e) {
      print(e);
    }

    try {
      nextWeekList = await HomeScreenQuries.getMaterialRequirement(loginId, 3);
    } catch (e) {
      print(e);
    }
    try {
      tomarrowsList = await HomeScreenQuries.getMaterialRequirement(loginId, 2);
    } catch (e) {
      print(e);
    }
    try {
      todaysList = await HomeScreenQuries.getMaterialRequirement(loginId, 1);
    } catch (e) {
      print(e);
    }
    try {
      nextWeekMachineList = await HomeScreenQuries.getMachineryList(loginId, 3);
    } catch (e) {
      print(e);
    }
    try {
      tomarrowsMachineList =
          await HomeScreenQuries.getMachineryList(loginId, 2);
    } catch (e) {
      print(e);
    }
    try {
      todaysMachineList = await HomeScreenQuries.getMachineryList(loginId, 1);
    } catch (e) {
      print(e);
    }

    try {
      labourNextWeekCount = await HomeScreenQuries.getLabourCount(loginId, 3);
    } catch (e) {
      print(e);
    }

    try {
      labourTomorrowCount = await HomeScreenQuries.getLabourCount(loginId, 2);
    } catch (e) {
      print(e);
    }

    try {
      labourTodayCount = await HomeScreenQuries.getLabourCount(loginId, 1);
    } catch (e) {
      print(e);
    }

    try {
      top5HighStock = List<StockDetails>();
      top5LowStock = List<StockDetails>();
      top5LowStockLabel = List<StockDetails>();
      top5HighStockLabel = List<StockDetails>();

      List<CommonModel> temp3 =
          await HomeScreenQuries.getStockDetails(loginId, 1);
      if (temp3 != null && temp3.length != 0)
        for (int i = 0; i < temp3.length; i++) {
          StockDetails stockDetails = new StockDetails.withData(
              name: temp3[i].Name.toString(),
              unit: temp3[i].Value.toString() + " " + temp3[i].Unit.toString(),
              yAxis: double.parse(temp3[i].Value.toString()),
              barColor: RColors.bluishGreen);
          //        data.add(stockDetails);
          top5LowStock.add(stockDetails);
          top5LowStockLabel.add(stockDetails);
        }

      if (top5LowStockLabel != null && top5LowStockLabel.length != 5) {
        for (int i = top5LowStockLabel.length; i < 5; i++) {
          StockDetails stockDetails = new StockDetails.withData(
              name: "", unit: "", yAxis: 0, barColor: RColors.bluishGreen);
          top5LowStockLabel.add(stockDetails);
        }
      }

      List<CommonModel> temp2 =
          await HomeScreenQuries.getStockDetails(loginId, 2);
      if (temp2 != null && temp2.length != 0)
        for (int i = 0; i < temp2.length; i++) {
          StockDetails stockDetails = new StockDetails.withData(
              name: temp2[i].Name.toString(),
              unit: temp2[i].Value.toString() + " " + temp2[i].Unit.toString(),
              yAxis: double.parse(temp2[i].Value.toString()),
              barColor: RColors.bluishGreen);
          top5HighStock.add(stockDetails);
          top5HighStockLabel.add(stockDetails);
        }

      if (top5HighStockLabel != null && top5HighStockLabel.length != 5) {
        for (int i = top5HighStockLabel.length; i < 5; i++) {
          StockDetails stockDetails = new StockDetails.withData(
              name: "", unit: "", yAxis: 0, barColor: RColors.bluishGreen);
          top5HighStockLabel.add(stockDetails);
        }
      }
      if (stock == null)
        stock = new StockGraph(Utils.getSize(455.0), top5HighStock,
            top5HighStockLabel, top5LowStock, top5LowStockLabel);
    } catch (e) {
      print(e);
    }

    try {
      plotListAll = await HomeScreenQuries.getPlotContractList(
          loginId, ApiUtils.APK_TYPE);
      plotList = new List();

      if (plotListAll != null && plotListAll.length > 5)
        for (int i = 0; i < 5; i++) plotList.add(plotListAll[i]);
      else
        plotList = plotListAll;
    } catch (e) {
      print(e);
    }
    CommonModel taskModel = null;
    try {
      taskModel = await HomeScreenQuries.getTaskData(loginId);
    } catch (e) {
      print(e);
    }

    if (ApiUtils.APK_TYPE == 1) {
      String totalPlotCount = "0", todaysPlotCount = "0";
      String totalSubPlotCount = "0", todaysSubPlotCount = "0";
      String totalCropCount = "0", todaysCropCount = "0";
      String totalSubPlotArea = "0", todaysSubPlotArea = "0";
      String totalEstimatedPro = "0", todaysEstimatedPro = "0";
      String totalActualProduction = "0", todaysActualProduction = "0";

      try {
        totalPlotCount = await HomeScreenQuries.getPlotCount(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysPlotCount = await HomeScreenQuries.getPlotCount(loginId, 2);
      } catch (e) {
        print(e);
      }

      if (totalPlotCount != null && totalPlotCount != "0") {
        supDetails[0].subValue1 = totalPlotCount;
      } else {
        supDetails[0].subValue1 = "0";
      }

      if (todaysPlotCount != null && todaysPlotCount != "0") {
        supDetails[0].subValue2 = todaysPlotCount;
      } else {
        supDetails[0].subValue2 = "0";
      }

      try {
        totalSubPlotCount = await HomeScreenQuries.getSubPlotCount(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysSubPlotCount = await HomeScreenQuries.getSubPlotCount(loginId, 2);
      } catch (e) {
        print(e);
      }

      if (totalSubPlotCount != null && totalSubPlotCount != "0") {
        supDetails[1].subValue1 = totalSubPlotCount;
      } else {
        supDetails[1].subValue1 = "0";
      }

      if (todaysSubPlotCount != null && todaysSubPlotCount != "0") {
        supDetails[1].subValue2 = todaysSubPlotCount;
      } else {
        supDetails[1].subValue2 = "0";
      }

      try {
        totalCropCount = await HomeScreenQuries.getCropCount(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysCropCount = await HomeScreenQuries.getCropCount(loginId, 2);
      } catch (e) {
        print(e);
      }

      if (totalCropCount != null && totalCropCount != "0") {
        supDetails[2].subValue1 = totalCropCount;
      } else {
        supDetails[2].subValue1 = "0";
      }

      if (todaysCropCount != null && todaysCropCount != "0") {
        supDetails[2].subValue2 = todaysCropCount;
      } else {
        supDetails[2].subValue2 = "0";
      }

      try {
        totalSubPlotArea =
            await HomeScreenQuries.getSubPlotAreaCount(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysSubPlotArea =
            await HomeScreenQuries.getSubPlotAreaCount(loginId, 2);
      } catch (e) {
        print(e);
      }

      if (totalSubPlotArea != null && totalSubPlotArea != "0") {
        supDetails[3].subValue1 = totalSubPlotArea;
      } else {
        supDetails[3].subValue1 = "0";
      }

      if (todaysSubPlotArea != null && todaysSubPlotArea != "0") {
        supDetails[3].subValue2 = todaysSubPlotArea;
      } else {
        supDetails[3].subValue2 = "0";
      }

      try {
        totalEstimatedPro =
            await HomeScreenQuries.getEstimatedProduction(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysEstimatedPro =
            await HomeScreenQuries.getEstimatedProduction(loginId, 2);
      } catch (e) {
        print(e);
      }

      if (totalEstimatedPro != null && totalEstimatedPro != "0") {
        supDetails[4].subValue1 = totalEstimatedPro;
      } else {
        supDetails[4].subValue1 = "0";
      }

      if (todaysEstimatedPro != null && todaysEstimatedPro != "0") {
        supDetails[4].subValue2 = todaysEstimatedPro;
      } else {
        supDetails[4].subValue2 = "0";
      }

      try {
        totalActualProduction =
            await HomeScreenQuries.getActualProduction(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysActualProduction =
            await HomeScreenQuries.getActualProduction(loginId, 2);
      } catch (e) {
        print(e);
      }

      if (totalActualProduction != null && totalActualProduction != "0") {
        supDetails[5].subValue1 = totalActualProduction;
      } else {
        supDetails[5].subValue1 = "0";
      }

      if (todaysActualProduction != null && todaysActualProduction != "0") {
        supDetails[5].subValue2 = todaysActualProduction;
      } else {
        supDetails[5].subValue2 = "0";
      }
      if(this.mounted)
      setState(() {});
    } else {
      String totalFarmerCount = "0", todaysCount = "0";
      String totalContractCount = "0", todaysContractCount = "0";
      String totalContractArea = "0", todaysContractArea = "0";

      try {
        totalFarmerCount = await HomeScreenQuries.getFarmerCount(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysCount = await HomeScreenQuries.getFarmerCount(loginId, 2);
      } catch (e) {
        print(e);
      }

      try {
        totalContractCount =
            await HomeScreenQuries.getContractCount(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysContractCount =
            await HomeScreenQuries.getContractCount(loginId, 2);
      } catch (e) {
        print(e);
      }

      try {
        totalContractArea = await HomeScreenQuries.getContractArea(loginId, 1);
      } catch (e) {
        print(e);
      }

      try {
        todaysContractArea = await HomeScreenQuries.getContractArea(loginId, 2);
      } catch (e) {
        print(e);
      }

      if (totalFarmerCount != null && totalFarmerCount != "0") {
        supDetails[0].subValue1 = totalFarmerCount;
      } else {
        supDetails[0].subValue1 = "0";
      }

      if (todaysCount != null && todaysCount != "0") {
        supDetails[0].subValue2 = todaysCount;
      } else {
        supDetails[0].subValue2 = "0";
      }

      if (totalContractCount != null && totalContractCount != "0") {
        supDetails[1].subValue1 = totalContractCount;
      } else {
        supDetails[1].subValue1 = "0";
      }

      if (todaysContractCount != null && todaysContractCount != "0") {
        supDetails[1].subValue2 = todaysContractCount;
      } else {
        supDetails[1].subValue2 = "0";
      }

      if (totalContractArea != null && totalContractArea != "0") {
        supDetails[2].subValue1 = totalContractArea;
      } else {
        supDetails[2].subValue1 = "0";
      }

      if (todaysContractArea != null && todaysContractArea != "0") {
        supDetails[2].subValue2 = todaysContractArea;
      } else {
        supDetails[2].subValue2 = "0";
      }

      ContractHarvestedQTY QTY1 = null;
      try {
        QTY1 = await HomeScreenQuries.getContractFarmingProductionDetails(
            loginId, 1);
      } catch (e) {
        print(e);
      }

      ContractHarvestedQTY QTY2 = null;
      try {
        QTY2 = await HomeScreenQuries.getContractFarmingProductionDetails(
            loginId, 2);
      } catch (e) {
        print(e);
      }

      if (QTY1 != null) {
        if (QTY1.EstimatedQTY != null && QTY1.EstimatedQTY.length > 0) {
          supDetails[3].subValue1 = QTY1.EstimatedQTY;
        } else {
          supDetails[3].subValue1 = "0";
        }

        if (QTY1.ReviesdQTY != null && QTY1.ReviesdQTY.length > 0) {
          supDetails[4].subValue1 = QTY1.ReviesdQTY;
        } else {
          supDetails[4].subValue1 = "0";
        }

        if (QTY1.ActualQTY != null && QTY1.ActualQTY.length > 0) {
          supDetails[5].subValue1 = QTY1.ActualQTY;
        } else {
          supDetails[5].subValue1 = "0";
        }
      } else {
        supDetails[3].subValue1 = "0";
        supDetails[4].subValue1 = "0";
        supDetails[5].subValue1 = "0";
      }

      if (QTY2 != null) {
        if (QTY2.EstimatedQTY != null && QTY2.EstimatedQTY.length > 0) {
          supDetails[3].subValue2 = QTY2.EstimatedQTY;
        } else {
          supDetails[3].subValue2 = "0";
        }

        if (QTY2.ReviesdQTY != null && QTY2.ReviesdQTY.length > 0) {
          supDetails[4].subValue2 = QTY2.ReviesdQTY;
        } else {
          supDetails[4].subValue2 = "0";
        }

        if (QTY2.ActualQTY != null && QTY2.ActualQTY.length > 0) {
          supDetails[5].subValue2 = QTY2.ActualQTY;
        } else {
          supDetails[5].subValue2 = "0";
        }
      } else {
        supDetails[3].subValue2 = "0";
        supDetails[4].subValue2 = "0";
        supDetails[5].subValue2 = "0";
      }
      setState(() {});
    }
    print("In set weather");
    if (type == 1 && !isCalled && this.mounted)
      this.setState(() {
        isCalled = true;
        if (taskModel != null) {
          historyTask = taskModel.HistoryCount.toString();
          upcomingTask = taskModel.UpcomingCount.toString();
          pendingTask = taskModel.PendingCount.toString();
        }
      });
    else if (type == 2 && this.mounted)
      this.setState(() {
        isCalled = true;
        if (taskModel != null) {
          historyTask = taskModel.HistoryCount.toString();
          upcomingTask = taskModel.UpcomingCount.toString();
          pendingTask = taskModel.PendingCount.toString();
        }
      });
  }*/

//  createDialogBox() {
//    if (state == running) {
//      return showDialog(
//          context: context,
//          builder: (context) => Dialog(
//              backgroundColor: Colors.white,
//
//              child: Container(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  children: <Widget>[
//                    SizedBox(height: Utils.getSize(10.0)),
//                    new Image.asset(
//                      'assets/rebootDesign/image/farmerplogonew.png',
//                      width: Utils.getSize(150.0),
//                      height: Utils.getSize(80.0),
//                    ),
//                    SizedBox(height: Utils.getSize(30.0)),
//                    new Container(
//                      margin: const EdgeInsets.only(
//                          top: 20, left: 20.0, right: 20.0),
//                      child: CircularStepProgressIndicator(
//                        totalSteps: 100,
//                        currentStep: progressInt,
//                        child: Container(
//                          alignment: Alignment.center,
//                          child: Text(
//                            progress + "%",
//                            style: TextStyle(
//                              fontSize: 34.0,
//                              fontWeight:
//                                  FontWeight.bold, // insert your font size here
//                            ),
//                          ),
//                        ),
//                        stepSize: 15,
//                        selectedColor: Colors.orangeAccent,
//                        unselectedColor: Colors.grey[200],
//                        padding: 0,
//                        width: Utils.getSize(150.0),
//                        height: Utils.getSize(150.0),
//                        selectedStepSize: 22,
//                      ),
//                    ),
//                    SizedBox(height: Utils.getSize(46.0)),
//                    new Container(
//                      margin:
//                          const EdgeInsets.only(top: 10, left: 5.0, right: 5.0),
//                      child: new StepsIndicator(
//                          selectedStep: 1,
//                          nbSteps: 3,
//                          selectedStepColorOut: RColors.bluishGreen,
//                          selectedStepColorIn: Colors.white,
//                          doneStepColor: RColors.bluishGreen,
//                          unselectedStepColor: Colors.black26,
//                          doneLineColor: RColors.bluishGreen,
//                          undoneLineColor: Colors.black26,
//                          isHorizontal: true,
//                          lineLength: 100,
//                          lineThickness: 1,
//                          doneStepSize: 1,
//                          unselectedStepSize: 1,
//                          selectedStepSize: 3,
//                          selectedStepBorderSize: 1,
//                          doneStepWidget: Container(
//                            alignment: Alignment.centerLeft,
//                            child: Icon(
//                              Icons.check_circle,
//                              size: 35,
//                              color: RColors.bluishGreen,
//                            ),
//                          ),
//                          // Custom Widget
//                          unselectedStepWidget: Container(
//                            alignment: Alignment.centerLeft,
//                            child: Icon(
//                              Icons.adjust,
//                              size: 35,
//                              color: Colors.black26,
//                            ),
//                          ),
//                          // Custom Widget
//                          selectedStepWidget: Container(
//                            alignment: Alignment.centerLeft,
//                            child: Icon(
//                              Icons.adjust,
//                              size: 35,
//                              color: Colors.black26,
//                            ),
//                          ),
//                          // Custom Widget
//                          lineLengthCustomStep: [
//                            StepsIndicatorCustomLine(nbStep: 4, lenght: 100)
//                          ]),
//                    ),
//                    new Container(
//                      margin:
//                          const EdgeInsets.only(top: 5, left: 8.0, right: 8.0),
//                      child: new Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: DynamicViews().text(
//                                context,
//                                "Upload",
//                                14,
//                                FontWeight.normal,
//                                Colors.black38,
//                                TextAlign.center),
//                          ),
//                          Expanded(
//                            child: DynamicViews().text(
//                                context,
//                                "Master",
//                                14,
//                                FontWeight.normal,
//                                Colors.black38,
//                                TextAlign.center),
//                          ),
//                          Expanded(
//                            child: DynamicViews().text(
//                                context,
//                                "Download",
//                                14,
//                                FontWeight.normal,
//                                Colors.black38,
//                                TextAlign.center),
//                          ),
//                        ],
//                      ),
//                    ),
//                    SizedBox(height: Utils.getSize(20.0)),
//                    new Container(
//                      alignment: Alignment.bottomCenter,
//                      color: Colors.black12,
//                      padding: EdgeInsets.only(
//                          top: Utils.getSize(10.0),
//                          bottom: Utils.getSize(10.0),
//                          left: Utils.getSize(8.0),
//                          right: Utils.getSize(8.0)),
//                      child: new Row(children: <Widget>[
//                        Expanded(
//                            child: Row(mainAxisSize: MainAxisSize.max,
//                                // To make the card compact
//                                children: <Widget>[
//                              DynamicViews().text(
//                                  context,
//                                  "Note :\n",
//                                  Utils.getSize(14.0),
//                                  FontWeight.normal,
//                                  RColors.textColorlight,
//                                  TextAlign.start),
//                              DynamicViews().text(
//                                  context,
//                                  "Please do not press back or close the app \nwhile synching is on",
//                                  Utils.getSize(14.0),
//                                  FontWeight.normal,
//                                  RColors.textColorlight,
//                                  TextAlign.left),
//                            ])),
//                      ]),
//                    ),
//                  ],
//                ),
//              )));
//    } else {
////      parentAct.syncDone();
//      return Container(
//        padding: EdgeInsets.only(
//          top: Consts.avatarRadius + Consts.padding,
//          bottom: Consts.padding,
//          left: Consts.padding,
//          right: Consts.padding,
//        ),
//        margin: EdgeInsets.only(top: Consts.avatarRadius),
//        decoration: new BoxDecoration(
//          color: Colors.white,
//          shape: BoxShape.rectangle,
//          borderRadius: BorderRadius.circular(Consts.padding),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.black26,
//              blurRadius: 10.0,
//              offset: const Offset(0.0, 10.0),
//            ),
//          ],
//        ),
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          // To make the card compact
//          children: <Widget>[
//            Text(
//              "Sync Successfully done",
////                  controller: percentage,
//              style: TextStyle(
//                fontSize: 24.0,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//            SizedBox(height: 16.0),
//            SizedBox(height: 24.0),
//            button("Ok", 0,context),
//          ],
//        ),
//      );
//    }
//  }
  bool isRTL() => Directionality.of(context)
      .toString()
      .contains(TextDirection.RTL.value.toLowerCase());

  needHelp() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      color: RColors.white,
      height: 88,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              new Positioned(
                right: 0.0,
                bottom: 0.0,
                child: new Icon(Icons.headphones),
              ),
              // DynamicViews().imageAsset(
              //     context,
              //     "assets/rebootDesign/homePage/scale300/Headphone@3x.png",
              //     24,
              //     isRTL() ? true : false),
              SizedBox(
                width: 16,
              ),
              DynamicViews().text(context, string.NeedHelp, 16, FontWeight.bold,
                  RColors.textColorDark, TextAlign.center)
            ],
          ),
          /*FlatButton(
              padding: EdgeInsets.all(3),
              onPressed: () {
                RaiseTicketState.isEditable = true;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RaiseTicket(URL)));
              },
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25),
//            side: BorderSide(color: Colors.red)
              ),
              color: RColors.yellow,
//                                padding: const EdgeInsets.all(1.0),
              child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: DynamicViews().text(
                    context,
                    string.RaiseTicket,
                    16,
                    FontWeight.normal,
                    RColors.white,
                    TextAlign.center,
                  ))),*/
        ],
      ),
    );
  }

  // void setPlotData(String qrResult) async {
  //   print(qrResult);
  //   String str = qrResult.toString();
  //   if(!Utils.checkString(str) && str.contains(" >> ")) {
  //     var mQRParts = str.split(" >> ");
  //
  //     if (mQRParts != null && mQRParts.length == 5) {
  //       var mQRSubPlotName = mQRParts[2].trim();
  //
  //       if (mQRSubPlotName != null) {
  //         SessionManager sessionManager = SessionManager();
  //         OBSEntryModel _obsSinglton ;
  //
  //         List<MRKPlotDetails> mPlotData = await Plots.getCropProfilePlotList(
  //             await sessionManager.getUserID(),
  //             await sessionManager.getLoginID(), mQRSubPlotName,
  //             Constant.ALL_SITE_PLOT_LIST);
  //
  //         if (mPlotData != null && mPlotData.length > 0) {
  //           MRKPlotDetails value = mPlotData[0];
  //
  //
  //           _obsSinglton.mainDataModel.Plot_Name = value.Site_Name +
  //               " - " +
  //               value.Plot_Name +
  //               " - " +
  //               value.SubPlot_Name +
  //               " - " +
  //               value.Crop_Name +
  //               " - " +
  //               value.Variety_Name;
  //
  //
  //           _obsSinglton.mainDataModel.Farm_Id = value.Farm_ID.toString();
  //           _obsSinglton.mainDataModel.Plot_Id = value.Plot_ID.toString();
  //           _obsSinglton.mainDataModel.UserCropProfileId =
  //               value.UserCropProfileId.toString();
  //           _obsSinglton.mainDataModel.AreaCovered = value.CropArea.toString();
  //           _obsSinglton.mainDataModel.CropArea = value.CropArea.toString();
  //           _obsSinglton.mainDataModel.Site_ID = value.Site_ID.toString();
  //           _obsSinglton.mainDataModel.Crop_ID = value.CropId.toString();
  //           _obsSinglton.mainDataModel.Crop_Name = value.CropId.toString();
  //           _obsSinglton.mainDataModel.Variety_ID = value.Variety.toString();
  //           _obsSinglton.mainDataModel.Variety_Name =
  //               value.Variety_Name.toString();
  //           _obsSinglton.mainDataModel.SubPlot_Name =
  //               value.SubPlot_Name.toString();
  //           _obsSinglton.mainDataModel.Unit_Id =
  //               value.CropAreaUnitId.toString();
  //           _obsSinglton.mainDataModel.Unit = value.Unit.toString();
  //
  //
  //           if (Utils.checkString(_obsSinglton.mainDataModel.Unit.toString())) {
  //             _obsSinglton.mainDataModel.Unit = "Acre";
  //           }
  //
  //           mainFragmentState.callFragment("OBSForm", "Observation", false, false);
  //
  //
  //         } else {
  //           Utils.showToast(string.invalid_scanned_qr);
  //         }
  //       } else {
  //         Utils.showToast(string.invalid_scanned_qr);
  //       }
  //     } else {
  //       Utils.showToast(string.invalid_scanned_qr);
  //     }
  //   }
  // }
  threeIcons() {
    return Container(
        margin: EdgeInsets.only(
            top: Utils.getSize(16.0),
            bottom: Utils.getSize(16.0),
            right: Utils.getSize(20.0),
            left: Utils.getSize(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (this.mounted) setState(() => selectedIcon = 1);
                },
                child: selectedIcon == 1
                    ? new Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: new Icon(Icons.star),
                )
                    :  new Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: new Icon(Icons.star),
                ),
              ),
            ),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      if (this.mounted) setState(() => selectedIcon = 2);
                    },
                    child: selectedIcon == 2
                        ?  new Positioned(
    right: 0.0,
    bottom: 0.0,
    child: new Icon(Icons.headphones),
    )

                    /*DynamicViews().imageAsset(
                            context,
                            "assets/rebootDesign/homePage/scale300/Labour@3x.png",
                            64,
                            isRTL() ? true : false)*/
                        : new Positioned(
    right: 0.0,
    bottom: 0.0,
    child: new Icon(Icons.headphones),
    ))),


            // Expanded(
            //     child: GestureDetector(
            //         onTap: () {
            //           if (this.mounted) setState(() => selectedIcon = 3);
            //         },
            //         child: selectedIcon == 3
            //             ? DynamicViews().imageAsset(
            //                 context,
            //                 "assets/rebootDesign/homePage/scale300/Graph5Stock@3x.png",
            //                 64,
            //                 isRTL() ? true : false)
            //             : DynamicViews().imageAsset(
            //                 context,
            //                 "assets/rebootDesign/homePage/scale300/De_Graph Top5@3x.png",
            //                 25,
            //                 isRTL() ? true : false))),
          ],
        ));
  }

  /*AddDownloadFlags() async {
    try {
      String UserId = await SessionManager().getUserID();
      String loginId = await SessionManager().getLoginID();

      SyncData syncData = new SyncData();
      syncData.makeTransactionTableData(UserId, loginId);

      AD_UserDataViewPermissionDetails.getAllAssignViewPermissionUserID();
    } catch (e) {}
  }*/

  /* List<ItemRequirement> todaysList;
  List<ItemRequirement> tomarrowsList;
  List<ItemRequirement> nextWeekList;
  List<PlotDetails> plotList;
  List<ItemRequirement> todaysMachineList;
  List<ItemRequirement> tomarrowsMachineList;
  List<ItemRequirement> nextWeekMachineList;

  List<StockDetails> top5HighStock;
  List<StockDetails> top5HighStockLabel;
  List<StockDetails> top5LowStock;
  List<StockDetails> top5LowStockLabel;

  String labourTodayCount = "0";
  String labourTomorrowCount = "0";
  String labourNextWeekCount = "0";
*/
  /*Future makeData() async {
//    data = List<StockDetails>();
    top5HighStock = List<StockDetails>();
    top5LowStock = List<StockDetails>();
    top5LowStockLabel = List<StockDetails>();
    top5HighStockLabel = List<StockDetails>();
    List<CommonModel> temp3 =
        await HomeScreenQuries.getStockDetails(loginId, 1);
    if (temp3 != null && temp3.length != 0)
      for (int i = 0; i < temp3.length; i++) {
        StockDetails stockDetails = new StockDetails.withData(
            name: temp3[i].Name.toString(),
            unit: temp3[i].Value.toString() + " " + temp3[i].Unit.toString(),
            yAxis: double.parse(temp3[i].Value.toString()),
            barColor: RColors.bluishGreen);
//        data.add(stockDetails);
        top5LowStock.add(stockDetails);
        top5LowStockLabel.add(stockDetails);
      }

    if (top5LowStockLabel != null && top5LowStockLabel.length != 5) {
      for (int i = top5LowStockLabel.length; i < 5; i++) {
        StockDetails stockDetails = new StockDetails.withData(
            name: "", unit: "", yAxis: 0, barColor: RColors.bluishGreen);
        top5LowStockLabel.add(stockDetails);
      }
    }

    List<CommonModel> temp2 =
        await HomeScreenQuries.getStockDetails(loginId, 2);
    if (temp2 != null && temp2.length != 0)
      for (int i = 0; i < temp2.length; i++) {
        StockDetails stockDetails = new StockDetails.withData(
            name: temp2[i].Name.toString(),
            unit: temp2[i].Value.toString() + " " + temp2[i].Unit.toString(),
            yAxis: double.parse(temp2[i].Value.toString()),
            barColor: RColors.bluishGreen);
        top5HighStock.add(stockDetails);
        top5HighStockLabel.add(stockDetails);
      }

    if (top5HighStockLabel != null && top5HighStockLabel.length != 5) {
      for (int i = top5HighStockLabel.length; i < 5; i++) {
        StockDetails stockDetails = new StockDetails.withData(
            name: "", unit: "", yAxis: 0, barColor: RColors.bluishGreen);
        top5HighStockLabel.add(stockDetails);
      }
    }
  }*/

  materialReqPage() {
    Row row = Row(
      children: <Widget>[
        Expanded(
          child: Container(
//        height: 485,
              margin: EdgeInsets.only(
                  left: Utils.getSize(16.0), right: Utils.getSize(16.0)),
              child: Card(
                  elevation: Utils.getSize(5.0),
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          color: RColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: <Widget>[
                          detailsHeader(materialAndLabourOpt),
                          Container(
                              padding: EdgeInsets.all(Utils.getSize(16.0)),
                              child: SingleChildScrollView(
                                  child: Stack(children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    if (selectedIcon == 1 &&
                                        materialAndLabourOpt == 1 &&
                                        todaysList != null &&
                                        todaysList.length > 0)
                                      for (int i = 0;
                                          i < todaysList.length;
                                          i++)
                                        addDyanamicView(i, 1)
                                    else if (selectedIcon == 1 &&
                                        materialAndLabourOpt == 2 &&
                                        tomarrowsList != null &&
                                        tomarrowsList.length > 0)
                                      for (int i = 0;
                                          i < tomarrowsList.length;
                                          i++)
                                        addDyanamicView(i, 2)
                                    else if (selectedIcon == 1 &&
                                        materialAndLabourOpt == 3 &&
                                        nextWeekList != null &&
                                        nextWeekList.length > 0)
                                      for (int i = 0;
                                          i < nextWeekList.length;
                                          i++)
                                        addDyanamicView(i, 3),
                                  ],
                                ),
                              ])))
                        ],
                      )))),
        )
      ],
    );
    return row;
  }

  Column addDyanamicView(int position, int type) {
    if (selectedIcon == 1) {
      if (type == 1)
        return Column(children: <Widget>[
          if (position == 0)
            addDyanamicView2(todaysList[position])
          else if (todaysList[position].type != todaysList[position - 1].type)
            addDyanamicView3(todaysList[position])
          else if (todaysList[position].type == todaysList[position - 1].type)
            addDyanamicView4(todaysList[position])
        ]);
      else if (type == 2)
        return Column(children: <Widget>[
          if (position == 0)
            addDyanamicView2(tomarrowsList[position])
          else if (tomarrowsList[position].type !=
              tomarrowsList[position - 1].type)
            addDyanamicView3(tomarrowsList[position])
          else if (tomarrowsList[position].type ==
              tomarrowsList[position - 1].type)
            addDyanamicView4(tomarrowsList[position])
        ]);
      else if (type == 3)
        return Column(children: <Widget>[
          if (position == 0)
            addDyanamicView2(nextWeekList[position])
          else if (nextWeekList[position].type !=
              nextWeekList[position - 1].type)
            addDyanamicView3(nextWeekList[position])
          else if (nextWeekList[position].type ==
              nextWeekList[position - 1].type)
            addDyanamicView4(nextWeekList[position])
        ]);
    } else if (selectedIcon == 2) {
      if (type == 1)
        return Column(children: <Widget>[
          SizedBox(
            height: Utils.getSize(14.0),
          ),
          labourDoubleText(
            todaysMachineList[position].name,
            todaysMachineList[position].value +
                " " +
                todaysMachineList[position].unit,
          ),
        ]);
      else if (type == 2)
        return Column(children: <Widget>[
          SizedBox(
            height: Utils.getSize(14.0),
          ),
          labourDoubleText(
            tomarrowsMachineList[position].name,
            tomarrowsMachineList[position].value +
                " " +
                tomarrowsMachineList[position].unit,
          ),
        ]);
      else if (type == 3)
        return Column(children: <Widget>[
          SizedBox(
            height: Utils.getSize(14.0),
          ),
          labourDoubleText(
            nextWeekMachineList[position].name,
            nextWeekMachineList[position].value +
                " " +
                nextWeekMachineList[position].unit,
          ),
        ]);
    }
  }

  Column addDyanamicView2(ItemRequirement type) {
    return Column(
      children: <Widget>[
        materialReqDoubleTextbold(type.type, ""),
        SizedBox(
          height: Utils.getSize(14.0),
        ),
        materialReqDoubleText(
          type.name,
          type.value + " " + type.unit,
        ),
        SizedBox(
          height: Utils.getSize(14.0),
        )
      ],
    );
  }

  Column addDyanamicView3(ItemRequirement type) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: Utils.getSize(20.0),
        ),
        materialReqDoubleTextbold(type.type, ""),
        SizedBox(
          height: Utils.getSize(14.0),
        ),
        materialReqDoubleText(
          type.name,
          type.value + " " + type.unit,
        ),
        SizedBox(
          height: Utils.getSize(14.0),
        )
      ],
    );
  }

  Column addDyanamicView4(ItemRequirement type) {
    return Column(
      children: <Widget>[
        materialReqDoubleText(
          type.name,
          type.value + " " + type.unit,
        ),
        SizedBox(
          height: Utils.getSize(14.0),
        )
      ],
    );
  }

  Column setLabour() {
    if (selectedIcon == 2 && materialAndLabourOpt == 1) {
      return Column(
        children: <Widget>[
          DynamicViews().text(context, labourTodayCount, 38, FontWeight.bold,
              RColors.black, TextAlign.center),
          DynamicViews().text(context, string.TotalLabour, 14,
              FontWeight.normal, RColors.textColorlight, TextAlign.center),
        ],
      );
    } else if (selectedIcon == 2 && materialAndLabourOpt == 2) {
      return Column(
        children: <Widget>[
          DynamicViews().text(context, labourTomorrowCount, 38, FontWeight.bold,
              RColors.black, TextAlign.center),
          DynamicViews().text(context, string.TotalLabour, 14,
              FontWeight.normal, RColors.black, TextAlign.center),
        ],
      );
    } else if (selectedIcon == 2 && materialAndLabourOpt == 3) {
      return Column(
        children: <Widget>[
          DynamicViews().text(context, labourNextWeekCount, 38, FontWeight.bold,
              RColors.black, TextAlign.center),
          DynamicViews().text(context, string.TotalLabour, 14,
              FontWeight.normal, RColors.black, TextAlign.center),
        ],
      );
    }
  }

  labourDetailsPage() {
    return Container(
        // height: Utils.getSize(485.0),
        margin: EdgeInsets.only(
            left: Utils.getSize(16.0), right: Utils.getSize(16.0)),
        child: Card(
            elevation: Utils.getSize(5.0),
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: RColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: <Widget>[
                    detailsHeader(materialAndLabourOpt),
                    Container(
                      // height: Utils.getSize(389.0),
                      padding: EdgeInsets.all(Utils.getSize(16.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          circleStroke(
                              context: context,
                              size: Utils.getSize(130.0),
                              color: Colors.grey[200],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[setLabour()],
                              )),
                          Column(
                            children: <Widget>[
                              if (selectedIcon == 2 &&
                                  materialAndLabourOpt == 1 &&
                                  todaysMachineList != null &&
                                  todaysMachineList.length > 0)
                                for (int i = 0;
                                    i < todaysMachineList.length;
                                    i++)
                                  addDyanamicView(i, 1)
                              else if (selectedIcon == 2 &&
                                  materialAndLabourOpt == 2 &&
                                  tomarrowsMachineList != null &&
                                  tomarrowsMachineList.length > 0)
                                for (int i = 0;
                                    i < tomarrowsMachineList.length;
                                    i++)
                                  addDyanamicView(i, 2)
                              else if (selectedIcon == 2 &&
                                  materialAndLabourOpt == 3 &&
                                  nextWeekMachineList != null &&
                                  nextWeekMachineList.length > 0)
                                for (int i = 0;
                                    i < nextWeekMachineList.length;
                                    i++)
                                  addDyanamicView(i, 3),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }

  materialReqDoubleText(text1, text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: DynamicViews().text(context, text1, 14, FontWeight.normal,
              Color(0xFF707070), TextAlign.start),
          flex: 80,
        ),
        Expanded(
          child: DynamicViews().text(context, text2, 14, FontWeight.normal,
              Color(0xFF707070), TextAlign.start),
          flex: 40,
        ),
      ],
    );
  }

  materialReqDoubleTextbold(text1, text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: DynamicViews().text(context, text1, 14, FontWeight.bold,
              Color(0xFF707070), TextAlign.start),
          flex: 100,
        ),
        Expanded(
          child: DynamicViews().text(context, text2, 14, FontWeight.normal,
              Color(0xFF707070), TextAlign.start),
          flex: 5,
        ),
      ],
    );
  }

  labourDoubleText(text1, text2) {
    return Container(
      padding: EdgeInsets.only(
          left: Utils.getSize(30.0), right: Utils.getSize(30.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: DynamicViews().text(context, text1, 14, FontWeight.bold,
                Color(0xFF707070), TextAlign.start),
            flex: 50,
          ),
          Expanded(
            child: DynamicViews().text(context, text2, 14, FontWeight.bold,
                Color(0xFF707070), TextAlign.start),
            flex: 30,
          ),
        ],
      ),
    );
  }

  detailsHeader(selected) {
    return Container(
        // height: Utils.getSize(88.0),
        decoration: BoxDecoration(
            color: RColors.black,
            borderRadius: BorderRadius.all(Radius.circular(5))),
//        margin: EdgeInsets.only(right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: Utils.getSize(20.0),
                  right: Utils.getSize(16.0),
                  left: Utils.getSize(16.0)),
              child: Column(
                children: <Widget>[
                  DynamicViews().text(
                      context,
                      selectedIcon == 1
                          ? string.MATERIALREQUIREMENTBASEDONPLAN
                          : selectedIcon == 2
                              ? string.LABOURREQUIREMENTBASEDONPLAN
                              : string.LABOURREQUIREMENTBASEDONPLAN,
                      14,
                      FontWeight.bold,
                      Colors.white,
                      TextAlign.center),
                  SizedBox(
                    height: Utils.getSize(10.0),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        if (this.mounted)
                          setState(() {
                            materialAndLabourOpt = 1;
                          });
                      },
                      child: DynamicViews().text(
                          context,
                          string.Today,
                          14,
                          selected == 1 ? FontWeight.bold : FontWeight.normal,
                          selected == 1
                              ? RColors.white
                              : RColors.textColorlight,
                          TextAlign.center),
                    )),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              if (this.mounted)
                                setState(() {
                                  materialAndLabourOpt = 2;
                                });
                            },
                            child: DynamicViews().text(
                                context,
                                string.Tomorrow,
                                14,
                                selected == 2
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                selected == 2
                                    ? RColors.white
                                    : RColors.textColorlight,
                                TextAlign.center))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              if (this.mounted)
                                setState(() {
                                  materialAndLabourOpt = 3;
                                });
                            },
                            child: DynamicViews().text(
                                context,
                                string.NextWeek,
                                14,
                                selected == 3
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                selected == 3
                                    ? RColors.white
                                    : RColors.textColorlight,
                                TextAlign.center))),
                  ],
                ),
                SizedBox(
                  height: Utils.getSize(10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color:
                            selected == 1 ? RColors.bluishGreen : RColors.black,
                        height: Utils.getSize(5.0),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color:
                          selected == 2 ? RColors.bluishGreen : RColors.black,
                      height: Utils.getSize(5.0),
                    )),
                    Expanded(
                        child: Container(
                      color:
                          selected == 3 ? RColors.bluishGreen : RColors.black,
                      height: Utils.getSize(5.0),
                    ))
                  ],
                )
              ],
            )
          ],
        ));
  }

//bool makeList = false;
  plotAndContractDetails() {
    return Container(
        padding: EdgeInsets.only(
            right: Utils.getSize(16.0), left: Utils.getSize(16.0)),
        child: Column(
          children: <Widget>[
            if (plotList != null && plotList.length > 0)
              for (int i = 0; i < plotList.length; i++)
                Column(children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (this.mounted)
                        setState(() {
                          plotList[i].expandFlag = !plotList[i].expandFlag;
                        });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 1),
                      height: Utils.getSize(40.0),
                      color: plotList[i].expandFlag
                          ? RColors.bluishGreen
                          : RColors.greenishBlue,
                      padding: new EdgeInsets.symmetric(
                          horizontal: Utils.getSize(16.0)),
                      child: new Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              child: DynamicViews().text2(
                                  context,
                                  plotList[i].name,
                                  14,
                                  FontWeight.bold,
                                  Colors.white,
                                  TextAlign.start),
                              alignment: Alignment.centerLeft,
                            ),
                            flex: 48,
                          ),
                          SizedBox(
                            width: Utils.getSize(10.0),
                          ),
                          Expanded(
                              child: Align(
                                child: DynamicViews().text2(
                                    context,
                                    plotList[i].details,
                                    14,
                                    FontWeight.bold,
                                    Colors.white,
                                    TextAlign.center),
                                alignment: Alignment.centerLeft,
                              ),
                              flex: 40),
                          new Icon(
                            plotList[i].expandFlag
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: Utils.getSize(24.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  addviewSub(plotList[i], context)
                ]),
            if (plotList != null && plotList.length > 3)
              GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PlotDetailsHomePage(
                    //             string.PlotContractDetails, plotListAll)));
                  },
                  child: Container(
                      height: 40,
                      // alignment: Alignment.topRight,
                      padding: EdgeInsetsDirectional.only(
                        top: Utils.getSize(8),
                        start: Utils.getSize(240),
                      ),
                      child: DynamicViews().text(
                        context,
                        string.Moredotdotdot,
                        16,
                        FontWeight.bold,
                        RColors.textColorlight,
                        TextAlign.end,
                      )))
          ],
        ));
  }
}

Container addviewSub(PlotDetails plotDetails, context) {
  return Container(
    width: double.infinity,
    height: plotDetails.expandFlag ? null : 0.0,
    padding: new EdgeInsets.only(
        top: Utils.getSize(8.0),
        bottom: Utils.getSize(8.0),
        right: Utils.getSize(16.0),
        left: Utils.getSize(16.0)),
    child: Column(
      children: <Widget>[
        if (plotDetails != null &&
            plotDetails.subPlotDetails != null &&
            plotDetails.subPlotDetails.length > 0)
          for (int i = 0; i < plotDetails.subPlotDetails.length; i++)
            Container(
              margin: EdgeInsets.only(
                  top: Utils.getSize(8.0), bottom: Utils.getSize(8.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: DynamicViews().text(
                            context,
                            plotDetails.subPlotDetails[i].name,
                            14,
                            FontWeight.normal,
                            RColors.black,
                            TextAlign.start),
                        alignment: Alignment.centerLeft,
                      ),
                      flex: 48,
                    ),
                    SizedBox(
                      width: Utils.getSize(10.0),
                    ),
                    Expanded(
                        child: Align(
                          child: DynamicViews().text(
                              context,
                              plotDetails.subPlotDetails[i].details,
                              14,
                              FontWeight.normal,
                              RColors.black,
                              TextAlign.start),
                          alignment: Alignment.centerLeft,
                        ),
                        flex: 40),
                    SizedBox(width: Utils.getSize(24.0))
                  ]),
            )
      ],
    ),
  );
}

taskDetails(context, Localemain string) {
  return Container(
      height: Utils.getSize(100.0),
      margin: EdgeInsets.only(
          left: Utils.getSize(16.0), right: Utils.getSize(16.0)),
      child: Card(
          color: Colors.transparent,
          elevation: Utils.getSize(5.0),
          child: Container(
            height: Utils.getSize(100.0),
            padding: EdgeInsets.only(
                top: Utils.getSize(10.0), bottom: Utils.getSize(10.0)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DynamicViews().text(context, historyTask, 30,
                        FontWeight.bold, RColors.bluishGreen, TextAlign.center),
                    DynamicViews().text(
                        context,
                        "History",
                        14,
                        FontWeight.normal,
                        RColors.textColorDark,
                        TextAlign.center),
                  ],
                ),
//                dottedLine(),
                DottedLine(
                  dashLength: 1,
                  dashGapLength: 1,
                  lineThickness: 1,
                  dashRadius: 5,
                  direction: Axis.vertical,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DynamicViews().text(context, pendingTask, 30,
                        FontWeight.bold, RColors.orange, TextAlign.center),
                    DynamicViews().text(
                        context,
                        string.Pending,
                        14,
                        FontWeight.normal,
                        RColors.textColorDark,
                        TextAlign.center),
                  ],
                ),
                DottedLine(
                  dashLength: 1,
                  dashGapLength: 1,
                  lineThickness: 1,
                  dashRadius: 5,
                  direction: Axis.vertical,
                ),
//                dottedLine(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DynamicViews().text(context, upcomingTask, 30,
                        FontWeight.bold, RColors.green, TextAlign.center),
                    DynamicViews().text(
                        context,
                        string.Upcoming,
                        14,
                        FontWeight.normal,
                        RColors.textColorDark,
                        TextAlign.center),
                  ],
                ),
              ],
            ),
          )));
}

//commonSeparator() {
//  return Container(
//    margin: EdgeInsets.only(top: Utils.getSize( 20.0), bottom: Utils.getSize( 25.0)),
//    color: Colors.grey[100],
//    height: 1.0,
//  );
//}

width(context) {
  return SizedBox(
    width: Utils.getSize(7.0),
  );
}

circleStroke({child, size, color, context}) {
  return Align(
    alignment: Alignment.center,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: size,
            width: size,
            decoration: new BoxDecoration(
              color: color == null ? RColors.white : color,
              shape: BoxShape.circle,
            ),
            child: new Center(
              child: Container(
                padding: EdgeInsets.all(
                  Utils.getSize(16.0),
                ),
                margin: EdgeInsets.all(
                  Utils.getSize(6.0),
                ),
//            height: size - 7,
//            width: size - 7,
                decoration: new BoxDecoration(
                  color: RColors.white,
                  shape: BoxShape.circle,
                ),
                child: new Center(child: child),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

circle(context) {
  return Container(
    height: Utils.getSize(10.0),
    width: Utils.getSize(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );
}

line(context) {
  return Expanded(
      child: Container(
    height: Utils.getSize(10.0),
    width: Utils.getSize(10.0),
    color: Colors.white,
  ));
}

List<SupervisorDetails> supDetails;

List<ItemRequirement> todaysList;
List<ItemRequirement> tomarrowsList;
List<ItemRequirement> nextWeekList;
List<PlotDetails> plotList;
List<PlotDetails> plotListAll;
List<ItemRequirement> todaysMachineList;
List<ItemRequirement> tomarrowsMachineList;
List<ItemRequirement> nextWeekMachineList;

List<StockDetails> top5HighStock;
List<StockDetails> top5HighStockLabel;
List<StockDetails> top5LowStock;
List<StockDetails> top5LowStockLabel;

String labourTodayCount = "0";
String labourTomorrowCount = "0";
String labourNextWeekCount = "0";
List<DailyWeather> dailyWeather;

makeSupTempList(Localemain string) {
  supDetails = List<SupervisorDetails>();
  if (ApiUtils.APK_TYPE == 1) {
    supDetails.add(new SupervisorDetails.withData(
        title: string.TotalPlotNo,
        icon: "assets/rebootDesign/image/plotw.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 0,
        backColor: RColors.blue));
    supDetails.add(new SupervisorDetails.withData(
        title: string.TotalSubplotNo,
        icon: "assets/rebootDesign/image/plotw.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 1,
        backColor: RColors.pink));
    supDetails.add(new SupervisorDetails.withData(
        title: string.TotalCropsNo,
        icon: "assets/rebootDesign/homePage/scale300/De_Labour@3x.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 2,
        backColor: RColors.orange));
    supDetails.add(new SupervisorDetails.withData(
        title: string.SubplotareaAcre,
        icon: "assets/rebootDesign/image/plotw.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 3,
        backColor: RColors.blue));
    supDetails.add(new SupervisorDetails.withData(
        title: string.EstimatedYieldKg,
        icon: "assets/rebootDesign/image/yield_estimation_w.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 4,
        backColor: RColors.pink));
    supDetails.add(new SupervisorDetails.withData(
        title: string.ActualYieldKg,
        icon: "assets/rebootDesign/image/yield_estimation_w.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 5,
        backColor: RColors.orange));
  } else {
    supDetails.add(new SupervisorDetails.withData(
        title: string.FarmerCountNo,
        icon: "assets/rebootDesign/homePage/scale300/De_Labour@3x.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 0,
        backColor: RColors.blue));
    supDetails.add(new SupervisorDetails.withData(
        title: string.FarmerContractNo,
        icon: "assets/rebootDesign/image/plotw.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 1,
        backColor: RColors.pink));
    supDetails.add(new SupervisorDetails.withData(
        title: string.ContractedAreaAcre,
        icon: "assets/rebootDesign/image/plotw.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 2,
        backColor: RColors.orange));
    supDetails.add(new SupervisorDetails.withData(
        title: string.EstimatedYieldKg,
        icon: "assets/rebootDesign/image/yield_estimation_w.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 3,
        backColor: RColors.blue));
    supDetails.add(new SupervisorDetails.withData(
        title: string.RevisedYieldKg,
        icon: "assets/rebootDesign/image/yield_estimation_w.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 4,
        backColor: RColors.pink));
    supDetails.add(new SupervisorDetails.withData(
        title: string.ActualYieldKg,
        icon: "assets/rebootDesign/image/yield_estimation_w.png",
        subLabel1: string.Total,
        subLabel2: string.Today,
        subValue1: "0",
        subValue2: "0",
        position: 5,
        backColor: RColors.orange));
  }
}

superVisorInfo(context, Localemain string) {
  if (supDetails == null) makeSupTempList(string);

  PageController controller = PageController(
    viewportFraction: 0.72,
    initialPage: 1,
  );
  return
//    Row(
//    children: <Widget>[
      Container(
          width: double.infinity,
          height: Utils.getSize(138.0),
          child: PageView.builder(
            controller: controller,
            itemCount: supDetails.length,
            itemBuilder: (context, position) {
              return Container(
                  padding: EdgeInsets.only(bottom: Utils.getSize(5.0)),
                  child: supervisorCard(
                      context,
                      supDetails[position].title,
                      supDetails[position].icon,
                      supDetails[position].subValue1,
                      supDetails[position].subValue2,
                      supDetails[position].backColor,
                      supDetails[position].subLabel1,
                      supDetails[position].subLabel2));
            },
          ))
//    ],
//  )
      ;
}

supervisorCard(
    context, title, image, estimated, actual, color, subLabel1, subLabel2) {
  return Card(
      color: Colors.transparent,
      elevation: Utils.getSize(5.0),
      child: Container(
        padding: EdgeInsets.all(Utils.getSize(16.0)),
        // padding: EdgeInsets.only(
        //     top: Utils.getSize(16.0),
        //     bottom: Utils.getSize(4.0),
        //     right: Utils.getSize(16.0),
        //     left: Utils.getSize(16.0)),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(5))),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Align(
                  child: Container(
                    height: Utils.getSize(55.0),
                    width: Utils.getSize(55.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: new Center(
                      child: Container(
                        height: Utils.getSize(53.0),
                        width: Utils.getSize(53.0),
                        decoration: new BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: new Center(
                          child: Image.asset(
                            image,
                            height: Utils.getSize(33.0),
                            color: Colors.white,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                flex: 25),
            Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: Utils.getSize(2.0),
                    ),
                    Container(
                      // alignment: Alignment.centerRight,
                      padding: EdgeInsetsDirectional.only(start: 5),
                      child: DynamicViews().text2(
                          context,
                          title,
                          14,
                          FontWeight.bold,
                          RColors.textColorDark,
                          TextAlign.center),
                    ),
                    SizedBox(
                      height: Utils.getSize(10.0),
                    ),
                    Container(
                      // bottom: Utils.getSize(10.0),
                      padding: EdgeInsets.only(
                          top: Utils.getSize(5.0),
                          right: Utils.getSize(5.0),
                          left: Utils.getSize(5.0)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              DynamicViews().text2(
                                  context,
                                  estimated,
                                  20,
                                  FontWeight.bold,
                                  Colors.white,
                                  TextAlign.center),
                              DynamicViews().text2(
                                  context,
                                  subLabel1,
                                  14,
                                  FontWeight.normal,
                                  Color(0xddFFFFFF),
                                  TextAlign.center),
                            ],
                          )),
                          SizedBox(
                            width: Utils.getSize(7.0),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  // alignment: Alignment.centerRight,
                                  padding: EdgeInsetsDirectional.only(start: 5),
                                  child: DynamicViews().text2(
                                      context,
                                      actual,
                                      20,
                                      FontWeight.bold,
                                      Colors.white,
                                      TextAlign.center)),
                              DynamicViews().text2(
                                  context,
                                  subLabel2,
                                  14,
                                  FontWeight.normal,
                                  Color(0xddFFFFFF),
                                  TextAlign.center),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
                flex: 55),
          ],
        ),
      ));
}

weatherPages(context) {
  PageController controller = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );
  return Container(
      width: double.infinity,
      height: Utils.getSize(238.0),
      child: PageView.builder(
        controller: controller,
        itemCount: 10,
        itemBuilder: (context, position) {
          return Container(
            padding: EdgeInsets.only(bottom: Utils.getSize(5.0)),
//              color: Colors.cyan,
            child: weatherCard(context, position),
//                position % 2 == 0 ? weatherCard(context) : weatherCard(context),
          );
        },
      )
//        PageView(
//      controller: PageController(
//        viewportFraction: 0.8,
//      ),
//      children: <Widget>[
//        Container(
//          color: Colors.pink,
//          child: weatherCard(),
//        ),
//        Container(
//          color: Colors.cyan,
//          child: weatherCard(),
//        ),
//        Container(
//          color: Colors.deepPurple,
//          child: weatherCard(),
//        ),
//      ],
//    )
      );
}

weatherCard(context, poisiton) {
  return Card(
      elevation: Utils.getSize(5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
//              padding: EdgeInsets.all(Utils.getSize( 24.0)),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          left: Utils.getSize(15.0),
                          right: Utils.getSize(15.0),
                          top: Utils.getSize(6.0),
                          bottom: Utils.getSize(6.0)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: Utils.getSize(10.0)),
                     /*     Icon(
                            Weather10Days.getIconData(
                                dailyWeather[poisiton].image),
                            color: RColors.PrimaryColor,
                            size: Utils.getSize(60.0),
                          ),*/
                          /*Image.asset(
                            "assets/rebootdesign/homepage/scale300/fresh@3x.png",
                            height: 60,
                            fit: BoxFit.contain,
                          ),*/
                          SizedBox(
                            width: Utils.getSize(20.0),
                          ),
                          DynamicViews().text(
                              context,
                              dailyWeather[poisiton].max.replaceAll("°C", "°"),
                              60,
                              FontWeight.w700,
                              RColors.textColorDark,
                              TextAlign.center),
                          SizedBox(
                            width: Utils.getSize(10.0),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: Utils.getSize(14.0),
                              ),
                              Container(
                                child: DynamicViews().text2(
                                    context,
                                    Utils.getNAIfNull(
                                        dailyWeather[poisiton].location),
                                    13,
                                    FontWeight.w700,
                                    RColors.textColorDark,
                                    TextAlign.start),
                              ),
                              SizedBox(
                                height: Utils.getSize(5.0),
                              ),
                              DynamicViews().text(
                                  context,
                                  Utils.getBlankIfNull(
                                          dailyWeather[poisiton].day)
                                      .toUpperCase(),
                                  12,
                                  FontWeight.normal,
                                  RColors.textColorDark,
                                  TextAlign.start),
                              SizedBox(
                                height: Utils.getSize(5.0),
                              ),
                              DynamicViews().text(
                                  context,
                                  Utils.convertDateFormat(
                                          Utils.getBlankIfNull(
                                              dailyWeather[poisiton].date),
                                          "MM/DD/yyyy",
                                          Utils.displayFormatDate)
                                      .toUpperCase(),
                                  12,
                                  FontWeight.normal,
                                  RColors.textColorDark,
                                  TextAlign.start)
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: Utils.getSize(10.0),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          left: Utils.getSize(24.0),
                          right: Utils.getSize(24.0),
                          bottom: Utils.getSize(10.0),
                          top: Utils.getSize(10.0)),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          weatherSubCard(context, dailyWeather[poisiton + 1]),
                          weatherSubCard(context, dailyWeather[poisiton + 2]),
                          weatherSubCard(context, dailyWeather[poisiton + 3]),
                          weatherSubCard(context, dailyWeather[poisiton + 4]),
                          weatherSubCard(context, dailyWeather[poisiton + 5]),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ));
}

weatherSubCard(context, DailyWeather dailyWeather) {
  return Container(
    child: Column(
      children: <Widget>[
        DynamicViews().text(context, dailyWeather.day.toUpperCase(), 13,
            FontWeight.bold, RColors.textColorDark, TextAlign.center),
        height(context),
        DynamicViews().text(
            context,
            Utils.convertDateFormat(Utils.getBlankIfNull(dailyWeather.date),
                    "MM/DD/yyyy", Utils.displayFormatDate)
                .toUpperCase()
                .substring(0, 6),
            12,
            FontWeight.normal,
            RColors.textColorDark,
            TextAlign.center),
        height(context),
      /*  Icon(
          Weather10Days.getIconData(dailyWeather.image),
          color: RColors.orange,
          size: Utils.getSize(12.0),
        ),*/
        height(context),
        DynamicViews().text(context, dailyWeather.max, 12, FontWeight.bold,
            RColors.textColorDark, TextAlign.center),
        height(context),
        DynamicViews().text(context, dailyWeather.min, 12, FontWeight.normal,
            RColors.textColorDark, TextAlign.center),
      ],
    ),
  );
}

height(context) {
  return SizedBox(
    height: Utils.getSize(6.0),
  );
}

makeWeatherList(location1) {
  dailyWeather = List<DailyWeather>();
  DateTime now = DateTime.now();
  dailyWeather.add(DailyWeather.withData(
      day: DateFormat('EEEE').format(now).substring(0, 3),
      image: "50n",
      max: "0°",
      min: "0°",
      date: DateFormat('MM/dd/yyyy').format(now),
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
  dailyWeather.add(DailyWeather.withData(
      day: "NA",
      image: "50n",
      max: "0°",
      min: "0°",
      date: "01/01/2000",
      location: location1));
}

dottedLine() {
  return Container(
    width: 1,
    alignment: Alignment.center,
//      height: 50,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        Expanded(
//          child:
        ListView.builder(
//            scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Container(
                  height: 1,
                  width: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 3,
                  width: 1,
                  color: Colors.white,
                ),
              ],
            );
          },
        ),
//        )
      ],
    ),
  );
}

class DailyWeather {
  String day, image, max, min, date, location;

  DailyWeather();

  DailyWeather.withData(
      {this.day, this.image, this.max, this.min, this.date, this.location});
}

class PlotDetails {
  String name, details, check;
  List<PlotDetails> subPlotDetails = [];
  int ID;
  bool expandFlag;

  PlotDetails();

  PlotDetails.withData(
      {this.name,
      this.details,
      this.subPlotDetails,
      this.ID,
      this.check,
      this.expandFlag});
}

//class SubPlotDetails {
//  String name, details;
//
//  SubPlotDetails();
//
//  SubPlotDetails.withData({this.name, this.details});
//}

class InvoiceProduct {
  String name,
      details1,
      details2,
      image,
      offer,
      unit,
      unitDes,
      stockDetails,
      ribbonMsg,
      productType;
  double price, stars, ratedBy;
  int id, count, quantity, dataType = 1;
  MaterialColor stockDetailsColor;
  bool isAddeable = true, ribbon = false;

  InvoiceProduct();

  InvoiceProduct.withData(
      {this.name,
      this.details1,
      this.details2,
      this.image,
      this.offer,
      this.unit,
      this.unitDes,
      this.stockDetails,
      this.productType,
      this.stockDetailsColor,
      this.isAddeable,
      this.ribbonMsg,
      this.ribbon,
      this.price,
      this.stars,
      this.quantity,
      this.ratedBy,
      this.id,
      this.count,
      this.dataType});
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 2
    // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class StockDetails {
  String name;
  String unit;
  double yAxis;

//  final charts.Color barColor;
  Color barColor;

  StockDetails();

  StockDetails.withData({this.name, this.unit, this.yAxis, this.barColor});
}

class ItemRequirement {
  String type, name, value, unit;

  ItemRequirement();

  ItemRequirement.withData({this.type, this.name, this.value, this.unit});

  static List fromMap(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return ItemRequirement.withData(
          type: maps[i]['type'],
          name: maps[i]['name'],
          unit: maps[i]['unit'],
          value: maps[i]['value']);
    }).toList();
  }
}

class PlotContractDetails {
  String cropName, test, PlotArea, SubPlotName, name;

  int Id;

  PlotContractDetails();

  PlotContractDetails.withData(
      {this.cropName,
      this.test,
      this.PlotArea,
      this.SubPlotName,
      this.name,
      this.Id});

  static List fromMap(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return PlotContractDetails.withData(
          cropName: maps[i]['cropName'],
          test: maps[i]['test'],
          PlotArea: maps[i]['PlotArea'],
          SubPlotName: maps[i]['SubPlotName'],
          name: maps[i]['name'],
          Id: maps[i]['Id']);
    }).toList();
  }
}

class SupervisorDetails {
  String title, icon, subLabel1, subLabel2, subValue1, subValue2;

  int position;

  Color backColor;

  SupervisorDetails();

  SupervisorDetails.withData(
      {this.title,
      this.icon,
      this.subLabel1,
      this.subLabel2,
      this.subValue1,
      this.subValue2,
      this.position,
      this.backColor});

  static List fromMap(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return SupervisorDetails.withData(
          title: maps[i]['title'],
          icon: maps[i]['icon'],
          subLabel1: maps[i]['subLabel1'],
          subLabel2: maps[i]['subLabel2'],
          subValue1: maps[i]['subValue1'],
          subValue2: maps[i]['subValue2'],
          position: maps[i]['position'],
          backColor: maps[i]['backColor']);
    }).toList();
  }
}

class ContractHarvestedQTY {
  String ActualQTY, EstimatedQTY, ReviesdQTY, fromDate, toDate;

  ContractHarvestedQTY();

  ContractHarvestedQTY.withData(
      {this.ActualQTY,
      this.EstimatedQTY,
      this.ReviesdQTY,
      this.fromDate,
      this.toDate});

  static List fromMap(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return ContractHarvestedQTY.withData(
          ActualQTY: maps[i]['ActualQTY'],
          EstimatedQTY: maps[i]['EstimatedQTY'],
          ReviesdQTY: maps[i]['ReviesdQTY'],
          fromDate: maps[i]['fromDate'],
          toDate: maps[i]['toDate']);
    }).toList();
  }
}

class WeatherModel {
  String day, maxTemp, minTemp, image, date;

  WeatherModel(this.day, this.maxTemp, this.minTemp, this.image, this.date);
}
