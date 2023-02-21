import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ials_app_nullsafety/functions.dart';
import 'package:ials_app_nullsafety/pop_up_windows.dart';
import 'package:ials_app_nullsafety/timer.dart';
import 'package:provider/provider.dart';
import 'globalVariables.dart' as global;
import 'main_frame.dart';

class SystemBrain extends ChangeNotifier
{

  int cycleCounter = 0;
  int adrenalineCounter = 0;
  int adrenalineCycle = 0;
  int amiodaroneCycle = 0;
  int amiodaroneCounter = 0;

  int nonShockableCounter = 0;

  bool adrenalineButtonActive = false;
  bool amiodaroneButtonActive = false;

  bool oxygenActive = false;
  bool lucasActive = false;

  int nPACounter = 0;
  int oPACounter = 0;
  int iGelCounter = 0;
  int eTTubeCounter = 0;

  bool nPAPresent = false;
  bool oPAPresent = false;
  bool iGelPresent = false;
  bool eTTubePresent = false;

  var accessCounterList = [0,0,0];
  var accessCounterStrings = ["Small bore cannula", "Large bore cannula", "Intraosseous access"];
  var accessBooleanList = [false,false,false];
  int unsuccessfulAccessCounter = 0;





  //region
  /*
  List logTextRemovalText =
  [
    ["", () {}],
    [
      ' - Shock x ' + global.shockCounter.toString() + ' delivered' + '\n' +
          '\n'
          + global.timeNow + ' - Cycle ' + Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString() + ":",
          (context) {
        global.shockCounter--;
        Provider.of<SystemBrain>(context, listen: false).cycleCounter--;
        rhythmButtonActiveMasterSwitch = false;
        shockButtonVisible = true;
        vTVFVisible = false;
        if (adrenalineButtonActivePersist == true &&
            Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive == true) {
          Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = true;
        }
        else {
          Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = false;
        }

        if (amiodaroneButtonActivePersist == true &&
            Provider.of<SystemBrain>(context, listen: false).amiodaroneButtonActive == true) {
          Provider.of<SystemBrain>(context, listen: false).amiodaroneButtonActive = true;
        }
        else {
          Provider.of<SystemBrain>(context, listen: false).amiodaroneButtonActive = false;
        }
        global.adrenalineCycle = adrenalineCycleSavedState;
        amiodaroneCycle = amiodaroneCycleSavedState;
      }
    ],
    [' - Adrenaline x${global.adrenalineCounter.toString()} given', (context) {
      global.adrenalineCounter--;
      Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = true;
    }
    ],
    [' - Amiodarone x${global.amiodaroneCounter.toString()} given', (context) {
      global.amiodaroneCounter--;
      amiodaroneCycle--;

      if(amiodaroneCycle == 2)
      {
        amiodaroneButtonText = "150 mg";
      }
      else
      {
        amiodaroneButtonText = "300 mg";
      }

      Provider.of<SystemBrain>(context, listen: false).amiodaroneButtonActive = true;
    }
    ],
    [' - Oxygen delivery commenced', (context) {
      ///TODO: Needs Fix - currently changing to provider
      ///oxygenButtonActive = !oxygenButtonActive;
      Provider.of<SystemBrain>(context, listen: false).oxygenActivation();
    }
    ],
    [' - Oxygen delivery stopped', () {
      ///oxygenButtonActive = !oxygenButtonActive;
    }
    ],
    [' - LUCAS device commenced', (context) {
      Provider.of<SystemBrain>(context, listen: false).lucasActivation();
    }
    ],
    [' - LUCAS device stopped', (context) {
      Provider.of<SystemBrain>(context, listen: false).lucasActivation();
    }
    ],

    [' - Ventricular fibrillation rhythm detected - shockable rhythm', () {
      vTVFVisible = true;
      rhythmButtonActiveMasterSwitch = true;
      //rhythmButtonActive = true;
      shockButtonVisible = false;
    }
    ],

    [
      ' - Pulseless ventricular tachycardia rhythm detected - shockable rhythm',
          () {
        vTVFVisible = true;
        rhythmButtonActiveMasterSwitch = true;
        shockButtonVisible = false;
      }
    ],

    [' - Asystole detected - non-shockable rhythm\n\n${global.timeNow} - Cycle ${Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString()}:', (context) {
      global.nonShockableCounter--;
      Provider.of<SystemBrain>(context, listen: false).cycleCounter--;
      rhythmButtonActiveMasterSwitch = true;
      global.adrenalineCycle = adrenalineCycleSavedState;

      if (adrenalineButtonActivePersist == true &&
          Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive == true) {
        Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = true;
      }
      else {
        Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = false;
      }

      if (global.shockCounter == 0 && global.nonShockableCounter == 0) {
        firstTimeShock = true;
      }
      else {
        firstTimeShock = false;
      }
    }
    ],

    [' - Pulseless Electrical Activity detected - non-shockable rhythm\n\n${global.timeNow} - Cycle ${Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString()}:', (context) {
      global.nonShockableCounter--;
      Provider.of<SystemBrain>(context, listen: false).cycleCounter--;
      global.adrenalineCycle = adrenalineCycleSavedState;
      rhythmButtonActiveMasterSwitch = true;

      if (adrenalineButtonActivePersist == true &&
          Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive == true) {
        Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = true;
      }
      else {
        Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = false;
      }


      if (global.shockCounter == 0 && global.nonShockableCounter == 0) {
        firstTimeShock = true;
      }
      else {
        firstTimeShock = false;
      }
    }
    ],
    [" - $entryPaneText", () {}],
    [' - Hartmann\'s solution (IV fluid) administered', () {}],
    [' - 0.9% sodium chloride (IV fluid bolus) administered', () {}],
    [' - Glucose (10%) 100ml bolus administered', () {}],
    [' - Sodium bicarbonate 50mls 8.4% (50mmol) administered', () {}],
    [' - Magnesium Sulphate 8mmol/2g in 100ml administered', () {}],
    [' - Alteplase 50mg IV bolus administered', () {}],
    [' - Calcium Chloride 10mls of 10% administered', () {}],
    [' - Glucagon 1mg administered', () {}],
    [' - Insulin/Dextrose administered', () {}],
    [' - Ipratropium bromide 500 mcg administered', () {}],
    [' - Salbutamol nebuliser 5mg administered', () {}],
    [' - Naloxone 400mcg administered', () {}],
    [' - Tranexamic Acid 1g administered', () {}],

    [
      ' - Ventricular fibrillation rhythm detected - shockable rhythm\n${global.timeNow} - Initial 3x shock therapy 1/3 given',
          () {
        firstTimeShock = true;
        threeShockButtonVisible = true;
        threeShockTherapyInProgress = true;
        threeShockCounter = 0;

        shockButtonVisible = false;
        rhythmButtonActiveMasterSwitch = true;
        vTVFVisible = true;
        vFButtonText = "VF";
        vTButtonText = "pVT";
      }
    ], //26

    [
      ' - Pulseless ventricular tachycardia rhythm detected - shockable rhythm\n${global.timeNow} - Initial 3x shock therapy 1/3 given',
          () {
        firstTimeShock = true;
        threeShockButtonVisible = true;
        threeShockTherapyInProgress = true;
        threeShockCounter = 0;
        shockButtonVisible = false;
        rhythmButtonActiveMasterSwitch = true;
        vTVFVisible = true;
        vFButtonText = "VF";
        vTButtonText = "pVT";
      }
    ], //27

    [
      ' - Ventricular fibrillation rhythm detected - shockable rhythm\n${global.timeNow} - Initial 3x shock therapy 2/3 given',
          () {
        shockButtonVisible = false;
        vTVFVisible = true;
        rhythmButtonActiveMasterSwitch = true;
        vTButtonText = "pVT (1)";
        vFButtonText = "VF (1)";
        threeShockCounter = 1;
      }
    ], //28

    [
      ' - Pulseless ventricular tachycardia rhythm detected - shockable rhythm\n${global.timeNow} - Initial 3x shock therapy 2/3 given',
          () {
        shockButtonVisible = false;
        vTVFVisible = true;
        rhythmButtonActiveMasterSwitch = true;
        vTButtonText = "pVT (1)";
        vFButtonText = "VF (1)";

        threeShockCounter = 1;
      }
    ], //29

    [' - Ventricular fibrillation rhythm detected - shockable rhythm' + '\n' +
        global.timeNow + ' - Initial 3x shock therapy 3/3 given' + '\n' + '\n'
        + global.timeNow + ' - Cycle ' + Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString() +
        ":",
          (context) {
        shockButtonVisible = false;
        vTVFVisible = true;
        rhythmButtonActiveMasterSwitch = true;
        threeShockTherapyInProgress = true;
        vTButtonText = "pVT (2)";
        vFButtonText = "VF (2)";
        threeShockCounter = 2;
        Provider.of<SystemBrain>(context, listen: false).cycleCounter = 0;
        global.shockCounter = 0;
      }
    ], //30

    [
      ' - Pulseless ventricular tachycardia rhythm detected - shockable rhythm' +
          '\n' + global.timeNow + ' - Initial 3x shock therapy 3/3 given' +
          '\n' + '\n'
          + global.timeNow + ' - Cycle ' + Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString() +
          ":",
          (context) {
        shockButtonVisible = false;
        vTVFVisible = true;
        rhythmButtonActiveMasterSwitch = true;
        threeShockTherapyInProgress = true;
        vTButtonText = "pVT (2)";
        vFButtonText = "VF (2)";
        threeShockCounter = 2;
        Provider.of<SystemBrain>(context, listen: false).cycleCounter = 0;
        global.shockCounter = 0;
      }
    ], //31

    [' - Pulseless Electrical Activity detected - non-shockable rhythm\n\n${global.timeNow} - Cycle ${Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString()}:', (context) {
      shockButtonVisible = false;
      vTVFVisible = true;
      rhythmButtonActiveMasterSwitch = true;
      vTButtonText = "pVT (1)";
      vFButtonText = "VF (1)";
      threeShockTherapyInProgress = true;
      Provider.of<SystemBrain>(context, listen: false).cycleCounter = 0;
      global.shockCounter = 0;
      global.nonShockableCounter = 0;
      global.adrenalineCycle = 0;
      Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = false;
      threeShockCounter = 1;
    }
    ], //32

    [' - Pulseless Electrical Activity detected - non-shockable rhythm\n\n${global.timeNow} - Cycle ${Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString()}:', (context) {
      shockButtonVisible = false;
      vTVFVisible = true;
      rhythmButtonActiveMasterSwitch = true;
      vTButtonText = "pVT (2)";
      vFButtonText = "VF (2)";
      threeShockTherapyInProgress = true;
      Provider.of<SystemBrain>(context, listen: false).cycleCounter = 0;
      global.shockCounter = 0;
      global.nonShockableCounter = 0;
      global.adrenalineCycle = 0;
      Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = false;
      threeShockCounter = 2;
    }
    ], //33

    [' - Asystole detected - non-shockable rhythm\n\n${global.timeNow} - Cycle ${Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString()}:', (context) {
      shockButtonVisible = false;
      vTVFVisible = true;
      rhythmButtonActiveMasterSwitch = true;
      vTButtonText = "pVT (1)";
      vFButtonText = "VF (1)";
      threeShockTherapyInProgress = true;
      Provider.of<SystemBrain>(context, listen: false).cycleCounter = 0;
      global.shockCounter = 0;
      global.nonShockableCounter = 0;
      global.adrenalineCycle = 0;
      Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = false;
      threeShockCounter = 1;
    }
    ], //34

    [' - Asystole detected - non-shockable rhythm\n\n${global.timeNow} - Cycle ${Provider.of<SystemBrain>(context, listen: false).cycleCounter.toString()}:', (context) {
      shockButtonVisible = false;
      vTVFVisible = true;
      rhythmButtonActiveMasterSwitch = true;
      vTButtonText = "pVT (2)";
      vFButtonText = "VF (2)";
      threeShockTherapyInProgress = true;
      Provider.of<SystemBrain>(context, listen: false).cycleCounter = 0;
      global.shockCounter = 0;
      global.nonShockableCounter = 0;
      global.adrenalineCycle = 0;
      Provider.of<SystemBrain>(context, listen: false).adrenalineButtonActive = false;
      threeShockCounter = 2;
    }
    ], //35
  ];

  ///LAST LOG ENTRY LIST IN HERE!!

*/
  //endregion

