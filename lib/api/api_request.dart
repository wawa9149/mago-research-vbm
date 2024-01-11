import 'dart:typed_data';

import 'mago_mh.dart';
import 'mago_s2t.dart';

// 나중에 magostar 대신에 다른 주소값 대체 해야 함, 변수 설정하거나 파일로 따로 빼기
class GetApiResult {
  var magoS2t = MagoS2T('http://saturn.mago52.com:9003/speech2text', 'eadc5d8d-ahno-9559-yesa-8c053e0f1f69'); // API 객체
  var magoMH = MagoMH('http://saturn.mago52.com:9110/mental_health', 'eadc5d8d-ahno-9559-yesa-8c053e0f1f69'); // API 객체

  Uint8List audioData = Uint8List(0);
  String audioFileName = '';

  GetApiResult(this.audioData, this.audioFileName);

  // API 요청
  Future<List<String?>> getApiResult() async {
    print('요청: getApiResult');
    List<Future<String?>> futures = [
      magoS2t.uploadAndProcessAudio(audioData, audioFileName),
      magoMH.uploadAndProcessAudio(audioData, audioFileName),
    ];

    List<String?> results = await Future.wait(futures);
    print(results);

    if (results.every((result) => result != null)) {
      return results;
    } else {
      // 결과 중 하나라도 null이면 예외 처리
      print('요청: error');
      throw Exception('API 요청 중 에러가 발생했습니다.');
    }
  }
}
