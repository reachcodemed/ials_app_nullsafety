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
  else if ((systemBrain.adrenalineButtonActive == true && systemBrain.amiodaroneButtonActive == true && global.shockCounter == 3)||(global.specialAmiodaroneRequirement == 1 && systemBrain.adrenalineButtonActive == true))
  {
    playSound('adrAndami');
    amiodaroneButtonText = "300 mg";
  }
  else if ((systemBrain.adrenalineButtonActive == true && systemBrain.amiodaroneButtonActive == true && global.amiodaroneCycle == 2)|| (global.specialAmiodaroneRequirement == 2&& systemBrain.adrenalineButtonActive == true))
    {
    playSound('adrAndami2');
    amiodaroneButtonText = "150 mg";
  }
  else if ((systemBrain.adrenalineButtonActive == false && global.shockCounter == 3 && systemBrain.amiodaroneButtonActive == true)||(global.specialAmiodaroneRequirement == 1 && systemBrain.adrenalineButtonActive == false))
  {
    playSound('amiodarone300');
    amiodaroneButtonText = "300 mg";
  }

  else if ((systemBrain.adrenalineButtonActive == false && global.amiodaroneCycle == 2 && systemBrain.amiodaroneButtonActive == true)||(global.specialAmiodaroneRequirement == 1 && systemBrain.adrenalineButtonActive == false))
  {
    playSound('amiodarone150');
    amiodaroneButtonText = "150 mg";
  }

  else if (threeShockTherapyInProgress == false && systemBrain.adrenalineButtonActive == true && systemBrain.amiodaroneButtonActive == false)
  {

  }

  else
  {
    if(firstTimeShock == true)
      {

      }
    else if (threeShockTherapyInProgress == true)
      {

      }
    else
      {
        playSound('startcpr');
      }

  }

}