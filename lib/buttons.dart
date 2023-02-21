
import 'package:ials_app_nullsafety/constants.dart';
import 'package:ials_app_nullsafety/main_frame.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:ials_app_nullsafety/timer.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WelcomeButtons extends StatelessWidget {

  WelcomeButtons({this.welcomeButtonColour, required this.welcomeButtonText, this.welcomeButtonPressed});

  final  Color? welcomeButtonColour;
  final String welcomeButtonText;
  final Function()? welcomeButtonPressed;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.symmetric(horizontal:60.0, vertical: 0.0,),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0,),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0,),
      ),
        child: MaterialButton(
          elevation: 0,
          onPressed: welcomeButtonPressed,
          color: welcomeButtonColour,
          child: Center(
            child: AutoSizeText(welcomeButtonText,
              style:
              TextStyle(
                fontSize:15.0,
                color: Colors.white,

              ),
              maxLines: 1,
              textAlign: TextAlign.center,
              minFontSize: 8.0,
            ),

          ),



          // Container(
          //
          //
          //   child: Center(
          //     child: AutoSizeText(welcomeButtonText,
          //       style:
          //         TextStyle(
          //           fontSize:15.0,
          //           color: Colors.white,
          //
          //       ),
          //       maxLines: 1,
          //       textAlign: TextAlign.center,
          //       minFontSize: 8.0,
          //     ),
          //
          //   ),
          // ),
        ),
      );
  }
}
// ignore: must_be_immutable

class InterventionsButtons extends StatelessWidget {

  InterventionsButtons({this.interventionsButtonColour, required this.interventionsButtonText, required this.interventionButtonPressed});

  final Color? interventionsButtonColour;
  final String interventionsButtonText;
  final void Function()? interventionButtonPressed;


  Widget build(BuildContext context) {


    return
      Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width/4.5, height: 50),
            child: GestureDetector(
              onTap: interventionButtonPressed,
              child:
              InkWell(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal:6.0, vertical: 8.0,),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0,),
                    color: interventionsButtonColour,
                  ),
                  child: Center(
                    child: AutoSizeText(interventionsButtonText,
                      style:
                        TextStyle(
                          fontSize:12.0,
                          color: Colors.white,

                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      minFontSize: 8.0,
                    ),

                  ),
                ),
              ),
            ),

        );
  }
}

class SmallRhythmButton extends StatelessWidget {

  SmallRhythmButton({required this.rhythmButtonText, this.rhythmButtonColour, this.rhythmButtonHeight, this.rhythmButtonPressed, this.rhythmButtonTextColour,});

  final String rhythmButtonText;
  final Color? rhythmButtonColour;
  final Color? rhythmButtonTextColour;
  final void Function()? rhythmButtonPressed;
  final double? rhythmButtonHeight;

  @override
  Widget build(BuildContext context) {


    bool isRunning = Provider.of<TwoMinuteTimerService>(context).isRunning;

    return Consumer<TwoMinuteTimerService>(
        builder: (context,timeservice,mytimer)
    => Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: isRunning?null:rhythmButtonPressed,
          color: rhythmButtonColour,
          disabledColor: kRhythmButtonInactiveColour,
          height: rhythmButtonHeight,
          minWidth: 85.0,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0,),
          child:
          AutoSizeText(rhythmButtonText,
            style: TextStyle(
                fontSize:13.0,
                color:rhythmButtonTextColour,

            ),
            minFontSize: 8.0,
            maxLines: 1,),

        ),
    ),
      );
  }
}

class CentralRhythmButton extends StatelessWidget {

  CentralRhythmButton({required this.rhythmButtonText, this.rhythmButtonColour, this.rhythmButtonHeight, this.rhythmButtonPressed, this.rhythmButtonTextColour,});

  final String rhythmButtonText;
  final Color? rhythmButtonColour;
  final Color? rhythmButtonTextColour;
  final void Function()? rhythmButtonPressed;
  final double? rhythmButtonHeight;

  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: rhythmButtonPressed,
          color: rhythmButtonColour,
          disabledColor: kRhythmButtonInactiveColour,
          height: rhythmButtonHeight,
          minWidth: 85.0,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0,),
          child:
          AutoSizeText(rhythmButtonText,
            style: TextStyle(
              fontSize:13.0,
              color:rhythmButtonTextColour,

            ),
            minFontSize: 8.0,
            maxLines: 1,),

        ),
    );
  }
}

class ActionButton extends StatelessWidget {

  ActionButton({this.actionButtonFunction, this.actionButtonIcon, this.actionButtonColour, this.actionButtonIconColour, this.actionButtonDescriptionText,this.additionalTextWidget,});
  final Function? actionButtonFunction;
  final IconData? actionButtonIcon;
  final Color? actionButtonIconColour;
  final Color? actionButtonColour;
  final String? actionButtonDescriptionText;
  final Widget? additionalTextWidget;


  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.0,0.0, 8.0, 0.0),
              child:
              MaterialButton(
                  onPressed: actionButtonFunction as void Function()?,
                  color: actionButtonColour,
                  disabledColor: kRhythmButtonInactiveColour,

                  highlightElevation: 0.5,
                  elevation: 0.0,
                  minWidth: 10.0,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0,),
                    side:BorderSide(color: actionButtonIconColour!),),
                  padding: EdgeInsets.all(15.0,),
                  child:
                  Icon(
                    actionButtonIcon,
                    size: 15.0,
                    color: actionButtonIconColour,
                  )
              ),
            ),
            AutoSizeText(actionButtonDescriptionText!,
              style:  const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,


              ),
              minFontSize: 9.0,
              maxFontSize: 12.0,
              maxLines: 1,
            ),
            additionalTextWidget!,
          ],
        ),
      );
  }
}

class LogPageButtons extends StatelessWidget {

  LogPageButtons({this.logPageButtonColour, this.logPageButtonIcon, this.logPageButtonText, this.logPageButtonFunction});

  final Color? logPageButtonColour;
  final String? logPageButtonText;
  final IconData? logPageButtonIcon;
  final Function? logPageButtonFunction;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(left:20.0,right:20.0,),

        child: MaterialButton(
          padding: EdgeInsets.all(5.0),
          minWidth: 120.0,
          elevation: 1.0,
          color: logPageButtonColour,
          onPressed: logPageButtonFunction as void Function()?,
          child:
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(6.0),
                child:
                Icon(
                  logPageButtonIcon,
                  color: kLogPageTitleIconColour,
                  size: 15.0,
                ),
              ),
              AutoSizeText(logPageButtonText!,
                style: TextStyle(
                    color: kLogPageTitleTextColour,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,


                ),
                maxFontSize: 15.0,
                minFontSize: 10.0,
              ),
            ],
          ),


        ),
      );
  }


}

class ABGButtons extends StatelessWidget {

  ABGButtons({this.abgButtonColour, this.abgButtonText, this.abgButtonFunction});

  final Color? abgButtonColour;
  final String? abgButtonText;
  final Function? abgButtonFunction;

  @override
  Widget build(BuildContext context) {
    return
      MaterialButton(
        padding: EdgeInsets.all(0.0),
        minWidth: 110.0,
        elevation: 1.0,
        color: abgButtonColour,
        onPressed: abgButtonFunction as void Function()?,
        child:
        AutoSizeText(abgButtonText!,
          style:  TextStyle(
              color: kLogPageTitleTextColour,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
          ),
          maxFontSize: 15.0,
          minFontSize: 10.0,
        ),


      );
  }
  
  
}