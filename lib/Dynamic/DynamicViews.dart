import 'dart:async';
//
// import 'package:farmerp/Common/CommonSingleList.dart';
// import 'package:farmerp/Common/CommonSingleSelection.dart';
// import 'package:farmerp/Common/FilterItem.dart';
// import 'package:farmerp/services/MainFragment/MainFragment.dart';
// import 'package:farmerp/services/taskCalendar/TaskCalendar.dart';

import 'package:ecompusellcontractor/Utility/LocaleBase.dart';
import 'package:ecompusellcontractor/Utility/RColors.dart';
import 'package:ecompusellcontractor/Utility/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'CInputDecorator.dart';
import 'CTextField.dart';

class DynamicViews {
  VoidCallback onTap, onTapIcon, onSuffixClick;
  void Function(String text) onTextChanged;
  String hint;
  TextEditingController controller;
  String title;
  bool _obscureText = true;
  double width;
  BuildContext context;
  Color bgColor;
  static Localemain string;
  static DateTime FromDate, ToDate;

  DynamicViews(
      {this.width,
      this.onTap,
//    this.onTapIcon,
      this.title,
      this.onTextChanged,
      this.hint,
      this.controller,
      this.bgColor,
      this.context,
      this.onSuffixClick});

  verticalDTextDark(context, text1, text2,
      {Color textColor1 = RColors.textColorlight,
      Color textColor2 = RColors.textColorDark}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        DynamicViews().text(
            context, text1, 14, FontWeight.normal, textColor1, TextAlign.start),
        SizedBox(
          height: Utils.getSize(8.0),
        ),
        DynamicViews().text(
            context, text2, 16, FontWeight.bold, textColor2, TextAlign.start),
      ],
    );
  }

  verticalDTextLight(context, text1, text2,
      {Color textColor1 = RColors.textColorlight,
      Color textColor2 = RColors.white}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        DynamicViews().text(
            context, text1, 14, FontWeight.normal, textColor1, TextAlign.start),
        SizedBox(
          height: Utils.getSize(8.0),
        ),
        DynamicViews().text(
            context, text2, 16, FontWeight.bold, textColor2, TextAlign.start),
      ],
    );
  }

  static progressBar(double height, double width, {double topMargin}) {
    topMargin = topMargin == null ? 0 : topMargin;
    return Container(
        margin: EdgeInsets.only(top: Utils.getSize(topMargin)),
        alignment: Alignment.center,
        child: SizedBox(
          height: Utils.getSize(height),
          width: Utils.getSize(width),
          child: CircularProgressIndicator(),
        ));
  }

  text(context, text, double size, wt, color, TextAlign alignment) {
    //multiline
    return Text(
      Utils.getBlankIfNull(text.toString()),
      textAlign: alignment,
      maxLines: null,
      style: TextStyle(
          fontSize: Utils.getSize(size), fontWeight: wt, color: color),
    );
  }

  // final Uint8List fontData = File('open-sans.ttf').readAsBytesSync();
  // final ttf =
  //     pw.Font.ttf(File('open-sans.ttf').readAsBytesSync().buffer.asByteData());

  pdfText(context, String text, double size, pw.FontWeight wt, String color,
      pw.TextAlign alignment,
      {int maxLines}) {
    return pw.Text(
      Utils.getBlankIfNull(text.toString()),
      textAlign: alignment,
      maxLines: maxLines,
      // softWrap:true ,
      // overflow: TextOverflow.ellipsis,
      style: pw.TextStyle(
        fontSize: size,
        fontWeight: wt,
        color: PdfColor.fromHex(color),
        // font: ttf
      ),
    );
  }

  // pdfText2(context, text, double size, wt, color, alignment) {
  //   return pw.Text(
  //     Utils.getBlankIfNull(text),
  //     textAlign: alignment,
  //     overflow: pw.TextOverflow.ellipsis,
  //     style:pw. TextStyle(
  //         fontSize: Utils.getSize(size),
  //         fontWeight: wt,
  //         color: color,
  //         fontFamily: "Lato"),
  //   );
  // }

  // textWithUnderline(
  //     context, text, double size, wt, color, TextAlign alignment, bool mStd) {
  //   return Text(
  //     Utils.getBlankIfNull(text.toString()),
  //     textAlign: alignment,
  //     maxLines: null,
  //     style: mStd
  //         ? TextStyle(
  //             // decorationThickness: 2,
  //             // decoration: TextDecoration.underline,
  //             // decorationStyle: TextDecorationStyle.solid,
  //             // decorationColor: RColors.bluishGreen,
  //             fontSize: Utils.getSize(size),
  //             fontWeight: wt,
  //             color: color,
  //             fontFamily: "Lato")
  //         : TextStyle(
  //             fontSize: Utils.getSize(size),
  //             fontWeight: wt,
  //             color: color,
  //             fontFamily: "Lato"),
  //   );
  // }

  textMaxLine(
      context, text, double size, wt, color, TextAlign alignment, int maxLine) {
    return Text(
      Utils.getBlankIfNull(text.toString()),
      textAlign: alignment,
      maxLines: maxLine,
      softWrap: true,
      style: TextStyle(
          fontSize: Utils.getSize(size),
          fontWeight: wt,
          color: color,
          fontFamily: "Lato"),
    );
  }

  textSingleLine(context, text, double size, wt, color, TextAlign alignment) {
    return Text(
      text,
      textAlign: alignment,
      maxLines: 1,
      style: TextStyle(
          fontSize: Utils.getSize(size),
          fontWeight: wt,
          color: color,
          fontFamily: "Lato"),
    );
  }

  text2(context, text, double size, wt, color, TextAlign alignment) {
    //its for single line ellipsis
    return Text(
      Utils.getBlankIfNull(text),
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: Utils.getSize(size), fontWeight: wt, color: color),
    );
  }

  text3(context, text, double size, wt, color, alignment) {
    return Text(
      Utils.getBlankIfNull(text),
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: Utils.getSize(size), fontWeight: wt, color: color
              // , backgroundColor: Colors.grey[400]
              ),
    );
  }

  static line() {
    return Container(
      height: 1,
      width: double.infinity,
      color: RColors.black,
    );
  }

  largeTextField(
      {TextEditingController controller,
      String label,
      bool isEnabled,
      bool asterisk}) {
    return new Container(
        color: RColors.bgColor,
        height: Utils.getSize(100.0),
        margin: EdgeInsets.only(bottom: Utils.getSize(16)),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                // child: ConstrainedBox(
                // constraints: new BoxConstraints(
                //   minHeight: Utils.getSize(99.0),
                // ),
                height: Utils.getSize(99.0),
                child: CTextField(
                  maxLength: 250,
                  controller: controller,
                  style: DynamicViews.textStyle,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,

                  enabled: isEnabled,
//                  focusNode: myFocusNode,
                  textAlign: TextAlign.start,
                  decoration: new CInputDecoration(
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    counterText: '',
                    contentPadding: EdgeInsets.all(Utils.getSize(10.0)),
//                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: label,
                    isMandate: asterisk,
                    labelStyle: TextStyle(
                        fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                            Utils.getSize(16.0),
                        fontFamily: "Lato",
                        //I believe the size difference here is 6.0 to account padding
                        color:
//                            myFocusNode.hasFocus ? Colors.blue :
                            Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              height: 1,
              width: double.infinity,
            )
          ],
        ));
  }

  icon(context, IconData icon, double size, {Color color}) {
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Icon(
              icon,
              color: color,
              size: Utils.getSize(size),
//        fit: BoxFit.contain,
            ),
          )
        : Icon(
            icon,
            color: color,
            size: Utils.getSize(size),
//        fit: BoxFit.contain,
          );
  }

  imageNetwork(context, String path, double size) {
    if (Utils.checkString(path)) path = "";
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Image.network(
              path,
              height: Utils.getSize(size),
              fit: BoxFit.contain,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace stackTrace) {
                return Container();
              },
            ),
          )
        : Image.network(
            path,
            height: Utils.getSize(size),
            fit: BoxFit.contain,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Container();
            },
          );
  }

  imageAsset(context, path, double size, bool MatchTextDirection) {
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Image.asset(path,
                height: Utils.getSize(size),
                fit: BoxFit.contain,
                matchTextDirection: true),
          )
        : Image.asset(path,
            height: Utils.getSize(size),
            fit: BoxFit.contain,
            matchTextDirection: true);
  }

  svgImageAsset(context, path, double size, {Color color, BoxFit boxfit}) {
    if (color == null) color = RColors.iconColor;
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: SvgPicture.asset(
              path,
              color: color,
              fit: BoxFit.contain,
              height: Utils.getSize(size),
              width: Utils.getSize(size),
              // semanticsLabel: 'Acme Logo'
            ),
          )
        : SvgPicture.asset(
            path,
            color: color,
            fit: BoxFit.contain,
            height: Utils.getSize(size),
            width: Utils.getSize(size),
            // semanticsLabel: 'Acme Logo'
          );
  }

  imageAsset2(context, path, double size, Color color, {bool isSVG}) {
    if (isSVG != null && isSVG)
      return onTap != null
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onTap(),
              child: SvgPicture.asset(
                path,
                color: color,
                fit: BoxFit.contain,
                height: Utils.getSize(size),
                width: Utils.getSize(size),
                // matchTextDirection:iconDirection,
                // semanticsLabel: 'Acme Logo'
              ),
            )
          : SvgPicture.asset(
              path,
              fit: BoxFit.contain,
              color: color,
              height: Utils.getSize(size),
              width: Utils.getSize(size),
              // matchTextDirection:iconDirection,
              // semanticsLabel: 'Acme Logo'
            );
    else
      return onTap != null
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onTap(),
              child: Image.asset(
                path,
                color: color,
                height: Utils.getSize(size),
                fit: BoxFit.contain,
                // matchTextDirection:iconDirection,
              ))
          : Image.asset(
              path,
              color: color,
              height: Utils.getSize(size),
              fit: BoxFit.contain,
              // matchTextDirection:iconDirection,
            );
  }

  String changedText = "";

  textField(
      {String label,
      controller,
      bool isEnabled,
      bool asterisk,
      TextInputType keyboard,
      showLine,
      int maxLength,
      double bottomHT,
      List<TextInputFormatter> inputFormatters,
      String errormsg,
      String hintText}) {
    showLine = showLine == null ? true : showLine;
    hintText = Utils.checkString(hintText) ? "" : hintText;
//    FocusNode myFocusNode = new FocusNode();
    label = Utils.checkString(label) ? "" : label;
    if (maxLength == null || maxLength == 0) {
      maxLength = 50;
    }
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Container(
              margin: EdgeInsets.only(
                  top: Utils.getSize(2.0),
                  bottom: Utils.getSize(bottomHT == null ? 24.0 : bottomHT)),
              alignment: Alignment.center,
//            height: 84,
              child: Column(
                children: <Widget>[
//            Theme(
//                data: new ThemeData(hintColor: Colors.grey[400]),
//                child:
                  CTextField(
                    keyboardType: keyboard,
                    enabled: isEnabled,
                    // maxLengthEnforced:true,
//                  focusNode: myFocusNode,
                    maxLength: maxLength,
                    controller: controller,
                    inputFormatters: inputFormatters,
                    textAlign: TextAlign.start,
                    style: DynamicViews.textStyle,
                    onChanged: (newVal) {
                      if (newVal.length <= maxLength) {
                        changedText = newVal;
                      } else {
                        controller.value = new TextEditingValue(
                            text: changedText,
                            selection: new TextSelection(
                                baseOffset: maxLength,
                                extentOffset: maxLength,
                                affinity: TextAffinity.downstream,
                                isDirectional: false),
                            composing: new TextRange(start: 0, end: maxLength));
                        // _controller.text = text;
                      }
                      if(onTextChanged!=null)
                      onTextChanged(newVal);
                    },
                    decoration: new CInputDecoration(
                      alignLabelWithHint: true,
                      counterText: '',
                      contentPadding:
                          EdgeInsets.only(bottom: Utils.getSize(8.0)),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorText: errormsg,
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                       hintText: hintText,
//                hintStyle: TextStyle(
//                    fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                        Utils.getSize(16.0),
//                    //I believe the size difference here is 6.0 to account padding
//                    color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                        Colors.grey[400]),
                      labelText: label,
                      isMandate: asterisk,
                      labelStyle: TextStyle(
                          fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                              Utils.getSize(16.0),
                          fontFamily: "Lato",
                          //I believe the size difference here is 6.0 to account padding
                          color:
//                            myFocusNode.hasFocus ? Colors.blue :
                              Colors.grey[500]),
//                    hintStyle: TextStyle(height: 0),
                    ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                  ),
//            ),
                  showLine
                      ? Container(
                          height: 1,
                          width: double.infinity,
                          color: RColors.black,
                        )
                      : Container()
                ],
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(
                top: Utils.getSize(2.0),
                bottom: Utils.getSize(bottomHT == null ? 24.0 : bottomHT)),
            alignment: Alignment.center,
//            height: 84,
            child: Column(
              children: <Widget>[
//            Theme(
//                data: new ThemeData(hintColor: Colors.grey[400]),
//                child:
                CTextField(
                  keyboardType: keyboard,
                  enabled: isEnabled,

//                  focusNode: myFocusNode,
                  maxLength: maxLength,
                  controller: controller,
                  inputFormatters: inputFormatters,
                  textAlign: TextAlign.start,
                  style: DynamicViews.textStyle,
                  onChanged: (newVal) {
                    if (newVal.length <= maxLength) {
                      changedText = newVal;
                    } else {
                      controller.value = new TextEditingValue(
                          text: changedText,
                          selection: new TextSelection(
                              baseOffset: maxLength,
                              extentOffset: maxLength,
                              affinity: TextAffinity.downstream,
                              isDirectional: false),
                          composing: new TextRange(start: 0, end: maxLength));
                      // _controller.text = text;
                    }
                    onTextChanged(newVal);
                  },
                  decoration: new CInputDecoration(
                    alignLabelWithHint: true,
                    counterText: '',
                    contentPadding: EdgeInsets.only(bottom: Utils.getSize(8.0)),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorText: errormsg,
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                hintText: label,
//                hintStyle: TextStyle(
//                    fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                        Utils.getSize(16.0),
//                    //I believe the size difference here is 6.0 to account padding
//                    color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                        Colors.grey[400]),
                    labelText: label,
                    isMandate: asterisk,
                    labelStyle: TextStyle(
                        fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                            Utils.getSize(16.0),
                        fontFamily: "Lato",
                        //I believe the size difference here is 6.0 to account padding
                        color:
//                            myFocusNode.hasFocus ? Colors.blue :
                            Colors.grey[500]),
//                    hintStyle: TextStyle(height: 0),
                  ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                ),
//            ),
                showLine
                    ? Container(
                        height: 1,
                        width: double.infinity,
                        color: RColors.black,
                      )
                    : Container()
              ],
            ),
          );
  }
  textFieldcaps(
      {String label,
      controller,
      bool isEnabled,
      bool asterisk,
      bool caps,
      TextInputType keyboard,
      showLine,
      int maxLength,
      double bottomHT,
      List<TextInputFormatter> inputFormatters,
      String errormsg,
      String hintText}) {
    showLine = showLine == null ? true : showLine;
    hintText = Utils.checkString(hintText) ? "" : hintText;
//    FocusNode myFocusNode = new FocusNode();
    label = Utils.checkString(label) ? "" : label;
    if (maxLength == null || maxLength == 0) {
      maxLength = 50;
    }
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Container(
              margin: EdgeInsets.only(
                  top: Utils.getSize(2.0),
                  bottom: Utils.getSize(bottomHT == null ? 24.0 : bottomHT)),
              alignment: Alignment.center,
//            height: 84,
              child: Column(
                children: <Widget>[
//            Theme(
//                data: new ThemeData(hintColor: Colors.grey[400]),
//                child:
                  CTextField(
                    keyboardType: keyboard,
                    enabled: isEnabled,
                    // maxLengthEnforced:true,
//                  focusNode: myFocusNode,
                    maxLength: maxLength,
                    controller: controller,
                    textCapitalization:caps? TextCapitalization.characters:TextCapitalization.none,
                    inputFormatters: inputFormatters,
                    textAlign: TextAlign.start,
                    style: DynamicViews.textStyle,
                    onChanged: (newVal) {
                      if (newVal.length <= maxLength) {
                        changedText = newVal;
                      } else {
                        controller.value = new TextEditingValue(
                            text: changedText,
                            selection: new TextSelection(
                                baseOffset: maxLength,
                                extentOffset: maxLength,
                                affinity: TextAffinity.downstream,
                                isDirectional: false),
                            composing: new TextRange(start: 0, end: maxLength));
                        // _controller.text = text;
                      }
                      onTextChanged(newVal);
                    },
                    decoration: new CInputDecoration(
                      alignLabelWithHint: true,
                      counterText: '',
                      contentPadding:
                          EdgeInsets.only(bottom: Utils.getSize(8.0)),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorText: errormsg,
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                       hintText: hintText,
//                hintStyle: TextStyle(
//                    fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                        Utils.getSize(16.0),
//                    //I believe the size difference here is 6.0 to account padding
//                    color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                        Colors.grey[400]),
                      labelText: label,
                      isMandate: asterisk,
                      labelStyle: TextStyle(
                          fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                              Utils.getSize(16.0),
                          fontFamily: "Lato",
                          //I believe the size difference here is 6.0 to account padding
                          color:
//                            myFocusNode.hasFocus ? Colors.blue :
                              Colors.grey[500]),
//                    hintStyle: TextStyle(height: 0),
                    ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                  ),
//            ),
                  showLine
                      ? Container(
                          height: 1,
                          width: double.infinity,
                          color: RColors.black,
                        )
                      : Container()
                ],
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(
                top: Utils.getSize(2.0),
                bottom: Utils.getSize(bottomHT == null ? 24.0 : bottomHT)),
            alignment: Alignment.center,
//            height: 84,
            child: Column(
              children: <Widget>[
//            Theme(
//                data: new ThemeData(hintColor: Colors.grey[400]),
//                child:
                CTextField(
                  keyboardType: keyboard,
                  enabled: isEnabled,

//                  focusNode: myFocusNode,
                  maxLength: maxLength,
                  controller: controller,
                  inputFormatters: inputFormatters,
                  textAlign: TextAlign.start,
                  textCapitalization:caps? TextCapitalization.characters:TextCapitalization.none,
                  style: DynamicViews.textStyle,
                  onChanged: (newVal) {
                    if (newVal.length <= maxLength) {
                      changedText = newVal;
                    } else {
                      controller.value = new TextEditingValue(
                          text: changedText,
                          selection: new TextSelection(
                              baseOffset: maxLength,
                              extentOffset: maxLength,
                              affinity: TextAffinity.downstream,
                              isDirectional: false),
                          composing: new TextRange(start: 0, end: maxLength));
                      // _controller.text = text;
                    }
                    onTextChanged(newVal);
                  },
                  decoration: new CInputDecoration(
                    alignLabelWithHint: true,
                    counterText: '',
                    contentPadding: EdgeInsets.only(bottom: Utils.getSize(8.0)),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorText: errormsg,
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                hintText: label,
//                hintStyle: TextStyle(
//                    fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                        Utils.getSize(16.0),
//                    //I believe the size difference here is 6.0 to account padding
//                    color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                        Colors.grey[400]),
                    labelText: label,
                    isMandate: asterisk,
                    labelStyle: TextStyle(
                        fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                            Utils.getSize(16.0),
                        fontFamily: "Lato",
                        //I believe the size difference here is 6.0 to account padding
                        color:
//                            myFocusNode.hasFocus ? Colors.blue :
                            Colors.grey[500]),
//                    hintStyle: TextStyle(height: 0),
                  ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                ),
//            ),
                showLine
                    ? Container(
                        height: 1,
                        width: double.infinity,
                        color: RColors.black,
                      )
                    : Container()
              ],
            ),
          );
  }

  validateQtyFormat(String text, controller) {
    Utils.showLog("text", text.toString());
    List<String> val = [];
    if (text.contains(".")) {
      val = text.split(".");
      Utils.showLog("val", val.toString());
      String finalTxt;
      if (val[1].length > 2) val[1] = val[1].substring(0, 2);
      // finalTxt = double.parse(val[0] + "." + val[1]).toStringAsFixed(2);
      // else
      finalTxt = val[0] + "." + val[1];
      controller.value = controller.value.copyWith(
        text: finalTxt,
        selection: TextSelection(
            baseOffset: finalTxt.length, extentOffset: finalTxt.length),
      );
    }
  }

  textFormField(
      {String label,
      controller,
      bool isEnabled,
      bool asterisk,
      TextInputType keyboard,
      showLine,
      int maxLength,
      double bottomHT,
      var validator,
      List<TextInputFormatter> inputFormatters,
      String errormsg,
      Color lineColor}) {
    showLine = showLine == null ? true : showLine;
//    FocusNode myFocusNode = new FocusNode();
    label = Utils.checkString(label) ? "" : label;
    if (maxLength == null || maxLength == 0) {
      maxLength = 50;
    }
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Container(
              margin: EdgeInsets.only(
                  top: Utils.getSize(2.0),
                  bottom: Utils.getSize(bottomHT == null ? 24.0 : bottomHT)),
              alignment: Alignment.center,
//            height: 84,
              child: Column(
                children: <Widget>[
//            Theme(
//                data: new ThemeData(hintColor: Colors.grey[400]),
//                child:
                  TextFormField(
                    keyboardType: keyboard,
                    enabled: isEnabled,

//                  focusNode: myFocusNode,
                    maxLength: maxLength,
                    controller: controller,
                    inputFormatters: inputFormatters,
                    textAlign: TextAlign.start,
                    style: DynamicViews.textStyle,
                    onChanged: onTextChanged,
                    validator: validator,
                    decoration: new InputDecoration(
                      alignLabelWithHint: true,
                      counterText: '',
                      contentPadding:
                          EdgeInsets.only(bottom: Utils.getSize(8.0)),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorText: errormsg,
                      labelText: label,
                      // isMandate: asterisk,
                      labelStyle: TextStyle(
                          fontSize: Utils.getSize(16.0),
                          fontFamily: "Lato",
                          color: Colors.grey[500]),
                    ),
                  ),
                  showLine
                      ? Container(
                          height: 1,
                          width: double.infinity,
                          color: lineColor != null ? lineColor : RColors.black,
                        )
                      : Container()
                ],
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(
                top: Utils.getSize(2.0),
                bottom: Utils.getSize(bottomHT == null ? 24.0 : bottomHT)),
            alignment: Alignment.center,
//            height: 84,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: keyboard,
                  enabled: isEnabled,

//                  focusNode: myFocusNode,
                  maxLength: maxLength,
                  controller: controller,
                  inputFormatters: inputFormatters,
                  textAlign: TextAlign.start,
                  style: DynamicViews.textStyle,
                  onChanged: onTextChanged,
                  validator: validator,
                  decoration: new InputDecoration(
                    alignLabelWithHint: true,
                    counterText: '',
                    contentPadding: EdgeInsets.only(bottom: Utils.getSize(8.0)),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorText: errormsg,
                    labelText: label,
                    labelStyle: TextStyle(
                        fontSize: Utils.getSize(16.0),
                        fontFamily: "Lato",
                        color: Colors.grey[500]),
                  ),
                ),
                showLine
                    ? Container(
                        height: 1,
                        width: double.infinity,
                        color: lineColor != null ? lineColor : RColors.black,
                      )
                    : Container()
              ],
            ),
          );
  }

  textField2(
      //use only if image required
      {String label,
      controller,
      bool isEnabled,
      bool asterisk,
      bool svgimage,
      TextInputType keyboard,
      String path,
      double imgSize,
      Color color,
      Color fontColor,
      int maxLength,
      Color lineColor,
      List<TextInputFormatter> inputFormatters,
      Function onClickIcon,
      int maxLines}) {
//    FocusNode myFocusNode = new FocusNode();
    onClickIcon = onClickIcon ?? () {};
    label = Utils.checkString(label) ? "" : label;
    if (maxLength == null || maxLength == 0) {
      maxLength = 50;
    }
    svgimage = svgimage == null ? false : svgimage;
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Container(
              margin: EdgeInsets.only(
                  top: Utils.getSize(2.0), bottom: Utils.getSize(24.0)),
              alignment: Alignment.center,
//            height: 84,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
//                    child: Theme(
//                        data: new ThemeData(hintColor: Colors.grey[400]),
                        child: CTextField(
                          keyboardType: keyboard,
                          enabled: isEnabled,
                          maxLength: maxLength,
                          maxLines:
                              maxLines != null && maxLines > 0 ? maxLines : 1,
//                  focusNode: myFocusNode,
                          onChanged: (newVal) {
                            if (newVal.length <= maxLength) {
                              changedText = newVal;
                            } else {
                              controller.value = new TextEditingValue(
                                  text: changedText,
                                  selection: new TextSelection(
                                      baseOffset: maxLength,
                                      extentOffset: maxLength,
                                      affinity: TextAffinity.downstream,
                                      isDirectional: false),
                                  composing:
                                      new TextRange(start: 0, end: maxLength));
                              // _controller.text = text;
                            }
                            onTextChanged(newVal);
                          },
                          controller: controller,
                          inputFormatters: inputFormatters,
                          textAlign: TextAlign.start,
                          style: DynamicViews.textStyle,

                          decoration: new CInputDecoration(
                            alignLabelWithHint: true,
                            contentPadding:
                                EdgeInsets.only(bottom: Utils.getSize(8.0)),
                            counterText: '',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,

//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                            hintText: label,
//                            hintStyle: TextStyle(
//                                fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                                Utils.getSize(16.0),
//                                //I believe the size difference here is 6.0 to account padding
//                                color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                                Colors.grey[300]),
                            labelText: label,
                            isMandate: asterisk,
                            labelStyle: TextStyle(
                                fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                                    Utils.getSize(16.0),
                                fontFamily: "Lato",
                                //I believe the size difference here is 6.0 to account padding
                                color:
//                            myFocusNode.hasFocus ? Colors.blue :
                                    fontColor != null
                                        ? fontColor
                                        : Colors.black),
//                    hintStyle: TextStyle(height: 0),
                          ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                        ),
//                    ),
                      ),
                      if (!Utils.checkString(path))
                        if (svgimage)
                          //
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => onClickIcon(),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: Utils.getSize(10)),
                                  child: IgnorePointer(
                                      child: svgImageAsset(
                                    context,
                                    path,
                                    imgSize,
                                  ))))
                        else
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => onClickIcon(),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: Utils.getSize(10.0)),
                                  child: IgnorePointer(
                                      child: imageAsset2(
                                          context,
                                          path,
                                          imgSize,
                                          color != null
                                              ? color
                                              : RColors.textColorlight))))
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: lineColor != null ? lineColor : RColors.black,
                  )
                ],
              ),
            ))
        : Container(
            margin: EdgeInsets.only(
                top: Utils.getSize(2.0), bottom: Utils.getSize(24.0)),
            alignment: Alignment.center,
//            height: 84,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
//                    child: Theme(
//                        data: new ThemeData(hintColor: Colors.grey[400]),
                      child: CTextField(
                        keyboardType: keyboard,
                        enabled: isEnabled,
                        maxLength: maxLength,
//                  focusNode: myFocusNode,
                        onChanged: (newVal) {
                          if (newVal.length <= maxLength) {
                            changedText = newVal;
                          } else {
                            controller.value = new TextEditingValue(
                                text: changedText,
                                selection: new TextSelection(
                                    baseOffset: maxLength,
                                    extentOffset: maxLength,
                                    affinity: TextAffinity.downstream,
                                    isDirectional: false),
                                composing:
                                    new TextRange(start: 0, end: maxLength));
                            // _controller.text = text;
                          }
                          onTextChanged(newVal);
                        },
                        controller: controller,
                        inputFormatters: inputFormatters,
                        textAlign: TextAlign.start,
                        style: DynamicViews.textStyle,

                        decoration: new CInputDecoration(
                          alignLabelWithHint: true,
                          contentPadding:
                              EdgeInsets.only(bottom: Utils.getSize(8.0)),
                          counterText: '',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                            hintText: label,
//                            hintStyle: TextStyle(
//                                fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                                Utils.getSize(16.0),
//                                //I believe the size difference here is 6.0 to account padding
//                                color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                                Colors.grey[300]),
                          labelText: label,
                          isMandate: asterisk,
                          labelStyle: TextStyle(
                              fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                                  Utils.getSize(16.0),
                              fontFamily: "Lato",
                              //I believe the size difference here is 6.0 to account padding
                              color:
//                            myFocusNode.hasFocus ? Colors.blue :
                                  Colors.grey[500]),
//                    hintStyle: TextStyle(height: 0),
                        ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                      ),
//                    ),
                    ),
                    if (!Utils.checkString(path))
                      IgnorePointer(
                          //absorbpointer
                          // old replace new by JP told by bharat for suffix
                          // child: Container(
                          //     margin:
                          //         EdgeInsets.only(bottom: Utils.getSize(10.0)),
                          //     child: imageAsset2(
                          //         context,
                          //         path,
                          //         imgSize,
                          //         color != null
                          //             ? color
                          //             : RColors.textColorlight)))

                          child: GestureDetector(
                              onTap: () => onSuffixClick(),
                              child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: Utils.getSize(10.0)),
                                  child: imageAsset2(
                                      context,
                                      path,
                                      imgSize,
                                      color != null
                                          ? color
                                          : RColors.textColorlight))))
                  ],
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: lineColor != null ? lineColor : RColors.black,
                )
              ],
            ),
          );
  }

  textField3(
      //use only if image required
      {String label,
      controller,
      bool isEnabled,
      bool asterisk,
      bool svgimage,
      TextInputType keyboard,
      String path,
      double imgSize,
      Color color,
      int maxLength,
      Color lineColor,
      List<TextInputFormatter> inputFormatters,
      Function onClickIcon}) {
//    FocusNode myFocusNode = new FocusNode();
    onClickIcon = onClickIcon ?? () {};
    label = Utils.checkString(label) ? "" : label;
    if (maxLength == null || maxLength == 0) {
      maxLength = 50;
    }
    svgimage = svgimage == null ? false : svgimage;
    return onTap != null
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(),
            child: Container(
              margin: EdgeInsets.only(
                  top: Utils.getSize(2.0), bottom: Utils.getSize(5.0)),
              alignment: Alignment.center,
//            height: 84,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
//                    child: Theme(
//                        data: new ThemeData(hintColor: Colors.grey[400]),
                        child: CTextField(
                          keyboardType: keyboard,
                          enabled: isEnabled,
                          maxLength: maxLength,
//                  focusNode: myFocusNode,
                          onChanged: (newVal) {
                            if (newVal.length <= maxLength) {
                              changedText = newVal;
                            } else {
                              controller.value = new TextEditingValue(
                                  text: changedText,
                                  selection: new TextSelection(
                                      baseOffset: maxLength,
                                      extentOffset: maxLength,
                                      affinity: TextAffinity.downstream,
                                      isDirectional: false),
                                  composing:
                                      new TextRange(start: 0, end: maxLength));
                              // _controller.text = text;
                            }
                            onTextChanged(newVal);
                          },
                          controller: controller,
                          inputFormatters: inputFormatters,
                          textAlign: TextAlign.start,
                          style: DynamicViews.textStyle,

                          decoration: new CInputDecoration(
                            alignLabelWithHint: true,
                            contentPadding:
                                EdgeInsets.only(bottom: Utils.getSize(8.0)),
                            counterText: '',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,

//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                            hintText: label,
//                            hintStyle: TextStyle(
//                                fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                                Utils.getSize(16.0),
//                                //I believe the size difference here is 6.0 to account padding
//                                color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                                Colors.grey[300]),
                            labelText: label,
                            isMandate: asterisk,
                            labelStyle: TextStyle(
                                fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                                    Utils.getSize(16.0),
                                fontFamily: "Lato",
                                //I believe the size difference here is 6.0 to account padding
                                color:
//                            myFocusNode.hasFocus ? Colors.blue :
                                    Colors.black),
//                    hintStyle: TextStyle(height: 0),
                          ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                        ),
//                    ),
                      ),
                      if (!Utils.checkString(path))
                        if (svgimage)
                          //
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => onClickIcon(),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: Utils.getSize(10)),
                                  child: IgnorePointer(
                                      child: svgImageAsset(
                                    context,
                                    path,
                                    imgSize,
                                  ))))
                        else
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => onClickIcon(),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: Utils.getSize(10.0)),
                                  child: IgnorePointer(
                                      child: imageAsset2(
                                          context,
                                          path,
                                          imgSize,
                                          color != null
                                              ? color
                                              : RColors.textColorlight))))
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: lineColor != null ? lineColor : RColors.black,
                  )
                ],
              ),
            ))
        : Container(
            margin: EdgeInsets.only(
                top: Utils.getSize(2.0), bottom: Utils.getSize(5.0)),
            alignment: Alignment.center,
//            height: 84,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
//                    child: Theme(
//                        data: new ThemeData(hintColor: Colors.grey[400]),
                      child: CTextField(
                        keyboardType: keyboard,
                        enabled: isEnabled,
                        maxLength: maxLength,
//                  focusNode: myFocusNode,
                        onChanged: (newVal) {
                          if (newVal.length <= maxLength) {
                            changedText = newVal;
                          } else {
                            controller.value = new TextEditingValue(
                                text: changedText,
                                selection: new TextSelection(
                                    baseOffset: maxLength,
                                    extentOffset: maxLength,
                                    affinity: TextAffinity.downstream,
                                    isDirectional: false),
                                composing:
                                    new TextRange(start: 0, end: maxLength));
                            // _controller.text = text;
                          }
                          onTextChanged(newVal);
                        },
                        controller: controller,
                        inputFormatters: inputFormatters,
                        textAlign: TextAlign.start,
                        style: DynamicViews.textStyle,

                        decoration: new CInputDecoration(
                          alignLabelWithHint: true,
                          contentPadding:
                              EdgeInsets.only(bottom: Utils.getSize(8.0)),
                          counterText: '',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: RColors.black),
//                    ),
//                            hintText: label,
//                            hintStyle: TextStyle(
//                                fontSize:
////                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
//                                Utils.getSize(16.0),
//                                //I believe the size difference here is 6.0 to account padding
//                                color:
////                            myFocusNode.hasFocus ? Colors.blue :
//                                Colors.grey[300]),
                          labelText: label,
                          isMandate: asterisk,
                          labelStyle: TextStyle(
                              fontSize:
//                        myFocusNode.hasFocus ? Utils.getSize(16.0) :
                                  Utils.getSize(16.0),
                              fontFamily: "Lato",
                              //I believe the size difference here is 6.0 to account padding
                              color:
//                            myFocusNode.hasFocus ? Colors.blue :
                                  Colors.black),
//                    hintStyle: TextStyle(height: 0),
                        ),
//                  autofocus: false,
//                  style: new TextStyle(fontSize: myFocusNode.hasFocus ? 16:16,color: Colors.black),
                      ),
