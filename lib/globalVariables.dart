library global;
import 'package:flutter/material.dart';

//int cycleCounter = 0;
int nonShockableCounter = 0;
int shockCounter = 0;

//int adrenalineCounter = 0;
int adrenalineCycle = 0;
int amiodaroneCycle = 0;
int amiodaroneCounter = 0;

// int smallBoreCounter = 0;
// int largeBoreCounter = 0;
// int iOCounter = 0;
//int unsuccessfulAccessCounter = 0;

// For reference
// [0] = smallBoreCounter, [1]= largeBoreCounter, [2] = ioCounter
//var accessCounterList = [0,0,0];
//var accessCounterStrings = ["Small bore cannula", "Large bore cannula", "Intraosseous access"];

//int nPACounter = 0;
//int oPACounter = 0;
// iGelCounter = 0;
// eTTubeCounter = 0;
// unsuccessfulAirwayCounter = 0;

int specialAmiodaroneRequirement = 0;

String? callOutTime;

int? roscCounter;

String? startTime = TimeOfDay.now().hour.toString().padLeft(2,'0') +':' + TimeOfDay.now().minute.toString().padLeft(2,'0');
String startDate = '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

String timeNow = TimeOfDay.now().hour.toString().padLeft(2,'0') +':' + TimeOfDay.now().minute.toString().padLeft(2,'0');

String log = '${TimeOfDay.now().hour.toString().padLeft(2,'0') +':' + TimeOfDay.now().minute.toString().padLeft(2,'0')} - Arrest started';

int lastLogEntry = 0;

/*
shockdelivered = 1
adrenaline given = 2
amiodarone given = 3
oxygen delivery started = 4
oxygen delivery stopped = 5
lucas button started = 6
lucas button stopped = 7
VF = 8
VT = 9
Asystole = 10
PEA = 11
Text entry = 12
Hartmanns = 13
Normal saline = 14
GLucose = 15
Sodium Bicarb = 16
Magnesium = 17
Alteplase = 18
Calcium Chloride = 19
Glucagon = 20
Insulin/dextrose = 21
Ipratropium bromide = 22
Salbutamol = 23
Naloxone = 24
Tranexamic acid = 25

*/

// String summaryLog =               '''
// Arrest start time: $startDate at $startTime
//
// Number of cycles: ${cycleCounter.toString()}
// Number of non-shockable cycles: ${nonShockableCounter.toString()}
// Number of shockable cycles: $shockCounter
// Number of adrenaline given: $adrenalineCounter
// Number of amiodarone given: $amiodaroneCounter
//                       ''';

String currentAirwayLogText = "";

String currentAccessLogText = "";


