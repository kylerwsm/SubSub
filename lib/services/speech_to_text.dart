import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SpeechToText{
  String vidPath;
  String _audFilePath;
  String _savePath;

  SpeechToText({this.vidPath});

  void extractAudio({String audName: 'temp.flac'}) async{
    final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();

    print('[IN CODE] getting save path');
    _savePath = await _localPath;
    print('[IN CODE] Save path is $_savePath');
    _audFilePath = '$_savePath/$audName';
    var arguments = ["-i", vidPath, "-vn", _audFilePath];
    print("Vid path is $vidPath");
    var rc = await _flutterFFmpeg.executeWithArguments(arguments);
    print("FFmpeg process exited with rc $rc");
    postAudio(_audFilePath);
  } 

  //curl.exe -X POST -u "apikey:9YzI9fjutbQ19KFJNACKui_kpxg0tssG_trPGkzSqPCO" --header "Content-Type: audio/flac" --data-binary '@out.flac' "https://stream.watsonplatform.net/speech-to-text/api/v1/recognize"
  void postAudio(String audPath) async{
    var uname = 'apikey';
    var pword = '9YzI9fjutbQ19KFJNACKui_kpxg0tssG_trPGkzSqPCO';
    var authn = 'Basic ' + base64Encode(utf8.encode('$uname:$pword'));

    var headers = {
      'Content-Type': 'audio/flac',
      'Authorization': authn,
    };

    print("Reading audio file...");
    var data = new File(_audFilePath).readAsBytesSync();// Default encoding is utf-8

    print("Sending audio file...");
    var res = await http.post('https://stream.watsonplatform.net/speech-to-text/api/v1/recognize', headers: headers, body: data);
    if (res.statusCode != 200) throw Exception('post error: statusCode= ${res.statusCode}');

    print("Received transcript.");
    var parsedBody = json.decode(res.body);
    var transcript = parsedBody['results'][0]['alternatives'][0]['transcript'];
    print("Transcript is $transcript");
    var toSave = File('$_savePath/transcript.txt');
    await toSave.writeAsString(transcript);
    print('Transcript is saved at ${toSave.path}.');
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


/**
 * Sample block of res.body:
//     {
//    "results": [
//       {
//          "alternatives": [
//             {
//                "confidence": 0.73,
//                "transcript": "now you can give more than hope with a paper creek at us on the hot Knievel with every paper creed that you full our sponsors will make a donation of two dollars to single ball cancer society and we've just thank creams you can overdo a stimulus which provide transportation to the hospital for one penny story for chemotherapy treatment a little goes a long way come join us in the fight against cancer at a carnival they'll be games and performances lined up for you baby can raise funds for Albany fisheries come on down to book is passed on first and second June for more information visit our website at C. A. C. A. F. T. H. dot com "
//             }
//          ],
//          "final": true
//       }
//    ],
//    "result_index": 0
 */