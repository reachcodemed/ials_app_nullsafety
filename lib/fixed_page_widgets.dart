import 'dart:ui';
import 'package:ials_app_nullsafety/globalVariables.dart' as global;
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import 'globalVariables.dart';

class PageLineWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.0,
      width: double.infinity,
      color: kPanelBackgroundColour,
    );
  }
}


class ManualArrestInputPane extends StatelessWidget {

  ManualArrestInputPane({this.starText, this.tabColour, required this.inputPaneText, this.hintTextInput, this.textInputFunction});

  final String? starText;
  final Color? tabColour;
  final String inputPaneText;
  final String? hintTextInput;
  final Function? textInputFunction;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
      Container(
          child:
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(starText!,
                      style: TextStyle(color: Colors.red,))),
              Expanded(
                  flex: 1,
                  child: Container(color: tabColour, width: 1.0,)),
              Expanded(
                  flex: 16,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      child: AutoSizeText(inputPaneText,
                          minFontSize: 10.0,
                          maxFontSize: 12.0,
                          style: TextStyle(fontSize: 12.0,)))),
              Expanded(
                flex: 8,
                child:
                Container(
                  margin: EdgeInsets.all(6.0),
                  child:

                  TextField(
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.bottom,
                    keyboardType: TextInputType.datetime,
                    onChanged: textInputFunction as void Function(String)?,
                    decoration: kTextFieldExternalArrestDecoration.copyWith(
                      hintText: hintTextInput,
                      hintStyle: TextStyle(color: kTextFieldLightGreyBorder),),

                  ),
                ),
              ),
            ],
          )),);
  }
}


class ABGInputPane extends StatelessWidget {

  ABGInputPane({this.inputPaneText, this.hintTextInput, this.textInputFunction, required this.fontSize, this.textEditingController, this.textFieldTextSize});


  final String? inputPaneText;
  final String? hintTextInput;
  final Function? textInputFunction;
  final double fontSize;
  final TextEditingController? textEditingController;
  final double? textFieldTextSize;


  @override
  Widget build(BuildContext context)
  {
    return  Expanded(
      flex: 6,
      child:
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              child: AutoSizeText(inputPaneText!,
                minFontSize: 10.0,
                maxFontSize: 16.0,
                style:
                  TextStyle(fontSize: fontSize,),),),),
          Expanded(
            flex: 1,
            child:
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 4.0,),
              child:

              TextField(
                style: TextStyle(
                    fontSize: textFieldTextSize,

                ),
                controller: textEditingController,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.datetime,
                onChanged: textInputFunction as void Function(String)?,
                decoration: kTextFieldExternalArrestDecoration.copyWith(
                  hintText: hintTextInput,
                  hintStyle: TextStyle(color: kTextFieldLightGreyBorder),),

              ),
            ),
          ),
        ],
      ),
    );

  }
}


class ManualArrestQuadInputPane extends StatelessWidget {

  ManualArrestQuadInputPane({this.inputPaneText, this.hintTextInput, this.textInputFunction, required this.fontSize});


  final String? inputPaneText;
  final String? hintTextInput;
  final Function(String)? textInputFunction;
  final double fontSize;


  @override
  Widget build(BuildContext context)
  {
    return  Expanded(
      flex: 6,
      child:
      Row(
        children: [
          Expanded(
            flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                  child: AutoSizeText(inputPaneText!,
                      minFontSize: 10.0,
                      maxFontSize: 16.0,
                      style:
                          TextStyle(fontSize: fontSize,),),),),
          Expanded(
            flex: 1,
            child:
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 4.0,),
              child:

              TextField(
                style: TextStyle(
                  fontSize: 10.0,

                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.datetime,
                onChanged: textInputFunction,
                decoration: kTextFieldExternalArrestDecoration.copyWith(
                  hintText: hintTextInput,
                  hintStyle: TextStyle(color: kTextFieldLightGreyBorder),),

              ),
            ),
          ),
        ],
      ),
    );

  }
}


class ManualArrestQuadSliderPane extends StatelessWidget {

  ManualArrestQuadSliderPane({this.starText, this.tabColour, required this.inputPaneText, required this.onValueChanged, required this.indexPosition});

  final String? starText;
  final Color? tabColour;
  final String inputPaneText;
  final Function(int?) onValueChanged;
  final int? indexPosition;

  @override
  Widget build(BuildContext context) {

    List<Color> myColours = [Colors.grey[100]!];

    return Expanded(
      child:
      Container(
        child:
        Row(
          children: [
            Expanded(
                flex: 1,
                child: AutoSizeText(starText!,
                    style: TextStyle(color: Colors.red,))),
            Expanded(
                flex: 1,
                child: Container(color: tabColour, width: 1.0,)),
            Expanded(
                flex: 8,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal:15.0, vertical: 0.0),
                    child: AutoSizeText(inputPaneText,
                        minFontSize: 10.0,
                        maxFontSize: 12.0,
                        style: TextStyle(fontSize: 12.0,
                            textBaseline: TextBaseline.alphabetic)))),
            Expanded(
              flex: 16,
              child:


              Container(
                //margin: EdgeInsets.all(4),
                  child:
                  CupertinoSlidingSegmentedControl(
                    //padding: EdgeInsets.all(4),
                      groupValue: indexPosition,
                      children:
                      {0:
                      Container(
                        height: 22,
                        child:Center(
                          child: Text("PEA",
                            style: TextStyle(

                              fontSize: 12,
                            ),),
                        ),),
                        1:
                        Container(
                          height: 22,
                          child:Center(
                            child: Text("Asys",
                              style: TextStyle(
                                fontSize: 12,
                                //color: Colors.blue
                              ),),
                          ),),
                        2:
                        Container(
                          height: 22,
                          child:Center(
                            child: Text("VF",
                              style: TextStyle(

                                fontSize: 12,
                              ),),
                          ),),
                        3:
                        Container(
                          height: 22,
                          child:Center(
                            child: Text("pVT",
                              style: TextStyle(
                                fontSize: 12,
                              ),),
                          ),),

                      },
                      onValueChanged: onValueChanged)


              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ManualArrestDualSliderPane extends StatelessWidget {

  ManualArrestDualSliderPane({this.starText, this.tabColour, required this.inputPaneText, required this.onValueChanged, required this.indexPosition});

  final String? starText;
  final Color? tabColour;
  final String inputPaneText;
  final Function(int?) onValueChanged;
  final int? indexPosition;


  @override
  Widget build(BuildContext context) {

    List<Color> myColours = [Colors.grey[100]!];

    return Expanded(
      child:
      Container(
        child:
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(starText!,
                    style: TextStyle(color: Colors.red,))),
            Expanded(
                flex: 1,
                child: Container(color: tabColour, width: 1.0,)),
            Expanded(
                flex: 16,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0,),
                    child: AutoSizeText(inputPaneText,
                        minFontSize: 10.0,
                        maxFontSize: 12.0,
                        style: TextStyle(fontSize: 12.0,)))),
            Expanded(
              flex: 8,
              child:
              CupertinoSlidingSegmentedControl(
                  //padding: EdgeInsets.all(4),
                  groupValue: indexPosition,
                  children:
                  {0:
                  Container(
                    height: 22,
                    child:Center(
                      child: Text("Yes",
                      style: TextStyle(

                        fontSize: 12,
                      ),),
                    ),),
                   1:
                   Container(
                     height: 22,
                     child:Center(
                       child: Text("No",
                         style: TextStyle(
                           fontSize: 12,
                         ),),
                     ),),},
                  onValueChanged: onValueChanged),
            ),
          ],
        ),
      ),
    );
  }
}




