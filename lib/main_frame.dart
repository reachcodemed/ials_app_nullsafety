import 'dart:async';
import 'package:ials_app_nullsafety/functions.dart';
import 'package:ials_app_nullsafety/constants.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:ials_app_nullsafety/welcome_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';
import 'counters.dart';
import 'fixed_page_widgets.dart';
import 'globalVariables.dart' as global;
import 'pop_up_windows.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';

//int adrenalineCycleSavedState = 0;
//int amiodaroneCycleSavedState = 0;

//String entryPaneText = " ";
//String lastLogRemoveText = "";

//bool reArrestAdrenalineKeepActive = false;
//bool reArrestAmiodaroneKeepActive = false;

//bool accessButtonActive = false;
//bool oxygenButtonActive = false;
//bool lucasButtonActive = false;
//bool rhythmButtonActiveMasterSwitch = true;
//bool roscRIPButtonActive = true;

//bool undoEventButtonActive = false;

//bool adrenalineButtonActive = false;
//bool amiodaroneButtonActive = false;

//bool amiodaroneButtonActivePersist = false;
//bool adrenalineButtonActivePersist = false;

//bool systemBrain.vTVFVisible = true;
//bool systemBrain.shockButtonVisible = false;
//

late bool rhythmTextLabelVisibility;
late bool attachPadsButton;
bool reArrestButtonVisible = false;
bool ripStatus = false;
bool ripOrRoscStatus = false;

bool firstTimeShock = true;
bool threeshockButtonVisible = true;
//bool? threeShockTherapyInProgress;
//int threeShockCounter = 0;

//String vFButtonText = "VF";
//String vTButtonText = "pVT";
//String amiodaroneButtonText = "";



class MainFrame extends StatefulWidget {

const MainFrame ({super.key,
  required this.rhythmButtonActiveInitial,
  required this.attachPadsActiveInitial,
});

  final bool rhythmButtonActiveInitial;
  final bool attachPadsActiveInitial;

// this code here with the key seems to be what brings information from the stateful widget across.

  createState() => MainFrameState();
}

class MainFrameState extends State<MainFrame> with SingleTickerProviderStateMixin {


  late AnimationController controller;
  late Animation animation;