  //FUNCTION CENTRE
  void accessLogFunction ()
  {
    String output = "";
    for (int i = 0; i<accessBooleanList.length; i++)
    {
      if (accessBooleanList[i] == true)
      {
        output = ("$output${accessCounterStrings[i]} x ${accessCounterList[i]}\n");
      }
    }
    global.currentAccessLogText = output;

    notifyListeners();
  }

  void adrenalineActiveFunction(context) {

    if (accessCounterList[0] + accessCounterList[1] +
        accessCounterList[2] == 0) {
        MainFrameState().accessNeededAlert(context);
      //TODO: ACCESS NEEDED this needs to be reinstated - and the set state below

      notifyListeners();
    }
    else
    {
      //NOTE SET STATE REMOVED HERE - will need one as button not updating
        adrenalineCounter++;
        adrenalineCycle = 1;
        adrenalineButtonActive = false;

        global.log = '${global.log}\n${global.timeNow} - Adrenaline x$adrenalineCounter given';

        global.lastLogEntry = 2;
        undoEventButtonActive = true;

        notifyListeners();


    }
    



  } // function which is called when the adrenaline button is pressed

  void adrenalineButtonActivation() {
    if (global.shockCounter >= 2 || cycleCounter > global.shockCounter ||
        adrenalineCounter > 1 || nonShockableCounter > 0) {

      //TODO: setState removed - needs to be re-added

        adrenalineCycle++;

    }
    else {

    }

    if ((adrenalineCycle % 2) != 0) {
      //TODO: setState removed - needs to be re-added
        adrenalineButtonActive = true;

    }
    else {

    }
    notifyListeners();

  }

