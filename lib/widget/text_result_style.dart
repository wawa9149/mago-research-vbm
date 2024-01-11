import 'dart:developer';

import 'package:flutter/material.dart';

Container TextResultBox(String? result) {
  return Container(
    height: 250,
    width: 800,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white, // 배경색
      borderRadius: BorderRadius.circular(20), // 테두리의 모서리를 둥글게 만듦
      boxShadow: const [
        BoxShadow(
          color: Colors.grey, // 그림자의 색상
          offset: Offset(0, 5), // 그림자의 위치 (가로, 세로)
          blurRadius: 10, // 그림자의 흐림 정도
          spreadRadius: 2, // 그림자의 확산 정도
        ),
      ],
    ),
    child: SingleChildScrollView(
      // 스크롤 가능
      child: Center(
        child: Text(resultCheck(result), style: const TextStyle(fontSize: 18,)), // 결과 출력
      ),
    ),
  );
}

// If the result value is null, 'N/A' is output.
String resultCheck(String? result){
  if(result == null){
    return 'N/A';
  }
  else{
    log('result: $result');
    return result;
  }
}