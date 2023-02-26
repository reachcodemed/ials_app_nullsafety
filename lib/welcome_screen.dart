import 'package:ials_app_nullsafety/about_screen.dart';
import 'package:ials_app_nullsafety/external_arrest_screen.dart';
import 'package:ials_app_nullsafety/handover_screen.dart';
import 'package:ials_app_nullsafety/mother_board.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:ials_app_nullsafety/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'buttons.dart';
import 'mother_board.dart';
import 'package:ials_app_nullsafety/globalVariables.dart' as global;

class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //final systemBrain = Provider.of<SystemBrain>(context,listen: false);

    return ListenableProvider<SystemBrain>(
      create:(_)=>SystemBrain(),
      builder: (context,child)
      => Scaffold(
        backgroundColor: kRedBackgroundColour,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.all(10.0),
            color: kRedBackgroundColour,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                // AutoSizeText('iALS',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 90.0,
                //   ),
                // ),
                const SizedBox(
                  height: 30.0,

                ),

                // AutoSizeText('Android Beta Version',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20.0,
                //   ),
                //   maxLines: 1,
                // ),

                const Image(image: AssetImage('images/iALSlogo.png')),

                const SizedBox(
                  height: 30.0,

                ),

                WelcomeButtons(
                    welcomeButtonText: 'Start New Arrest',
                    welcomeButtonColour: kBlueButtonColour,
                    welcomeButtonPressed: () {
                      Provider.of<SystemBrain>(context,listen: false).startTime = '${TimeOfDay.now().hour.toString().padLeft(2,'0')}:${TimeOfDay.now().minute.toString().padLeft(2,'0')}';
                      Provider.of<SystemBrain>(context,listen: false).timeNow = '${TimeOfDay.now().hour.toString().padLeft(2,'0')}:${TimeOfDay.now().minute.toString().padLeft(2,'0')}';
                      Provider.of<SystemBrain>(context,listen: false).cycleCounter = 0;
                      Provider.of<SystemBrain>(context,listen: false).shockCounter = 0;
                      Provider.of<SystemBrain>(context,listen: false).nonShockableCounter = 0;
                      Provider.of<SystemBrain>(context,listen: false).adrenalineCounter = 0;
                      Provider.of<SystemBrain>(context,listen: false).amiodaroneCounter = 0;
                      Provider.of<SystemBrain>(context,listen: false).adrenalineCycle = 0;
                      Provider.of<SystemBrain>(context,listen: false).amiodaroneCycle = 0;

                      global.log = '${'${TimeOfDay.now().hour.toString().padLeft(2,'0')}:${TimeOfDay.now().minute.toString().padLeft(2,'0')}'} - Arrest started';

                      Provider.of<SystemBrain>(context,listen: false).currentAccessLogText = "";
                      Provider.of<SystemBrain>(context,listen: false).currentAirwayLogText = "";


                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const MotherBoard(
                          rhythmButtonActiveInitial: true,
                          attachPadsActiveInitial: true,
                        );

                      }));
                    }
                ),
                WelcomeButtons(
                    welcomeButtonText: 'Continue External Arrest',
                    welcomeButtonColour: kPEAAsystoleButtonColour,
                    welcomeButtonPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ExternalArrestScreen();

                      }));
                    }
                ),

                WelcomeButtons(
                    welcomeButtonText: 'Receive Handover',
                    welcomeButtonColour: kYellowButtonColour,
                    welcomeButtonPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HandoverScreen();


                    }));},


                ),

                WelcomeButtons(
                  welcomeButtonText: 'About',
                  welcomeButtonColour: kTextFieldLightGreyBorder,
                  welcomeButtonPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                          toolbarHeight: 35,
                          backgroundColor: kRedBackgroundColour,
                          elevation: 0,
                          leading:
                          IconButton(
                                icon: const Icon(CupertinoIcons.chevron_left,
                                  size: 20.0,
                                  color: Colors.white,),
                                onPressed: ()
                                {
                                  Navigator.pop(context);
                                },
                              ),

                        ),
                      body: const AboutScreen(),
                    );


                  }));},


                ),




              ],
            ),

          ),
        ),
      ),
    );
  }
}
