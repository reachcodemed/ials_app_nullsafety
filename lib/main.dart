import 'package:after_layout/after_layout.dart';
import 'package:ials_app_nullsafety/constants.dart';
import 'package:ials_app_nullsafety/guide_screen.dart';
import 'package:flutter/material.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:provider/provider.dart';
import 'welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const ALSapp());

//final key = new GlobalKey<MainFrameState>();

class ALSapp extends StatelessWidget {
  const ALSapp({super.key});


  @override
  Widget build(BuildContext context) {
    return
      const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FirstTimeCheck(),
      );

  }
}

class FirstTimeCheck extends StatefulWidget {
  const FirstTimeCheck({Key? key}) : super(key: key);

  @override
  _FirstTimeCheckState createState() => _FirstTimeCheckState();
}

class _FirstTimeCheckState extends State<FirstTimeCheck> with AfterLayoutMixin<FirstTimeCheck> {

  Future checkFirstSeen() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen')??false);

    if (seen)
    {
      var pushReplacement = Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ListenableProvider<SystemBrain>(

              create: (_) => SystemBrain(),
              builder: (context, child)
              {
               return const WelcomeScreen();
              }
             )));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DisclaimerScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}


class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: kRedBackgroundColour,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              const Text("iALS Disclaimer\n",
              style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.red,)),
              const Text("iALS is a product produced by Code Med Ltd. iALS is a tool which helps users to navigate the Advanced Life Support (ALS) Algorithm as produced by the Resuscitation Council (UK).\n\niALS is not meant to be a substitute for being ALS trained. Its is designed to be a companion for ALS training and we do not endorse its use for those who have not been ALS trained. The use of the iALS app should never be used in place of ones own clinical judgement.\n\nWhilst Code Med has robustly tested iALS, it does not and cannot accept any liability for its use within any clinical or non-clinical setting. Any clinician who decides to use iALS within a clinical setting does so at their own risk and accepts full liability for its outcomes.\n\niALS does not store any data within the application and all data which are recorded are anonymous. The application allows for electronic transmission of data. Code Med does not accept an liability with regards to transmission of data which is borne entirely by the user.",
              style: TextStyle(fontSize: 12,
              color: Colors.black,
              ),
              textAlign: TextAlign.justify,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return GuidePages(firstTimeNavigation: true);
                        }));
                      },
                      child: Container(
                        color:Colors.blue,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Accept",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                      ),),
                  TextButton(
                      onPressed: ()
                      {

                      },
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Do Not Accept",
                            style: TextStyle(
                              color: Colors.white,

                              //backgroundColor: Colors.blueAccent,
                            )),
                      ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



