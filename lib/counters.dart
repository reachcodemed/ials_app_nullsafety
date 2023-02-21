import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:ials_app_nullsafety/timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


ScrollController controllerOne = ScrollController();

class Counters extends StatelessWidget {

  Counters({this.counterIcon, this.counterValue});

  int? counterValue;
  IconData? counterIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width:30.0,
        height: double.infinity,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(counterIcon,size: 20.0, color: Colors.black,),
            const SizedBox(width: double.infinity,height: 10.0,),
            Text(counterValue.toString(),
              style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ));
  }
}

class TopLeftAndRightPanes extends StatelessWidget {

  TopLeftAndRightPanes({this.cycleCounterExitButtonFunction,this.cycleCounterExitButtonText, this.cycleCounterExitButtonColour, this.cycleCounterExitButtonDescription});

  String? cycleCounterExitButtonDescription;
  String? cycleCounterExitButtonText;
  Color? cycleCounterExitButtonColour;
  Function? cycleCounterExitButtonFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:1,
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[

          const SizedBox(width:double.infinity,height:30.0,),

          Expanded(

            child: GestureDetector(
              onTap: cycleCounterExitButtonFunction as void Function()?,
              child:
              Container(
                decoration:
                BoxDecoration(
                  color: cycleCounterExitButtonColour,
                  borderRadius:
                  BorderRadius.circular(12.0,),
                ),
                margin:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 5.0,),
                child:
                Center(
                  child:
                  AutoSizeText(cycleCounterExitButtonText!,
                    style:
                      const TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    maxLines: 1,),
                ),
              ),
            ),

          ),

          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0,),
              child: AutoSizeText(cycleCounterExitButtonDescription!,
                maxLines: 2,
                maxFontSize: 20.0,
                minFontSize: 10.0,
                textAlign: TextAlign.center,),

            ),
          ),
        ],
      ),
    );
  }
}

class StartTimeTextBox extends StatelessWidget {
  StartTimeTextBox({
    required this.timerText,
    required this.timerTextMaxLines,
    required this.timerTextMaxFontSize,
    required this.timerTextColour,
    required this.timerTextMinFontSize,
    required this.timerTextVerticalPadding,
  });

  final String timerText;
  final int timerTextMaxLines;
  final double timerTextMaxFontSize;
  final Color timerTextColour;
  final double timerTextMinFontSize;
  final double timerTextVerticalPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: timerTextVerticalPadding, horizontal: 0.0,),
        child: Center(
          child: AutoSizeText(
            timerText,
            textAlign: TextAlign.center,
            style:
              TextStyle(
                color: timerTextColour,
                fontWeight: FontWeight.bold,
                fontSize: 60.0,),

            maxFontSize: timerTextMaxFontSize,
            minFontSize: timerTextMinFontSize,
            maxLines: timerTextMaxLines,),
        ),
      ),
    );
  }
}


class TwoMinuteTimerTextBox extends StatelessWidget {
  TwoMinuteTimerTextBox({

    required this.timerTextMaxLines,
    required this.timerTextMaxFontSize,
    required this.timerTextColour,
    required this.timerTextMinFontSize,
    required this.timerTextVerticalPadding,
    required this.ripORroscStatus,
  });

  final int timerTextMaxLines;
  final double timerTextMaxFontSize;
  final Color timerTextColour;
  final double timerTextMinFontSize;
  final double timerTextVerticalPadding;
  final bool ripORroscStatus;

  @override
  Widget build(BuildContext context) {

    final currentDuration = Provider.of<TwoMinuteTimerService>(context).currentDuration;
    final seconds = currentDuration.inSeconds;
    final minutes = currentDuration.inMinutes;

    String twoMinuteTimer =
        (minutes).toString().padLeft(2, "0") + ':' +
            (seconds%60).toString().padLeft(2, "0");

    return Consumer<TwoMinuteTimerService>(
      builder: (context,timeService,widget)
      => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: timerTextVerticalPadding, horizontal: 0.0,),
          child: Center(
            child: AutoSizeText(
              ripORroscStatus?"":seconds == 0?"RHYTHM CHECK":twoMinuteTimer,
              textAlign: TextAlign.center,
              style:
              TextStyle(
                color: timerTextColour,
                fontWeight: FontWeight.bold,
                fontSize: 60.0,),
              maxFontSize: timerTextMaxFontSize,
              minFontSize: timerTextMinFontSize,
              maxLines: timerTextMaxLines,),
          ),
        ),
      ),
    );
  }
}


class GlobalTimerTextBox extends StatelessWidget {
  GlobalTimerTextBox({
    //required this.timerText,
    required this.timerTextMaxLines,
    required this.timerTextMaxFontSize,
    required this.timerTextColour,
    required this.timerTextMinFontSize,
    required this.timerTextVerticalPadding,});

  //final String timerText;
  final int timerTextMaxLines;
  final double timerTextMaxFontSize;
  final Color timerTextColour;
  final double timerTextMinFontSize;
  final double timerTextVerticalPadding;


  @override
  Widget build(BuildContext context) {
    final currentDuration = Provider.of<GlobalTimerService>(context).currentDuration;
    final seconds = currentDuration.inSeconds;

    //final seconds = (currentDuration.inSeconds.toInt()-currentDuration.inSeconds.toInt()%60)/60;
    final minutes = currentDuration.inMinutes;



    String myglobaltimer =
        (minutes).toString().padLeft(2, "0") + ':' +
            (seconds%60).toString().padLeft(2, "0");

    return Expanded(
        child: Consumer<GlobalTimerService>(
          builder:(context,timeservice,widget) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: timerTextVerticalPadding, horizontal: 0.0,),
              child: Center(
                child: AutoSizeText(
                  "Total time: $myglobaltimer",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(
                    color: timerTextColour,
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0,),
                  maxFontSize: timerTextMaxFontSize,
                  minFontSize: timerTextMinFontSize,
                  maxLines: timerTextMaxLines,),
              ),
            );
          }
        ),
      );
  }
}

class LogTitleAndTextPanes extends StatelessWidget {

  LogTitleAndTextPanes({required this.flex, this.logTitleText, this.logTextPaneText, this.logTextPaneColour,this.logTextPaneTextColour,this.logTitleIcon,this.logTitlePaneColour,this.logTitleTextColour,this.reversePositionOfLog});

  Color? logTitlePaneColour;
  Color? logTitleTextColour;
  Color? logTextPaneColour;
  Color? logTextPaneTextColour;
  IconData? logTitleIcon;
  String? logTitleText;
  String? logTextPaneText;
  bool? reversePositionOfLog;
  int flex;





  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        flex: flex,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Expanded(
              child:
              Container(
                color: logTitlePaneColour,
                child:
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 10.0,),
                      child: Icon(
                        logTitleIcon,
                        color: logTitleTextColour,
                        size: 18.0,
                      ),
                    ),
                    AutoSizeText(logTitleText!,
                      style:  TextStyle(
                          color: logTitleTextColour,
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
              flex: 6,
              child:
              Container(color: logTextPaneColour,
                child:
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  Scrollbar(
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      controller: ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true),
                      reverse: reversePositionOfLog!,
                      scrollDirection: Axis.vertical,
                      child:
                      SelectableText(logTextPaneText!,
                        style: const TextStyle(
                            fontSize: 13.0,

                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

