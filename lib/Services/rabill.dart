import 'dart:async';
import 'dart:convert';

import 'package:ecompusellcontractor/Services/MeasurmentList.dart';
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
  rabillState createState() => rabillState(this.mainFragmentState);
}

class rabillState extends State<rabill> with SingleTickerProviderStateMixin {
  Future<List<rabillcustom>> futureData;
  final MainFragmentState mainFragmentState;
  String url =
      "http://103.133.215.47:8080/app/ecomob/addContractorRABillDtls?EMBWorkId=14&contractorid=19";

  rabillState(this.mainFragmentState) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = fetchData();
    Utils.showLog("bv", "futureData${futureData.toString()}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RA Details'),
        ),
        body: Center(
            child:
            FutureBuilder<List<rabillcustom>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<rabillcustom> data = snapshot.data;
                    Utils.showLog("bv", "data$data");
                    return ListView.builder(
                        itemCount: data == null ? 0 : data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 1,margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.purple.shade200, width: 0.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                height: 200,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("RA Bill: " +
                                                      data[index]
                                                          .SerialNumber
                                                          .toString())),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  alignment: Alignment.topRight,
                                                  child: Text(data[index]
                                                      .CreatedDate
                                                      .toString())),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Container(

                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text("Bill amount: "),
                                                  SizedBox.fromSize(),
                                                  Text("Deducted amount: "),
                                                  SizedBox.fromSize(),
                                                  Text("Current bill: "),
                                                  SizedBox.fromSize(),
                                                  Text("Approved amount: "),
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Container(

                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    data[index]
                                                        .totalAmountofBILL
                                                        .toString(),
                                                  ),
                                                  SizedBox.square(),
                                                  Text(data[index]
                                                      .DeductedAmount
                                                      .toString()),
                                                  SizedBox.fromSize(),
                                                  Text(data[index]
                                                      .FinalAmount
                                                      .toString()),
                                                  SizedBox.fromSize(),
                                                  Text(data[index]
                                                      .ApprovedAmount
                                                      .toString()),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Text("Forwarded Date: " )),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              alignment: Alignment.topRight,
                                              child: Text("PENDING")),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Text("Approved Date: "),
                                        )),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              alignment: Alignment.topRight,
                                              child: Text("PENDING")),
                                        )
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child:FlatButton(
                                        child: Text('Add MB Data', style: TextStyle(fontSize: 14.0),),
                                        color: Colors.blueAccent,
                                        textColor: Colors.white,
                                        onPressed: () {
                                          Utils.showToast("click RA bill ${data[index].SerialNumber.toString()}");
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MeasurementList()));
                                        },
                                      ),
                                    )

                                  ],
                                )),
                          );
                        });
                  } else if (snapshot.hasError) {
                    Utils.showLog("bv", "has error${snapshot.hasError}");
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            )

        
      )
    );
  }

  Future<List<rabillcustom>> fetchData() async {
    final response = await http.post(Uri.parse(url));

    Utils.showLog("bv", response.statusCode.toString());
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<rabillcustom>((json) => rabillcustom.fromJson(json))
          .toList();
      // List jsonResponse = json.decode(response.body);
      // return jsonResponse.map((data) =>  rabillcustom.fromJson(data)).toList();
    } else {
      Utils.showLog("bv", "else");
      throw Exception('Unexpected error occured!');
    }
  }
}
