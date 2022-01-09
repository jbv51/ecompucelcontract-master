

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Services/MainFragment.dart';
import 'package:ecompusellcontractor/Utility/ApiUtils.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/SessionManager.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:ecompusellcontractor/login/LoginBloc.dart';

import 'package:flutter/material.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key, this.title, this.state}) : super(key: key);
  final String title;
  final LoginState state;

  @override
  LoginPage createState() => LoginPage(state:state);
}


class LoginPage extends State<LoginPageWidget>
    with SingleTickerProviderStateMixin {

  bool _obscureText = true;
  TextEditingController comId = TextEditingController();
  TextEditingController userName =  TextEditingController();
  TextEditingController password =  TextEditingController();
  TextEditingController emailid =  TextEditingController();
  LoginPage({state}) {
    loginBloc = LoginBloc();
    loginBloc.loginStream.sink.add(state);
  }
  // LoginPage({state}) {
  //   loginBloc = LoginBloc();
  //   loginBloc.loginStream.sink.add(state);
  // }
  SessionManager sessionManager;
  static double per=100;
  static Localemain string;

  static LoginPage state;

  @override
  void initState() {
    super.initState();
    state = this;

    isCalled = true;

  }


  // init() async {
  //   // String language = await SessionManager().getLanguage();
  //   // if (language == null || language == "") {
  //   //   Language = "English";
  //   //   await SessionManager().setValue(SessionManager.Language, "English");
  //   // } else {
  //   //   Language = language;
  //   // }
  //   // if (await SessionManager().getIsLoggedIn() == "true" && context != null) {
  //   //   Future.delayed(Duration.zero, () {
  //   //     // SchedulerBinding.instance.addPostFrameCallback((_) {
  //   //     //   WidgetsBinding.instance.addPostFrameCallback((_){
  //   //     Navigator.pushReplacement(
  //   //         context,
  //   //         MaterialPageRoute(
  //   //             builder: (context) =>
  //   //                 MainFragment("HomePage", "Dashboard", false, false)));
  //   //   });
  //   // }
  //   // isRefreshed = true;
  //   // setState(() {
  //   //
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    per = (((MediaQuery.of(context).size.width) / 360) * 100);
    // string = Localizations.of<LocaleBase>(context, LocaleBase).main;
//    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
//    print(loc.main.save);
//    LocaleBase localeBase = Localizations.of<LocaleBase>(context, LocaleBase);
//    string = localeBase.main;
    // TODO: implement build
    Utils.showLog("tag", "per"+per.toString());
    sessionManager =  SessionManager();
    return  WillPopScope(
      onWillPop: () async => _onBackPressed(),
      child:
          // !isRefreshed ? DynamicViews.progressBar(50, 50) :
          createWidget(context),
    );
  }

  bool isCalled = true;

  checkIfLogged() async {
    if (await sessionManager.getIsLoggedIn() == "true" && context != null) {
      ApiUtils.ClientID =
          await sessionManager.getValueOf(SessionManager.ClientID);
      // Future.delayed(Duration.zero, () {
      // SchedulerBinding.instance.addPostFrameCallback((_) {
      // WidgetsBinding.instance.addPostFrameCallback((_){
      loginBloc.dispose();
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MainFragmentSatatess(
      //             serviceCode: "HomePage",
      //             title: string.Dashboard,
      //             showFB: false,
      //             resize: false)),
      //     ModalRoute.withName("/MainFragment"));

      // });
    } else {
      if (loginBloc != null && !loginBloc.loginStream.isClosed) {
      loginBloc.loginStream?.sink?.add(LoginState.Login);
      }
    }
    // setState(() {
    // isCalled = true;
    // });
  }

  editText(String hint, TextEditingController cotroller) {
    return  Container(
//        color: Colors.blue,

        margin: const EdgeInsets.all(15.0),
        child: TextField(
          controller: cotroller,
          style:  TextStyle(
            fontSize: Utils.getSize(14.0),
            color: Colors.black45,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
//            hintText: hint,
            labelText: hint,
          ),
        ));

//
//        TextField(
//          controller: cotroller,
//          decoration: InputDecoration(
//              border:
////      InputBorder.none,
//              new OutlineInputBorder(
//                  borderSide: new BorderSide(color: Colors.black),
//                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
//              hintText: hint),
//        ));
  }

  imageView(String path) {
    return Image.asset(
      path,
      fit: BoxFit.fitWidth,
      height: Utils.getSize(110.0),
      width: Utils.getSize(290.0),
      filterQuality: FilterQuality.medium,
    );
  }

  button(String text, int onPressed) {
//    Utils.showLog("button", "called here");

    return Container(
        margin: EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          new Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(5.0),
              color: RColors.blue,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                onPressed: () {
                 Utils.showLog("onPressed", "called here"+onPressed.toString());

                  if (onPressed == 1) {
                    // FirebaseCrashlytics.instance.crash();
                    // FirebaseCrashlytics.instance
                    //     .log('This is a log example');
                    loginBloc.login(
                        comId.text, userName.text, password.text, context);
                  } else if (onPressed == 2) {
                    // if (this.mounted)
                    //   setState(() {
                    //     state = LoginSCR;
                    //   });
                    loginBloc.loginStream.sink.add(LoginState.Login);
                    Utils.showToast("Password Changed");
                  }
                },
                child: DynamicViews().text(context, text, 14, FontWeight.bold,
                    RColors.white, TextAlign.center),
              ))
        ]));

  }

  int preveouscalled = 0;

  createWidget(BuildContext context) {
    // if (!isCalled) {
    //   return DynamicViews.progressBar(50, 50);
    // } else {
      return StreamBuilder<LoginState>(
          stream: loginBloc.loginObservable,
          builder: (context, snapshot) {
            if (snapshot.data == LoginState.Login) {
              return Scaffold(
                  // appBar: AppBar(
                  //   title: Text('User Login'),
                  // ),
                  body: Container(
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                          child: Card(
                              margin: EdgeInsets.all((20.0)),
                              child: Container(
                                  padding: EdgeInsets.all((10.0)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        // SizedBox(height: (30.0)),
                                        // imageView(
                                        //     "assets/images/ecom.jpg"),
                                        SizedBox(height: (30.0)),
                                        imageView(
                                            "assets/images/ecomps.jpg"),
                                        SizedBox(height: Utils.getSize(30.0)),
                                        if (ApiUtils.isMulClient)
                                          Container(
                                            margin: const EdgeInsets.all(15.0),
                                            child: DynamicViews(
                                                    hint: "Company Id",
                                                    controller: comId,
                                                    onTextChanged: (text) {})
                                                .editText(),
                                          ),
                                        Container(
                                          margin: const EdgeInsets.all(15.0),
                                          child: DynamicViews(
                                                  hint: "Login Name",
                                                  controller: userName,
                                                  onTextChanged: (text) {})
                                              .editText(
                                                  // label: "Login Name",
                                                  ),
                                        ),
//                                editText("Login Name", userName),
                                        PasswordTextField("Password", password),
                                        SizedBox(height: (20.0)),
                                        button("Sign In", 1),
                                        SizedBox(height: (20.0)),
                                        GestureDetector(
                                          onTap: () {
                                            // if (this.mounted)
                                            //   setState(() {
                                            //     state = ForgotPWDSCR;
                                            //   });
                                            loginBloc.loginStream.sink
                                                .add(LoginState.ForgotPassword);

                                            Utils.showToast("Forgot Password?");
                                          },
                                          child: new Container(
                                              padding: EdgeInsets.all(10.0),
                                              child: DynamicViews().text(
                                                  context,
                                                  "Forgot Password ?",
                                                  14,
                                                  FontWeight.normal,
                                                  RColors.black,
                                                  TextAlign.center)),
                                        ),

                                        SizedBox(height:(10.0)),
                                      ]))))));
            }
//             else if (snapshot.data == LoginState.ForgotPassword) {
//               return Scaffold(
//                   // appBar: AppBar(
//                   //   title: Text('User Login'),
//                   // ),
//                   body: Container(
//                       color: Colors.black12,
//                       alignment: Alignment.center,
//                       child: SingleChildScrollView(
//                           child: Card(
//                               margin: EdgeInsets.all(Utils.getSize(20.0)),
//                               child: Container(
//                                   padding: EdgeInsets.all(Utils.getSize(10.0)),
//                                   child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         SizedBox(height: Utils.getSize(40.0)),
//                                         imageView(
//                                             "assets/rebootDesign/image/farmerplogonew.png"),
//                                         DynamicViews().text(
//                                             context,
//                                             "   Forgot Password",
//                                             Utils.getSize(16.0),
//                                             FontWeight.normal,
//                                             RColors.black,
//                                             TextAlign.center),
//                                         SizedBox(height: Utils.getSize(30.0)),
//                                         new Container(
//                                           margin: const EdgeInsets.all(15.0),
//                                           child: DynamicViews(
//                                                   hint: "Login Name",
//                                                   controller: userName,
//                                                   onTextChanged: (text) {})
//                                               .editText(),
//                                         ),
//
// //                                editText("Login Name", userName),
// //                                PasswordTextField("Password", password),
//                                         new Container(
//                                           margin: const EdgeInsets.all(15.0),
//                                           child: DynamicViews(
//                                                   hint: "Email ID",
//                                                   controller: emailid,
//                                                   onTextChanged: (text) {})
//                                               .editText(),
//                                         ),
//                                         SizedBox(height: Utils.getSize(20.0)),
//                                         button("Submit", 2),
//                                         SizedBox(height: Utils.getSize(20.0)),
//
//                                         SizedBox(height: Utils.getSize(10.0)),
//                                       ]))))));
//             }
//             else if (snapshot.data == LoginState.Loading) {
//               // loginBloc.callLoginApi();
//               return new WillPopScope(
//                   onWillPop: _onWillPop,
//                   child: Scaffold(
//                       // appBar: AppBar(
//                       //   title: Text('User Login'),
//                       // ),
//                       body: Center(child: CircularProgressIndicator())));
//             }
            else if (snapshot.data == LoginState.Splash) {
              // Future.delayed(const Duration(milliseconds: 1000), () {
              // if (this.mounted)
              //   setState(() {
              //     if (state != LoginSCR) state = LoginSCR;
              //   });
              //_controller.forward();
              // });
              Future.delayed(const Duration(milliseconds: 5000), () async {
                // if (this.mounted)
                //   setState(() {
                //     if (state != LoginSCR) state = LoginSCR;
                //   });

                // if (!isCalled)
                try {
                  await checkIfLogged();
                } catch (e) {
                  print(e);
                }
              });

              return Scaffold(
                  // appBar: AppBar(
                  //   title: Text(""),
                  // ),
                  body: Center(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: Utils.getSize(5.0),
                              top: Utils.getSize(5.0),
                              right: Utils.getSize(5.0),
                              bottom: Utils.getSize(16.0)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                /*  _AnimatedLogo(
                                  animation: this._sizeAnimation,
                                ),*/
                                SizedBox(height: Utils.getSize(20.0)),
                                Image.asset(
                                  "assets/images/ecompse.jpg",
                                  height: Utils.getSize(150.0),
                                  width: Utils.getSize(200.0),
                                  fit: BoxFit.fitWidth,
                                  filterQuality: FilterQuality.medium,
                                ),
                                SizedBox(height: Utils.getSize(20.0)),
                                Image.asset(
                                  "assets/images/ecom.jpg",
                                  height: Utils.getSize(250.0),
                                  width: Utils.getSize(350.0),
                                  fit: BoxFit.fitWidth,
                                  filterQuality: FilterQuality.medium,
                                ),

                                SizedBox(height: Utils.getSize(180.0)),
                                Text(
                                  "@Copyrights 2005-2021",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: Utils.getSize(18.0),
                                    color: Colors.black,
                                  ),
//                                ),
                                ),
                                Text(
                                  "E-Compusell Pvt. Ltd.",
                                  textAlign: TextAlign.end,
                                  style: new TextStyle(
                                    fontSize: Utils.getSize(18.0),
                                    color: Colors.black,
                                  ),
//                                ),
                                ),
                              ]))));
            }
            else if (snapshot.data == LoginState.Done) {
              Future.delayed(const Duration(milliseconds: 2500), () {
                changeThePage();
              });

              return Container();
            }
            else {
              return Container();
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             MainFragment("HomePage", "Dashboard", false, false)));
            }
          });
    // }
  }

  changeThePage( ) {
    loginBloc.dispose();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MainFragmentSatatess(
                serviceCode: "HomePage",
                title: "Dashboard",
                showFB: false,
                resize: false,
                showBN: true)),
        ModalRoute.withName("/MainFragment"));
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e, s) {
      Utils.showException(e, s);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Future<bool> _onWillPop() async {
    // setState(() {
    //   if (state != LoginSCR) state = LoginSCR;
    // });
    loginBloc.loginStream.sink.add(LoginState.Login);
    return false;
  }

  // App_SyncSetting getSetting(int id, String name, String userId) {
  //   App_SyncSetting app_syncSetting = new App_SyncSetting();
  //   app_syncSetting.ServiceID = id;
  //   app_syncSetting.setServiceName(name);
  //   app_syncSetting.setSyncFlag(id.toString());
  //   app_syncSetting.setIsDownload("1");
  //   app_syncSetting.setIsUpload("0");
  //   app_syncSetting.setUserID(userId);
  //   app_syncSetting.setLast_Download_Date("01/01/2000");
  //   return app_syncSetting;
  // }

  PasswordTextField(String str, TextEditingController controller) {
    return new Container(
//        color: Colors.blue,

        margin: const EdgeInsets.all(15.0),
        child: TextFormField(
          controller: controller,
          style: new TextStyle(
            fontFamily: "Lato",
            fontSize: Utils.getSize(14.0),
            color: Colors.black45,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
//            hintText: str,
            labelText: str,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                size: Utils.getSize(20.0),
              ),
              onPressed: _togglePasswordStatus,
            ),
          ),
//          validator: (val) {
//            return val.length < 6
//                ? 'Enter A Password Longer Than 6 Charchters'
//                : null;
//          },
          obscureText: _obscureText,
          onChanged: (val) {
            // setState(() {
            //   //password.text = val.trim();
            // });
          },
        ));
  }

  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.dispose();
  }

  Future<bool> _onBackPressed() {
    // if (state == ForgotPWDSCR) {
    // if (this.mounted)
    //   setState(() {
    //     state = LoginSCR;
    //   });
    // loginBloc.loginStream.sink.add(LoginState.Login);
    // }
    // else {
      return showDialog(
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
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      );
    // }
  }

// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');
//
//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer
//       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//
//   return file;
// }

}