  void airwayLogFunction ()
  {
    if(nPAPresent == true)
    {
      if (oPAPresent == true)
      {
        global.currentAirwayLogText = "Nasopharyngeal Airway and Oropharyngeal Airway";
      }
      else if (iGelPresent == true)
      {
        global.currentAirwayLogText = "Nasopharyngeal Airway and Laryngeal Mask/iGel Airway";
      }
      else if (eTTubePresent == true)
      {
        global.currentAirwayLogText = "Nasopharyngeal Airway and Endotracheal Tube Airway";
      }
      else
      {
        global.currentAirwayLogText = "Nasopharyngeal Airway ";
      }
    }

    else
    {
      if (oPAPresent == true)
      {
        global.currentAirwayLogText = "Oropharyngeal Airway";
      }
      else if (iGelPresent == true)
      {
        global.currentAirwayLogText = "Laryngeal Mask/iGel Airway";
      }
      else if (eTTubePresent == true)
      {
        global.currentAirwayLogText = "Endotracheal Tube Airway";
      }
      else
      {
        global.currentAirwayLogText = "";
      }

    }

    notifyListeners();

  }

  void amiodaroneButtonActivation() {
    amiodaroneCycleSavedState = amiodaroneCycle;

    if (global.shockCounter == 2 || amiodaroneCycle == 2 ||
        global.specialAmiodaroneRequirement == 1 ||
        global.specialAmiodaroneRequirement == 2)

    {
      //TODO: Set state removed here need to redo
        amiodaroneButtonActive = true;

        if (global.specialAmiodaroneRequirement == 2) {
          amiodaroneCycle = 2;
        }

    }

    notifyListeners();
  } // code which turns on the amiodarone button - called from the shock button

