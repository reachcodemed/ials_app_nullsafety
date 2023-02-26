import 'package:flutter/material.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:ials_app_nullsafety/globalVariables.dart' as global;
import 'toggle_switches.dart';


class ReversibleTilesGrid extends StatefulWidget {
  const ReversibleTilesGrid({super.key});




  @override
  _ReversibleTilesGridState createState() => _ReversibleTilesGridState();
}

class _ReversibleTilesGridState extends State<ReversibleTilesGrid> {


  List<int?> indexPositionsOfHsAndTs = [null,null,null,null,null,null,null,null,null,null,null,null];//Hyperkalaemia,Hypokalaemia,Hypoglycaemia,Hypothermia,Hypovolaemia,Hypoxia,H+Ions,Tamponade,Tension Pneumothorax, Toxins,Thrombosis(Lung), Thomobosis(MI)
//Excluded = 0, Consider = 1

  List<String> hsAndTsLogStrings = [
    "Hyperkalaemia",
    "Hypokalaemia",
    "Hypoglycaemia",
    "Hypothermia",
    "Hypovolaemia",
    "Hypoxia",
    "Acidosis",
    "Cardiac tamponade",
    "Tension pneumothorax",
    "Toxins",
    "Pulmonary embolism",
    "Myocardial infarction",
  ];



  @override
  Widget build(BuildContext context) {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    return Scaffold(
      body:
      SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HsAndTsPane(
                    hAndTIndex: 0,
                    hsAndTsPaneColour: kPane1,
                    hsAndTsPaneText: 'Hyperkalaemia',
                    hsAndTsPaneTextColour: kButtonTextColourDark,
                    indexPosition: indexPositionsOfHsAndTs[0],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[0] = index;
                        

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[0]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[0]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),
                  HsAndTsPane(
                    hAndTIndex: 1,
                    hsAndTsPaneColour: kPane1,
                    hsAndTsPaneText: 'Hypokalaemia',
                    hsAndTsPaneTextColour: kButtonTextColourDark,
                    indexPosition: indexPositionsOfHsAndTs[1],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[1] = index;
                  

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[1]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[1]} considered';
                        }
                        else
                        {

                        }
                      });
                    },
                  ),

                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HsAndTsPane(
                    hAndTIndex: 2,
                    hsAndTsPaneColour: kPane2,
                    hsAndTsPaneText: 'Hypoglycaemia',
                    hsAndTsPaneTextColour: kButtonTextColour,
                    indexPosition: indexPositionsOfHsAndTs[2],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[2] = index;
                     

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[2]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[2]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),
                  HsAndTsPane(
                    hAndTIndex: 3,
                    hsAndTsPaneColour: kPane2,
                    hsAndTsPaneText: 'Hypothermia',
                    hsAndTsPaneTextColour: kButtonTextColour,
                    indexPosition: indexPositionsOfHsAndTs[3],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[3] = index;
                 

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[3]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[3]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),


                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HsAndTsPane(
                    hAndTIndex: 4,
                    hsAndTsPaneColour: kPane3,
                    hsAndTsPaneText: 'Hypovolaemia',
                    hsAndTsPaneTextColour: kButtonTextColour,
                    indexPosition: indexPositionsOfHsAndTs[4],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[4] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[4]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[4]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),
                  HsAndTsPane(
                    hAndTIndex: 5,
                    hsAndTsPaneColour: kPane3,
                    hsAndTsPaneText: 'Hypoxia',
                    hsAndTsPaneTextColour: kButtonTextColour,
                    indexPosition: indexPositionsOfHsAndTs[5],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[5] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[5]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[5]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),


                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HsAndTsPane(
                    hAndTIndex: 6,
                    hsAndTsPaneColour: kPane4,
                    hsAndTsPaneText: 'H+ Ions',
                    hsAndTsPaneTextColour: kButtonTextColour,
                    indexPosition: indexPositionsOfHsAndTs[6],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[6] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[6]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[6]} considered';
                        }
                        else
                        {

                        }
                      });
                    },
                  ),
                  HsAndTsPane(
                    hAndTIndex: 7,
                    hsAndTsPaneColour: kPane4,
                    hsAndTsPaneText: 'Tamponade',
                    hsAndTsPaneTextColour: kButtonTextColour,
                    indexPosition: indexPositionsOfHsAndTs[7],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[7] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[7]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[7]} considered';
                        }
                        else
                        {

                        }
                      });
                    },
                  ),

                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HsAndTsPane(
                    hAndTIndex: 8,
                    hsAndTsPaneColour: kPane5,
                    hsAndTsPaneText: 'Tension Pneumothorax',
                    hsAndTsPaneTextColour: kButtonTextColourDark,
                    indexPosition: indexPositionsOfHsAndTs[8],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[8] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[8]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[8]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),
                  HsAndTsPane(
                    hAndTIndex: 9,
                    hsAndTsPaneColour: kPane5,
                    hsAndTsPaneText: 'Toxins',
                    hsAndTsPaneTextColour: kButtonTextColourDark,
                    indexPosition: indexPositionsOfHsAndTs[9],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[9] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[9]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[9]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),


                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HsAndTsPane(
                    hAndTIndex: 10,
                    hsAndTsPaneColour: kPane6,
                    hsAndTsPaneText: 'Thrombosis (Lung)',
                    hsAndTsPaneTextColour: kButtonTextColourDark,
                    indexPosition: indexPositionsOfHsAndTs[10],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[10] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[10]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[10]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),
                  HsAndTsPane(
                    hAndTIndex: 11,
                    hsAndTsPaneColour: kPane6,
                    hsAndTsPaneText: 'Thrombosis (MI)',
                    hsAndTsPaneTextColour: kButtonTextColourDark,
                    indexPosition: indexPositionsOfHsAndTs[11],
                    onValueChanged: (index)
                    {
                      setState(() {
                        indexPositionsOfHsAndTs[11] = index;
                         

                        if (index == 0)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[11]} excluded';
                        }
                        else if (index == 1)
                        {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ${hsAndTsLogStrings[11]} considered';
                        }
                        else
                        {

                        }
                      });
                    },

                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