//                    ),
                    ),
                    if (!Utils.checkString(path))
                      IgnorePointer(
                          //absorbpointer
                          // old replace new by JP told by bharat for suffix
                          // child: Container(
                          //     margin:
                          //         EdgeInsets.only(bottom: Utils.getSize(10.0)),
                          //     child: imageAsset2(
                          //         context,
                          //         path,
                          //         imgSize,
                          //         color != null
                          //             ? color
                          //             : RColors.textColorlight)))

                          child: GestureDetector(
                              onTap: () => onSuffixClick(),
                              child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: Utils.getSize(10.0)),
                                  child: imageAsset2(
                                      context,
                                      path,
                                      imgSize,
                                      color != null
                                          ? color
                                          : RColors.textColorlight))))
                  ],
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: lineColor != null ? lineColor : RColors.black,
                )
              ],
            ),
          );
  }

  dateCircle(date, month) {
    return Container(
      margin: EdgeInsets.only(
          top: Utils.getSize(6.0),
          bottom: Utils.getSize(6.0),
          right: Utils.getSize(10.0),
          left: Utils.getSize(8.0)),
      height: Utils.getSize(48.0),
      width: Utils.getSize(48.0),
      decoration: new BoxDecoration(
        color: RColors.bgBottomNavigation,
        shape: BoxShape.circle,
      ),
      child: new Center(
          child: Container(
        height: Utils.getSize(37.0),
        child: Stack(
//                      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: DynamicViews().text(context, date, 20, FontWeight.normal,
                    RColors.white, TextAlign.center),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    child: DynamicViews().text(context, month, 12,
                        FontWeight.normal, RColors.white, TextAlign.center)))
          ],
        ),
      )),
    );
  }

  static sizedBox({double width, double height}) {
    if (width != null && height != null)
      return SizedBox(
        width: Utils.getSize(width),
        height: Utils.getSize(height),
      );
    else if (width != null)
      return SizedBox(
        width: Utils.getSize(width),
      );
    else if (height != null)
      return SizedBox(
        height: Utils.getSize(height),
      );
  }

  static pdfSizedBox({double width, double height}) {
    if (width != null && height != null)
      return pw.SizedBox(
        width: Utils.getSize(width),
        height: Utils.getSize(height),
      );
    else if (width != null)
      return pw.SizedBox(
        width: Utils.getSize(width),
      );
    else if (height != null)
      return pw.SizedBox(
        height: Utils.getSize(height),
      );
  }

  static TextStyle textStyle = TextStyle(
      color: RColors.black, fontSize: Utils.getSize(16.0), fontFamily: "Lato");

  bool isRTL() => Directionality.of(context)
      .toString()
      .contains(TextDirection.RTL.value.toLowerCase());

  appBarBB() {
    //BackButton
    return Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          // borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              blurRadius: 10.0,
              offset: const Offset(0.0, 5.0),
            ),
          ],
        ),
        // alignment: Alignment.centerLeft,
        padding: EdgeInsetsDirectional.only(
            start: Utils.getSize(16.0), end: Utils.getSize(16.0)),
        height: Utils.getSize(56.0),
        // decoration: BoxDecoration(color: Colors.white),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              if (onTap == null) {
                Navigator.pop(context);
              } else
                onTap();
            },
            child: DynamicViews().imageAsset2(
              context,
              "assets/rebootDesign/BackArrow@3x.png",
              18,
              RColors.black,
            ),
          ),
          SizedBox(
            width: Utils.getSize(20.0),
          ),
          Expanded(
              child: DynamicViews().text2(context, title, 20, FontWeight.bold,
                  RColors.black, TextAlign.start)), //bgAppBar
        ]));
  }