  void amiodaroneActiveFunction() {
    if (accessCounterList[0] + accessCounterList[1] +
        accessCounterList[2] == 0) {
      //_accessNeededAlert();
      //TODO: this needs to be reinstated - and the set state below

    }

    else {
    //NOTE SET STATE REMOVED HERE
        global.specialAmiodaroneRequirement = 0;
        amiodaroneCounter++;
        amiodaroneCycle++;
        amiodaroneButtonActive = false;
        global.log = '${global.log}\n${global.timeNow} - Amiodarone x$amiodaroneCounter given';

        global.lastLogEntry = 3;
        undoEventButtonActive = true;
        amiodaroneButtonText = "";

    }

    notifyListeners();
  } // function which is called when the amiodarone button is pressed
//endregion
  void lucasActivation()
  {
    lucasActive = !lucasActive;
    notifyListeners();
  }

  void nonShockableFunction(context) {

    //TODO: removed setState, need to re-instate

      adrenalineCycleSavedState = adrenalineCycle;
      nonShockableCounter++;
      cycleCounter++;
      //rhythmButtonActive = false;

      firstTimeShock = false;

      vTButtonText = "pVT";
      vFButtonText = "VF";

      startTwoMinuteTimerOnly(context);
      //startTwoMinuteTimer();
      adrenalineButtonActivation();

      global.log = global.log + '\n' + '\n'


          + global.timeNow + ' - Cycle ' + cycleCounter.toString() + ":";


    startCPRSoundPlayer(context);

      notifyListeners();
  }

