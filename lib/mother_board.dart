import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:ials_app_nullsafety/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'abg.dart';
import 'about_screen.dart';
import 'h_and_t.dart';
import 'log_page.dart';
import 'main_frame.dart';



class MotherBoard extends StatefulWidget {

  const MotherBoard({super.key,
    required this.rhythmButtonActiveInitial,
    required this.attachPadsActiveInitial,
  });

  final bool rhythmButtonActiveInitial;
  final bool attachPadsActiveInitial;

  @override
  _MotherBoardState createState() => _MotherBoardState();
}

int _currentIndexOfBottomBar = 0;

class _MotherBoardState extends State<MotherBoard> {
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async => false,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<GlobalTimerService>(create:(_) => GlobalTimerService(),),
          ChangeNotifierProvider<TwoMinuteTimerService>(create:(_) => TwoMinuteTimerService(),),

          ChangeNotifierProvider<SystemBrain>(create:(_)=> SystemBrain(),)
        ],
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body:
            IndexedStack(
              index: _currentIndexOfBottomBar,
              children:
              [
                MainFrame(
                  rhythmButtonActiveInitial: widget.rhythmButtonActiveInitial,
                  attachPadsActiveInitial: widget.attachPadsActiveInitial,
                ),
                LogPage(),
                ABG(),
                ReversibleTilesGrid(),
                const AboutScreen(),
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndexOfBottomBar,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blueAccent,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.waveform_path_ecg),
                  label: 'Resus',

                  ),


                BottomNavigationBarItem(
                  icon: Icon(Icons.create),

                  label: 'Log',

                ),

                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.doc_plaintext),
                  label: "ABG",
                ),

                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.check_mark_circled),
                  label: "H&T",
                ),

                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.info),
                  label: "Info",
                ),
              ],


              onTap: (index)
              {
                setState(() {
                  _currentIndexOfBottomBar = index;

                });
              },
            ),


        ),
      ),
    );
  }
}