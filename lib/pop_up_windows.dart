import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:provider/provider.dart';
import 'globalVariables.dart' as global;
import 'main_frame.dart';


bool unsuccessfulAccessPresent = false;
//accessBoolean list is for the forloop that fills the log. The [0] position is smallBorePresent, the [1] position is largeBorePresent, the [2] position is [ioPresent]


//bool nPAPresent=false;
//bool oPAPresent = false;
//bool iGelPresent= false;
//bool eTTubePresent = false;
//bool unsuccessfulAirwayPresent = false;
//bool hartmannsPresent = false;




class PopUpWindowTile extends StatelessWidget {

  const PopUpWindowTile({
    required this.imageStringPath,
    required this.descriptor,
    required this.tileActive,
    required this.counter,
    required this.removeFunction,
    required this.addFunction
  });

  final String imageStringPath;
  final String descriptor;
  final bool tileActive;
  final int counter;
  final Function removeFunction;
  final Function addFunction;

  @override
  Widget build(BuildContext context) {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    return
      ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 1,
        ),
        leading: SizedBox(
            height: 50,
            width: 50,
            child: Image(image: AssetImage(imageStringPath))),
        title: Text(descriptor,
          style: const TextStyle(
            fontSize: 15.0,

          ),
        ),
        selected: tileActive,
        trailing:
        Visibility(
          visible: tileActive,
          child:
          Text(counter.toString(),
              style: const TextStyle(),
              ),
        ),

        onTap: () async {
          addFunction();
          await Future.delayed(const Duration(milliseconds: 400));
          Navigator.of(context).pop();
          systemBrain.accessLogFunction();
          systemBrain.airwayLogFunction();
        },

        onLongPress: () async {
            await Future.delayed(const Duration(milliseconds: 400));
            Navigator.of(context).pop();
            removeFunction();
            systemBrain.accessLogFunction();
            systemBrain.airwayLogFunction();

            //Navigator.of(context).pop();

        },


      );
  }
}



class simplePopUpWindowTile extends StatelessWidget {


  simplePopUpWindowTile({this.descriptor, this.tileActive, this.counter, this.removeFunction, this.addFunction});

  final String? descriptor;
  final bool? tileActive;
  final int? counter;
  final Function? removeFunction;
  final Function? addFunction;

  @override
  Widget build(BuildContext context) {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);



    return
      ListTile(
        title:
        Center(
          child: Text(descriptor!,
            style: const TextStyle(
              fontSize: 15.0,

            ),
          ),
        ),
        selected: tileActive!,

        onTap: () async {
          addFunction!();
          await Future.delayed(const Duration(milliseconds: 400));
          Navigator.pop(context);
          systemBrain.accessLogFunction();
          systemBrain.airwayLogFunction();
        },

        onLongPress: () async {
          try {
            removeFunction!();
            systemBrain.accessLogFunction();
            systemBrain.airwayLogFunction();

            await Future.delayed(const Duration(milliseconds: 400));
            Navigator.pop(context);
          }
          catch (e)
          {
            await Future.delayed(const Duration(milliseconds: 400));
            Navigator.pop(context);
          }

        },


      );
  }
}

class AccessPopUp
{

  Function updateState = (){};

  AccessPopUp(Function updateStateInput)
  {
    updateState = updateStateInput;
  }

