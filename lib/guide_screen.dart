import 'package:ials_app_nullsafety/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';


class GuidePages extends StatefulWidget {
  GuidePages({Key? key, required this.firstTimeNavigation}) : super(key: key);

  bool firstTimeNavigation;

  @override
  _GuidePagesState createState() => _GuidePagesState();
}

class _GuidePagesState extends State<GuidePages> {

  int guideImageNumber = 0;


  @override
  Widget build(BuildContext context) {

    bool firstTimeNavigation = widget.firstTimeNavigation;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.white,
        elevation: 0,
        leading:
        IconButton(
          icon: Icon(CupertinoIcons.chevron_left,
            size: 20.0,
            color: kTextFieldLightGreyBorder),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 35,
        color: Colors.white,
        child:
          Column(
            children:[
              Expanded(child: Container(
                color: Colors.white,
                child: Image(image: AssetImage("images/tut_page_$guideImageNumber.png"),)
              ),),
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 30,
                color: Colors.white,
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        margin: EdgeInsets.only(left:10),
                        width: 40,
                        //color:Colors.purple,
                          child: guideImageNumber == 0?Container():


                          MaterialButton(
                            elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),

                              color: kBlueButtonColour,
                              minWidth: 40,
                              height: 40,

                              onPressed: ()
                          {
                            setState(() {
                              if (guideImageNumber==0)
                              {
                                guideImageNumber=0;
                              }
                              else
                              {
                                guideImageNumber--;
                              }

                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Icon(CupertinoIcons.chevron_back,
                            size: 18,
                            color: Colors.white),
                          ),

                        ),
                      ),
                      (firstTimeNavigation&&guideImageNumber==0)||!firstTimeNavigation||(firstTimeNavigation&&guideImageNumber==12)?Container(
                        width: 150,
                        color:Colors.yellow,
                        //color:Colors.purple,
                        child: MaterialButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),

                          color: kBlueButtonColour,
                          minWidth: 50,
                          height: 50,
                          onPressed: ()
                          {
                            setState(() {
                              if (guideImageNumber == 0)
                              {
                                guideImageNumber++;
                              }
                              else
                              {
                                firstTimeNavigation?
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return WelcomeScreen();

                                  }))

                                :Navigator.pop(context);
                              }
                            });

                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(guideImageNumber == 0?"Start Guide":"Exit Guide",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                          ),

                        ),
                      ):Container(),
                      Container(
                        margin: EdgeInsets.only(right:10),
                        width: 40,
                        //color:Colors.purple,
                        child: guideImageNumber == 0 || guideImageNumber == 12? Container():MaterialButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),

                          color: kBlueButtonColour,
                          minWidth: 40,
                          height: 40,
                          onPressed: ()
                          {
                            setState(() {
                              if (guideImageNumber==12)
                                {
                                  guideImageNumber=12;
                                }
                              else
                                {
                                  guideImageNumber++;
                                }

                            });
                          },
                          child: Container(

                            alignment: Alignment.center,
                            child: Icon(CupertinoIcons.chevron_forward,
                                size: 18,
                                color: Colors.white),
                          ),

                        ),
                      ),
                    ],

                  ),
              ),
        ],
          ),
      ),
    );
  }
}
