
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecompusellcontractor/Services/MainFragment.dart';
import 'package:ecompusellcontractor/customclass/rabillcustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
class rabill extends StatefulWidget {
  final MainFragmentState mainFragmentState;

  const rabill({Key key, this.mainFragmentState}) : super(key: key);

  @override
 rabillState createState()  => rabillState(this.mainFragmentState);
}
class rabillState extends State<rabill>
    with SingleTickerProviderStateMixin {
 Future<List<rabillcustom>> futureData;
  final MainFragmentState mainFragmentState;
  String url="http://103.133.215.47:8080/app/ecomob/addContractorRABillDtls";
  rabillState(this.mainFragmentState) {

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData =  fetchData();
    setState(() {

    });
  }
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter API and ListView Example',
     home: Scaffold(
       appBar: AppBar(
         title: Text('Flutter ListView'),
       ),
       body: Center(
         child: FutureBuilder <List<rabillcustom>>(
           future: futureData,
           builder: (context, snapshot) {
             if (snapshot.hasData) {
               List<rabillcustom> data = snapshot.data;
               Utils.showLog("bv", "data$data");
               return
                 ListView.builder(
                     itemCount: data==null?0:data.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Container(
                         height: 75,
                         color: Colors.white,
                         child: Center(child: Text(data[index].RABillid.toString()),
                         ),);
                     }
                 );
             } else if (snapshot.hasError) {
               Utils.showLog("bv", "has error${snapshot.hasError}");
               return Text("${snapshot.error}");
             }
             // By default show a loading spinner.
             return CircularProgressIndicator();
           },
         ),
       ),
     ),
   );
 }


  Future <List<rabillcustom>> fetchData() async {

    final response =

    await http.post(Uri.parse(url),
        headers: {"EMBWorkId": "14","contractorid":"19"});

    Utils.showLog("bv", response.statusCode.toString());
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);



        return jsonResponse.map((data) => new rabillcustom.fromJson(data)).toList();


    } else {
      Utils.showLog("bv", "else");
      throw Exception('Unexpected error occured!');

    }
  }
  //
  // body() {
  //
  //   return Center(
  //     child:  ListView.builder(
  //       // itemCount: 1,
  //       //itemCount: data==null ? 0 :data.length ,
  //       itemCount: futureData==null?0:futureData.length,
  //
  //       itemBuilder: (BuildContext context, int index) {
  //         return new Container(
  //           child: new Center(
  //             child: new Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: <Widget>[
  //                 new Card(
  //                   child: new Container(
  //                     child: new Text(futureData[index].RABillid),
  //                     padding: EdgeInsets.all(20),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  //
  //
  //
  //
  //
  //
  // }
}