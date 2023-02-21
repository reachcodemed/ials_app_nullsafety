import 'package:ials_app_nullsafety/guide_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'buttons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:core';
import 'dart:async';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRedBackgroundColour,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          //margin: EdgeInsets.all(10.0),
          color: kRedBackgroundColour,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // AutoSizeText('iALS',
              //   style: GoogleFonts.lato(textStyle: TextStyle(
              //     color: Colors.white,
              //     fontSize: 80.0,
              //   ),
              //   ),),

              // SizedBox(
              //   height: 20.0,
              // ),
              // AutoSizeText('interactive - intuitive - intelligent',
              //   style: GoogleFonts.lato(textStyle: TextStyle(
              //     color: Colors.white,
              //     fontSize: 20.0,
              //   ),
              //   ),
              //   maxLines: 1,
              // ),
              const Image(image: AssetImage('images/iALSlogo.png')),

              // SizedBox(
              //   height: 30.0,
              //
              // ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0,),
                child: const AutoSizeText('© Code Med 2021, Android Beta',
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),

                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(
                height: 20.0,

              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0,),
                child: const AutoSizeText('Developed by: Joseph Hogan • Anja Hutchinson • Imran Qureshi • Arron Thind • Keefai Yeong',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,

                  ),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),


              const SizedBox(
                height: 20.0,

              ),

              WelcomeButtons(
                welcomeButtonText: 'Email Code Med',
                welcomeButtonColour: kBlueButtonColour,
                welcomeButtonPressed: () async
                {
                  final toEmail = "reachcodemed@gmail.com";
                  final url = "mailto:$toEmail";

                  if (await canLaunch(url))
                  {
                    await launch(url);
                  }

                  //_launchURL('mailto:reachcodemed@gmail.com');
                },

              ),

              WelcomeButtons(
                welcomeButtonText: 'Visit iALS Website',
                welcomeButtonColour: kPEAAsystoleButtonColour,
                welcomeButtonPressed: () async
                {
                  final url = "https://codemed.co.uk";

                  if (await canLaunch(url))
                  {
                    await launch(url);

                  }
                },



              ),

              WelcomeButtons(
                welcomeButtonText: 'iALS Video',
                welcomeButtonColour: kYellowButtonColour,
                welcomeButtonPressed: ()async
                {

                  final url = "https://vimeo.com/407570643";

                  if (await canLaunch(url))
                  {

                    await launch(url);

                  }

                },

              ),

              WelcomeButtons(
                welcomeButtonText: 'iALS guide',
                welcomeButtonColour: Colors.grey,
                welcomeButtonPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GuidePages(firstTimeNavigation: false,);


                  }));},



              ),
            ],
          ),


        ),
      ),
    );
  }
}