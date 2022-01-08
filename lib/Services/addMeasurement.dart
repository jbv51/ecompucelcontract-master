import 'dart:convert';

import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Services/MainFragment.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/SessionManager.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:ecompusellcontractor/customclass/itemCustom.dart';
import 'package:ecompusellcontractor/customclass/measurementModeCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class addMeasurement extends StatefulWidget {
  final MainFragmentState mainFragmentState;

  const addMeasurement({Key key, this.mainFragmentState}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      addMeasurementState(this.mainFragmentState);
}

class addMeasurementState extends State<addMeasurement> {
  MainFragmentState mainFragmentState;

  DateTime entryDate;
  String CurrencyId;
  bool enabled = true;
  BuildContext context;

  addMeasurementState(this.mainFragmentState);

  int pageType = 1;
  static TextEditingController manualMBNoCon = TextEditingController(),
      _dateCon = TextEditingController(),
      manualMBReferenceCon = TextEditingController(),
      unitCon = TextEditingController(),
      lengthCon = TextEditingController(),
      widthCon = TextEditingController(),
      heightCon = TextEditingController(),
      TotalQtyCon = TextEditingController(),
      workDetailsCon = TextEditingController();

  DateTime entryDateTime = DateTime.now();
  String selectedOrderType, selectedCurrency, selectedCIF;
  List<itemCustom> itemnolist = [];
  List<itemCustom> itemDescriptionlist = [];
  List<measurementModeCustom> mmodelist = [];
  String itemnoUnit,itemdes,mmodeunit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpreviousdata();
    getItemno();
    getItemDescription();
    getMeasurementMode();
  }

  @override
  Widget build(BuildContext context) {
    // string = Localizations.of<LocaleBase>(context, LocaleBase).main;
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Measurement'),
      ),
      body: body(),
    );
  }

  body() {
    return Container(
        margin: EdgeInsets.all(Utils.getSize(16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: DynamicViews(
                      onTap: () async {
                        entryDateTime = (await Utils.getDatePicker(context,
                                lastDate: DateTime.now(),
                                initialDate: entryDateTime)) ??
                            entryDateTime;
                        _dateCon.text =
                            Utils.getDisplayFormatDate(entryDateTime);
                        // model.mainModel.Booking_Date =
                        //     DateFormat(Utils.sqlDateFormat)
                        //         .format(entryDateTime);
                      },
                    ).textField(
                      label: "Measurement Date",
                      controller: _dateCon,
                      isEnabled: false,
                      asterisk: false,
                    ),
                  ),
                  dropDown("Item no", itemnolist, itemnoUnit),
                  dropDowndes("Item Description", itemDescriptionlist,itemdes),
                  dropDownmm("Measurement mode", mmodelist,mmodeunit),
                  Column(
                    children: [
                      DynamicViews().text2(context, "Item Quantity Details", 14,
                          FontWeight.bold, RColors.textColorDark, TextAlign.center),
                      Card(
                          elevation: 2,
                          color: RColors.lightGreenLL,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "Tender Quantity:",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.left)),
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "1000",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.right))
                                  ],
                                ),
                                SizedBox(height: Utils.getSize(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "Consumed Quantity:",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.left)),
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "1000",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.right))
                                  ],
                                ),
                                SizedBox(height: Utils.getSize(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "Current Total:",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.left)),
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "1000",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.right))
                                  ],
                                ),
                                SizedBox(height: Utils.getSize(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "Balance Quantity:",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.left)),
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "1000",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.right))
                                  ],
                                ),
                                SizedBox(height: Utils.getSize(5.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "Excess Quantity :",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.left)),
                                    Expanded(
                                        flex: 1,
                                        child: DynamicViews().text2(
                                            context,
                                            "1000",
                                            14,
                                            FontWeight.normal,
                                            RColors.textColorDark,
                                            TextAlign.right))
                                  ],
                                ),
                                SizedBox(height: Utils.getSize(5.0)),
                              ],
                            ),
                          )),
                    ],
                  ),

                  DynamicViews().textField2(
                    label: "Manual MB No",
                    isEnabled: true,
                    asterisk: false,
                    controller: manualMBNoCon,
                  ),
                  DynamicViews().textField2(
                    label: "Manual MB Reference",
                    isEnabled: true,
                    asterisk: false,
                    controller: manualMBReferenceCon,
                  ),
                  DynamicViews().textField2(
                    label: "Work details",
                    isEnabled: true,
                    asterisk: false,
                    controller: workDetailsCon,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DynamicViews(onTextChanged: (text) {
                          double quantity = double.tryParse(text.toString()) *
                              double.tryParse(widthCon.text.toString()) *
                              double.tryParse(heightCon.text.toString());

                          TotalQtyCon.text = quantity.toString();
                        }).textField2(
                          label: "Length",
                          isEnabled: true,
                          asterisk: false,
                          keyboard: TextInputType.number,
                          controller: lengthCon,
                        ),
                      ),
                      SizedBox(width: Utils.getSize(10.0)),
                      Expanded(
                        child: DynamicViews().textField2(
                          label: "Unit",
                          isEnabled: false,
                          asterisk: false,
                          controller: unitCon,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DynamicViews(onTextChanged: (text) {
                          double quantity = double.tryParse(text.toString()) *
                              double.tryParse(lengthCon.text.toString()) *
                              double.tryParse(heightCon.text.toString());

                          TotalQtyCon.text = quantity.toString();
                        }).textField2(
                          label: "Width",
                          isEnabled: true,
                          asterisk: false,
                          keyboard: TextInputType.number,
                          controller: widthCon,
                        ),
                      ),
                      SizedBox(width: Utils.getSize(10.0)),
                      Expanded(
                        child: DynamicViews(onTextChanged: (text) {
                          double quantity = double.tryParse(text.toString()) *
                              double.tryParse(lengthCon.text.toString()) *
                              double.tryParse(widthCon.text.toString());

                          TotalQtyCon.text = quantity.toString();
                        }).textField2(
                          label: "Height",
                          isEnabled: true,
                          asterisk: false,
                          keyboard: TextInputType.number,
                          controller: heightCon,
                        ),
                      )
                    ],
                  ),
                  DynamicViews().textField2(
                    label: "Total Quantity",
                    isEnabled: false,
                    asterisk: false,
                    keyboard: TextInputType.number,
                    controller: TotalQtyCon,
                  ),
                  bottomButtons(),
                ],
              ),
            ),
          ],
        ));
  }

  bool isRTL() => Directionality.of(context)
      .toString()
      .contains(TextDirection.RTL.value.toLowerCase());

  bottomButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: DynamicViews(
                  onTap: () {
                    // if (!validateData()) {
                    //   Utils.showToast("Please check details");
                    // } else {
                    //   model.mainModel.Customer_Name = _customerNameCon.text;
                    //   if (!Utils.checkString(CurrencyId)) {
                    //     model.mainModel.Currency_Id = CurrencyId;
                    //   } else {}
                    //   model.mainModel.Customer_Adderss =
                    //       _customerAddressCon.text.toString();
                    //   model.mainModel.Order_Type = selectedOrderType;
                    //   model.mainModel.Currency = selectedCurrency;
                    //   model.mainModel.CIF_FOB_CNF = selectedCIF;
                    //   model.mainModel.Booking_Date =
                    //       Utils.getSQLFormatDate(entryDateTime);
                    //   // sbFormState.changePage(2, string.ItemDetails, 2);
                    // }
                  },
                  bgColor: RColors.blue,
                  title: 'Add')
              .button(),
        ),
      ],
    );
  }

  static bool validateData() {
    // bool flag = true;
    // if (!Utils.checkString(manualMBNoCon.text.toString())) {
    //   // model.mainModel.Customer_Name = _customerNameCon.text;
    // } else {
    //   Utils.showToast("Please select Location");
    //   flag = false;
    //   return flag;
    // }
    // if (!Utils.checkString(workDetailsCon.text.toString())) {
    // } else {
    //   Utils.showToast("Please select Customer Name");
    //   flag = false;
    //   return flag;
    // }
    // return flag;
  }

  dropDown(label, List<itemCustom> list, String currentUnit) {
    return Container(
      margin:
          EdgeInsets.only(top: Utils.getSize(1.4), bottom: Utils.getSize(24.0)),
      child: DropdownButtonFormField<String>(
        //DropdownButtonHideUnderline
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              fontSize: Utils.getSize(16.0),
              fontFamily: "Lato",
              color: Colors.grey[500]),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(bottom: 0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RColors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RColors.black),
          ),
        ),
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: Utils.getSize(24.0),
        isExpanded: false,
        value: currentUnit,
        style: DynamicViews.textStyle,
        items: list.map((itemCustom value) {
          return new DropdownMenuItem<String>(
            value: value.ItemNo.toString(),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: Utils.getSize(16)),
              width: Utils.getSize(135),
              child: DynamicViews().text2(context, value.ItemNo.toString(), 16,
                  FontWeight.normal, RColors.black, TextAlign.left),
            ),
          );
        }).toList(),
        onChanged: (String newValue) {
          setState(() {
            currentUnit = newValue;
            Utils.showToast("unit=$newValue");
            // setUnitId(currentUnit);
          });
        },
      ),
    );
  }
  dropDowndes(label, List<itemCustom> list, String currentUnit) {
    return Container(
      margin:
          EdgeInsets.only(top: Utils.getSize(1.4), bottom: Utils.getSize(24.0)),
    child: IgnorePointer(
    ignoring:  enabled,
      child: DropdownButtonFormField<String>(
        //DropdownButtonHideUnderline
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              fontSize: Utils.getSize(16.0),
              fontFamily: "Lato",
              color: Colors.grey[500]),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(bottom: 0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RColors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RColors.black),
          ),
        ),
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: Utils.getSize(24.0),
        isExpanded: false,
        value: currentUnit,
        style: DynamicViews.textStyle,
        items: list.map((itemCustom value) {
          return new DropdownMenuItem<String>(
            value: value.Description.toString(),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: Utils.getSize(16)),
              width: Utils.getSize(135),
              child: DynamicViews().text2(context, value.Description.toString(), 16,
                  FontWeight.normal, RColors.black, TextAlign.left),
            ),
          );
        }).toList(),
        onChanged: (String newValue) {
          setState(() {
            currentUnit = newValue;
            // Utils.showToast("unit=$newValue");
            // setUnitId(currentUnit);
          });
        },
      ),)
    );
  }
  dropDownmm(label, List<measurementModeCustom> list, String currentUnit) {
    return Container(
      margin:
          EdgeInsets.only(top: Utils.getSize(1.4), bottom: Utils.getSize(24.0)),
    child: IgnorePointer(
    ignoring:  enabled,
      child: DropdownButtonFormField<String>(
        //DropdownButtonHideUnderline
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              fontSize: Utils.getSize(16.0),
              fontFamily: "Lato",
              color: Colors.grey[500]),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(bottom: 0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RColors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RColors.black),
          ),
        ),
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: Utils.getSize(24.0),
        isExpanded: false,
        value: currentUnit,
        style: DynamicViews.textStyle,
        items: list.map((measurementModeCustom value) {
          return new DropdownMenuItem<String>(
            value: value.actualFormula.toString(),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: Utils.getSize(16)),
              width: Utils.getSize(135),
              child: DynamicViews().text2(context, value.actualFormula.toString(), 16,
                  FontWeight.normal, RColors.black, TextAlign.left),
            ),
          );
        }).toList(),
        onChanged: (String newValue) {
          setState(() {
            currentUnit = newValue;
            // Utils.showToast("unit=$newValue");
            // setUnitId(currentUnit);
          });
        },
      ),)
    );
  }

  Future<List<itemCustom>> getItemno() async {
    String url5item =
        "http://103.133.215.47:8080/app/ecomob/getItemsForBill?EMBWorkId=14";
    final response = await http.post(Uri.parse(url5item));

    Utils.showLog("bv", response.statusCode.toString());
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      itemnolist.addAll(
          parsed.map<itemCustom>((json) => itemCustom.fromJson(json)).toList());
      setState(() {});
      itemnoUnit = itemnolist[0].ItemNo.toString();
      Utils.showLog("bv", "list" + itemnolist.toString());
      return itemnolist;
    } else {
      Utils.showLog("bv", "else");
      throw Exception('Unexpected error occured!');
    }
  }
  Future<List<itemCustom>> getItemDescription() async {
    String url6itemdescrib =
        "http://103.133.215.47:8080/app/ecomob/getDescriptionForBill?EMBWorkId=14";
    final response = await http.post(Uri.parse(url6itemdescrib));

    Utils.showLog("bv", response.statusCode.toString());
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      itemDescriptionlist.addAll(
          parsed.map<itemCustom>((json) => itemCustom.fromJson(json)).toList());
      setState(() {});
      itemdes = itemDescriptionlist[0].Description.toString();
      Utils.showLog("bv", "itemDescriptionlist" + itemDescriptionlist.toString());
      return itemDescriptionlist;
    } else {
      Utils.showLog("bv", "else");
      throw Exception('Unexpected error occured!');
    }
  }
  Future<List<measurementModeCustom>> getMeasurementMode() async {
    String url8MeasurementMode =
        "http://103.133.215.47:8080/app/ecomob/getMeasurementModeForBill?ItemId=50";
    final response = await http.post(Uri.parse(url8MeasurementMode));

    Utils.showLog("bv", response.statusCode.toString());
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      mmodelist.addAll(
          parsed.map<measurementModeCustom>((json) => measurementModeCustom.fromJson(json)).toList());
      setState(() {});
      mmodeunit = mmodelist[0].actualFormula.toString();
      Utils.showLog("bv", "mmodelist" + mmodelist.toString());
      return mmodelist;
    } else {
      Utils.showLog("bv", "else");
      throw Exception('Unexpected error occured!');
    }
  }

  // dropDown(label, List<String> list) {
  //   print(selectedOrderType);
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
  //       value: selectedOrderType,
  //       style: DynamicViews.textStyle,
  //       items: list.map((String model) {
  //         return new DropdownMenuItem<String>(
  //           value: model,
  //           child: Container(
  //             child: DynamicViews().text2(context, model, 16.0,
  //                 FontWeight.normal, RColors.black, TextAlign.left),
  //           ),
  //         );
  //       }).toList(),
  //       onChanged: (String newValue) {
  //         // setState(() {
  //         print(newValue);
  //         if (newValue == "Domestic") {
  //           enabled = false;
  //           selectedCurrency = null;
  //           CurrencyId = "";
  //           selectedCIF = null;
  //         } else {
  //           enabled = true;
  //           selectedOrderType = newValue;
  //         }
  //         setState(() {});
  //         // }
  //         // );
  //       },
  //     ),
  //   );
  // }


  void getpreviousdata() {
    // if (model.mainModel != null) {
    //   try {
    //     if (!Utils.checkString(model.mainModel.Booking_Date)) {
    //       _dateCon.text = Utils.convertDateFormat(
    //           Utils.getBlankIfNull(model.mainModel.Booking_Date),
    //           Utils.sqlDateFormat,
    //           Utils.displayFormatDate);
    //     } else {
    //       _dateCon.text =
    //           DateFormat(Utils.displayFormatDate).format(entryDateTime);
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    //
    //   if (!Utils.checkString(model.mainModel.Booking_Location_Name)) {
    //     _bookingLocationCon.text = model.mainModel.Booking_Location_Name;
    //   }
    //   if (!Utils.checkString(model.mainModel.Customer_Name)) {
    //     _customerNameCon.text = model.mainModel.Customer_Name;
    //   }
    //   // try {
    //   //   if (!Utils.checkString(model.mainModel.Order_Type.toString())) {
    //   //     selectedOrderType = model.mainModel.Order_Type.toString();
    //   //   } else {
    //   //     if (SBEntryModels().OrderTypelist != null &&
    //   //         SBEntryModels().OrderTypelist.length > 0) {
    //   //       selectedOrderType = SBEntryModels().OrderTypelist[0].toString();
    //   //     } else {
    //   //       selectedOrderType = null;
    //   //     }
    //   //   }
    //   // } catch (e) {
    //   //   print(e);
    //   //   selectedOrderType = null;
    //   // }
    //   if (selectedOrderType == "Domestic") {
    //     enabled = false;
    //     selectedCIF=null;
    //     selectedCurrency=null;
    //   } else {
    //     enabled = true;
    //     // try {
    //     //   if (!Utils.checkString(model.mainModel.Currency.toString())) {
    //     //     selectedCurrency = model.mainModel.Currency;
    //     //   } else {
    //     //     if (SBEntryModels().currencylist != null &&
    //     //         SBEntryModels().currencylist.length > 0) {
    //     //       selectedCurrency =
    //     //           SBEntryModels().currencylist[0].Abbreation.toString();
    //     //     } else {
    //     //       selectedCurrency = null;
    //     //     }
    //     //   }
    //     // } catch (e) {
    //     //   print(e);
    //     //   selectedCurrency = null;
    //     // }
    //     try {
    //       if (!Utils.checkString(model.mainModel.CIF_FOB_CNF.toString()) &&
    //           model.mainModel.CIF_FOB_CNF.toString() != "0") {
    //         selectedCIF = model.mainModel.CIF_FOB_CNF;
    //       } else {
    //         selectedCIF = null;
    //       }
    //     } catch (e) {
    //       print(e);
    //       selectedCIF = null;
    //     }
    //   }
    //
    //   if (!Utils.checkString(model.mainModel.Customer_Adderss)) {
    //     _customerAddressCon.text = model.mainModel.Customer_Adderss;
    //   }
    setState(() {});
    // }
  }

  setcurrency(value) {
    // if (SBEntryModels().currencylist != null) {
    //   for (int i = 0; i < SBEntryModels().currencylist.length; i++) {
    //     if (value == (SBEntryModels().currencylist[i].Abbreation.toString())) {
    //       CurrencyId = SBEntryModels().currencylist[i].Currency_ID.toString();
    //       selectedCurrency =
    //           SBEntryModels().currencylist[i].Abbreation.toString();
    //     }
    //   }
    // }
    // Utils.showLog("tag", "value="+value);
    // Utils.showLog("tag", "CurrencyId="+CurrencyId);
    // Utils.showLog("tag", "selectedCurrency="+selectedCurrency);
    setState(() {});
  }

  static void clearData() {
    _dateCon.clear();
    manualMBNoCon.clear();
    workDetailsCon.clear();
    TotalQtyCon.clear();
    unitCon.clear();
    lengthCon.clear();
    widthCon.clear();
    heightCon.clear();
    manualMBReferenceCon.clear();
  }
}
