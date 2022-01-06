import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:ecompusellcontractor/login/LoginBloc.dart';
import 'package:ecompusellcontractor/login/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          gridimage("assets/images/ecompse.jpg", "PROFILE",context),
          gridimage("assets/images/ecompse.jpg", "EMB",context),
          gridimage("assets/images/ecompse.jpg", "EBILL",context),
          gridimage("assets/images/ecompse.jpg", "MONITORING",context),
          gridimage("assets/images/ecompse.jpg", "REPORTS",context),
          gridimage("assets/images/ecompse.jpg", "LOGOUT",context)
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
        child:  new Card(
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
          switch(name){
            case "PROFILE":
              Utils.showToast("Click event on $name");
              break; case "EMB":
            Utils.showToast("Click event on $name");
              break; case "EBILL":
            Utils.showToast("Click event on $name");
              break; case "MONITORING":
            Utils.showToast("Click event on $name");
              break; case "REPORTS":
            Utils.showToast("Click event on $name");
              break;case "LOGOUT":
            Utils.showToast("Click event on $name");
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
                            builder: (context) =>
                                LoginPageWidget(
                                    title: "",
                                    state: LoginState.Login)));},
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
}
