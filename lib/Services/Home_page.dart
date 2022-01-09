import 'dart:io';

import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Services/MainFragment.dart';
import 'package:ecompusellcontractor/Services/rabill.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:ecompusellcontractor/login/LoginBloc.dart';
import 'package:ecompusellcontractor/login/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Home_page extends StatefulWidget {
  final MainFragmentState mainFragmentState;

  const Home_page({Key key, this.mainFragmentState}) : super(key: key);

  @override
  HomePageState createState() => HomePageState(mainFragmentState);
}
class HomePageState  extends State<Home_page>
with SingleTickerProviderStateMixin {
  final MainFragmentState mainFragmentState;

  HomePageState(this.mainFragmentState) {
    mainFragmentState.onBackPressed = onBackPressed;
  }

  static Localemain string;
  @override
  Widget build(BuildContext context) {
    string = Localizations.of<LocaleBase>(context, LocaleBase).main;
    return Container(
      color: Colors.grey.shade200,
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          gridimage("assets/images/ecompse.jpg", "PROFILE", context),
          gridimage("assets/images/guide.png", "EMB", context),
          gridimage("assets/images/bill.png", "EBILL", context),
          gridimage("assets/images/dashboard.png", "MONITORING", context),
          gridimage("assets/images/report.png", "REPORTS", context),
          gridimage("assets/images/power.png", "LOGOUT", context)
        ],
      ),
    );

    //     new GridView.count(
    //     crossAxisCount: 2,
    //     children:
    //
    //     new List<Widget>.generate(6, (index) {
    //   return new GridTile(
    //     child: new Card(
    //
    //         color: Colors.blue.shade200,
    //         child: Column(
    //
    //           children: [
    //             gridimage("assets/images/ecompse.jpg", "PROFILE"),
    //   //       gridimage("assets/images/ecompse.jpg", "EMB"),
    //   //     gridimage("assets/images/ecompse.jpg", "EBILL"),
    //   // gridimage("assets/images/ecompse.jpg", "MONITORING"),
    //   // gridimage("assets/images/ecompse.jpg", "REPORTS"),
    //   // gridimage("assets/images/ecompse.jpg", "LOGOUT")
    //           ],
    //         ),
    //
    //     ),
    //   );
    // }),
    // )));
  }

  gridimage(String image, String name, BuildContext context) {
    return InkWell(
      child: new Card(
          color: Colors.white,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                  height: 100,
                  width: 100,
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(name),
              ),
            ],
          )),
      onTap: () {
        switch (name) {
          case "PROFILE":
            Utils.showToast("Click event on $name");
            break;
          case "EMB":
            Utils.showToast("Click event on $name");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => rabill(mainFragmentState: this.mainFragmentState,)));
            break;
          case "EBILL":
            Utils.showToast("Click event on $name");
            break;
          case "MONITORING":
            Utils.showToast("Click event on $name");
            break;
          case "REPORTS":
            Utils.showToast("Click event on $name");
            break;
          case "LOGOUT":
            // Utils.showToast("Click event on $name");
            // Navigator.of(context).pop();

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to logout an App'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPageWidget(
                                  title: "", state: LoginState.Login)));
                    },
                    child: new Text('Yes'),
                  ),
                ],
              ),
            );

            break;
        }
      },
    );
  }

  onBackPressed() {
    Utils.showLog("onBackPressed", "HomePageState");
    // if (SyncView.state == 2) {
    return showDialog(
        context: context,
        builder: (context) => WillPopScope(
            onWillPop: () {
              Utils.showToast("Close dialogue first");
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
}
