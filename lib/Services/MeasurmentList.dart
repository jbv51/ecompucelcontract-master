import 'dart:convert';
import 'dart:io';

import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Services/MainFragment.dart';
import 'package:ecompusellcontractor/Services/addMeasurement.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:ecompusellcontractor/customclass/itemCustom.dart';
import 'package:ecompusellcontractor/customclass/measurmentlistcustom.dart';
import 'package:ecompusellcontractor/customclass/rabillcustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MeasurementList extends StatefulWidget {
  final MainFragmentState mainFragmentState;

  const MeasurementList({Key key, this.mainFragmentState}) : super(key: key);

  @override
  MeasurementListState createState() =>
      MeasurementListState(this.mainFragmentState);
}

class MeasurementListState extends State<MeasurementList>
    with SingleTickerProviderStateMixin {
  final MainFragmentState mainFragmentState;
  String url3 =
      "http://103.133.215.47:8080/app/ecomob/getAllContractorRABillDtls?EMBWorkId=14";
  String url4m =
      "http://103.133.215.47:8080/app/ecomob/getAllRaBillMBDtls?EMBWorkId=14&RABillid=1";
  String url5item =
      "http://103.133.215.47:8080/app/ecomob/getItemsForBill?EMBWorkId=14";
  String url6itemdescrib =
      "http://103.133.215.47:8080/app/ecomob/getDescriptionForBill?EMBWorkId=14";
  String url8MeasurementMode =
      "http://103.133.215.47:8080/app/ecomob/getMeasurementModeForBill?ItemId=50";
  String url7desandqty =
      "http://103.133.215.47:8080/app/ecomob/getDescriptionAndQuantityDetails?EMBWorkId=14&ItemId=50&RABillid=1";
  List<itemCustom> list = [];

  Future<List<measurmentlistcustom>> futureData;

  MeasurementListState(this.mainFragmentState) {

  }

  List<measurmentlistcustom> MainList;
  List<measurmentlistcustom> FilterList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Measurement'),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Utils.showToast("add measurment here..");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            addMeasurement()));
              },
              label: const Text('Add'),
              icon: const Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
            body: Center(
              child: Expanded(
                child: mlist(),
              ),
            )

            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: Column(
            //     children: [
            //       Row(children: [
            //         Expanded(child: dropDown("Item no", list, "1.1"))
            //       ])
            //     ],
            //   ),
            // )

            ));
  }

  // dropDown(label,  List<itemCustom> list, String currentUnit) {
  //   return Container(
  //     margin:
  //         EdgeInsets.only(top: Utils.getSize(1.4), bottom: Utils.getSize(24.0)),
  //     child: DropdownButtonFormField<String>(
  //       //DropdownButtonHideUnderline
  //       decoration: InputDecoration(
  //         labelText: label,
  //         labelStyle: TextStyle(
  //             fontSize: Utils.getSize(16.0),
  //             fontFamily: "Lato",
  //             color: Colors.grey[500]),
  //         alignLabelWithHint: true,
  //         contentPadding: EdgeInsets.only(bottom: 0),
  //         enabledBorder: UnderlineInputBorder(
  //           borderSide: BorderSide(color: RColors.black),
  //         ),
  //         focusedBorder: UnderlineInputBorder(
  //           borderSide: BorderSide(color: RColors.black),
  //         ),
  //       ),
  //       icon: Icon(Icons.keyboard_arrow_down),
  //       iconSize: Utils.getSize(24.0),
  //       isExpanded: false,
  //       value: currentUnit,
  //       style: DynamicViews.textStyle,
  //       items: list.map((itemCustom value) {
  //
  //         return new DropdownMenuItem<String>(
  //           value: value.ItemNo.toString(),
  //           child: Container(
  //             // margin: EdgeInsets.symmetric(horizontal: Utils.getSize(16)),
  //             width: Utils.getSize(135),
  //             child: DynamicViews().text2(context, value.ItemNo.toString(), 16,
  //                 FontWeight.normal, RColors.black, TextAlign.left),
  //           ),
  //         );
  //       }).toList(),
  //       onChanged: (String newValue) {
  //         setState(() {
  //           currentUnit = newValue;
  //           Utils.showToast("unit=$newValue");
  //           // setUnitId(currentUnit);
  //         });
  //       },
  //     ),
  //   );
  // }

