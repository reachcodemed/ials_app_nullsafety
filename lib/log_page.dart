import 'dart:io';
import 'dart:ui';
import 'package:ials_app_nullsafety/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:provider/provider.dart';
import 'counters.dart';
import 'buttons.dart';
import 'globalVariables.dart' as global;
import 'package:share/share.dart';

class LogPage extends StatefulWidget {

  //String trialLog;

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {


  bool logScrollPositionBottom = false;

  TimeOfDay displaytime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {

    //
    // ResusLog information = ResusLog();
    // String trialLogTemp = information.resusLog;
    // print(trialLogTemp);

    final systemBrain = Provider.of<SystemBrain>(context,listen: false);


    return Scaffold(
        body:
        SafeArea(
          child:
          Container(
            color: kPanelBackgroundColour,
            child:
            Container(
              color: Colors.white,
              margin: const EdgeInsets.all(20.0),
              child:
              Column(
                children: [
                  LogTitleAndTextPanes(
                    flex: 7,
                    logTitlePaneColour: kLogPageTitleBarColour,
                    logTitleIcon: CupertinoIcons.square_list,
                    logTitleText: 'Resuscitation Summary',
                    logTitleTextColour: kLogPageTitleTextColour,
                    logTextPaneColour: kLogPageTextPaneColour,
                    logTextPaneTextColour: kLogPageTextPaneTextColour,
                    reversePositionOfLog: false,
                    logTextPaneText:                '''
Arrest start time: ${systemBrain.startDate} at ${systemBrain.startTime} 

Number of cycles: ${systemBrain.cycleCounter.toString()}
Number of non-shockable cycles: ${systemBrain.nonShockableCounter.toString()}
Number of shockable cycles: ${systemBrain.shockCounter}
Number of adrenaline given: ${systemBrain.adrenalineCounter}
Number of amiodarone given: ${systemBrain.amiodaroneCounter}
                      ''',
                  ),

                  Expanded(
                    flex:1,
                    child:
                    Container(
                      color: kLogPageTitleBarColour,
                      child:
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child:
                            Icon(
                              CupertinoIcons.list_bullet_indent,
                              color: kLogPageTitleIconColour,
                              size: 18.0,
                            ),
                          ),
                          AutoSizeText('Interventions Summary',
                            style: TextStyle(
                                color: kLogPageTitleTextColour,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,


                            ),
                            maxFontSize: 15.0,
                            minFontSize: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        LogTitleAndTextPanes(
                          flex: 7,
                          logTitlePaneColour: kLogPageRed,
                          logTitleIcon: CupertinoIcons.eyedropper,
                          logTitleText: 'Access',
                          logTitleTextColour: kLogPageTitleTextColour,
                          logTextPaneColour: kLogPageTextPaneColour,
                          logTextPaneTextColour: kLogPageTextPaneTextColour,
                          logTextPaneText: systemBrain.currentAccessLogText,
                          reversePositionOfLog: false,
                        ),
                        LogTitleAndTextPanes(
                          flex: 7,
                          logTitlePaneColour: kLogPageBlue,
                          logTitleIcon: CupertinoIcons.person,
                          logTitleText: 'Airway',
                          logTitleTextColour: kLogPageTitleTextColour,
                          logTextPaneColour: kLogPageTextPaneColour,
                          logTextPaneTextColour: kLogPageTextPaneTextColour,
                          logTextPaneText: systemBrain.currentAirwayLogText,
                          reversePositionOfLog: false,
                        ),
                      ],
                    ),
                  ),
                  LogTitleAndTextPanes(
                    flex: 7,
                    logTitlePaneColour: kLogPageTitleBarColour,
                    logTitleIcon: CupertinoIcons.pencil_ellipsis_rectangle,
                    logTitleText: 'Arrest Log',
                    logTitleTextColour: kLogPageTitleTextColour,
                    logTextPaneColour: kLogPageTextPaneColour,
                    logTextPaneTextColour: kLogPageTextPaneTextColour,
                    logTextPaneText: global.log,
                    reversePositionOfLog: true,


                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: kPanelBackgroundColour,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LogPageButtons(
                            logPageButtonColour: kLogPageRed,
                            logPageButtonText: 'Handover',
                            logPageButtonIcon: CupertinoIcons.person_2,
                            logPageButtonFunction: ()
                            {
                              showDialog<void>(
                                  useSafeArea: true,
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context)
                                  {
                                    return AlertDialog(
                                        title: Container(
                                          margin: const EdgeInsets.fromLTRB(10,0,10,15),
                                          child: const Text('Sorry! 🛠',
                                            style: TextStyle(
                                              fontSize: 20.0,

                                            ),
                                          ),
                                        ),

                                        content: const Text('The handover section is still under development. Please continue with the arrest on one device for now as we work hard on updating this.', style: TextStyle(color: Colors.grey, fontSize: 14.0),),
                                        actions: [

                                          TextButton(
                                              child: const Text('Dismiss'),
                                              onPressed: (){

                                                Navigator.of(context).pop();

                                              }
                                          ),




                                        ]
                                    );
                                  }

                              );

                            }
                            ,
                          ),
                          LogPageButtons(
                            logPageButtonColour: kLogPageBlue,
                            logPageButtonText: 'Send Log',
                            logPageButtonIcon: CupertinoIcons.paperplane,
                            logPageButtonFunction: ()
                            {
                              sendLog(context);
                            }
                            ,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ),
        )
    );
  }

  void sendLog (BuildContext context)
  {

    final systemBrain = Provider.of<SystemBrain>(context,listen: false);

    final String sendLogText = (                '''
Arrest start time: ${systemBrain.startDate} at ${systemBrain.startTime} 

Number of cycles: ${systemBrain.cycleCounter.toString()}
Number of non-shockable cycles: ${systemBrain.nonShockableCounter.toString()}
Number of shockable cycles: ${systemBrain.shockCounter}
Number of adrenaline given: ${systemBrain.adrenalineCounter}
Number of amiodarone given: ${systemBrain.amiodaroneCounter}
                      ''' +'\n' + 'Events Summary: \n' +global.log);

    Share.share(sendLogText);
  }

}