  mainBottomSheet (BuildContext context)
  {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (_)
        {
          return ListenableProvider.value(
            value: systemBrain,
            child: StatefulBuilder(
                builder: (BuildContext context,StateSetter setModalState)
                {
                  return
                    Wrap(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          child:
                          Column(
                            children: [
                              const SizedBox(height:5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [

                                  Icon(CupertinoIcons.arrow_down,
                                    color: Colors.grey,size:20,),
                                  Icon(CupertinoIcons.hand_draw,
                                    color: Colors.grey,size:20,),

                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: AutoSizeText(
                                  'Tap to add intervention, hold to remove',
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,

                                  ),
                                  maxFontSize: 12.0,
                                  maxLines: 1,
                                  minFontSize: 10.0,
                                ),
                              ),

                              PopUpWindowTile(
                                imageStringPath: 'images/sbcannula.jpg',
                                descriptor: "Small Bore Cannula",
                                tileActive: systemBrain.accessBooleanList[0],
                                counter: systemBrain.accessCounterList[0],
                                addFunction: () {
                                  setModalState((){
                                    systemBrain.accessCounterList[0]++;

                                    global.log = global.log + '\n' + global.timeNow +
                                        ' - Small Bore Cannula Inserted';
                                    systemBrain.accessBooleanList[0] = true;
                                  });

                                  updateState();

                                },
                                removeFunction: () {
                                  setModalState((){
                                    systemBrain.accessCounterList[0]--;
                                    if (systemBrain.accessCounterList[0] > 0) {
                                      global.log = global.log + '\n' + global.timeNow +
                                          ' - Small Bore Cannula Removed';
                                    }
                                    else if (systemBrain.accessCounterList[0] == 0) {
                                      global.log = global.log + '\n' + global.timeNow +
                                          ' - Small Bore Cannula Removed';
                                      systemBrain.accessCounterList[0] = 0;
                                      systemBrain.accessBooleanList[0] = false;
                                    }
                                    else {
                                      systemBrain.accessCounterList[0] = 0;
                                      systemBrain.accessBooleanList[0] = false;
                                    }
                                  });

                                  updateState();

                                },
                              ),
                              PopUpWindowTile(
                                imageStringPath: 'images/lbcannula.jpg',
                                descriptor: "Large Bore Cannula",
                                tileActive: systemBrain.accessBooleanList[1],
                                counter: systemBrain.accessCounterList[1],
                                addFunction: () {
                                  setModalState((){
                                    systemBrain.accessCounterList[1]++;

                                    global.log = global.log + '\n' + global.timeNow +
                                        ' - Large Bore Cannula Inserted';
                                    systemBrain.accessBooleanList[1] = true;
                                  });
                                  updateState();

                                },

                                removeFunction: () {
                                  setModalState((){
                                    systemBrain.accessCounterList[1]--;
                                    if (systemBrain.accessCounterList[1] > 0) {
                                      global.log = global.log + '\n' + global.timeNow +
                                          ' - Large Bore Cannula Removed';
                                    }
                                    else if (systemBrain.accessCounterList[1] == 0) {
                                      global.log = global.log + '\n' + global.timeNow +
                                          ' - Large Bore Cannula Removed';
                                      systemBrain.accessCounterList[1] = 0;
                                      systemBrain.accessBooleanList[1] = false;
                                    }
                                    else {
                                      systemBrain.accessCounterList[1] = 0;
                                      systemBrain.accessBooleanList[1] = false;
                                    }
                                  });
                                  updateState();

                                },
                              ),

                              PopUpWindowTile(
                                imageStringPath: 'images/intrao.jpg',
                                descriptor: "IO Inserted",
                                tileActive: systemBrain.accessBooleanList[2],
                                counter: systemBrain.accessCounterList[2],
                                addFunction: () {

                                  setModalState((){
                                    systemBrain.accessCounterList[2]++;

                                    global.log = global.log + '\n' + global.timeNow +
                                        ' - IO Inserted';
                                    systemBrain.accessBooleanList[2] = true;
                                  });
                                  updateState();

                                },
                                removeFunction: () {

                                  setModalState((){
                                    systemBrain.accessCounterList[2]--;
                                    if (systemBrain.accessCounterList[2] > 0) {
                                      global.log = global.log + '\n' + global.timeNow +
                                          ' - IO Removed';
                                    }
                                    else if (systemBrain.accessCounterList[2] == 0) {
                                      global.log = global.log + '\n' + global.timeNow +
                                          ' - IO Removed';
                                      systemBrain.accessCounterList[2] = 0;
                                      systemBrain.accessBooleanList[2] = false;
                                    }
                                    else {
                                      systemBrain.accessCounterList[2] = 0;
                                      systemBrain.accessBooleanList[2] = false;
                                    }
                                  });
                                  updateState();

                                },
                              ),
                              PopUpWindowTile(
                                imageStringPath: 'images/unsucc.jpg',
                                descriptor: "Unsuccessful attempt",
                                tileActive: unsuccessfulAccessPresent,
                                counter: systemBrain.unsuccessfulAccessCounter,
                                addFunction: () {

                                  setModalState((){
                                    systemBrain.unsuccessfulAccessCounter++;

                                    global.log = global.log+ '\n' + global.timeNow +' - Unsuccessful access attempt';
                                    unsuccessfulAccessPresent = true;
                                  });
                                  updateState();
                                },
                                removeFunction: () {},
                              ),


                            ],
                          ),
                        ),

                      ],
                    );
                }),
          );//showModalBottomSheet

        });

  }
}
class AirwayPopUp
{

