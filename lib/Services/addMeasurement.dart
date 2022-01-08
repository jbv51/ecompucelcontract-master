import 'package:ecompusellcontractor/Dynamic/DynamicViews.dart';
import 'package:ecompusellcontractor/Services/MainFragment.dart';
import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/SessionManager.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // static Localemain string;

  DateTime entryDateTime = DateTime.now();
  String selectedOrderType, selectedCurrency, selectedCIF;
  List<String> clist = ['1.1', '1.2', '1.3'];
  List<String> clist1 = ['abc', 'def', 'xyz'];
  List<String> clist2 = ['length*width', 'width*height', 'length*width*height'];
  SessionManager sessionManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sessionManager = new SessionManager();
    // if (model == null) model = SBEntryModels();
    getpreviousdata();
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
                  dropDown("Item no", clist),
                  dropDown1("Item Description", clist1),
                  dropDown2("Measurement mode", clist2),
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
                  DynamicViews().textField2(
                    label: "Unit",
                    isEnabled: false,
                    asterisk: false,
                    controller: unitCon,
                  ),
                  DynamicViews(onTextChanged: (text) {
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
                  DynamicViews(onTextChanged: (text) {
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
                  DynamicViews(onTextChanged: (text) {
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
    bool flag = true;
    if (!Utils.checkString(manualMBNoCon.text.toString())) {
      // model.mainModel.Customer_Name = _customerNameCon.text;
    } else {
      Utils.showToast("Please select Location");
      flag = false;
      return flag;
    }
    if (!Utils.checkString(workDetailsCon.text.toString())) {
    } else {
      Utils.showToast("Please select Customer Name");
      flag = false;
      return flag;
    }
    return flag;
  }

  onAttachment() async {
    // sbFormState.changePage(5, string.attachment_details, 1);
  }

  dropDown(label, List<String> list) {
    print(selectedOrderType);
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
        value: selectedOrderType,
        style: DynamicViews.textStyle,
        items: list.map((String model) {
          return new DropdownMenuItem<String>(
            value: model,
            child: Container(
              child: DynamicViews().text2(context, model, 16.0,
                  FontWeight.normal, RColors.black, TextAlign.left),
            ),
          );
        }).toList(),
        onChanged: (String newValue) {
          // setState(() {
          print(newValue);
          if (newValue == "Domestic") {
            enabled = false;
            selectedCurrency = null;
            CurrencyId = "";
            selectedCIF = null;
          } else {
            enabled = true;
            selectedOrderType = newValue;
          }
          setState(() {});
          // }
          // );
        },
      ),
    );
  }

  dropDown1(label, List<String> list) {
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
        value: selectedCurrency,
        style: DynamicViews.textStyle,
        items: list.map((String value) {
          return new DropdownMenuItem<String>(
            value: value.toString(),
            child: Container(
              child: DynamicViews().text2(context, value.toString(), 16.0,
                  FontWeight.normal, RColors.black, TextAlign.left),
            ),
          );
        }).toList(),
        onChanged:
            enabled ? (value) => setState(() => setcurrency(value)) : null,
      ),
    );
  }

  dropDown2(label, List<String> list) {
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
        value: selectedCIF,
        style: DynamicViews.textStyle,
        items: list.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Container(
              child: DynamicViews().text2(context, value, 16.0,
                  FontWeight.normal, RColors.black, TextAlign.left),
            ),
          );
        }).toList(),
        onChanged:
            enabled ? (value) => setState(() => selectedCIF = value) : null,
      ),
    );
  }

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
