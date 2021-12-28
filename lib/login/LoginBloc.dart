import 'dart:convert';

import 'package:ecompusellcontractor/Utility/ApiUtils.dart';
import 'package:ecompusellcontractor/Utility/SessionManager.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

enum LoginState { Loading, Login, ForgotPassword, Splash, Done }

LoginBloc loginBloc;

class LoginBloc {
  // int state = 0; //if the data is not passed by paramether it initializes with 0
  // BehaviorSubject<int> _subjectCounter;
  // CounterBloc({this.initialCount}){
  //   _subjectCounter = new BehaviorSubject<int>.seeded(this.initialCount); //initializes the subject with element already
  // }
  // Observable<int> get counterObservable => _subjectCounter.stream;

  final loginStream = BehaviorSubject<LoginState>();

  Stream<LoginState> get loginObservable => loginStream.stream;

  login(String comIdd, String userName, String password, BuildContext context) {
    if (!ApiUtils.isMulClient) comIdd = "test";
//    return Navigator.pushReplacement(
//        context, MaterialPageRoute(builder: (context) => HomeScreen()));

//    SyncView syncView = new SyncView(context, SyncView.LoginSync);
//    syncView.startSync();
//    userName.text = "farmerptestadmin";
//    password.text = "admin@2019";
//    userName.text = "mahesh";
//    password.text = "mahesh@123";
    ApiUtils.ClientID = comIdd;
    if (ApiUtils.ClientID == null ||
        ApiUtils.ClientID == "" ||
        userName == null ||
        userName == "" ||
        password == null ||
        password == "") {
      Utils.showToast("Field cannot be empty");
    } else {
      Utils.showLog("login", "called here");
      loginStream.sink.add(LoginState.Done);

      // callLoginApi(userName, password, context);
    }
  }

  // Future<LoginResponce>
  callLoginApi(String userName, String password, BuildContext context) async {
    bool isConnected = await Utils.isNetWorkConnected();
    LoginResponce snapshot;
    if (isConnected) {
      String clientLink = ApiUtils.getMainLink().toString();
      if (Utils.checkString(clientLink)) {
        // Utils.showToast("No Link Found.");
        if (ApiUtils.isMulClient) Utils.showToast("Company Code Mismatched.");
        loginStream.sink.add(LoginState.Login);
        return;
      }
      String link = clientLink +
          "Api_FarmERPMobDownLoad/ValidateActiveUserLoginLite?UserName=" +
          userName +
          "&Password=" +
          password;
      Utils.showLog("link", link);
      final response =
//    await http.get('https://jsonplaceholder.typicode.com/albums/1');
          await http.get(Uri.parse(link));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response, then parse the JSON.
        snapshot = LoginResponce.fromJson(json.decode(response.body));
      } else {
        // If the server did not return a 200 OK response, then throw an exception.
        loginStream.sink.add(LoginState.Login);
        throw Exception('Login Failed');
      }
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      loginStream.sink.add(LoginState.Login);
      Utils.showToast('Conect to Internet first!');
      Utils.showLog("Connection Failed", "No Internet");
    }

    if (snapshot != null) {
      if (snapshot.RStatus == "Yes") {
        // WidgetsBinding.instance
        //     .addPostFrameCallback((_) => {loginSuccessFull(context)});
        SessionManager sessionManager = SessionManager();
        await sessionManager.setValue(
            SessionManager.ClientID, ApiUtils.ClientID);
        await sessionManager.setValue(SessionManager.UserID, snapshot.UserID);
        await sessionManager.setValue(SessionManager.LoginID, snapshot.LoginID);
        // await sessionManager.setValue(SessionManager.LoginID, snapshot.LoginID);
        await sessionManager.setValue(
            SessionManager.CompanyID, snapshot.CompanyID);
        await sessionManager.setValue(SessionManager.isLoggedIn, "true");
        Utils.showLog("LoginResponce", snapshot.toString());
        Utils.showToast("Login Success");
        //Code block added by Sumit 29th April 2021
        // loginSuccessFull(context);
        // code block ended
      } else {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          // if (this.mounted)
          //   setState(() {
          //     if (state != LoginSCR) state = LoginSCR;
          //   });
          loginBloc.loginStream.sink.add(LoginState.Login);
        });

        Utils.showToast("Login Failed");
      }
//                      return Text(snapshot.data.RStatus);
    }
//     else if (snapshot.hasError) {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         Utils.showLog("login failed", "called here");
//         // if (this.mounted)
//         //   setState(() {
//         //     if (state != LoginSCR) state = LoginSCR;
//         //   });
//         loginBloc.loginStream.sink.add(LoginState.Login);
//       });
//       Utils.showToast("Login Failed");
// //                      Utils.showToast("${snapshot.error}");
// //                      return Text("${snapshot.error}");
//     }
  }

//   loginSuccessFull(BuildContext context) async {
// //    SyncView syncView = new SyncView(context, SyncView.LoginSync);
//     //    syncView.startSync();
// //    Navigator.pushReplacement(
// //        context,
// //        MaterialPageRoute(
// //            builder: (context) => ProgressDialog(
// //                  syncType: SyncView.LoginSync,
// //                )));
//
//     return showDialog(
//         context: context,
//         builder: ((BuildContext context) {
//           return ProgressDialog(
//             syncType: SyncType.LoginSync,
//             parentAct: this,
//             flag: 1,
//           );
//         }));
//
// //                              Navigator.pushReplacement(
// //                                  context,
// //                                  MaterialPageRoute(
// //                                      builder: (context) => MainScreenTheme())
// //                              )
//   }

  onLoginDone() async {
    String UserId = await SessionManager().getUserID();
    String loginId = await SessionManager().getLoginID();

//     SyncData syncData = new SyncData();
//     syncData.makeTransactionTableData(UserId, loginId);
    // addPreRequestData((await sessionManager.getUserID()).toString());
    // AD_UserDetails loginData = await AD_UserDetails.getUserDetails(UserId);

    // await sessionManager.setValue(SessionManager.EmailId, UserId);
    // await sessionManager.setValue(
    //     SessionManager.KeyLanguageId, loginData.LanguageId.toString());
//      sessionManager.createLoginSession(userName, password);
    //todo:goto main screen
    // state = 0;not need to change state
//    Utils.showLog("HomeScreen", "HomeScreen");

    loginStream.sink.add(LoginState.Done);
//        HomeScreen()));
  }

  void dispose() {
    //?to see if its not null
    loginStream?.close();
  }

  // void addPreRequestData(String userId) async {
  //   await getSetting(112, "", userId).save();
  //   await getSetting(211, "", userId).save();
  //   await getSetting(202, "", userId).save();
  // }

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
}

class LoginResponce {
  final String RStatus, FileName, UserID, LoginID, CompanyID, Farmer_ID;

  LoginResponce(
      {this.RStatus,
      this.FileName,
      this.LoginID,
      this.UserID,
      this.CompanyID,
      this.Farmer_ID});

  factory LoginResponce.fromJson(Map<String, dynamic> json) {
    return LoginResponce(
      RStatus: json['RStatus'],
      FileName: json['FileName'],
      UserID: json['UserID'],
      LoginID: json['LoginID'],
      CompanyID: json['CompanyID'],
      Farmer_ID: json['Farmer_ID'],
    );
  }

  @override
  String toString() {
    return 'LoginResponce{RStatus: $RStatus, FileName: $FileName, UserID: $UserID, LoginID: $LoginID, CompanyID: $CompanyID, Farmer_ID: $Farmer_ID}';
  }
}