//
//   appBarBB2({bool removeToolBar, String secondOpt, VoidCallback onTapSecOpt}) {
//     removeToolBar = removeToolBar ?? true;
//     onTapSecOpt = onTapSecOpt ?? () {};
//     //BackButton
//     return Container(
//         decoration: new BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.rectangle,
//           // borderRadius: BorderRadius.circular(5),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey[350],
//               blurRadius: 10.0,
//               offset: const Offset(0.0, 5.0),
//             ),
//           ],
//         ),
//         // alignment: Alignment.centerLeft,
//         padding: EdgeInsetsDirectional.only(
//             // top: Utils.getSize(16.0),
//             start: Utils.getSize(16.0),
//             end: Utils.getSize(16.0)),
//         height: Utils.getSize(56.0),
//         // decoration: BoxDecoration(color: Colors.white),
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Expanded(
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => onTap == null ? Navigator.pop(context) : onTap(),
//                   child: DynamicViews().imageAsset2(
//                     context,
//                     "assets/rebootDesign/BackArrow@3x.png",
//                     18,
//                     RColors.black,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Utils.getSize(20.0),
//                 ),
//                 Expanded(
//                   child: DynamicViews().text2(context, title, 20,
//                       FontWeight.bold, RColors.black, TextAlign.start),
//                 )
//               ],
//             ),
//             flex: 80,
//           ),
//           if (!Utils.checkString(secondOpt))
//             Expanded(
//               child: GestureDetector(
//                 onTap: onTapSecOpt,
//                 behavior: HitTestBehavior.translucent,
//                 child: DynamicViews().text2(context, secondOpt, 14,
//                     FontWeight.bold, RColors.black, TextAlign.end),
//               ),
//               flex: 40,
//             ),
//           if (!removeToolBar)
//             Row(
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => MainFragmentSatatess(
//                                 serviceCode: "ServiceList",
//                                 title: "Services",
//                                 showFB: false,
//                                 resize: false)));
// //                   setState(() {
// //                     serviceCode = "ServiceList";
// //                     this.title = "Services";
// //                     showFB = false;
// //                   });
//                   },
//                   child: SvgPicture.assets(
//                     "assets/rebootDesign/svgImgs/service.svg",
//                     height: Utils.getSize(24.0),
//                     width: Utils.getSize(24.0),
//                     // semanticsLabel: 'Acme Logo'
//                   ),
//                   // Image.assets(
//                   //   "assets/rebootDesign/homePage/scale300/Settings@3x.png",
//                   //   height: Utils.getSize(24.0),
//                   //   fit: BoxFit.contain,
//                   // ),
//                 ),
//                 SizedBox(
//                   width: Utils.getSize(16.0),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Image.assets(
//                     "assets/rebootDesign/homePage/scale300/Help@3x.png",
//                     height: Utils.getSize(24.0),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Utils.getSize(16.0),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Image.assets(
//                     "assets/rebootDesign/homePage/scale300/VectorSmartObject@3x.png",
//                     height: Utils.getSize(24.0),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ],
//             )
//         ]));
//   }
//
//   bool isBarCode = true;
//
//   navigationBar(BuildContext context, selected, Localemain string,
//       MainFragmentState mainFragmentState,bool isRTL) {
//     // selected = 1;
//
//     return StatefulBuilder(builder: (context, setState) {
//       return Container(
//           decoration: BoxDecoration(
//             color: RColors.bgBottomNavigation,
//             // color: RColors.greenishBlue,
//             // color:isBarCode? RColors.white :RColors.bgBottomNavigation,
// //            gradient: LinearGradient(
// //                begin: Alignment.topCenter,
// //                end: Alignment.bottomCenter,
// //                colors: [Utils.greenColor2, Utils.greenColor2])
//           ),
//           height: Utils.getSize(48.0), //56
//           width: double.infinity,
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Expanded(
//                 child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => MainFragmentSatatess(
//                                   serviceCode: "HomePage",
//                                   title: string.MapPlotDetails,
//                                   showFB: false,
//                                   resize: false)));
//                     },
//                     child: Container(
//                         width: Utils.getSize(72),
//                         child: DynamicViews().svgImageAsset(context,
//                             "assets/rebootDesign/svgImgs/F_Dashboard.svg", 24,
//                             color: // isBarCode?RColors.orange:RColors.white
//                                 selected == 1
//                                     ? RColors.white
//                                     : Colors.grey[500]))),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                     onTap: () {
//                       mainFragmentState.callFragment(
//                           "MapPlotDetails", "Map Module", false, false);
//
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => MainFragmentSatatess(
//                       //             serviceCode: "MapPlotDetails",
//                       //             title: string.PlotDetails,
//                       //             showFB: false,
//                       //             resize: false)));
//                     },
//                     child: Container(
//                         width: Utils.getSize(72),
//                         child: DynamicViews().svgImageAsset(
//                             context,
//                             "assets/rebootDesign/svgImgs/bottom_navigation/ic_map.svg",
//                             24,
//                             color: selected == 2
//                                 ? RColors.white
//                                 : Colors.grey[500]))),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                     onTap: () {
//                       TaskCalendarState.ClearTaskCalender();
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => MainFragmentSatatess(
//                                   serviceCode: Constants.TaskCalendar,
//                                   title: string.TaskCalendar,
//                                   showFB: false,
//                                   resize: false)));
//                     },
//                     child: Container(
//                         width: Utils.getSize(72),
//                         child: DynamicViews().svgImageAsset(
//                             context,
//                             "assets/rebootDesign/svgImgs/bottom_navigation/ic_task_calendar.svg",
//                             24,
//                             color: selected == 3
//                                 ? RColors.white
//                                 : Colors.grey[500]))),
//               ),
//
//               //call the voice command service from bottom navigation bar
//               // Expanded(
//               //   child: GestureDetector(
//               //       onTap: () {
//               //         Navigator.push(
//               //             context,
//               //             MaterialPageRoute(
//               //                 builder: (context) => VoiceRecognition(
//               //                     mainFragmentState: mainFragmentState)));
//               //       },
//               //       child: Container(
//               //           width: Utils.getSize(60),
//               //           child: DynamicViews().svgImageAsset(
//               //               context,
//               //               "assets/rebootDesign/svgImgs/bottom_navigation/ic_mic.svg",
//               //               24,
//               //               color: selected == 6
//               //                   ? RColors.white
//               //                   : Colors.grey[500]))),
//               // ),
//               Expanded(
//                 child: GestureDetector(
//                     onTap: () async {
//                       mainFragmentState.callFragment(
//                           "MoreOptions", "More", false, false,
//                           showAppBar: false);
//
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) =>
//                       //           MoreOptions(mainFragmentState:mainFragmentState)),
//                       // );
//                     },
//                     child: Container(
//                       width: Utils.getSize(72),
//                       child: DynamicViews().imageAsset2(
//                           context,
//                           "assets/rebootDesign/bottomNav/scale300/Active_Speak@3x.png",
//                           24,
//                           selected == 5 ? RColors.white : Colors.grey[500]),
//                     )),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                     onTap: () {
//                       if (!isBarCode)
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MainFragmentSatatess(
//                                     serviceCode: "ServiceList",
//                                     title: string.Services,
//                                     showFB: false,
//                                     resize: false)));
//                     },
//                     child: Container(
//                         width: Utils.getSize(72),
//                         child: DynamicViews().svgImageAsset(
//                             context,
//                             "assets/rebootDesign/svgImgs/bottom_navigation/ic_mic.svg",
//                             24,
//                             color: isBarCode
//                                 ? Colors.transparent
//                                 : selected == 4
//                                     ? RColors.white
//                                     : Colors.grey[500]))),
//               ),
//             ],
//           ));
//     });
//   }

//
//   startSync1(context, String downloadDate,MainFragmentState mainFragmentState) {
//     string = Localizations.of<LocaleBase>(context, LocaleBase).main;
//     return Scaffold(
//         appBar: PreferredSize(
//           child: AppBar(
//             automaticallyImplyLeading: false,
//             title: Text(""),
//           ),
//           preferredSize: Size.fromHeight(0.0),
//         ),
//         backgroundColor: RColors.bgColor,
//         body: Container(
//             color: RColors.white,
//             child: ListView(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 shrinkWrap: true,
//                 children: <Widget>[
//                   DynamicViews(
//                       title: string.more,
//                       onTap: () => Navigator.pop(context)).appBarBB(),
//                   new Divider(
//                     height: Utils.getSize(15.0),
//                     indent: Utils.getSize(1.0),
//                     color: RColors.bgColor,
//                     thickness: Utils.getSize(20.0),
//                   ),
//                   new Container(
//                       margin: EdgeInsets.all(Utils.getSize(16.0)),
//                       child: GestureDetector(
//                           behavior: HitTestBehavior.translucent,
//                           onTap: () {
//                             Navigator.pop(context, false);
//                             startSync(context);
//                           },
//                           child: Row(
//                             children: [
//                               Expanded(
//                                   child: singleItem(
//                                       'assets/rebootDesign/svgImgs/ic_sync.svg',
//                                       string.syncapp)),
//                               if (!Utils.checkString(downloadDate))
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     DynamicViews().text(
//                                         context,
//                                         "Last Sync",
//                                         12,
//                                         FontWeight.normal,
//                                         RColors.black,
//                                         TextAlign.start),
//                                     DynamicViews().text(
//                                         context,
//                                         downloadDate,
//                                         16,
//                                         FontWeight.normal,
//                                         RColors.black,
//                                         TextAlign.start)
//                                   ],
//                                 )
//                             ],
//                           ))),
//                   new Divider(
//                     height: Utils.getSize(1.0),
//                     indent: Utils.getSize(1.0),
//                     color: RColors.textColorlight,
//                   ),
//                   DynamicViews.sizedBox(height:5),
//                   new Container(
//                       margin: EdgeInsets.all(Utils.getSize(16.0)),
//                     child: GestureDetector(
//                       behavior: HitTestBehavior.translucent,
//                       onTap: () {
//                         Navigator.pop(context);
//                         showDialog(
//                             context: context,
//                             builder: (context) => WillPopScope(
//                                 child:VoiceRecognition(mainFragmentState:mainFragmentState)));
//
//                       },
//                           child: Row(
//                             children: [
//                               Expanded(
//                                   child: singleItem(
//                                       'assets/rebootDesign/svgImgs/bottom_navigation/ic_mic.svg',
//                                       string.VoiceAssistant)),
//                               // if (!Utils.checkString(downloadDate))
//                               //   Column(
//                               //     crossAxisAlignment: CrossAxisAlignment.start,
//                               //     children: [
//                               //       DynamicViews().text(
//                               //           context,
//                               //           "Last Sync",
//                               //           12,
//                               //           FontWeight.normal,
//                               //           RColors.black,
//                               //           TextAlign.start),
//                               //       DynamicViews().text(
//                               //           context,
//                               //           downloadDate,
//                               //           16,
//                               //           FontWeight.normal,
//                               //           RColors.black,
//                               //           TextAlign.start)
//                               //     ],
//                               //   )
//                             ],
//                           ))),
//                   /*   /***functionality not get fixed when fully developed then uncomment this part***/
//                 new Container(
//                       margin: EdgeInsets.all(Utils.getSize(16.0)),
//                       child: GestureDetector(
//                           onTap: () {
//                             Utils.showToast("sticky note clicked");
//                           },
//                           child: singleItem(
//                               'assets/rebootDesign/svgImgs/ic_sticky_notes.svg',
//                               "Sticky Notes"))),
//                   new Divider(
//                     height: Utils.getSize(1.0),
//                     indent: Utils.getSize(1.0),
//                     color: RColors.textColorlight,
//                   ),
//                   new Container(
//                       margin: EdgeInsets.all(Utils.getSize(16.0)),
//                       child: GestureDetector(
//                           onTap: () {
//                             Utils.showToast("Plot Profile");
//                           },
//                           child: singleItem(
//                               "assets/rebootDesign/svgImgs/ic_active_plot.svg",
//                               "Plot Profile"))),
//                   new Divider(
//                     height: Utils.getSize(1.0),
//                     indent: Utils.getSize(1.0),
//                     color: RColors.textColorlight,
//                   ),
//                   new Container(
//                       margin: EdgeInsets.all(Utils.getSize(16.0)),
//                       child: GestureDetector(
//                           onTap: () {
//                             Utils.showToast("Image Gallery");
//                           },
//                           child: singleItem(
//                               "assets/rebootDesign/svgImgs/F_Observation Gallery.svg",
//                               "Image Gallery"))),
//                   new Divider(
//                     height: Utils.getSize(1.0),
//                     indent: Utils.getSize(1.0),
//                     color: RColors.textColorlight,
//                   ),
//                   new Container(
//                       margin: EdgeInsets.all(Utils.getSize(16.0)),
//                       child: GestureDetector(
//                           onTap: () {
//                             Utils.showToast("Chat Bot");
//                           },
//                           child: singleItem(
//                               "assets/rebootDesign/svgImgs/ic_chat.svg",
//                               "Chat Bot"))),*/
//                   new Divider(
//                     height: Utils.getSize(1.0),
//                     indent: Utils.getSize(1.0),
//                     color: RColors.textColorlight,
//                   ),
//                 ])));
//
//     /*showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => Dialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             elevation: 0.0,
//             backgroundColor: Colors.transparent,
//             child: Container(
//                 height: Utils.getSize(350.0),
// //                margin: const EdgeInsets.only(left: 26, right: 26),
//                 child: Card(
//                     child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: <Widget>[
//                       Container(
//                         width: double.infinity,
// //                          margin: EdgeInsets.all(10.0),
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.all(Utils.getSize(8.0)),
//                             color: RColors.greenishBlue,
//                             child: DynamicViews().text(
//                                 context,
//                                 "More Options",
//                                 18,
//                                 FontWeight.normal,
//                                 RColors.white,
//                                 TextAlign.center),
//                           ),
//                           SizedBox(
//                             width: Utils.getSize(30.0),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top:Utils.getSize(10.0),left:Utils.getSize(10.0),right:Utils.getSize(10.0)),
//                             child: MaterialButton(
//                               minWidth: double.maxFinite,
//                               color: RColors.PrimaryColor,
//                               padding: EdgeInsets.all(Utils.getSize(5.0)),
//                               onPressed: () {
//                                 Navigator.pop(context, false);
//                                 startSync(context);
//                               },
//                               child: DynamicViews().text(
//                                   context,
//                                   "Sync App",
//                                   16,
//                                   FontWeight.normal,
//                                   RColors.white,
//                                   TextAlign.start),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top:Utils.getSize(10.0),left:Utils.getSize(10.0),right:Utils.getSize(10.0)),
//                             child: MaterialButton(
//                               minWidth: double.maxFinite,
//                               color: RColors.PrimaryColor,
//                               padding: EdgeInsets.all(Utils.getSize(5.0)),
//                               onPressed: () {
//                                 Utils.showToast("clicked Sticky Notes");
//                               },
//                               child: DynamicViews().text(
//                                   context,
//                                   "Sticky Notes",
//                                   16,
//                                   FontWeight.normal,
//                                   RColors.white,
//                                   TextAlign.start),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top:Utils.getSize(10.0),left:Utils.getSize(10.0),right:Utils.getSize(10.0)),
//                             child: MaterialButton(
//                               minWidth: double.maxFinite,
//                               color: RColors.PrimaryColor,
//                               padding: EdgeInsets.all(Utils.getSize(5.0)),
//                               onPressed: () {
//                                 Utils.showToast("clicked Plot Profile");
//                               },
//                               child: DynamicViews().text(
//                                   context,
//                                   "Plot Profile",
//                                   16,
//                                   FontWeight.normal,
//                                   RColors.white,
//                                   TextAlign.start),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top:Utils.getSize(10.0),left:Utils.getSize(10.0),right:Utils.getSize(10.0)),
//                             child: MaterialButton(
//                               minWidth: double.maxFinite,
//                               color: RColors.PrimaryColor,
//                               padding: EdgeInsets.all(Utils.getSize(5.0)),
//                               onPressed: () {
//                                 Utils.showToast("clicked Image Gallery");
//                               },
//                               child: DynamicViews().text(
//                                   context,
//                                   "Image Gallery",
//                                   16,
//                                   FontWeight.normal,
//                                   RColors.white,
//                                   TextAlign.start),
//                             ),
//                           ) ,          Container(
//                             margin: EdgeInsets.only(top:Utils.getSize(10.0),left:Utils.getSize(10.0),right:Utils.getSize(10.0)),
//                             child: MaterialButton(
//                               minWidth: double.maxFinite,
//                               color: RColors.PrimaryColor,
//                               padding: EdgeInsets.all(Utils.getSize(5.0)),
//                               onPressed: () {
//                                 Utils.showToast("clicked Chart Bots");
//                               },
//                               child: DynamicViews().text(
//                                   context,
//                                   "Chart Bots",
//                                   16,
//                                   FontWeight.normal,
//                                   RColors.white,
//                                   TextAlign.start),
//                             ),
//                           )
//                         ])))));*/
//   }
//
//   singleItem(path, title) {
//     return Container(
//       child: Row(children: <Widget>[
//         new Container(
//           child: DynamicViews()
//               .svgImageAsset(context, path, 24, color: RColors.textColorlight),
//         ),
//         SizedBox(height: Utils.getSize(10.0)),
//         new Container(
//           margin: EdgeInsets.only(left: Utils.getSize(15.0)),
//           child: DynamicViews().text(context, title, 16, FontWeight.normal,
//               RColors.black, TextAlign.start),
//         ),
//       ]),
//     );
//   }

  Widget editText() {
    //Material
    return TextField(
        controller: controller,
        style: new TextStyle(
            fontFamily: "Lato",
            fontSize: Utils.getSize(16.0),
            color: Colors.black54),
        autofocus: true,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: hint,
          labelStyle: TextStyle(color: Colors.black54),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: onTextChanged);
  }

  Widget editTextReadonly() {
    //Material
    return TextField(
        controller: controller,
//        readOnly: true,

        style:
            new TextStyle(fontSize: Utils.getSize(14.0), color: Colors.black54),
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(color: Colors.black54),
        ),
        onChanged: onTextChanged);
  }

  Widget result() {
    //Material
    return TextField(
      controller: controller,
      style: new TextStyle(fontSize: 18.0, height: 3.0, color: Colors.black),
      decoration: InputDecoration(
        labelText: hint,
//            prefixIcon: Icon(Icons.date_range),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.grey[5],
        filled: true,
      ),
    );
  }

  Widget button({Color color, double borderRadius}) {
    return
//      ButtonTheme(
//        minWidth: 120.0,
//        child:
        Container(
            width: width,
            child: FlatButton(
                //RaisedButton
                onPressed: () {
                  onTap();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(borderRadius ?? 4),
//            side: BorderSide(color: Colors.red)
                ),
                color: bgColor != null ? bgColor : RColors.greenishBlue,
//                                padding: const EdgeInsets.all(1.0),
                child: Container(
                  height: Utils.getSize(40.0),
                  alignment: Alignment.center,
                  // padding: EdgeInsets.only(
                  //     right: Utils.getSize(16.0), left: Utils.getSize(16.0)),
                  child: DynamicViews().textSingleLine(
                      context,
                      title,
                      14,
                      FontWeight.bold,
                      color != null ? color : RColors.white,
                      TextAlign.center),
                )));
  }

  // void _selectItem(MainFragmentState value, BuildContext context) {
  //   if (value != null)
  //     Navigator.of(context).pop({'selection': value});
  //   else
  //     Navigator.of(context).pop({'selection': ""});
  // }

  bool isExpanded = false;

  showSliderDialog(double height,
      {onTapP, onTapC, onTapA, onTapD, onTapE, onTapQR, onTapJ, onTapG, onTapR, onTapRA, onTapAP}) {
    double sliderWD = 0.0;
    double bCount = 0;
    if (onTapP != null) bCount++;
    if (onTapC != null) bCount++;
    if (onTapA != null) bCount++;
    if (onTapD != null) bCount++;
    if (onTapE != null) bCount++;
    if (onTapQR != null) bCount++;
    if (onTapJ != null) bCount++;
    if (onTapG != null) bCount++;
    if (onTapR != null) bCount++;
    if (onTapRA != null) bCount++;  // For Receive Asset
    if (onTapAP != null) bCount++;  // For Approve
    // if (bCount != null) bCount++;

    return showDialog(
        context: context,
        builder: (contextSD) =>
            // WillPopScope(
            // onWillPop: () {
            //   Navigator.pop(context, true);
            // },
            // child:
            Dialog(
                elevation: 0.0,
                insetPadding: EdgeInsets.only(
                    // bottom: Utils.getSize(0.0),
                    // bottom: Utils.getSize(48.0),
                    ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(15),
                // ),
//            elevation: 0.0,
                backgroundColor: Color(0x88FFFFFF),
                child: StatefulBuilder(builder: (context, setState2) {
                  if (!isExpanded) {
                    isExpanded = true;
                    Timer _timer;
                    _timer = Timer.periodic(
                        Duration(microseconds: 100),
                        (Timer timer) => setState2(() {
                              _timer.cancel();
                              sliderWD = Utils.getSize((bCount * 55) + 32);
                            }));
                  }

                  return GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (details.velocity.pixelsPerSecond.dx > 100) {
                        setState2(() {
                          sliderWD = 0;
                        });
                      }
                    },
                    onTap: () => Navigator.pop(contextSD, true),
                    child: Container(
                        color: RColors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(contextSD, true),
                              child: Container(
                                width: double.infinity,
                                height: height,
                              ),
                            ),
                            // Expanded(
                            //   child:
                            Container(
                              child: GestureDetector(
                                onTap: () => Navigator.pop(contextSD, true),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnimatedContainer(
                                      height: Utils.getSize(75),
                                      color: Color(0x00EEEEEE),
                                      width: sliderWD,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn,
                                      margin: EdgeInsets.all(1),
                                      alignment: Alignment.center,
                                      onEnd: () {
                                        if (sliderWD == 0) {
                                          Navigator.pop(contextSD, true);
                                        }
                                      },
                                      child: DynamicViews().slider(
                                          // onTapD: onTapD,
                                          onTapP: onTapP,
                                          onTapC: onTapC,
                                          onTapA: onTapA,
                                          onTapD: onTapD,
                                          onTapE: onTapE,
                                          onTapQR: onTapQR,
                                          onTapJ: onTapJ,
                                          onTapG: onTapG,
                                          onTapR: onTapR,
                                          onTapRA: onTapRA,
                                          onTapAP: onTapAP,
                                          contextSD: contextSD),
                                    )),
                                // ListView(
                                //           shrinkWrap: true,
                                //           children: [
                                //
                                //           ],
                                //         ),
                                //       ),
                              ),
                            ),
                            // Expanded(
                            //   child:
                            // GestureDetector(
                            //   onTap: () => Navigator.pop(contextSD, true),
                            //   child: Expanded(
                            //     child: Container(
                            //       color: Colors.blue,
                            //       width: double.infinity,
                            //
                            //     ),
                            //   ),
                            // ),
                            // flex: 10,
                            // ),
                          ],
                        )),
                  );
                })));
  }

  slider(
      {VoidCallback onTapD,
      VoidCallback onTapP,
      VoidCallback onTapA,
      VoidCallback onTapE,
      VoidCallback onTapC,
      VoidCallback onTapQR,
      VoidCallback onTapJ,
      VoidCallback onTapG,
      VoidCallback onTapR,
      VoidCallback onTapRA,
      VoidCallback onTapAP,
      BuildContext contextSD}) {
    return Container(
      margin: EdgeInsets.only(top: Utils.getSize(8), bottom: Utils.getSize(8)),
      padding:
          EdgeInsets.only(right: Utils.getSize(16), left: Utils.getSize(16)),
      // width: Utils.getSize(55),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[800],
            blurRadius: 4.0,
            offset: const Offset(3.0, 3.0),
          ),
        ],
      ),
      child: ListView(
        // reverse: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onTapQR != null)
                sliderOption(
                    contextSD,
                    onTapQR,
                    RColors.white,
                    //redDark
                    "QR-Code",
                    "assets/rebootDesign/svgImgs/Artboard_Merged 2_Barcode Scanner.svg",
                    35,
                    true),
              if (onTapD != null)
                sliderOption(
                    contextSD,
                    onTapD,
                    RColors.white,
                    //redDark
                    "Delete",
                    "assets/rebootDesign/commonImages/slider/delete.png",
                    35,
                    false),
              if (onTapP != null)
                sliderOption(
                    contextSD,
                    onTapP,
                    RColors.white,
                    "Preview",
                    //lightGreen
                    "assets/rebootDesign/commonImages/slider/preview.png",
                    35,
                    false),
              if (onTapA != null)
                sliderOption(
                    contextSD,
                    onTapA,
                    RColors.white,
                    //blue,
                    "Attachment",
                    "assets/rebootDesign/commonImages/3x/Attchement@3x.png",
                    35,
                    false),
              if (onTapE != null)
                sliderOption(
                    contextSD,
                    onTapE,
                    RColors.white,
                    //purple
                    "Edit",
                    "assets/rebootDesign/commonImages/slider/edit.png",
                    35,
                    false),
              if (onTapC != null)
                sliderOption(
                    contextSD,
                    onTapC,
                    RColors.white,
                    //yellow
                    "Copy",
                    "assets/rebootDesign/commonImages/slider/copy.png",
                    35,
                    false),
              if (onTapJ != null)
                sliderOption(
                    contextSD,
                    onTapJ,
                    RColors.white,
                    //yellow
                    "Jump To",
                    "assets/rebootDesign/commonImages/slider/copy.png",
                    35,
                    false),
              if (onTapG != null)
                sliderOption(
                    contextSD,
                    onTapG,
                    RColors.white,
                    //yellow
                    "Geo Tag",
                    "assets/rebootDesign/commonImages/slider/copy.png",
                    35,
                    false),
              if (onTapR != null)
                sliderOption(
                    contextSD,
                    onTapR,
                    RColors.white,
                    //yellow
                    "Return",
                    "assets/rebootDesign/commonImages/slider/edit.png",
                    35,
                    false),
              if (onTapRA != null)
                sliderOption(
                    contextSD,
                    onTapRA,
                    RColors.white,
                    //yellow
                    "Receive Asset",
                    "assets/rebootDesign/commonImages/slider/edit.png",
                    35,
                    false),
              if (onTapAP != null)
                sliderOption(
                    contextSD,
                    onTapAP,
                    RColors.white,
                    //yellow
                    "Approve",
                    "assets/rebootDesign/commonImages/slider/edit.png",
                    35,
                    false),
            ],
          )
        ],
      ),
    );
  }

  static verticleDText(context, text1, text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DynamicViews().text(context, text1, 14, FontWeight.normal,
            RColors.textColorlight, TextAlign.start),
        SizedBox(
          height: Utils.getSize(8.0),
        ),
        DynamicViews().text(context, text2, 16, FontWeight.bold,
            RColors.textColorDark, TextAlign.start),
      ],
    );
  }

  sliderOption(BuildContext contextSD, VoidCallback onTap, Color color,
      String title, String path, size, bool isSvg) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(contextSD, true);
        onTap();
      },
      child: Container(
        width: Utils.getSize(55),
        padding: EdgeInsets.all(Utils.getSize(5)),
        // margin: EdgeInsets.only(
        //     top: Utils.getSize(8), bottom: Utils.getSize(8), right: 1),
        // decoration: BoxDecoration(
        //   color: color,
        //   borderRadius: new BorderRadius.all(Radius.circular(Utils.getSize(8))),
        // // topLeft: const Radius.circular(40.0),
        // ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? DynamicViews()
                    .svgImageAsset(context, path, 24, color: RColors.black)
                : DynamicViews().imageAsset2(context, path, 24, RColors.black),
            DynamicViews().text2(context, title, 10, FontWeight.normal,
                RColors.textColorDark, TextAlign.center),
          ],
        ),
      ),
    );
  }

  // static List<FilterItem> myFilter = [];

  // bottomSheet(BuildContext context, String pageindex) {
  //   TextEditingController fromDate = TextEditingController(),
  //       toDate = TextEditingController();
  //
  //   DateTime fromDateww = DateTime.now().subtract(Duration(days: 7));
  //   DateTime toDateww = DateTime.now();
  //   fromDate.text = DateFormat('dd/MM/yyyy').format(fromDateww);
  //   toDate.text = DateFormat('dd/MM/yyyy').format(toDateww);
  //   showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (context) {
  //         return SafeArea(
  //             child: Padding(
  //           padding: MediaQuery.of(context).viewInsets,
  //           child: StatefulBuilder(
  //             builder: (BuildContext context, StateSetter setState) {
  //               return onTap != null
  //                   ? GestureDetector(
  //                       behavior: HitTestBehavior.translucent,
  //                       onTap: () => onTap(),
  //                       child: Container(
  //                         padding: EdgeInsets.all(10),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.only(
  //                               topLeft: Radius.circular(5),
  //                               topRight: Radius.circular(5)),
  //                           color: RColors.white,
  //                         ),
  //                         child: ListView(
  //                           shrinkWrap: true,
  //                           children: [
  //                             Row(
  //                               children: <Widget>[
  //                                 Expanded(
  //                                   flex: 1,
  //                                   child: DynamicViews(
  //                                     onTap: () async {
  //                                       fromDateww = (await Utils.getDatePicker(
  //                                               context,
  //                                               initialDate: fromDateww,
  //                                               lastDate: toDateww)) ??
  //                                           fromDateww;
  //                                       Utils.showLog(" lrFilter.fromDate",
  //                                           fromDateww.toString());
  //                                       fromDate.text = DateFormat('dd/MM/yyyy')
  //                                           .format(fromDateww);
  //                                       DateTime dateTime =
  //                                           new DateFormat('dd/MM/yyyy')
  //                                               .parse(fromDate.text);
  //
  //                                       FromDate = dateTime;
  //                                     },
  //                                   ).textField2(
  //                                     label: "FromDate",
  //                                     controller: fromDate,
  //                                     isEnabled: false,
  //                                     asterisk: false,
  //                                     path:
  //                                         "assets/rebootDesign/Calendar@3x.png",
  //                                     imgSize: 14,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: Utils.getSize(16),
  //                                 ),
  //                                 Expanded(
  //                                   flex: 1,
  //                                   child: DynamicViews(
  //                                     onTap: () async {
  //                                       toDateww = (await Utils.getDatePicker(
  //                                               context,
  //                                               initialDate: toDateww,
  //                                               lastDate: toDateww,
  //                                               firstDate: fromDateww)) ??
  //                                           toDateww;
  //                                       toDate.text = DateFormat('dd/MM/yyyy')
  //                                           .format(toDateww);
  //                                       DateTime dateTime =
  //                                           new DateFormat('dd/MM/yyyy')
  //                                               .parse(toDate.text);
  //                                       ToDate = dateTime;
  //                                     },
  //                                   ).textField2(
  //                                     label: "ToDate",
  //                                     controller: toDate,
  //                                     isEnabled: false,
  //                                     asterisk: false,
  //                                     path:
  //                                         "assets/rebootDesign/Calendar@3x.png",
  //                                     imgSize: 14,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             ListView.builder(
  //                                 shrinkWrap: true,
  //                                 itemCount: myFilter.length,
  //                                 physics: NeverScrollableScrollPhysics(),
  //                                 itemBuilder:
  //                                     (BuildContext context, int index) {
  //                                   return DynamicViews(onTap: () async {
  //                                     CommonSingleList model =
  //                                         await Navigator.push(
  //                                             context,
  //                                             MaterialPageRoute(
  //                                                 builder: (context) =>
  //                                                     CommonSingleSelection(
  //                                                         myFilter[index]
  //                                                             .para
  //                                                             .toString(),
  //                                                         "byList",
  //                                                         "",
  //                                                         false,
  //                                                         string,
  //                                                         list: myFilter[index]
  //                                                                 .filterList ??
  //                                                             [].toList())));
  //
  //                                     if (model != null) {
  //                                       myFilter[index].controller.text =
  //                                           model.Name.toString();
  //                                       myFilter[index].selectedItem = model;
  //                                       myFilter[index].getList(model);
  //                                     }
  //                                   }).textField(
  //                                       label: myFilter[index].para.toString(),
  //                                       controller: myFilter[index].controller,
  //                                       isEnabled: false);
  //                                 }),
  //                             Container(
  //                                 child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: DynamicViews(
  //                                     onTap: () {
  //                                       onTap();
  //                                       Navigator.of(context).pop();
  //                                     },
  //                                     bgColor: RColors.yellow,
  //                                     title: "Submit",
  //                                   ).button(),
  //                                 ),
  //                                 DynamicViews.sizedBox(width: 16),
  //                                 Expanded(
  //                                   child: DynamicViews(
  //                                     onTap: () {
  //                                       FromDate = null;
  //                                       ToDate = null;
  //                                       toDate.text = "";
  //                                       fromDate.text = "";
  //                                       onTap();
  //                                       Navigator.of(context).pop();
  //                                     },
  //                                     bgColor: RColors.yellow,
  //                                     title: "Clear",
  //                                   ).button(),
  //                                 )
  //                               ],
  //                             )),
  //                           ],
  //                         ),
  //                       ),
  //                     )
  //                   : Container(
  //                       padding: EdgeInsets.all(10),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(5),
  //                             topRight: Radius.circular(5)),
  //                         color: RColors.white,
  //                       ),
  //                       child: ListView(
  //                         shrinkWrap: true,
  //                         children: [
  //                           Row(
  //                             children: <Widget>[
  //                               Expanded(
  //                                 flex: 1,
  //                                 child: DynamicViews(
  //                                   onTap: () async {
  //                                     fromDateww = (await Utils.getDatePicker(
  //                                             context,
  //                                             initialDate: fromDateww,
  //                                             lastDate: toDateww)) ??
  //                                         fromDateww;
  //                                     Utils.showLog(" lrFilter.fromDate",
  //                                         fromDateww.toString());
  //                                     fromDate.text = DateFormat('dd/MM/yyyy')
  //                                         .format(fromDateww);
  //                                     DateTime dateTime =
  //                                         new DateFormat('dd/MM/yyyy')
  //                                             .parse(fromDate.text);
  //
  //                                     FromDate = dateTime;
  //                                   },
  //                                 ).textField2(
  //                                   label: "FromDate",
  //                                   controller: fromDate,
  //                                   isEnabled: false,
  //                                   asterisk: false,
  //                                   path: "assets/rebootDesign/Calendar@3x.png",
  //                                   imgSize: 14,
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 width: Utils.getSize(16),
  //                               ),
  //                               Expanded(
  //                                 flex: 1,
  //                                 child: DynamicViews(
  //                                   onTap: () async {
  //                                     toDateww = (await Utils.getDatePicker(
  //                                             context,
  //                                             initialDate: toDateww,
  //                                             lastDate: toDateww,
  //                                             firstDate: fromDateww)) ??
  //                                         toDateww;
  //                                     toDate.text = DateFormat('dd/MM/yyyy')
  //                                         .format(toDateww);
  //                                     DateTime dateTime =
  //                                         new DateFormat('dd/MM/yyyy')
  //                                             .parse(toDate.text);
  //                                     ToDate = dateTime;
  //                                   },
  //                                 ).textField2(
  //                                   label: "ToDate",
  //                                   controller: toDate,
  //                                   isEnabled: false,
  //                                   asterisk: false,
  //                                   path: "assets/rebootDesign/Calendar@3x.png",
  //                                   imgSize: 14,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           ListView.builder(
  //                               shrinkWrap: true,
  //                               itemCount: myFilter.length,
  //                               physics: NeverScrollableScrollPhysics(),
  //                               itemBuilder: (BuildContext context, int index) {
  //                                 TextEditingController controller1 =
  //                                     TextEditingController();
  //                                 return DynamicViews(onTap: () async {
  //                                   CommonSingleList model =
  //                                       await Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                               builder: (context) =>
  //                                                   CommonSingleSelection(
  //                                                       myFilter[index]
  //                                                           .para
  //                                                           .toString(),
  //                                                       "byList",
  //                                                       "",
  //                                                       false,
  //                                                       string,
  //                                                       list: myFilter[index]
  //                                                           .filterList
  //                                                           .toList())));
  //
  //                                   if (model != null) {
  //                                     controller1.text = model.Name.toString();
  //                                     myFilter[index].selectedItem = model;
  //                                   }
  //                                 }).textField(
  //                                     label: myFilter[index].para.toString(),
  //                                     controller: controller1,
  //                                     isEnabled: false);
  //                               }),
  //                           Container(
  //                               child: Row(
  //                             children: [
  //                               Expanded(
  //                                 child: DynamicViews(
  //                                   onTap: () {
  //                                     onTap();
  //                                     Navigator.of(context).pop();
  //                                   },
  //                                   bgColor: RColors.yellow,
  //                                   title: "Submit",
  //                                 ).button(),
  //                               ),
  //                               DynamicViews.sizedBox(width: 16),
  //                               Expanded(
  //                                 child: DynamicViews(
  //                                   onTap: () {
  //                                     FromDate = null;
  //                                     ToDate = null;
  //                                     toDate.text = "";
  //                                     fromDate.text = "";
  //                                     controller.text = "";
  //
  //                                     onTap();
  //                                     Navigator.of(context).pop();
  //                                   },
  //                                   bgColor: RColors.yellow,
  //                                   title: "Clear",
  //                                 ).button(),
  //                               )
  //                             ],
  //                           )),
  //                         ],
  //                       ),
  //                     );
  //             },
  //           ),
  //         ));
  //       });
  // }

  void setState(Null Function() param0) {}
}
