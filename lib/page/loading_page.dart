import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.fitWidth,
        //     alignment: Alignment.bottomCenter,
        //     image: AssetImage('assets/images/background_file.png'), // 배경 이미지
        //   ),
        // ),
        child: Center(
          child: SpinKitFadingCircle(
            color: Color.fromRGBO(153, 0, 153, 1), // 로딩 색상 설정
            size: 100.0, // 로딩 크기 설정
          ),
        ),
      ),
    );
  }
}
