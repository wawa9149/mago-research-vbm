import 'dart:convert';
import 'dart:developer';

class ApiResultParser {
  static String? getResultFromJson(
      String api, String jsonResponse, String status) {
    try {
      Map<String, dynamic> jsonObject = json.decode(jsonResponse);

      if (status == 'upload') {
        return _getResult(_getUploadResult, jsonObject);
      }

      if (status == 'result') {
        if (api == 's2t') {
          return _getResult(_getS2tResult, jsonObject);
        } else if (api == 'mh') {
          return _getResult(_getMhResult, jsonObject);
        }
      }
    } catch (e) {
      log('Error parsing result: $e');
    }

    return 'Failed to get result';
  }

  static String? _getResult(
      String? Function(Map<String, dynamic>) getResultFunction,
      Map<String, dynamic> jsonObject) {
    try {
      return getResultFunction(jsonObject['contents']);
    } catch (e) {
      log('Error getting result: $e');
      return null;
    }
  }

  static String? _getUploadResult(Map<String, dynamic> contentsObject) {
    return contentsObject['id'];
  }

  static String? _getS2tResult(Map<String, dynamic> contentsObject) {
    if (contentsObject.containsKey('results')) {
      Map<String, dynamic> results = contentsObject['results'];
      return json.encode(results['text']);
    }
    return null;
  }

  static String? _getMhResult(Map<String, dynamic> contentsObject) {
    if (contentsObject.containsKey('results')) {
      Map<String, dynamic> results = contentsObject['results'];
      // if (results.containsKey('depression') &&
      //     results['depression'] is Map<String, dynamic>) {
      //   return json.encode(results['depression']);
      // }
      return json.encode(results);
    } else if (contentsObject.containsKey('detail')) {
      return 'detail';
    }
    return null;
  }
}