  //this is the function which you can use to apply functions as a stateful widget is being built.
  //it will only be created when a widget is being built the first time.
  @override
  void initState() {
    super.initState();
    setState(() {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        Provider.of<SystemBrain>(context, listen: false).startGlobalTimerOnly(context);
      });
      //
      Provider.of<SystemBrain>(context, listen: false).rhythmButtonActiveMasterSwitch = widget.rhythmButtonActiveInitial;
      rhythmTextLabelVisibility = !widget.attachPadsActiveInitial;
      attachPadsButton = widget.attachPadsActiveInitial;
      //twominutetimer = widget.initialTwoMinuteTimerText;
    });

    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1
      ,
    );

    controller.forward();

    animation = StepTween(begin: 3, end: 4 ).animate(controller);

    animation.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          controller.reverse(from: 1.0);
        }
        else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    });
  }

  void updateWidget() {
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {





    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    systemBrain.timeNow = '${TimeOfDay
        .now()
        .hour
        .toString()
        .padLeft(2, '0')}:${TimeOfDay
        .now()
        .minute
        .toString()
        .padLeft(2, '0')}';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      SafeArea(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child:
              Container(
                color: kPanelBackgroundColour,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TopLeftAndRightPanes(
                      cycleCounterExitButtonDescription: 'No OF CYCLES',
                      cycleCounterExitButtonText: systemBrain.cycleCounter
                          .toString(),
                      cycleCounterExitButtonColour: kBlueButtonColour,


                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TwoMinuteTimerTextBox(
                            ripORroscStatus: ripOrRoscStatus,
                            timerTextMaxFontSize: 60.0,
                            timerTextMinFontSize: 20,
                            timerTextMaxLines: 1,
                            timerTextColour: Colors.red,
                            timerTextVerticalPadding: 10.0,
                          ),
                          Visibility(
                            visible: systemBrain.twoMinuteTimerTextVisibility,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const Center(
                                child: AutoSizeText("2 MINUTE TIMER",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,


                                  ),
                                  maxFontSize: 40,
                                  maxLines: 1,),
                              ),
                            ),
                          ),

                          Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 2.0,
                          ),
                          Row(
                            children: [
                              GlobalTimerTextBox(
                                timerTextColour: Colors.black,
                                //timerText: "Total time: $myglobaltimer",
                                timerTextMaxFontSize: 30.0,
                                timerTextMinFontSize: 10,
                                timerTextMaxLines: 1,
                                timerTextVerticalPadding: 10.0,),

                              const SizedBox(height: 5.0, width: 5.0,),
                              StartTimeTextBox(
                                timerTextColour: const Color(0xFFb3b3b3),
                                timerText: 'Start Time: ${systemBrain.startTime}',
                                timerTextMaxFontSize: 30.0,
                                timerTextMinFontSize: 10,
                                timerTextMaxLines: 1,
                                timerTextVerticalPadding: 10.0,

                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TopLeftAndRightPanes(
                        cycleCounterExitButtonDescription: 'END SESSION',
                        cycleCounterExitButtonText: 'X',
                        cycleCounterExitButtonColour: kYellowButtonColour,
                        cycleCounterExitButtonFunction: () {
                          _exitArrestConfirmation();
                        }
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child:
              Container(
                color: kPanelBackgroundColour,
                margin: const EdgeInsets.all(10.0,),
                padding: const EdgeInsets.all(5.0),
                child:
                  Consumer<SystemBrain>(
                    builder: (context, oxygenDelivery, widget)
                    => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textBaseline: TextBaseline.alphabetic,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: double.infinity, width: 5.0,),
                      InterventionsButtons(
                        interventionsButtonText: 'AIRWAY',
                        interventionsButtonColour: (systemBrain.nPACounter +
                            systemBrain.oPACounter + systemBrain.iGelCounter +
                            systemBrain.eTTubeCounter == 0)
                            ? kInterventionsButtonInactiveColour
                            : kInterventionsButtonActiveColour,
                        interventionButtonPressed: () {
                          setState(() {
                            AirwayPopUp accessBottomModal = AirwayPopUp(
                                updateWidget);
                            accessBottomModal.mainBottomSheet(context);
                          });
                        },
                      ), //AIRWAY BUTTON

                      InterventionsButtons(interventionsButtonText: 'ACCESS',
                        interventionsButtonColour: systemBrain.accessCounterList[0] +
                            systemBrain.accessCounterList[1] +
                            systemBrain.accessCounterList[2] == 0
                            ? kInterventionsButtonInactiveColour
                            : kInterventionsButtonActiveColour,
                        interventionButtonPressed: () {
                          setState(() {
                            AccessPopUp accessBottomModal = AccessPopUp(
                                updateWidget);
                            accessBottomModal.mainBottomSheet(context);
                          });
                        },
                      ), //ACCESS BUTTON
                       InterventionsButtons(interventionsButtonText: 'OXYGEN',
                          interventionsButtonColour: systemBrain.oxygenActive
                              ? kInterventionsButtonActiveColour
                              : kInterventionsButtonInactiveColour,
                          interventionButtonPressed: () {
                            systemBrain.oxygenActivation();

                            if (systemBrain.oxygenActive == true) {
                              systemBrain.lastLogEntry = 4;
                              systemBrain.undoEventButtonActive = true;
                            }

                            else {
                              systemBrain.lastLogEntry = 5;
                              systemBrain.undoEventButtonActive = true;
                            }

                              //TODO: Oxygen needs fixing and log changes updated
                              // oxygenButtonActive = !oxygenButtonActive;
                              //
                           systemBrain.oxygenActive
                                  ? global.log = '${global.log}\n${systemBrain.timeNow} - Oxygen delivery commenced'
                                  : global.log = '${global.log}\n${systemBrain.timeNow} - Oxygen delivery stopped';



                              //stopGlobalTimer();

                          },
                        ),
                      //OXYGEN BUTTON
                      InterventionsButtons(interventionsButtonText: 'LUCAS',
                        interventionsButtonColour: systemBrain.lucasActive
                            ? kInterventionsButtonActiveColour
                            : kInterventionsButtonInactiveColour,
                        interventionButtonPressed: () {
                          systemBrain.lucasActivation();

                            systemBrain.lucasActive
                                ? global.log = '${global.log}\n${systemBrain.timeNow} - LUCAS device commenced'
                                : global.log = '${global.log}\n${systemBrain.timeNow} - LUCAS device stopped';

                            if (systemBrain.lucasActive == true) {
                              systemBrain.lastLogEntry = 6;
                              systemBrain.undoEventButtonActive = true;
                            }
                            else {
                              systemBrain.lastLogEntry = 7;
                              systemBrain.undoEventButtonActive = true;
                            }

                        },
                      ), //LUCAS BUTTON
                      const SizedBox(height: double.infinity, width: 5.0,),

                    ],
                  ),
                ),
              ),

            ),
            Visibility(
              visible: rhythmTextLabelVisibility,
              child: Container(
                color: kPanelBackgroundColour,
                margin: const EdgeInsets.only(left: 10.0,),
                width: 120.0,
                height: 20.0,
                child: const AutoSizeText('Rhythm Analysis',
                  textAlign: TextAlign.center,),
              ),
            ),
            Visibility(
              visible: attachPadsButton,
              child: Expanded(
                flex: 6,
                child: GestureDetector(
                  onTap: () {
                    //startTwoMinuteTimerOnly();
                    setState(() {
                      attachPadsButton = false;
                      rhythmTextLabelVisibility = true;
                      controller.dispose();
                      //rhythmButtonActive = true;
                      playSound('rhythmCheck');
                      //twominutetimer = "RHYTHM CHECK";
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: animation.value.toDouble(),
                      vertical: animation.value.toDouble(),
                    ),
                    color: Colors.grey.shade300,
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(2),
                      color: Colors.white,
                      child:
                      const Center(child: Image(image: AssetImage(
                          'images/attachPads.png'))),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: rhythmTextLabelVisibility,
              child: Expanded(
                flex: 5,
                child:
                Consumer<SystemBrain>(
                  builder: (context, update, widget)
                  =>Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(width: 10,),
                      Counters(counterIcon: CupertinoIcons.bolt_fill,
                        counterValue: systemBrain.shockCounter,),
                      Stack(
                        children: [
                          Visibility(
                            visible: systemBrain.vTVFVisible,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallRhythmButton(
                                  rhythmButtonText: systemBrain.vFButtonText,
                                  rhythmButtonColour: kVTVFActiveButtonColour,
                                  rhythmButtonTextColour: Colors.white,
                                  rhythmButtonPressed: systemBrain.rhythmButtonActiveMasterSwitch
                                      ? () {
                                    setState(() {
                                      systemBrain.vTPressed = false;
                                      //vFPressed = false;
                                      systemBrain.vFPressed = true;
                                      playSound('shockAdvised');
                                      systemBrain.vTVFVisible = false;
                                      systemBrain.shockButtonVisible = true;
                                      systemBrain.rhythmButtonActiveMasterSwitch = false;
                                      global.log =
                                          '${global.log}\n${systemBrain.timeNow} - Ventricular fibrillation rhythm detected - shockable rhythm';
                                      systemBrain.lastLogEntry = 8;
                                      systemBrain.undoEventButtonActive = true;
                                    });
                                  }
                                      : null,
                                ),
                                SmallRhythmButton(
                                  rhythmButtonText: systemBrain.vTButtonText,
                                  rhythmButtonColour: kVTVFActiveButtonColour,
                                  rhythmButtonTextColour: Colors.white,
                                  rhythmButtonPressed: systemBrain.rhythmButtonActiveMasterSwitch
                                      ? () {
                                    setState(() {
                                      playSound('shockAdvised');
                                      //vTPressed = false;
                                      systemBrain.vFPressed = false;
                                      systemBrain.vTPressed = true;
                                      systemBrain.vTVFVisible = false;
                                      systemBrain.shockButtonVisible = true;
                                      systemBrain.rhythmButtonActiveMasterSwitch = false;
                                      global.log =
                                          '${global.log}\n${systemBrain.timeNow} - Pulseless ventricular tachycardia rhythm detected - shockable rhythm';

                                      systemBrain.lastLogEntry = 9;
                                      systemBrain.undoEventButtonActive = true;
                                    });
                                  }
                                      : null,
                                ),
                              ],
                            ),
                          ),

                          Visibility(
                            visible: systemBrain.shockButtonVisible,
                            child:
                            Center(child: SmallRhythmButton(
                              rhythmButtonText: 'SHOCK',
                              rhythmButtonColour: Colors.yellow,
                              rhythmButtonHeight: 80.0,
                              rhythmButtonTextColour: Colors.black,
                              rhythmButtonPressed: systemBrain.shockButtonVisible ? () =>
                                  systemBrain.shockFunction(context) : null,),
                            ),
                          ),
                          // Visibility(
                          //   visible: threesystemBrain.systemBrain.shockButtonVisible,
                          //   child:
                          //   Center(child: RhythmButton(
                          //     rhythmButtonText: 'SHOCK',
                          //     rhythmButtonColour: Colors.yellow,
                          //     rhythmButtonHeight: 80.0,
                          //     rhythmButtonTextColour: Colors.black,
                          //     rhythmButtonPressed: systemBrain.shockButtonVisible?()=>ShockFunction():null,),
                          //   ),
                          // ),
                        ],
                      ), //VF VT and Shock buttons inside a stack

                      Stack(
                        children: [
                          Center(
                            child: CentralRhythmButton(
                              rhythmButtonText: 'ROSC/RIP',
                              rhythmButtonHeight: 80.0,
                              rhythmButtonColour: kYellowButtonColour,
                              rhythmButtonTextColour: kButtonTextColourDark,
                              rhythmButtonPressed: systemBrain.roscRIPButtonActive ? () {
                                _roscRIPDialog();
                              } : null,
                            ),
                          ),
                          Center(
                            child: Visibility(
                              visible: reArrestButtonVisible,
                              child: CentralRhythmButton(
                                rhythmButtonText: 'RE-ARREST',
                                rhythmButtonHeight: 80.0,
                                rhythmButtonColour: kBlueButtonColour,
                                rhythmButtonTextColour: Colors.white,
                                rhythmButtonPressed: () {
                                  _reArrestConfirmation();
                                },
                              ),
                            ),
                          ),


                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallRhythmButton(
                            rhythmButtonText: 'ASYSTOLE',
                            rhythmButtonColour: kPEAAsystoleButtonColour,
                            rhythmButtonTextColour: Colors.white,
                            rhythmButtonPressed: systemBrain.rhythmButtonActiveMasterSwitch
                                ? () {
                              global.log = '${global.log}\n${systemBrain.timeNow} - Asystole detected - non-shockable rhythm';

                              if (systemBrain.threeShockTherapyInProgress == true) {
                                if (systemBrain.threeShockCounter == 1) {
                                  systemBrain.lastLogEntry = 32;
                                }
                                else if (systemBrain.threeShockCounter == 2) {
                                  systemBrain.lastLogEntry = 33;
                                }
                                else if (systemBrain.threeShockCounter == 3) {
                                  systemBrain.lastLogEntry = 10;
                                }
                                else {

                                }
                              }
                              else {
                                systemBrain.lastLogEntry = 10;
                              }

                              systemBrain.threeShockTherapyInProgress = false;
                              systemBrain.nonShockableFunction(context);

                              systemBrain.undoEventButtonActive = true;
                            }
                                : null,

                          ),
                          SmallRhythmButton(
                            rhythmButtonText: 'PEA',
                            rhythmButtonColour: kInterventionsButtonActiveColour,
                            rhythmButtonTextColour: Colors.white,
                            rhythmButtonPressed: systemBrain.rhythmButtonActiveMasterSwitch
                                ? () {
                              global.log = '${global.log}\n${systemBrain.timeNow} - Pulseless Electrical Activity detected - non-shockable rhythm';


                              if (systemBrain.threeShockTherapyInProgress == true) {
                                if (systemBrain.threeShockCounter == 1) {
                                  systemBrain.lastLogEntry = 34;
                                }
                                else if (systemBrain.threeShockCounter == 2) {
                                  systemBrain.lastLogEntry = 35;
                                }
                                else if (systemBrain.threeShockCounter == 3) {
                                  systemBrain.lastLogEntry = 10;
                                }
                                else {

                                }
                              }
                              else {
                                systemBrain.lastLogEntry = 10;
                              }

                              systemBrain.threeShockTherapyInProgress = false;
                              systemBrain.nonShockableFunction(context);

                              systemBrain.undoEventButtonActive = true;
                            }
                                : null,
                          ),
                        ],
                      ), //NON SHOCKABLE BUTTONS

                      Counters(counterIcon: CupertinoIcons.bolt_slash,
                        counterValue: systemBrain.nonShockableCounter,),

                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
              ),
            ),
            PageLineWidget(),
            Container(
              color: kPanelBackgroundColour,
              margin: const EdgeInsets.only(left: 10.0,),
              width: 70.0,
              height: 20.0,
              child: const AutoSizeText('Drugs',
                style: TextStyle(
                  //fontSize: 10.0,


                ),
                maxFontSize: 20.0,
                minFontSize: 10.0,
                textAlign: TextAlign.center,),
            ),
            Expanded(
                flex: 4,
                child:
                Consumer<SystemBrain>(
                  builder: (context, update, widget)
                  =>Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Expanded(
                        flex: 1,
                        child: Counters(counterValue: systemBrain.adrenalineCounter,
                          counterIcon: CupertinoIcons.rays,),
                      ),

                      ActionButton(actionButtonColour: Colors.yellow,
                        actionButtonIcon: Icons.add,
                        actionButtonIconColour: systemBrain.adrenalineButtonActive ? Colors
                            .red : Colors.white,
                        actionButtonDescriptionText: 'ADRENALINE',
                        actionButtonFunction: systemBrain.adrenalineButtonActive ? () =>
                            systemBrain.adrenalineActiveFunction(context) : null,

                        additionalTextWidget: const AutoSizeText("10ml of 1:10,000",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,

                          ),
                          minFontSize: 6.0,
                          maxFontSize: 10.0,
                          maxLines: 1,
                        ),

                      ),
                      //ActionButton(),
                      Expanded(
                        flex: 2,
                        child: Container(),),
                      ActionButton(
                        actionButtonColour: Colors.yellow,
                        actionButtonIcon: Icons.add,
                        actionButtonIconColour: systemBrain.amiodaroneButtonActive ? Colors
                            .red : Colors.white,
                        actionButtonDescriptionText: 'AMIODARONE',
                        actionButtonFunction: systemBrain.amiodaroneButtonActive ? () =>
                            systemBrain.amiodaroneActiveFunction() : null,


                        additionalTextWidget: AutoSizeText(systemBrain.amiodaroneButtonText,
                          style: const TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,


                          ),
                          minFontSize: 6.0,
                          maxFontSize: 10.0,
                          maxLines: 1,
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Counters(counterValue: systemBrain.amiodaroneCounter,
                          counterIcon: CupertinoIcons.slowmo,),

                        //color: Colors.green,

                      ),
                    ],
                  ),
                )
            ),
            PageLineWidget(),
            Container(
              color: kPanelBackgroundColour,
              margin: const EdgeInsets.only(left: 10.0,),
              width: 70.0,
              height: 20.0,
              child: const AutoSizeText('Other',
                textAlign: TextAlign.center,),
            ),
            Expanded(
              flex: 4,
              child:
              Consumer<SystemBrain>(
                builder: (context, update, widget)
                => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                        ),
                      ),
                      ActionButton(
                        actionButtonIcon: Icons.add,
                        actionButtonIconColour: kButtonTextColour,
                        actionButtonColour: kBlueButtonColour,
                        actionButtonDescriptionText: 'DRUG ENTRY',
                        actionButtonFunction: () {
                          DrugDrawer drugButtonModal = DrugDrawer();
                          drugButtonModal.mainBottomSheet(context);
                        },
                        additionalTextWidget: const SizedBox(),
                      ),
                      ActionButton(
                        actionButtonIcon: Icons.add,
                        actionButtonIconColour: kButtonTextColour,
                        actionButtonColour: kBlueButtonColour,
                        actionButtonDescriptionText: 'EVENT ENTRY',
                        actionButtonFunction: () {
                          _eventEntryDialog();
                        },
                        additionalTextWidget: const SizedBox(),

                      ),
                      ActionButton(
                        actionButtonIcon: CupertinoIcons.arrowshape_turn_up_left,
                        actionButtonIconColour: kButtonTextColour,
                        actionButtonColour: kBlueButtonColour,
                        actionButtonDescriptionText: 'UNDO EVENT',
                        additionalTextWidget: const SizedBox(),
                        actionButtonFunction: systemBrain.undoEventButtonActive ? () {
                          if (systemBrain.lastLogEntry == 1 ||
                              systemBrain.lastLogEntry == 8 ||
                              systemBrain.lastLogEntry == 9 || systemBrain.lastLogEntry ==
                              10 || systemBrain.lastLogEntry == 11 ||
                              systemBrain.lastLogEntry == 30 ||
                              systemBrain.lastLogEntry == 31 ||
                              systemBrain.lastLogEntry == 32 ||
                              systemBrain.lastLogEntry == 33 ||
                              systemBrain.lastLogEntry == 34 ||
                              systemBrain.lastLogEntry == 35) {
                            systemBrain.stopTwoMinuteTimerOnly(context);
                            systemBrain.resetTwoMinuteTimerOnly(context);

                            // stopTwoMinuteTimer();
                            // resetTwoMinuteTimer();

                            setState(() {
                              //twominutetimer = 'RHYTHM CHECK';
                              systemBrain.twoMinuteTimerTextVisibility = false;
                            });
                          }
                          else {

                          }
                          systemBrain.undoEvent(context);
                        } : null,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          //color: Colors.green,
                        ),),
                    ]

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future <void> accessNeededAlert(context) async {
    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    return showDialog<void>(
        barrierDismissible: true,
        useSafeArea: true,
        context: context,
        builder: (_) {
          return ListenableProvider.value(
            value: systemBrain,
            child: AlertDialog(
                title: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: const Text('Access needed',
                    style: TextStyle(
                      fontSize: 15.0,

                    ),
                  ),
                ),

                content: const Text(
                  'Please enter the access gained before administering medications',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),),
                actions: [

                  TextButton(
                      child: const Text('Dismiss'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                  ),
                ]
            ),
          );
        }

    );
  }


  Future <void> _eventEntryDialog() async {
    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    return showDialog<void>(
        barrierDismissible: true,
        useSafeArea: true,
        context: context,
        builder: (_) {
          return ListenableProvider.value(
            value: systemBrain,
            child: AlertDialog(
                title: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: const Text('Event Entry',
                      style: TextStyle(
                        fontSize: 15.0,
                      )

                  ),),
                content: TextField(
                  //expands: true,
                  minLines: 3,
                  maxLines: 8,
                  //maxLines: null,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {

                      systemBrain.entryPaneText = value;

                  },
                  decoration: kTextFieldExternalArrestDecoration.copyWith(
                    hintText: 'e.g. ICU registrar arrived',
                    hintStyle: const TextStyle(color: kTextFieldLightGreyBorder,
                      fontSize: 15,),),
                ),
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), ),
                actions: [

                  TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                  ),
                  TextButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        global.log = '${global.log}\n${systemBrain.timeNow} - ${systemBrain.entryPaneText}'
                        ;

                        systemBrain.lastLogEntry = 12;
                        systemBrain.undoEventButtonActive = true;
                      }
                  )
                ]
            ),
          );
        }

    );
  }

  Future <void> _confirmArrestEndDialog() async {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    return showDialog<void>(
        barrierDismissible: true,
        useSafeArea: true,
        context: context,
        builder: (_) {
          return ListenableProvider.value(
            value: systemBrain,
            child: AlertDialog(
                title: const Text("""Do you wish to confirm this?
                """,
                  style: TextStyle(
                    fontSize: 15.0,

                  ),

                ),
                content: const Text(
                  "Please ensure to send the information from the log before exiting the arrest. All the recorded information will be reset.",
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),),


                actions: [

                  TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                  ),
                  TextButton(
                      child: const Text('Send Log'),
                      onPressed: () {
                        sendLog(context);
                      }
                  ),

                  TextButton(
                      child: const Text('Confirm'),
                      onPressed: () {
                        systemBrain.rhythmButtonActiveMasterSwitch = false;
                        Navigator.of(context).pop();
                        systemBrain.resetTwoMinuteTimerOnly(context);
                        systemBrain.stopGlobalTimerOnly(context);

                        ripOrRoscStatus = true;

                        if (ripStatus == true) {
                          setState(() {
                            systemBrain.roscRIPButtonActive = false;
                            global.log = '${global.log}\n${systemBrain.timeNow} - Cardiopulmonary resuscitation stopped, RIP';
                          });
                        }
                        else {
                          setState(() {
                            reArrestButtonVisible = true;
                            global.log = '${global.log}\n${systemBrain.timeNow} - Return of spontaneous circulation (ROSC)';
                          });
                        }
                        setState(() {
                          systemBrain.adrenalineButtonActive
                              ? systemBrain.reArrestAdrenalineKeepActive = true
                              : systemBrain.reArrestAdrenalineKeepActive = false;

                          systemBrain.amiodaroneButtonActive
                              ? systemBrain.reArrestAmiodaroneKeepActive = true
                              : systemBrain.reArrestAmiodaroneKeepActive = false;

                          systemBrain.adrenalineButtonActive = false;
                          systemBrain.amiodaroneButtonActive = false;
                        });
                      }
                  ),
                ]
            ),
          );
        }

    );
  }

  Future <void> _reArrestConfirmation() async {
    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    return showDialog<void>(
        barrierDismissible: true,
        useSafeArea: true,
        context: context,
        builder: (_) {
          return ListenableProvider.value(
            value: systemBrain,
            child: AlertDialog(
              title: const Text(
                'Do you wish to continue with the arrest which just terminated (note this will not reset the counters)?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                ),

              ),

              content: Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: MaterialButton(
                        color: kPanelBackgroundColour,
                        onPressed: () {
                          systemBrain.resetGlobalTimerOnly(context);
                          systemBrain.startGlobalTimerOnly(context);

                          setState(() {
                            systemBrain.rhythmButtonActiveMasterSwitch = true;
                            reArrestButtonVisible = false;
                            systemBrain.resetTwoMinuteTimerOnly(context);
                            systemBrain.startTwoMinuteTimerOnly(context);
                            // resetTwoMinuteTimer();
                            // startTwoMinuteTimer();

                            systemBrain.startTime = '${TimeOfDay
                                .now()
                                .hour
                                .toString()
                                .padLeft(2, '0')}:${TimeOfDay
                                .now()
                                .minute
                                .toString()
                                .padLeft(2, '0')}';

                            systemBrain.cycleCounter = 0;
                            systemBrain.shockCounter = 0;
                            systemBrain.nonShockableCounter = 0;
                            systemBrain.adrenalineCounter = 0;
                            systemBrain.amiodaroneCounter = 0;
                            systemBrain.adrenalineCycle = 0;
                            systemBrain.amiodaroneCycle = 0;

                            global.log = '${global.log}\n${systemBrain.timeNow} - Re-arrest, cycle counting and timers restarted and not continued from previous arrest';
                          });
                          ripOrRoscStatus = false;
                          Navigator.of(context).pop();
                        },
                        child: const Text("No",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: MaterialButton(
                        color: kPanelBackgroundColour,
                        onPressed: () {
                          systemBrain.startGlobalTimerOnly(context);
                          setState(() {
                            systemBrain.rhythmButtonActiveMasterSwitch = true;
                            reArrestButtonVisible = false;
                            systemBrain.resetTwoMinuteTimerOnly(context);
                            systemBrain.startTwoMinuteTimerOnly(context);

                            systemBrain.reArrestAmiodaroneKeepActive ? {
                              systemBrain.amiodaroneButtonActive = true
                            } : {systemBrain.amiodaroneButtonActive = false};
                            systemBrain.reArrestAdrenalineKeepActive ? {
                              systemBrain.adrenalineButtonActive = true
                            } : {systemBrain.adrenalineButtonActive = false};
                            //startGlobalTimer();
                            global.log = '${global.log}\n${systemBrain.timeNow} - Re-arrest, cycle counting and timers continued from previous arrest';
                          });
                          ripOrRoscStatus = false;
                          Navigator.of(context).pop();
                        },
                        child: const Text("Yes",

                        ),),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Future <void> _roscRIPDialog() async {
    return showDialog<void>(
        useSafeArea: true,
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please confirm ROSC or RIP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,

              ),

            ),

            content: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: MaterialButton(
                      color: kPanelBackgroundColour,
                      onPressed: () {
                        Navigator.of(context).pop();
                        _confirmArrestEndDialog();
                        ripStatus = false;
                      },
                      child: const Text("ROSC",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: MaterialButton(
                      color: kPanelBackgroundColour,
                      onPressed: () {
                        ripStatus = true;
                        Navigator.of(context).pop();
                        _confirmArrestEndDialog();
                      },
                      child: const Text("RIP",
                      ),),
                  ),
                ),
              ],
            ),


          );
        }


    );
  }

  Future <void> _exitArrestConfirmation() {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    return showDialog<void>(
        barrierDismissible: true,
        useSafeArea: true,
        context: context,
        builder: (_) {
          return ListenableProvider.value(
            value: systemBrain,
              child: AlertDialog(

                title: const Text("""Do you really wish to exit?
                """,
                  style: TextStyle(
                    fontSize: 15.0,

                  ),

                ),
                content: const Text(
                  "Please ensure to send the information from the log before exiting this screen, all the recorded information will be reset.",
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),),


                actions: [

                  TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                  ),

                  TextButton(
                      child: const Text('Send Log'),
                      onPressed: () {
                        sendLog(context);
                      }
                  ),

                  TextButton(
                      child: const Text('Confirm'),
                      onPressed: () {
                        if(controller.isAnimating)
                          {
                            controller.dispose();
                          }
                        else
                          {

                          }
                        systemBrain.resetTwoMinuteTimerOnly(context);
                        // resetTwoMinuteTimer();
                        // stopTwoMinuteTimer();
                        systemBrain.resetGlobalTimerOnly(context);
                        //accessButtonActive = false;
                        systemBrain.oxygenActive = false;
                        systemBrain.lucasActive = false;
                        //rhythmButtonActive = false;
                        systemBrain.roscRIPButtonActive = true;

                        systemBrain.adrenalineButtonActive = false;
                        systemBrain.amiodaroneButtonActive = false;

                        systemBrain.vTVFVisible = true;
                        systemBrain.shockButtonVisible = false;
                        systemBrain.twoMinuteTimerTextVisibility = false;

                        reArrestButtonVisible = false;
                        ripStatus = false;

                        systemBrain.accessCounterList[0] = 0;
                        systemBrain.accessCounterList[1] = 0;
                        systemBrain.accessCounterList[2] = 0;

                        systemBrain.nPAPresent = false;
                        systemBrain.oPAPresent = false;
                        systemBrain.iGelPresent = false;
                        systemBrain.eTTubePresent = false;

                        systemBrain.accessBooleanList [0] = false;
                        systemBrain.accessBooleanList [1] = false;
                        systemBrain.accessBooleanList [2] = false;
                        unsuccessfulAccessPresent = false;

                        systemBrain.nPACounter = 0;
                        systemBrain.oPACounter = 0;
                        systemBrain.iGelCounter = 0;
                        systemBrain.eTTubeCounter = 0;

                        systemBrain.unsuccessfulAccessCounter = 0;



                        systemBrain.lastLogEntry = 0;
                        systemBrain.lastLogRemoveText = '';
                        systemBrain.undoEventButtonActive = false;

                        firstTimeShock = true;
                        threeshockButtonVisible = true;
                        systemBrain.threeShockTherapyInProgress;
                        systemBrain.threeShockCounter = 0;

                        systemBrain.vFButtonText = "VF";
                        systemBrain.vTButtonText = "pVT";

                        global.log = '';

                        ripOrRoscStatus = false;


                        setState(() {});

                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return const WelcomeScreen();
                        }));
                      }
                  )


                ]

          ),
            );
        }

    );
  }

  void sendLog(BuildContext context) {

    final systemBrain = Provider.of<SystemBrain>(context,listen: false);
    final String sendLogText = ('''
Arrest start time: ${systemBrain.startDate} at ${systemBrain.startTime} 

Number of cycles: ${systemBrain.cycleCounter.toString()}
Number of non-shockable cycles: ${systemBrain.nonShockableCounter.toString()}
Number of shockable cycles: ${systemBrain.shockCounter}
Number of adrenaline given: ${systemBrain.adrenalineCounter}
Number of amiodarone given: ${systemBrain.amiodaroneCounter}
                      ''' + '\n' + 'Events Summary: \n' + global.log);

    Share.share(sendLogText);
  }

}


