import 'package:ials_app_nullsafety/buttons.dart';
import 'package:ials_app_nullsafety/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:ials_app_nullsafety/fixed_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ials_app_nullsafety/globalVariables.dart' as global;
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:ials_app_nullsafety/welcome_screen.dart';
import 'package:provider/provider.dart';

class ABG extends StatefulWidget {

  @override
  _ABGState createState() => _ABGState();
}

class _ABGState extends State<ABG> {

  double? ph;
  double? pO2;
  double? pCO2;
  double? hCO3;
  double? baseExcess;
  double? potassium;
  double? lactate;
  double? glucose;


  int? proceed;

  String outputTextArea = ' ';

  TextEditingController phTextField = TextEditingController();
  TextEditingController pO2TextField = TextEditingController();
  TextEditingController pCO2TextField = TextEditingController();
  TextEditingController hCO3TextField = TextEditingController();
  TextEditingController baseExcessTextField = TextEditingController();
  TextEditingController potassiumTextField = TextEditingController();
  TextEditingController lactateTextField = TextEditingController();
  TextEditingController glucoseTextField = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final systemBrain = Provider.of<SystemBrain>(context, listen: false);
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPanelBackgroundColour,
      body:
      SafeArea(
        child: Column(
          children: [

            Expanded(
              flex: 9,
              child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left:20.0,right:20, top: 20, bottom: 10),
                  child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:
                      [
                        Expanded(
                          flex:1,
                          child:
                          Container(

                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children:
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Container(color: kButtonTextColourDark,
                                        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0,),
                                        child:
                                        Row(
                                          children: [
                                            Icon(CupertinoIcons.info,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 12.0,
                                            ),

                                            AutoSizeText('Arterial Blood Gas Interpretation',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),),
                                          ],
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Container(color: Colors.white,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(10.0),
                                                margin: EdgeInsets.fromLTRB(0, 0,10.0,0),
                                                color: Colors.white,
                                                child:
                                                Column(
                                                  children: [
                                                    ABGInputPane(
                                                      inputPaneText: 'pH',
                                                      fontSize: 15,
                                                      textEditingController: phTextField,
                                                      textInputFunction:(value)
                                                      {
                                                        ph = double.parse(phTextField.text);
                                                        ph = double.parse(value);
                                                      },
                                                    ),
                                                    ABGInputPane(
                                                      inputPaneText: 'pO2',
                                                      fontSize: 15,
                                                      textEditingController: pO2TextField,
                                                      textInputFunction:(value)
                                                      {
                                                        pO2 = double.parse(value);
                                                        pO2 = double.parse(pO2TextField.text);
                                                      },
                                                    ),
                                                    ABGInputPane(
                                                      inputPaneText: 'pCO2',
                                                      fontSize: 15,
                                                      textEditingController: pCO2TextField,
                                                      textInputFunction:(value)
                                                      {
                                                        pCO2 = double.parse(value);
                                                        pCO2 = double.parse(pCO2TextField.text);
                                                      },
                                                    ),
                                                    ABGInputPane(
                                                      inputPaneText: 'HCO3',
                                                      fontSize: 15,
                                                      textEditingController: hCO3TextField,
                                                      textInputFunction:(value)
                                                      {
                                                        hCO3 = double.parse(hCO3TextField.text);
                                                        hCO3 =double.parse(value);
                                                      },
                                                    ),

                                                  ],

                                                ),

                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0, 0,10.0,0),
                                                padding: EdgeInsets.all(10.0),
                                                color: Colors.white,
                                                child:
                                                Column(
                                                  children: [
                                                    ABGInputPane(
                                                      inputPaneText: 'BE',
                                                      fontSize: 15,
                                                      textEditingController: baseExcessTextField,
                                                      textInputFunction:(value)
                                                      {
                                                        baseExcess = double.parse(baseExcessTextField.text);
                                                        baseExcess = double.parse(value);
                                                      },
                                                    ),
                                                    ABGInputPane(
                                                      inputPaneText: 'K+',
                                                      fontSize: 15,
                                                      textEditingController: potassiumTextField,
                                                      textInputFunction:(valueK)
                                                      {
                                                        potassium = double.parse(potassiumTextField.text);
                                                        potassium = double.parse(valueK);
                                                      },
                                                    ),
                                                    ABGInputPane(
                                                      inputPaneText: 'Lac',
                                                      fontSize: 15,
                                                      textEditingController: lactateTextField,
                                                      textInputFunction:(value)
                                                      {
                                                        lactate = double.parse(lactateTextField.text);
                                                        lactate = double.parse(value);
                                                      },
                                                    ),
                                                    ABGInputPane(
                                                      inputPaneText: 'Glu',
                                                      fontSize: 15,
                                                      textEditingController: glucoseTextField,
                                                      textInputFunction:(value)
                                                      {
                                                        glucose = double.parse(glucoseTextField.text);
                                                        glucose = double.parse(value);
                                                      },
                                                    ),

                                                  ],

                                                ),

                                              ),
                                            ),
                                          ],
                                        )
                                      // ManualArrestQuadInputPane1(
                                      //   inputPaneText: 'ph',
                                      // ),
                                      //

                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          color: Colors.red,
                          height: 5.0,
                        ),
                        Expanded(
                          flex: 1,
                          child:
                          Container(color: Colors.white,
                            padding: EdgeInsets.all(30.0),

                            child:
                            SingleChildScrollView(
                              child: Text(outputTextArea,
                                style:  TextStyle(
                                  fontSize: 16.0,
                                ),

                              ),
                            ),

                          ),
                        ),

                      ]
                  )


              ),
            ),
            Expanded(
              flex: 1,
              child:
              Container(
                color: kPanelBackgroundColour,
                margin: EdgeInsets.only(left: 20,right:20, bottom:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ABGButtons(
                      abgButtonText: 'Interpret',
                      abgButtonColour: kInterventionsButtonActiveColour,
                      abgButtonFunction: ()
                      {

                        proceedWithCalculation();
                        aBGCalculation();
                        setState(()
                        {

                        });
                      },

                    ),
                    ABGButtons(
                      abgButtonText: 'Reset',
                      abgButtonColour: kVTVFActiveButtonColour,
                      abgButtonFunction: ()
                      {

                        ph = null;
                        pO2 = null;
                        pCO2 = null;
                        hCO3 = null;
                        baseExcess = null;
                        potassium = null;
                        lactate = null;
                        glucose = null;

                        setState(() {
                          outputTextArea = '';
                        });


                        phTextField.clear();
                        pO2TextField.clear();
                        pCO2TextField.clear();
                        hCO3TextField.clear();
                        baseExcessTextField.clear();
                        potassiumTextField.clear();
                        lactateTextField.clear();
                        glucoseTextField.clear();




                      },
                    ),

                    ABGButtons(
                      abgButtonText: 'Add to Log',
                      abgButtonColour: kBlueButtonColour,
                      abgButtonFunction: ()
                      {
                        if(ph == null || pO2 == null || pCO2 == null || hCO3 == null || baseExcess == null || lactate == null)
                        {
                          _showMyDialog();
                        }
                        else {
                          global.log = '${global.log}\n${systemBrain.timeNow} - ABG Result: \n                  pH: ${phTextField.text}\n                  pO2: ${pO2TextField.text} kPa\n                  pCO2: ${pCO2TextField.text} kPa\n                  HCO3: ${hCO3TextField.text} mmol/L\n                  BE: ${baseExcessTextField.text} mmol/L\n                  K+: ${potassiumTextField.text} mmol/L\n                  Lac: ${lactateTextField.text} mmol/L\n                  Glu: ${glucoseTextField.text} mmol/L'
                          ;
                        }
                      },
                    ),



                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }



  void aBGCalculation()
  {
    try {
      if (proceed == 1)
      {
        if (ph! > 7.45) // ALKALOSIS
            {
          if (pO2! > 10) // NORMAL OXYGENATION
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic alkalosis with respiratory compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include: ';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Vomiting/diarrhoea, Loop & thiazide diuretics, Heart failure, Nephrotic syndrome, Conn\'s syndrome, Milk-alkali syndrome';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypercapnic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Vomiting/diarrhoea, Loop & thiazide diuretics, Heart failure, Nephrotic syndrome, Conn\'s syndrome, Milk-alkali syndrome';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a mixed Metabolic and Respiratory alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Liver cirrhosis with diuretic use, Hyperemesis gravidarum, Execssive ventilation in COPD';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypocapnic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Anxiety, Pain, Hypoxia, Pulmonary embolism, Pneumothorax, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypocapnic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory alkalosis with metabolic compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Anxiety, Pain, Hypoxia, Pulmonary embolism, Pneumothorax, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypocapnic';
              }
            }
          }
          else if (pO2! < 10 && pO2! > 8) // HYPOXAEMIA
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic alkalosis with respiratory compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Vomiting/diarrhoea, Loop & thiazide diuretics, Heart failure, Nephrotic syndrome, Conn\'s syndrome, Milk-alkali syndrome';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Vomiting/diarrhoea, Loop & thiazide diuretics, Heart failure, Nephrotic syndrome, Conn\'s syndrome, Milk-alkali syndrome';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a mixed Metabolic and Respiratory alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Liver cirrhosis with diuretic use, Hyperemesis gravidarum, Execssive ventilation in COPD';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Anxiety, Pain, Hypoxia, Pulmonary embolism, Pneumothorax, Iatrogenic (excessive mechanical ventilation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory alkalosis with metabolic compensation';

                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Anxiety, Pain, Hypoxia, Pulmonary embolism, Pneumothorax, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
            }
          }
          else // RESPIRATORY FAILURE
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic alkalosis with respiratory compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Vomiting/diarrhoea, Loop & thiazide diuretics, Heart failure, Nephrotic syndrome, Conn\'s syndrome, Milk-alkali syndrome';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Vomiting/diarrhoea, Loop & thiazide diuretics, Heart failure, Nephrotic syndrome, Conn\'s syndrome, Milk-alkali syndrome';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a mixed Metabolic and Respiratory alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Liver cirrhosis with diuretic use, Hyperemesis gravidarum, Execssive ventilation in COPD';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory alkalosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Anxiety, Pain, Hypoxia, Pulmonary embolism, Pneumothorax, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory alkalosis with metabolic compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Anxiety, Pain, Hypoxia, Pulmonary embolism, Pneumothorax, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
            }
          }
        }
        else if (ph! < 7.35) // ACIDOTIC
            {
          if (pO2! > 10) // NORMAL OXYGENATION
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory acidosis with metabolic compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Respiratory depression, Guillain-Barre, Asthma, COPD, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypercapnic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Respiratory depression, Guillain-Barre, Asthma, COPD, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypercapnic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a mixed Metabolic and Respiratory acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea =
                    '${outputTextArea}Cardiac arrest, Multi-organ failure';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypercapnic';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Diabetic Ketoacidosis, Lactic acidosis, Aspirin overdose, Diarrhoea/Ileostomy, Renal Tubular Acidosis, Addison\'s Disease';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic acidosis with respiratory compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Diabetic Ketoacidosis, Lactic acidosis, Aspirin overdose, Diarrhoea/Ileostomy, Renal Tubular Acidosis, Addison\'s Disease';
              }
            }
          }
          else if (pO2! < 10 && pO2! > 8) // HYPOXAEMIA
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory acidosis with metabolic compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Respiratory depression, Guillain-Barre, Asthma, COPD, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Respiratory depression, Guillain-Barre, Asthma, COPD, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a mixed Metabolic and Respiratory acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea =
                    '${outputTextArea}Cardiac arrest, Multi-organ failure';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Diabetic Ketoacidosis, Lactic acidosis, Aspirin overdose, Diarrhoea/Ileostomy, Renal Tubular Acidosis, Addison\'s Disease';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic acidosis with respiratory compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Diabetic Ketoacidosis, Lactic acidosis, Aspirin overdose, Diarrhoea/Ileostomy, Renal Tubular Acidosis, Addison\'s Disease';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
            }
          }
          else // RESPIRATORY FAILURE
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory acidosis with metabolic compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Respiratory depression, Guillain-Barre, Asthma, COPD, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result demonstrates a Respiratory acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Respiratory depression, Guillain-Barre, Asthma, COPD, Iatrogenic (excessive mechanical ventilation)';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a mixed Metabolic and Respiratory acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea =
                    '${outputTextArea}Cardiac arrest, Multi-organ failure';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is type 2 respiratory failure';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic acidosis';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Diabetic Ketoacidosis, Lactic acidosis, Aspirin overdose, Diarrhoea/Ileostomy, Renal Tubular Acidosis, Addison\'s Disease';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result demonstrates a Metabolic acidosis with respiratory compensation';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}Causes include:';
                outputTextArea = '$outputTextArea\n';
                outputTextArea = '${outputTextArea}Diabetic Ketoacidosis, Lactic acidosis, Aspirin overdose, Diarrhoea/Ileostomy, Renal Tubular Acidosis, Addison\'s Disease';
                outputTextArea = '$outputTextArea\n\n';
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
            }
          }
        }
        else // NORMAL PH
            {
          if (pO2! > 10) // NORMAL OXYGENATION
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypercapnic with compensation';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypercapnic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                    '${outputTextArea}This result demonstrates no metabolic or respiratory abnormalities';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                'This result does not fit any pattern. Is this a venous or mixed gas?';
                outputTextArea = '$outputTextArea\n\n';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypocapnic';
              }
              else // LOW BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypocapnic';
              }
            }
          }
          else if (pO2! < 10 && pO2! > 8) // HYPOXAEMIA
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
              else // LOW BICARB
                  {
                outputTextArea =
                    '${outputTextArea}This patient is hypoxic and hypercapnic';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else // LOW BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
              else // LOW BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is hypoxic';
              }
            }
          }
          else // RESPIRATORY FAILURE
              {
            if (pCO2! > 6) // HYPERCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 2 respiratory failure';
              }
            }
            else if (pCO2! < 6 && pCO2! > 4.5) // NORMOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
            }
            else // HYPOCAPNIC
                {
              if (hCO3! > 26) // HIGH BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else if (hCO3! < 26 && hCO3! > 22) // NORMAL BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
              else // LOW BICARB
                  {
                outputTextArea = '${outputTextArea}This patient is in type 1 respiratory failure';
              }
            }
          }
        }

        if (potassium! > 5.3)
        {
          outputTextArea = '$outputTextArea\n\nThis patient is hyperkalaemic';
        }
        else if (potassium!<3.5)
        {
          outputTextArea = '$outputTextArea\n\nThis patient is hypokalaemic';
        }

        else
        {

        }

        if (glucose!> 11)
        {
          outputTextArea = '$outputTextArea\n\nThis patient is hyperglycaemic';
        }
        else if (glucose! < 4)
        {
          outputTextArea = '$outputTextArea\n\nThis patient is hypoglycaemic';
        }
        else
        {

        }

      }
      else
      {

      }
    }
    catch (e)
    {

    }
  }

  void proceedWithCalculation()
  {
    setState(() {

    });

    if(ph == null || pO2 == null || pCO2 == null || hCO3 == null || baseExcess == null || lactate == null)
    {
      _showMyDialog();
    }
    //else if((((baseExcess.toString().contains('0')) || (baseExcess.toString().contains('1')) || (baseExcess.toString().contains('2')) || (baseExcess.toString().contains('3')) || (baseExcess.toString().contains('4')) || (baseExcess.toString().contains('5')) || (baseExcess.toString().contains('6')) || (baseExcess.toString().contains('7')) || (baseExcess.toString().contains('8')) || (baseExcess.toString().contains('9')))) || ((baseExcess.toString().contains('a'))) || ((baseExcess.toString().contains('b'))) || ((baseExcess.toString().contains('c'))) || ((baseExcess.toString().contains('d'))) || ((baseExcess.toString().contains('e'))) || ((baseExcess.toString().contains('f'))) || ((baseExcess.toString().contains('g'))) || ((baseExcess.toString().contains('h'))) || ((baseExcess.toString().contains('i'))) || ((baseExcess.toString().contains('j'))) || ((baseExcess.toString().contains('k'))) || ((baseExcess.toString().contains('l'))) || ((baseExcess.toString().contains('m'))) || ((baseExcess.toString().contains('n'))) || ((baseExcess.toString().contains('o'))) || ((baseExcess.toString().contains('p'))) || ((baseExcess.toString().contains('q'))) || ((baseExcess.toString().contains('r'))) || ((baseExcess.toString().contains('s'))) || ((baseExcess.toString().contains('t'))) || ((baseExcess.toString().contains('u'))) || ((baseExcess.toString().contains('v'))) || ((baseExcess.toString().contains('w'))) || ((baseExcess.toString().contains('x'))) || ((baseExcess.toString().contains('y'))) || ((baseExcess.toString().contains('z'))) || ((baseExcess.toString().contains('/'))) || ((baseExcess.toString().contains(':'))) || ((baseExcess.toString().contains(';'))) || ((baseExcess.toString().contains('('))) || ((baseExcess.toString().contains(')'))) || ((baseExcess.toString().contains('£'))) || ((baseExcess.toString().contains('&'))) || ((baseExcess.toString().contains('@'))) || ((baseExcess.toString().contains(','))) || ((baseExcess.toString().contains('?'))) || ((baseExcess.toString().contains('!'))) || ((baseExcess.toString().contains('''))) || ((baseExcess.toString().contains('~'))) )
    //   {
    //     _showMyDialog();
    // }
    else
    {
      proceed = 1;
      outputTextArea = '';
    }

  }


  Future <void> _showMyDialog() async {
    return showDialog<void>(
        useSafeArea: true,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return AlertDialog(
              title: Container(
                margin: EdgeInsets.fromLTRB(10,0,10,15),
                child: Text('Please complete all the text fields',
                    style: TextStyle(
                      fontSize: 20.0,
                    )

                ),
              ),
              actions: [

                TextButton(
                    child: Text('Dismiss'),
                    onPressed: (){

                      Navigator.of(context).pop();

                    }
                ),
              ]
          );
        }

    );
  }
}