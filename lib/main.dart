
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/login/LoginBloc.dart';
import 'package:ecompusellcontractor/login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECompusell',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Lato',

        ),
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          LocDelegate(),
          // LocDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          // English, no country code
          const Locale('id', 'ID'),
          // English UK
          const Locale('mr', 'IN'),
          const Locale('fr', ''),
          const Locale('ar', ''),

        ],
        localeResolutionCallback: (
            Locale locale,
            Iterable<Locale> supportedLocales,
            ) {
          return locale;
        },

        home: LoginPageWidget(title: "", state: LoginState.Splash));
  }
}
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key key,  this.title}) : super(key: key);
//
//
//   final String title;
//
//
//   @override
//   State<HomePage> createState() => HomePageState();
// }
//
// class HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
//
//   int state = 2;
//  static double per;
//
//
//   @override
//   Widget build(BuildContext context) {
//     per = (((MediaQuery.of(context).size.width) / 360) * 100);
//     return createScreen();
//   }
//
//   Widget createScreen() {
//     TextEditingController controller = TextEditingController();
//     controller.text = "";
//     FocusNode myFocusNode = new FocusNode();
// // return LoginPageWidget(title: "login",state: 2,);
//     if (state == 1) {
//       return splashScreen();
//     }
//     else {
//       return new WillPopScope(
//           onWillPop: _onWillPop,
//           child: Scaffold(
//             appBar: AppBar(
//               // Here we take the value from the MyHomePage object that was created by
//               // the App.build method, and use it to set our appbar title.
//               title: Text(widget.title),
//             ),
//             body: Center(
//               // Center is a layout widget. It takes a single child and positions it
//               // in the middle of the parent.
//               child:
//               Column(
//
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
// //                    margin: EdgeInsets.all(Utils.getSize(16.0)),
//                     color: RColors.yellow,
//                     height: Utils.getSize(40.0),
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(
//                         right: Utils.getSize(16.0), left: Utils.getSize(16.0)),
//                     child: DynamicViews().text(context, "Normal Container", 14,
//                         FontWeight.bold, RColors.white, TextAlign.center),
//                   ),
//                   FlatButton(
//                       onPressed: () {},
//                       shape: RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(4),
//                       ),
//                       color: RColors.yellow,
//                       child: Container(
//                         height: Utils.getSize(40.0),
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(
//                             right: Utils.getSize(16.0),
//                             left: Utils.getSize(16.0)),
//                         child: DynamicViews().text(
//                             context,
//                             "FlatButton With Container",
//                             14,
//                             FontWeight.bold,
//                             RColors.white,
//                             TextAlign.center),
//                       )),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context, true);
//                           },
//                           child: Container(
//                             color: RColors.yellow,
//                             height: Utils.getSize(40.0),
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.only(
//                                 right: Utils.getSize(16.0),
//                                 left: Utils.getSize(16.0)),
//                             child: DynamicViews().text(
//                                 context,
//                                 "Gesture Detector ",
//                                 14,
//                                 FontWeight.bold,
//                                 RColors.white,
//                                 TextAlign.center),
//                           ),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context, true);
//                     },
//                     child: Container(
//                       color: RColors.yellow,
//                       height: Utils.getSize(40.0),
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.only(
//                           right: Utils.getSize(16.0),
//                           left: Utils.getSize(16.0)),
//                       child: DynamicViews().text(context, "Gesture Detector 2",
//                           14, FontWeight.bold, RColors.white, TextAlign.center),
//                     ),
//                   ),
//
//                   ButtonTheme(
//                       minWidth: 100.0,
//                       child: RaisedButton(
//                           onPressed: () {},
//                           shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(30.0),
// //            side: BorderSide(color: Colors.red)
//                           ),
//                           textColor: Colors.white,
//                           color: RColors.bluishGreen,
//                           padding: EdgeInsets.all(Utils.getSize(5.0)),
//                           child: new Text(
//                             "Raised Button",
//                             style: new TextStyle(
//                               fontSize: Utils.getSize(16.0),
//                               color: Colors.white,
//                             ),
//                           ))),
//                   ButtonTheme(
//                       minWidth: 100.0,
//                       child: RaisedButton(
//                           onPressed: () {
//                             // pickImg();
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(30.0),
// //            side: BorderSide(color: Colors.red)
//                           ),
//                           textColor: Colors.white,
//                           color: RColors.bluishGreen,
//                           padding: EdgeInsets.all(Utils.getSize(5.0)),
//                           child: new Text(
//                             "Click here",
//                             style: new TextStyle(
//                               fontSize: Utils.getSize(16.0),
//                               color: Colors.white,
//                             ),
//                           )))
//
// //                  textField(),
// //                  verticleDText("Name *", "Please enter name", controller),
// //                  Expanded(
// //                    //textview for multiple lines
// //                    child: Text(
// //                        "Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
// //                  ),
// //                  DynViews(
// //                      text: "AdityaDemo.dart",
// //                      onTap: () {
// //                        Navigator.push(
// //                            context,
// //                            MaterialPageRoute(
// //                                builder: (context) => MyHomePageAD(title: "")));
// //                      }).button(),
// //                  DynamicViews.withData(
// //                      title: "Record Keeping",
// //                      onTap: () {
// //                        Navigator.push(
// //                            context,
// //                            MaterialPageRoute(
// //                                builder: (context) => MainFragment(
// //                                    "RKMainList", "Record Keeping", true)));
// //                      }).button(),
// //
// //                  DynamicViews.withData(
// //                      title: "Task Calendar",
// //                      onTap: () {
// //                        Navigator.push(
// //                            context,
// //                            MaterialPageRoute(
// //                                builder: (context) => TaskCalendar()));
// //                      }).button(),
// //                  DynamicViews.withData(
// //                      title: "Material Indent",
// //                      onTap: () {
// //                        Navigator.push(
// //                            context,
// //                            MaterialPageRoute(
// //                                builder: (context) => MainFragment(
// //                                    "MIMainList", "Material Indent", true)));
// //                      }).button(),
// //                  DynamicViews.withData(
// //                      title: "My Stock",
// //                      onTap: () {
// //                        Navigator.push(
// //                            context,
// //                            MaterialPageRoute(
// //                                builder: (context) => MainFragment(
// //                                    "MyStock", "My Stock", false)));
// //                      }).button(),
// ////                  DynViews(
// ////           body           text: "Home Page",
// ////                      onTap: () {
// ////                        navigateToSubPage(context);
// ////                      }).button(),
// //                  DynamicViews.withData(
// //                      title: "Home Page Reboot",
// //                      onTap: () {
// //                        Navigator.push(
// //                            context,
// //                            MaterialPageRoute(
// //                                builder: (context) => MainFragment(
// //                                    "HomePage", "Dashboard", false)));
// //
// ////                        Navigator.push(
// ////                            context,
// ////                            MaterialPageRoute(
// ////                                builder: (context) => HomePageReboot()));
// //                      }).button(),
// //                  Image.file(
// //                    file,
// //                    fit: BoxFit.contain,
// //                    height: 125,
// //                    width: 125,
// //                  ),
// //                  DynamicViews.withData(
// //                      title: "Home Page Reboot",
// //                      onTap: () {
// //                        Navigator.push(
// //                            context,
// //                            MaterialPageRoute(
// //                                builder: (context) => FarmerAssessment()));
// //
// ////                        Navigator.push(
// ////                            context,
// ////                            MaterialPageRoute(
// ////                                builder: (context) => HomePageReboot()));
// //                      }).button(),
// //
// //                  RaisedButton(
// //                    onPressed: () {
// //                      Navigator.push(
// //                          context,
// //                          MaterialPageRoute(
// //                              builder: (context) => LoginPageWidget()));
// //                    },
// ////              intentPageSecond(context),
// //                    textColor: Colors.white,
// //                    color: Colors.red,
// //                    padding: const EdgeInsets.all(8.0),
// //                    child: new Text(
// //                      "Login Page",
// //                    ),
// //                  ),
// //                  RaisedButton(
// //                    onPressed: () {
// //                      createFile();
// //                    },
// ////              intentPageSecond(context),
// //                    textColor: Colors.white,
// //                    color: Colors.red,
// //                    padding: const EdgeInsets.all(8.0),
// //                    child: new Text(
// //                      "Create File",
// //                    ),
// //                  ),
// //
// //                  new FlatButton(
// //                    onPressed: () {
// //                      Navigator.push(context,
// //                          MaterialPageRoute(builder: (context) => ListDemo()));
// ////                    SyncView(context, SyncView.LoginSync).startSync();
// //                    },
// //                    textColor: Colors.white,
// //                    color: Colors.red,
// //                    padding: const EdgeInsets.all(8.0),
// //                    child: new Text("List Demo"),
// //                  ),
// //            Text(
// //              'You have pushed the button this many times:',
// //            ),
// //            Text(
// //              '$_counter',
// //              style: Theme.of(context).textTheme.display1,
// //            ),
//
// //            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
// //
// //              new Flexible(child: new Text("Babe"), flex: 1,),
// //              new Flexible(child: new Text("Babe"), flex: 2,),
// //              Text(
// //                'You have pushed the button this many times:',
// //              ),
// //              Text(
// //                'You have pushed the button this many times:',
// //              )
// //            ])
//                 ],
//               ),
//             ),
//
//           ));
//     }
//   }
//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//       context: context,
//       builder: (context) => new AlertDialog(
//         title: new Text('Are you sure?'),
//         content: new Text('Do you want to exit an App'),
//         actions: <Widget>[
//           new FlatButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: new Text('No'),
//           ),
//           new FlatButton(
//             onPressed: () => Navigator.of(context).pop(true),
//             child: new Text('Yes'),
//           ),
//         ],
//       ),
//     )) ??
//         false;
//   }
//
//   splashScreen() {
//     Future.delayed(const Duration(milliseconds: 3000), () {});
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//                 margin: const EdgeInsets.only(bottom: 20.0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Image.asset(
//                         "assets/images/ecom.jpg",
//                         height: 150,
//                         width: 180,
//                         fit: BoxFit.fitWidth,
//                         filterQuality: FilterQuality.medium,
//                       ),
//                       Text(
//                         "@Copyrights 2005-2020",
//                         textAlign: TextAlign.center,
//                         style: new TextStyle(
//                           fontSize: 18.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         "E-COMPUSELL Pvt. Ltd.",
//                         textAlign: TextAlign.end,
//                         style: new TextStyle(
//                           fontSize: 18.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ]))));
//   }
// }
