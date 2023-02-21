import 'dart:ui';
import 'package:ials_app_nullsafety/main_frame.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:provider/provider.dart';
import 'functions.dart';
import 'fixed_page_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:ials_app_nullsafety/buttons.dart';

import 'mother_board.dart';
import 'globalVariables.dart' as global;

class ExternalArrestScreen extends StatefulWidget {
  @override
  _ExternalArrestScreenState createState() => _ExternalArrestScreenState();
}

class _ExternalArrestScreenState extends State<ExternalArrestScreen> {

  String? callOutTime;
  String? startTime;
  int? firstRhythm;
  int? lastRhythm;
  int? cycleNumber;
  int? shockNumber;
  int? peaCyclesNumber;
  int? asystoleCyclesNumber;
  int? vfCyclesNumber;
  int? pVTCyclesNumber;
  int totalROSC = 0;
  int? totalAdrenalineGiven;
  int? adrenalineLastCycle;
  int? totalAmiodaroneGiven;
  int? amiodaroneLastCycle = null;
  bool alertText = false;

  List<String> rhythmNames= ["PEA","Asystole","VF","pVT"];


  @override
  Widget build(BuildContext context) {

    final systemBrain = Provider.of<SystemBrain>(context,listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: kButtonTextColourDark,
          leading:
          IconButton(
            icon: const Icon(CupertinoIcons.chevron_left,
              //size: 12.0,
              color: Colors.white,),
            onPressed: ()
            {
              Navigator.pop(context);
            },
          ),
          title: const Text('Manual Entry Arrest',
            style: TextStyle(fontSize: 20,
              ),

          ),
        ),
      body:
      Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 65,
            padding: const EdgeInsets.all(20.0),
            color: Colors.white,
            child:
            Column(
              children: [
                ManualArrestInputPane(
                  starText: "  ",
                  inputPaneText: "Call out time (HH:MM)?",
                  tabColour: Colors.yellow[700],
                  hintTextInput: "HH:MM",
                  textInputFunction: (value){
                    callOutTime = value;
                  },

                ),
                ManualArrestInputPane(
                  starText: " * ",
                  inputPaneText: "Arrest start time (HH:MM)?",
                  tabColour: Colors.yellow[700],
                  hintTextInput: "HH:MM",
                  textInputFunction: (value){
                    startTime = value;
                  },

                ),

                ManualArrestQuadSliderPane(
                    inputPaneText: 'First Rhythm?',
                    starText: ' * ',
                    tabColour: Colors.yellow[700],
                    indexPosition: firstRhythm,
                    onValueChanged:(index)
                    {
                      setState(() {
                        firstRhythm = index;
                      });
                    }
                ),


                Expanded(child: Container(color: Colors.white),),

                ManualArrestInputPane(
                  starText: " * ",
                  inputPaneText: "How many cycles have been completed?",
                  tabColour: Colors.green[500],
                  hintTextInput: "Cycles",
                  textInputFunction: (value){
                    setState(() {
                      cycleNumber = int.parse(value);
                    });
                  },

                ),

                ManualArrestInputPane(
                  starText: " * ",
                  inputPaneText: "How many shocks delivered?",
                  tabColour: Colors.green[500],
                  hintTextInput: "Shocks",
                  textInputFunction: (value){
                    shockNumber = int.parse(value);
                  },

                ),

                ManualArrestQuadSliderPane(
                  inputPaneText: 'Last Rhythm?',
                  starText: ' * ',
                  tabColour: Colors.green[500],
                  indexPosition: lastRhythm,
                  onValueChanged:(index)
                    {
                      setState(() {
                        lastRhythm = index;
                      });
                    }

                ),

                Expanded(
                  child:
                  Container(
                    child: Row(
                      children: [
                        const Expanded(
                            flex: 1,
                            child: Text(' * ',
                                style: TextStyle(color: Colors.red,))),
                        Expanded(
                            flex: 1,
                            child: Container(color: Colors.green[500], width: 1.0,)),

                        ManualArrestQuadInputPane(
                          inputPaneText: "PEA",
                          hintTextInput: "",
                          fontSize: 11,
                          textInputFunction: (value)
                          {
                            peaCyclesNumber = int.parse(value);
                          },
                        ),
                        ManualArrestQuadInputPane(
                          inputPaneText: "Asys",
                          hintTextInput: "",
                          fontSize: 11,
                          textInputFunction: (value)
                          {
                            asystoleCyclesNumber = int.parse(value);
                          },
                        ),
                        ManualArrestQuadInputPane(
                          inputPaneText: "VF",
                          hintTextInput: "",
                          fontSize: 11,
                          textInputFunction: (value)
                          {
                            vfCyclesNumber = int.parse(value);
                          },
                        ),
                        ManualArrestQuadInputPane(
                          inputPaneText: "pVT",
                          hintTextInput: '',
                          fontSize: 11,
                          textInputFunction: (value)
                          {
                            pVTCyclesNumber = int.parse(value);
                          },
                        ),
                      ],
                    ),
                  ),


                ),


                ManualArrestInputPane(
                  starText: "  ",
                  inputPaneText: "Total number of ROSC",
                  tabColour: Colors.green[500],
                  hintTextInput: "total ROSC",
                  textInputFunction: (value){
                    totalROSC = int.parse(value);
                  },

                ),

                Expanded(child: Container(color: Colors.white),),

                ManualArrestInputPane(
                  starText: " * ",
                  inputPaneText: "How many adrenaline given?",
                  tabColour: Colors.red[500],
                  hintTextInput: "adrenaline",
                  textInputFunction: (value){
                    totalAdrenalineGiven = int.parse(value);
                  },

                ),

                ManualArrestDualSliderPane(
                  inputPaneText: 'Adrenaline given in last cycle?',
                  starText: ' * ',
                  tabColour: Colors.red[500],
                  indexPosition: adrenalineLastCycle,
                  onValueChanged: (index)
                  {
                    setState(() {
                      adrenalineLastCycle = index;
                    });
                  },

                ),

                ManualArrestInputPane(
                  starText: " * ",
                  inputPaneText: "How many amiodarone given?",
                  tabColour: Colors.red[500],
                  hintTextInput: "amiodarone",
                  textInputFunction: (value){
                    totalAmiodaroneGiven = int.parse(value);
                  },

                ),

                ManualArrestDualSliderPane(
                  inputPaneText: 'Amiodarone given in last cycle?',
                  starText: ' * ',
                  tabColour: Colors.red[500],
                  indexPosition: amiodaroneLastCycle,
                  onValueChanged: (index)
                  {
                    setState(() {
                      amiodaroneLastCycle = index;
                    });
                  },
                ),

                //Expanded(child: Container(color: Colors.white),),

                WelcomeButtons(
                    welcomeButtonText: 'Continue with arrest',
                    welcomeButtonColour: kPEAAsystoleButtonColour,
                    welcomeButtonPressed:() {
                      try {
                        if (startTime == null|| cycleNumber == null || shockNumber == null|| peaCyclesNumber == null || asystoleCyclesNumber == null || pVTCyclesNumber == null || vfCyclesNumber == null ||totalAdrenalineGiven == null||totalAmiodaroneGiven==null || adrenalineLastCycle == null || amiodaroneLastCycle == null||firstRhythm == null || lastRhythm == null)
                        {
                          setState(() {
                            alertText = true;
                          });

                          print(startTime);
                          print(cycleNumber);
                          print(shockNumber);
                          print(pVTCyclesNumber);
                          print(peaCyclesNumber);
                          print(asystoleCyclesNumber);
                          print(vfCyclesNumber);
                          print(totalAdrenalineGiven);
                          print(totalAmiodaroneGiven);
                          print(adrenalineLastCycle);
                          print(amiodaroneLastCycle);
                          print(firstRhythm);
                          print(lastRhythm);

                        }

                        else
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            global.startTime = startTime;
                            systemBrain.cycleCounter = cycleNumber!;

                            systemBrain.nonShockableCounter = peaCyclesNumber! + asystoleCyclesNumber!;
                            global.shockCounter = vfCyclesNumber! + pVTCyclesNumber!;

                            systemBrain.adrenalineCounter  = totalAdrenalineGiven!;

                            if(global.shockCounter >=3)
                              {
                                if(totalAmiodaroneGiven! == 0)
                                  {
                                    global.specialAmiodaroneRequirement = 1;
                                  }
                                else if (totalAmiodaroneGiven! == 1)
                                  {
                                    global.specialAmiodaroneRequirement = 2;
                                  }
                                else if (totalAmiodaroneGiven! >= 2)
                                  {
                                    global.specialAmiodaroneRequirement = 0;
                                  }
                                else
                                  {

                                  }

                              }

                            if(global.roscCounter == null)
                              {
                                global.roscCounter = 0;
                              }

                            else
                            {
                              global.roscCounter = totalROSC;
                            }

                            adrenalineLastCycle==0? systemBrain.adrenalineCycle =1:systemBrain.adrenalineCycle = 0;

                            if(callOutTime == null)
                              {
                                global.callOutTime = "Not recorded";
                              }
                            else
                              {
                                global.callOutTime = callOutTime;
                              }


                            if(firstRhythm == 0)
                              {

                              }

                            undoEventButtonActive = false;
                            firstTimeShock = false;
                            threeShockTherapyInProgress = false;

                            playSound('rhythmCheck');

                            global.log = global.log + '\nArrest handed over. Prior to handover: '
                                +"\n\n" +"Call out time: ${global.callOutTime}"
                                +"\n" +"Arrest start time: $startTime"
                                +"\n" +"First rhythm detected: ${rhythmNames[firstRhythm!]}"
                                +"\n" + "Cycles completed: ${systemBrain.cycleCounter}"
                                +"\n" + "Non-shockable cycles completed: ${systemBrain.nonShockableCounter}"
                                +"\n" + "Shockable cycles completed: ${global.shockCounter}"
                                +"\n" + "Shocks delivered: $shockNumber"
                                +"\n" + "Adrenaline doses given: ${systemBrain.adrenalineCounter}"
                                +"\n" + "Amiodarone doses given: ${systemBrain.amiodaroneCounter}"
                                +"\n" + "Total ROSC: ${global.roscCounter}"
                                +"\n" + "Last rhythm detected: ${rhythmNames[firstRhythm!]}\n"
                            ;

                            return const MotherBoard(
                              rhythmButtonActiveInitial: true,
                              attachPadsActiveInitial: false,
                            );
                          }));
                        }

                      } catch (e, s) {
                        print(s);
                      }

                    }
                ),

                Center(
                  child: Visibility(
                    visible: alertText,
                    child:
                      const Text("Please complete all  required fields (*) fields before proceeding",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13.0,
                      ),
                      ),
                  ),

                ),



              ],
            ),
          ),
        ),
      ),

    );
  }
}