  Function updateState = (){};

  AirwayPopUp(Function updateStateInput)
  {
    updateState = updateStateInput;
  }



  mainBottomSheet (context)
  {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        builder: (_)
      {
      return ListenableProvider.value(
      value: systemBrain,
          child: StatefulBuilder(
          builder: (BuildContext context,StateSetter setModalState)
              {
                      return

                      Wrap(
                      children: [
                      Container(
                      decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      ),
                      ),
                      child: Column(
                      children: [

                      const SizedBox(height: 5),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [

                      Icon(CupertinoIcons.arrow_down,
                      color: Colors.grey, size: 20,),
                      Icon(CupertinoIcons.hand_draw,
                      color: Colors.grey, size: 20,),
                      ],
                      ),
                      const Padding(
                      padding: EdgeInsets.all(
                      5),
                      child: AutoSizeText(
                      'Tap to add intervention, hold to remove',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      ),

                      maxFontSize: 12.0,
                      maxLines: 1,
                      minFontSize: 10.0,
                      ),
                      ),


                      PopUpWindowTile(
                      imageStringPath: 'images/nasop.jpg',
                      descriptor: "Nasopharyngeal Airway",
                      tileActive: Provider
                          .of<SystemBrain>(context, listen: false)
                          .nPAPresent,
                      counter: Provider
                          .of<SystemBrain>(context, listen: false)
                          .nPACounter,


                      addFunction: () {
                        setModalState(()
                        {
                          Provider
                              .of<SystemBrain>(context, listen: false)
                              .nPACounter++;

                          if (Provider
                              .of<SystemBrain>(context, listen: false)
                              .nPACounter <= 2) {
                            global.log = global.log + '\n' + global.timeNow +
                                ' - Nasopharyngeal Airway Inserted';
                            Provider
                                .of<SystemBrain>(context, listen: false)
                                .nPAPresent = true;
                            //nPAPresent = true;
                            //airwayLogFunction();
                          }

                          else {
                            Provider
                                .of<SystemBrain>(context, listen: false)
                                .nPACounter = 2;
                            //airwayLogFunction();
                          }


                        });


                      // setModalState((){
                      //   global.nPACounter++;
                      //
                      //   if (global.nPACounter <=2)
                      //   {
                      //     global.log = global.log+ '\n' + global.timeNow +' - Nasopharyngeal Airway Inserted';
                      //     nPAPresent = true;
                      //     //airwayLogFunction();
                      //   }
                      //
                      //   else
                      //   {
                      //     global.nPACounter = 2;
                      //     //airwayLogFunction();
                      //   }
                      // });

                      updateState();

                      },
                      removeFunction: () {

                        setModalState(()
                        {
                          Provider
                              .of<SystemBrain>(context, listen: false)
                              .nPACounter --;

                          if (Provider
                              .of<SystemBrain>(context, listen: false)
                              .nPACounter > 0) {
                            global.log = '${global.log}\n${global
                                .timeNow} - Nasopharyngeal Airway Removed';
                          }

                          else if (Provider
                              .of<SystemBrain>(context, listen: false)
                              .nPACounter == 0) {
                            global.log = global.log + '\n' + global.timeNow +
                                ' - Nasopharyngeal Airway Removed';
                            Provider
                                .of<SystemBrain>(context, listen: false)
                                .nPACounter = 0;
                            systemBrain.nPAPresent = false;
                          }

                          else {
                            Provider
                                .of<SystemBrain>(context, listen: false)
                                .nPACounter = 0;
                            systemBrain.nPAPresent = false;
                          }
                        });

                      // setModalState((){
                      //   global.nPACounter--;
                      //   if (global.nPACounter >0)
                      //   {
                      //     global.log = global.log+ '\n' + global.timeNow +' - Nasopharyngeal Airway Removed';
                      //   }
                      //   else if(global.nPACounter == 0)
                      //   {
                      //     global.log = global.log+ '\n' + global.timeNow +' - Nasopharyngeal Airway Removed';
                      //     global.nPACounter = 0;
                      //     nPAPresent = false;
                      //   }
                      //   else
                      //   {
                      //     global.nPACounter = 0;
                      //     nPAPresent = false;
                      //   }
                      // });


                      updateState();
                      //airwayLogFunction();


                      },
                      ),

                      PopUpWindowTile(
                      imageStringPath: 'images/orop.jpg',
                      descriptor: "Oropharyngeal Airway",
                      tileActive: systemBrain.oPAPresent,
                      counter: systemBrain.oPACounter,
                      addFunction: () {


                      setModalState((){
                        if (systemBrain.oPACounter <1)
                        {
                          systemBrain.oPACounter = 1;
                          systemBrain.iGelCounter = 0;
                          systemBrain.eTTubeCounter = 0;
                          systemBrain.oPAPresent = true;
                          systemBrain.iGelPresent = false;
                          systemBrain.eTTubePresent = false;
                          global.log = global.log + '\n' + global.timeNow +
                              ' - Oropharyngeal Airway Inserted';

                        }

                        else
                        {

                        }
                      });

                      updateState();
                      //airwayLogFunction();
                      },
                      removeFunction: () {
                      setModalState((){
                        if (systemBrain.oPACounter >0)
                        {
                          systemBrain.oPACounter = 0;
                          systemBrain.oPAPresent = false;
                          global.log = global.log + '\n' + global.timeNow +
                              ' - Oropharyngeal Airway Removed';

                        }
                        else
                        {

                        }
                      });

                      updateState();

                      //airwayLogFunction();
                      },
                      ),
                      PopUpWindowTile(
                      imageStringPath: 'images/lma.jpg',
                      descriptor: "Laryngeal Mask Airway/iGel",
                      tileActive: systemBrain.iGelPresent,
                      counter: systemBrain.iGelCounter,
                      addFunction: () {
                      setModalState((){
                        if (systemBrain.iGelCounter <1)
                        {
                          systemBrain.iGelCounter = 1;
                          systemBrain.oPACounter = 0;
                          systemBrain.eTTubeCounter = 0;
                          systemBrain.oPAPresent = false;
                          systemBrain.iGelPresent = true;
                          systemBrain.eTTubePresent = false;
                          global.log = global.log + '\n' + global.timeNow +
                              ' - Laryngeal Mask Airway/iGel Inserted';

                        }

                        else
                        {

                        }
                      });

                      updateState();

                      //airwayLogFunction();

                      },
                      removeFunction: () {
                      // setModalState((){
                      //   if (global.iGelCounter >0)
                      //   {
                      //     global.iGelCounter = 0;
                      //     iGelPresent = false;
                      //     global.log = global.log + '\n' + global.timeNow +
                      //         ' - Laryngeal Mask Airway/iGel Removed';
                      //
                      //
                      //   }
                      //   else
                      //   {
                      //
                      //   }
                      // });

                      updateState();

                      //airwayLogFunction();

                      },
                      ),

                      PopUpWindowTile(
                      imageStringPath: 'images/ett.jpg',
                      descriptor: "Endotracheal tube",
                      tileActive: systemBrain.eTTubePresent,
                      counter: systemBrain.eTTubeCounter,
                      addFunction: () {
                      // setModalState((){
                      //   if (global.eTTubeCounter <1)
                      //   {
                      //     global.eTTubeCounter = 1;
                      //     global.oPACounter = 0;
                      //     global.iGelCounter = 0;
                      //     oPAPresent = false;
                      //     iGelPresent = false;
                      //     eTTubePresent = true;
                      //     global.log = global.log + '\n' + global.timeNow +
                      //         ' - Endotracheal Tube Inserted';
                      //
                      //   }
                      //
                      //   else
                      //   {
                      //
                      //   }
                      // });

                      updateState();
                      //airwayLogFunction();
                      },
                      removeFunction: () {
                      // setModalState((){
                      //   if (global.eTTubeCounter >0)
                      //   {
                      //     global.eTTubeCounter= 0;
                      //     eTTubePresent = false;
                      //     global.log = global.log + '\n' + global.timeNow +
                      //         ' - Endotracheal Tube Removed';
                      //
                      //   }
                      //   else
                      //   {
                      //
                      //   }
                      // });

                      updateState();
                      //airwayLogFunction();

                      },
                      ),


                      ],

                      //builder


                      ),
                      ),

                      ],

                      );
              }
          )
            );
            //showModalBottomSheet

      }
      );

  } //modalbottomsheet

}

