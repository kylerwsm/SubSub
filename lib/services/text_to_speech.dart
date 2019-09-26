import 'dart:io';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

const _rapidApiKey = 'c6242b6450msh08e71a9acec48f1p15202cjsn0e9c5ab92e1c';
const _ttsApiKey = '8de1a6ed70da42b29c8608dd7d0f7f10';
const _urlPrefix =
    'https://voicerss-text-to-speech.p.rapidapi.com/?r=0&c=mp3&f=8khz_8bit_mono&src=';

class TextToSpeech {
  final String content;
  final Language language;

  TextToSpeech({this.content, this.language});

  void playAudio() async {
    var encodedContent = Uri.encodeQueryComponent(content);
    print(encodedContent);
    final response = await http.get(
      '$_urlPrefix$encodedContent&hl=$contentLanguage&key=$_ttsApiKey',
      headers: {
        'x-rapidapi-host': "voicerss-text-to-speech.p.rapidapi.com",
        'x-rapidapi-key': "$_rapidApiKey"
      },
    );
    final bytes = response.bodyBytes;
    var path = await writeCounter(bytes);

    AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    await audioPlayer.play(path, isLocal: true);
  }

  String get contentLanguage {
    switch (language) {
      case Language.english:
        return 'en-us';
      default:
        return null;
    }
  }

  Future<String> writeCounter(var data) async {
    final file = await _localFile;
    await file.writeAsBytes(data);
    return file.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/audio.mp3');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({this.id, this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

enum Language { english }
