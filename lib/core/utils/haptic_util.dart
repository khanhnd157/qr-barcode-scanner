import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

class HapticUtil {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> vibrate() async {
    final hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      Vibration.vibrate(duration: 100);
    }
  }

  Future<void> beep() async {
    await _audioPlayer.play(AssetSource('sounds/beep.wav'));
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