// Future<List<itemCustom>> getItemno()  async {
//     final response = await http.post(Uri.parse(url5item));
//
//     Utils.showLog("bv", response.statusCode.toString());
//     if (response.statusCode == 200) {
//      //  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
//      // parsed.map<itemCustom>((json) => itemCustom.fromJson(json)).toList();
//       var jsonData = json.decode(response.body);
//       for(var u in jsonData){
//
//         itemCustom user = itemCustom(ItemNo: u["ItemNo"],RecId:  u["RecId"]);
//
//         list.add(user);
//
//       }
//
//       Utils.showLog("bv", "list"+list.toString());
//      return list;
//     } else {
//       Utils.showLog("bv", "else");
//       throw Exception('Unexpected error occured!');
//     }
//   }

  Future<List<measurmentlistcustom>> fetchData() async {
    final response = await http.post(Uri.parse(url4m));

    Utils.showLog("bv", response.statusCode.toString());
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      FilterList.addAll(parsed
          .map<measurmentlistcustom>(
              (json) => measurmentlistcustom.fromJson(json))
          .toList());
      setState(() {

      });
    } else {
      Utils.showLog("bv", "else");
      throw Exception('Unexpected error occured!');
    }
  }

  mlist() {
    if (FilterList != null && FilterList.length > 0)
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return singleItem(FilterList[index], index);
        },
        itemCount: FilterList.length,
      );
    else
      return Center(
          child: DynamicViews().text(context, "norecordfound", 18,
              FontWeight.bold, RColors.black, TextAlign.center));
  }

  singleItem(measurmentlistcustom activityData, index) {
    GlobalKey key = GlobalKey();

    DateTime dateTime = DateTime.now();
    if (!Utils.checkString(activityData.MeasurementDate.toString())) {
      dateTime = new DateFormat(Utils.mmddYYYY)
          .parse(activityData.MeasurementDate.toString());
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // setAllRecordData(activityData.Android_WORK_ID.toString(),
        //     activityData.Work_ID.toString(), "1");
      },
      onHorizontalDragEnd: (details) async {
        if (details.velocity.pixelsPerSecond.dx < 100) {
          RenderBox box = key.currentContext.findRenderObject();
          Offset position =
              box.localToGlobal(Offset.zero); //this is global position
          Size sizeRed = box.size;
          double y = position.dy - (sizeRed.height - Utils.getSize(80.0)) / 2;
          // AttachmentDetailsState.attachmentList =
          // await AD_FarmAttachementDetails
          //     .getRecordKeepingAttachmentListById(
          //     activityData.Work_ID.toString(),
          //     activityData.Android_WORK_ID.toString(),
          //     Utils.RecordKeepingTableId);
          // await AD_FarmAttachementDetails.getAttachmentListById(
          //     Utils.RecordKeepingTableId,
          //     activityData.Android_WORK_ID.toString());
          DynamicViews(context: context).showSliderDialog(y,
              onTapA: () {
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return MLAttachmentView();
                //   },
                // );
              },
              onTapP: null,
              onTapC: null,
              onTapD: () {
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
                                insetPadding:
                                    EdgeInsets.all(Utils.getSize(32.0)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
//            elevation: 0.0,
                                backgroundColor: Colors.transparent,
                                child: Container(
//                height: Utils.getSize(172.0),
//                             width: Utils.getSize(100.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          new BorderRadius.circular(4),
//            side: BorderSide(color: Colors.red)
                                      color: RColors.white,
                                    ),
                                    padding:
                                        EdgeInsets.all(Utils.getSize(14.0)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        SizedBox(
                                          height: Utils.getSize(16.0),
                                        ),
                                        DynamicViews().text(
                                            context,
                                            "Are you sure to Delete this Record",
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
                                                      onTap: () {
                                                        // DeleteRecord(
                                                        //     Utils.getZeroIfNull(
                                                        //         activityData
                                                        //             .Android_WORK_ID
                                                        //             .toString()),
                                                        //     Utils.getZeroIfNull(
                                                        //         activityData
                                                        //             .RABillMeasurementid
                                                        //             .toString()),
                                                        //     index);
                                                        // Navigator.of(
                                                        //     context)
                                                        //     .pop(true);
                                                        // setState(() {});
                                                      },
                                                      title: "Yes",
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
                                                      title: "Cancel",
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
              },
              onTapE: () {
                // setAllRecordData(activityData.Android_WORK_ID.toString(),
                //     activityData.Work_ID.toString());
                // setAllRecordData(activityData.Android_WORK_ID.toString(),
                //     activityData.Work_ID.toString(),"2");
                // editEntry(activityData, "2", index);

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => MainFragment(
                //             "FRKInfo", "Farmer Record Keeping", false, false)));
              });
        }
      },
      child: Container(
        key: key,
        margin: EdgeInsets.only(
            right: Utils.getSize(16.0), left: Utils.getSize(16.0)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: Utils.getSize(8.0)),
//                  right: Utils.getSize(16.0), left: Utils.getSize(16.0)),

              child: Row(
                children: <Widget>[
                  DynamicViews(context: context).dateCircle(
                      dateTime.day.toString(),
                      DateFormat("MMM").format(dateTime)),
                  Expanded(
                    child: Container(
//                          padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(top: Utils.getSize(5.0)),
//                              alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DynamicViews().text(
                                context,
                                "Item no:" + activityData.ItemNo,
                                16,
                                FontWeight.bold,
                                RColors.bluishGreen,
                                TextAlign.left),
                            DynamicViews().text(
                                context,
                                "Work name:" + activityData.workName,
                                16,
                                FontWeight.normal,
                                RColors.textColorlight,
                                TextAlign.left),
                            DynamicViews().text(
                                context,
                                "Number:" +
                                    activityData.number +
                                    " (" +
                                    activityData.Unit +
                                    ")",
                                16,
                                FontWeight.normal,
                                RColors.textColorlight,
                                TextAlign.left),
                            DynamicViews().text(
                                context,
                                "Total quantity: " + activityData.total,
                                16,
                                FontWeight.normal,
                                RColors.textColorlight,
                                TextAlign.left),
                            // DynamicViews().text(
                            //     context,
                            //     activityData.Crop_Name+" "+ activityData.Variety,
                            //     16,
                            //     FontWeight.normal,
                            //     RColors.textColorlight,
                            //     TextAlign.center),
                            SizedBox(height: Utils.getSize(10.0)),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 1,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  bool isRTL() => Directionality.of(context)
      .toString()
      .contains(TextDirection.RTL.value.toLowerCase());

  Color getColor(String workId, String workStatus) {
    if (workId == "0" && workStatus == "0") {
      return RColors.red;
    } else if (workId != "0" && workStatus == "0") {
      return RColors.yellow;
    } else if (workId != "0" && workStatus == "2") {
      return RColors.green;
    }
  }
}

Future<List<measurmentlistcustom>> Responce(
    measurmentlistcustom measurmentlistcustom) {}