class DrugDrawer
{
  mainBottomSheet (BuildContext context)
  {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        isDismissible: false,
        builder: (context)

        {
          return DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder:(_,controller)=>
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(13), topRight: Radius.circular(13),),
                      color: Colors.white,
                      ),

                    child: ListView(
                      controller: controller,
                      //mainAxisSize: MainAxisSize.min,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>
                        [
                          const SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [

                              Icon(CupertinoIcons.arrow_down,
                                color: Colors.grey,size:20,),
                              Icon(CupertinoIcons.hand_draw,
                                color: Colors.grey,size:20,),

                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: AutoSizeText('Tap to add a drug',
                              textAlign: TextAlign.center,
                              style:
                                TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,

                              ),
                              maxFontSize: 15.0,
                              maxLines: 1,
                              minFontSize: 10.0,
                            ),
                          ),
                          PopUpWindowTile(
                            descriptor: 'Hartmann\'s solution (IV fluid)',
                            imageStringPath: 'images/Fluids.png',
                            counter: 0,
                            tileActive: false,
                            //tileActive: hartmannsPresent,
                            addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow + ' - Hartmann\'s solution (IV fluid) administered';
                                global.lastLogEntry = 13;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},


                          ),
                          PopUpWindowTile(
                              descriptor: '0.9% sodium chloride (IV fluid bolus)',
                              imageStringPath: 'images/Fluids.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - 0.9% sodium chloride (IV fluid bolus) administered';
                               global.lastLogEntry = 14;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),
                          PopUpWindowTile(
                              descriptor: 'Glucose (10%) 100ml bolus',
                              imageStringPath: 'images/Fluids.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Glucose (10%) 100ml bolus administered';
                               global.lastLogEntry = 15;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),

