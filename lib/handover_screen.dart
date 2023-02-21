import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';

class HandoverScreen extends StatelessWidget {

  static String id = 'HandoverScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: kButtonTextColourDark,
        leading:
        IconButton(
        icon: Icon(CupertinoIcons.chevron_left,
        //size: 12.0,
        color: Colors.white,),
    onPressed: ()
    {
    Navigator.pop(context);
    },
    ),
    title: Text('Receive Handover',
    style: TextStyle(fontSize: 20,

    ),
    ),
    ),
    body:
    Container(
      margin: EdgeInsets.all(30.0),
      //color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(CupertinoIcons.hammer_fill,
          size: 100,),),
          SizedBox(height: 100,),
          Center(
            child:
              Text('Sorry! The function is still in construction for Android devices. Please wait for further updates as we work hard to get this in place. Please head back to the welcome screen for now.',
              textAlign: TextAlign.center,
                style:(TextStyle(fontSize: 15,)
                ),
              ),
    ),
        ],
      ),
    ),
    );
  }
}
