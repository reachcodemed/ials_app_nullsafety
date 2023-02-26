import 'package:audioplayers/audioplayers.dart';
import 'package:ials_app_nullsafety/system_brain.dart';
import 'package:provider/provider.dart';
import 'main_frame.dart';
import 'package:ials_app_nullsafety/globalVariables.dart' as global;

void playSound(String soundName) async
{
  final player = AudioPlayer();
  await player.play(AssetSource('$soundName.wav'));
}

void startCPRSoundPlayer (context)
{

  final systemBrain = Provider.of<SystemBrain>(context, listen: false);

  if (systemBrain.adrenalineButtonActive == true && systemBrain.amiodaroneButtonActive == false)
  {
    playSound('adrenaline');
  }
  else if ((systemBrain.adrenalineButtonActive == true && systemBrain.amiodaroneButtonActive == true && systemBrain.shockCounter == 3)||(systemBrain.specialAmiodaroneRequirement == 1 && systemBrain.adrenalineButtonActive == true))
  {
    playSound('adrAndami');
    systemBrain.amiodaroneButtonText = "300 mg";
  }
  else if ((systemBrain.adrenalineButtonActive == true && systemBrain.amiodaroneButtonActive == true && systemBrain.amiodaroneCycle == 2)|| (systemBrain.specialAmiodaroneRequirement == 2&& systemBrain.adrenalineButtonActive == true))
    {
    playSound('adrAndami2');
    systemBrain.amiodaroneButtonText = "150 mg";
  }
  else if ((systemBrain.adrenalineButtonActive == false && systemBrain.shockCounter == 3 && systemBrain.amiodaroneButtonActive == true)||(systemBrain.specialAmiodaroneRequirement == 1 && systemBrain.adrenalineButtonActive == false))
  {
    playSound('amiodarone300');
    systemBrain.amiodaroneButtonText = "300 mg";
  }

  else if ((systemBrain.adrenalineButtonActive == false && systemBrain.amiodaroneCycle == 2 && systemBrain.amiodaroneButtonActive == true)||(systemBrain.specialAmiodaroneRequirement == 1 && systemBrain.adrenalineButtonActive == false))
  {
    playSound('amiodarone150');
    systemBrain.amiodaroneButtonText = "150 mg";
  }

  else if (systemBrain.threeShockTherapyInProgress == false && systemBrain.adrenalineButtonActive == true && systemBrain.amiodaroneButtonActive == false)
  {

  }

  else
  {
    if(firstTimeShock == true)
      {

      }
    else if (systemBrain.threeShockTherapyInProgress == true)
      {

      }
    else
      {
        playSound('startcpr');
      }

  }

}