  void oxygenActivation()
  {
    oxygenActive = !oxygenActive;
    notifyListeners();
  }

  void shockFunction(context) {
    if (firstTimeShock == true) {
      //TODO: try this to see if it works to set height of bottom sheet!x
      showModalBottomSheet<void>(
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            //mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>
            [

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child:
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: const [
                        AutoSizeText('THREE-SHOCK THERAPY',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,

                          ),
                          maxFontSize: 20.0,
                          maxLines: 1,
                          minFontSize: 10.0,
                        ),
                        AutoSizeText(
                          'Do you wish to give further shocks as part of initial three-shock therapy?',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,

                          ),
                          maxFontSize: 15.0,
                          maxLines: 2,
                          minFontSize: 10.0,
                        ),
                      ],
                    ),
                  ),


                  simplePopUpWindowTile(

                    descriptor: 'Yes',
                    tileActive: true,
                    addFunction: () {
                      firstTimeShock = false;
                      threeShockTherapyInProgress = true;
                      shockFunction(context);
                    },
                  ),

                  simplePopUpWindowTile(

                    descriptor: 'No',
                    tileActive: true,
                    addFunction: () {
                      firstTimeShock = false;
                      threeShockTherapyInProgress = false;
                      shockFunction(context);
                    },
                  ),
                ],),

              ),

            ],
          );
        },
      );


      // ThreeShockQuestion ThreeShockQuestionModal = new ThreeShockQuestion();
      // ThreeShockQuestionModal.mainBottomSheet(context);
    }

    else {
      if (threeShockTherapyInProgress == true) {
        //TODO: set state removed need to update this

          threeShockCounter++;

          if (threeShockCounter == 1) {
            shockButtonVisible = false;
            vTVFVisible = true;
            rhythmButtonActiveMasterSwitch = true;
            vTButtonText = "VT (1)";
            vFButtonText = "pVF (1)";
            global.log = '${global.log}\n${global.timeNow} - Initial 3x shock therapy 1/3 given';

            if (vFPressed == true) {
              global.lastLogEntry = 26;
            }
            else {
              global.lastLogEntry = 27;
            }
          }
          else if (threeShockCounter == 2) {
            shockButtonVisible = false;
            vTVFVisible = true;
            rhythmButtonActiveMasterSwitch = true;
            vTButtonText = "pVT (2)";
            vFButtonText = "VF (2)";
            global.log = '${global.log}\n${global.timeNow} - Initial 3x shock therapy 2/3 given';

            if (vFPressed == true) {
              global.lastLogEntry = 28;
            }
            else {
              global.lastLogEntry = 29;
            }
          }
          else if (threeShockCounter == 3) {
            shockButtonVisible = false;
            vTVFVisible = true;
            rhythmButtonActiveMasterSwitch = true;
            vTButtonText = "pVT";
            vFButtonText = "VF";
            threeShockTherapyInProgress = false;
            global.log = '${global.log}\n${global.timeNow} - Initial 3x shock therapy 3/3 given';

            shockFunction(context);

            global.log = global.log.replaceAll(
                global.log.substring((global.log.length - (('\n'
                    + global.timeNow + ' - Shock x ' +
                    global.shockCounter.toString() +
                    ' delivered' + '\n' + '\n'
                    + global.timeNow + ' - Cycle ' +
                    cycleCounter.toString() +
                    ":").length))), "");

            global.log = global.log + '\n' + '\n'
                + global.timeNow + ' - Cycle ' +
                cycleCounter.toString() +
                ":";

            if (vFPressed == true) {
              global.lastLogEntry = 30;
            }
            else {
              global.lastLogEntry = 31;
            }
          }
          else
          {

          }
      }

      else {
        //TODO: set state removed need to update this
          amiodaroneCycleSavedState = amiodaroneCycle;
          adrenalineCycleSavedState = adrenalineCycle;
          adrenalineButtonActivation();
          amiodaroneButtonActivation();
          global.shockCounter++;
          cycleCounter++;
          rhythmButtonActiveMasterSwitch = true;
          shockButtonVisible = false;
          vTVFVisible = true;
          startTwoMinuteTimerOnly(context);
          //startTwoMinuteTimer();
          global.log = global.log + '\n'
              + global.timeNow + ' - Shock x ' +
              global.shockCounter.toString() +
              ' delivered' + '\n' + '\n'
              + global.timeNow + ' - Cycle ' + cycleCounter.toString() +
              ":";

          global.lastLogEntry = 1;

          undoEventButtonActive = true;

          if (amiodaroneCycle == 1) {
            //TODO: set state removed need to update this
              amiodaroneCycle++;

          }

      }
    }

    startCPRSoundPlayer(context);
    notifyListeners();
  }

  void resetGlobalTimerOnly(context) {
    Provider.of<GlobalTimerService>(context, listen: false).globalTimerStop();
    Provider.of<GlobalTimerService>(context, listen: false).globalTimerReset();
  }

  void stopGlobalTimerOnly(context) {
    Provider.of<GlobalTimerService>(context, listen: false).globalTimerStop();
  }

  void startGlobalTimerOnly(context) {
    Provider.of<GlobalTimerService>(context, listen: false).globalTimerStart();
  }

  void resetTwoMinuteTimerOnly(context) {
    Provider.of<TwoMinuteTimerService>(context, listen: false)
        .twoMinuteTimerStop();
    Provider.of<TwoMinuteTimerService>(context, listen: false)
        .twoMinuteTimerReset();
  }

  void stopTwoMinuteTimerOnly(context) {
    Provider.of<TwoMinuteTimerService>(context, listen: false)
        .twoMinuteTimerStop();
  }

  void startTwoMinuteTimerOnly(context) {
    Provider.of<TwoMinuteTimerService>(context, listen: false)
        .twoMinuteTimerStart();
  }

  void undoEvent(context) {
    for (int i = 1; i < 36; i++) {
      if (global.lastLogEntry == i) {

        //TODO: setstate removed here - also needs reinstating
        //   lastLogRemoveText = global.log.substring(
        //       global.log.length - (logTextRemovalText[i][0].length) - 6 as int);
        //   global.log = global.log.replaceAll(lastLogRemoveText, "");
        //
        //   logTextRemovalText[i][1](context);

      }
    }
    lastLogRemoveText = "";
    global.lastLogEntry = 0;
    undoEventButtonActive = false;

    notifyListeners();
  }

//code which turns on the adrenaline button







}