import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HsAndTsPane extends StatelessWidget {

  HsAndTsPane({this.hsAndTsPaneTextColour, this.hsAndTsPaneColour, this.hsAndTsPaneText, required this.hAndTIndex, required this.onValueChanged, required this.indexPosition});

  final Color? hsAndTsPaneColour;
  final String? hsAndTsPaneText;
  final Color? hsAndTsPaneTextColour;
  final int hAndTIndex;
  final int? indexPosition;
  final Function (int?) onValueChanged;

  @override
  Widget build(BuildContext context) {

    List<Color>myColours = [Colors.white];

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(1.0,),
        padding: EdgeInsets.all(3.0),
        alignment: Alignment.center,
        color: hsAndTsPaneColour,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoSizeText(
              hsAndTsPaneText!,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: hsAndTsPaneTextColour,

              ),
              maxFontSize: 30.0,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),

            CupertinoSlidingSegmentedControl(
              //padding: EdgeInsets.all(4),
                backgroundColor: Colors.grey.shade300,
                thumbColor: Colors.grey.shade100,
                groupValue: indexPosition,
                children:
                {0:
                Container(
                  height: 25,
                  child:Center(
                    child: Text("Excluded",
                      style: TextStyle(

                        fontSize: 12,
                      ),),
                  ),),
                  1:
                  Container(
                    height: 25,
                    child:Center(
                      child: Text("Consider",
                        style: TextStyle(
                          fontSize: 12,
                        ),),
                    ),),},
                onValueChanged: onValueChanged),
            
            
            // ToggleSwitch(
            //   activeBgColor: myColours,
            //   activeFgColor: Colors.blue[400],
            //   inactiveBgColor: Colors.grey[300],
            //   inactiveFgColor: Colors.grey[700],
            //   fontSize: 11.0,
            //   minHeight: 30.0,
            //   minWidth: 70.0,
            //   cornerRadius: 5.0,
            //
            //   initialLabelIndex: global.indexPositionsOfHsAndTs[hAndTIndex],
            //
            // labels: ['Excluded', 'Consider',],
            // onToggle: (index)
            // {
            //   if (index == 0)
            //   {
            //     global.indexPositionsOfHsAndTs[hAndTIndex] = 0;
            //     global.log = global.log+ '\n' + global.timeNow +' - ' +global.hsAndTsLogStrings[hAndTIndex] +' excluded';
            //   }
            //   else if (index == 1)
            //   {
            //     global.indexPositionsOfHsAndTs[hAndTIndex] = 1;
            //     global.log = global.log+ '\n' + global.timeNow +' - ' +global.hsAndTsLogStrings[hAndTIndex] +' considered';
            //   }
            //   else
            //   {
            //
            //   }
            //   },
            //   totalSwitches: 2,
            // ),
          ],
        ),

      ),
    );
  }
}