                          PopUpWindowTile(
                              descriptor: 'Sodium bicarbonate 50mls 8.4% (50mmol)',
                              imageStringPath: 'images/Fluids.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Sodium bicarbonate 50mls 8.4% (50mmol) administered';
                               global.lastLogEntry = 16;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),

                          PopUpWindowTile(
                              descriptor: 'Magnesium Sulphate 8mmol/2g in 100ml',
                              imageStringPath: 'images/Fluids.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Magnesium Sulphate 8mmol/2g in 100ml administered';
                                global.lastLogEntry = 17;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),

                          PopUpWindowTile(
                              counter: 0,
                              descriptor: 'Alteplase 50mg IV bolus',
                              imageStringPath: 'images/Injection.png',
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                              global.log = global.log+ '\n' + global.timeNow +' - Alteplase 50mg IV bolus administered';
                             global.lastLogEntry = 18;
                              undoEventButtonActive = true;
                              },
                            removeFunction: (){},


                          ),


                          PopUpWindowTile(
                              descriptor: 'Calcium Chloride 10mls of 10%',
                              imageStringPath: 'images/Injection.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Calcium Chloride 10mls of 10% administered';
                                global.lastLogEntry = 19;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},
                          ),

                          PopUpWindowTile(
                              descriptor: 'Glucagon 1mg',
                              imageStringPath: 'images/Injection.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Glucagon 1mg administered';
                                global.lastLogEntry = 20;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},


                          ),

                          PopUpWindowTile(
                              descriptor: 'Insulin/Dextrose',
                              imageStringPath: 'images/med.jpg',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Insulin/Dextrose administered';
                                global.lastLogEntry = 21;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),


///TO DO: Create images for nebulisers
                          ///
                          ///
                          PopUpWindowTile(
                              descriptor: 'Ipratropium bromide 500 mcg',
                              imageStringPath: 'images/med.jpg',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Ipratropium bromide 500 mcg administered';
                                global.lastLogEntry = 22;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),
                          PopUpWindowTile(
                              descriptor: 'Salbutamol nebuliser 5mg',
                              imageStringPath: 'images/med.jpg',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Salbutamol nebuliser 5mg administered';
                                global.lastLogEntry = 23;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),

                          PopUpWindowTile(
                              descriptor: 'Naloxone 400mcg',
                              imageStringPath: 'images/Injection.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Naloxone 400mcg administered';
                                global.lastLogEntry = 24;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),
                          PopUpWindowTile(
                              descriptor: 'Tranexamic Acid 1g',
                              imageStringPath: 'images/Injection.png',
                              counter: 0,
                              tileActive: false,
                              //tileActive: hartmannsPresent,
                              addFunction: ()
                              {
                                global.log = global.log+ '\n' + global.timeNow +' - Tranexamic Acid 1g administered';
                                global.lastLogEntry = 25;
                                undoEventButtonActive = true;
                              },
                            removeFunction: (){},

                          ),


                        ]
                    ),
                  );
                } //builder
            ),
          ); //showModalBottomSheet

        });

  } //modalbottomsheet


}


