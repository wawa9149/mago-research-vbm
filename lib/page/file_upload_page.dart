import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../api/api_request.dart';
import '../widget/file_drag_n_drop.dart';
import 'result_page.dart';
import 'loading_page.dart';

class ExampleDragTarget extends StatefulWidget {
  const ExampleDragTarget({Key? key}) : super(key: key);

  @override
  ExampleDragTargetState createState() => ExampleDragTargetState();
}

class ExampleDragTargetState extends State<ExampleDragTarget> {
  late Uint8List audioFile = Uint8List(0);
  late String audioFileName = '';
  bool dragging = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          DropZoneWidget(
            audioFile: audioFile,
            audioFileName: audioFileName,
            onFileSelected: (Uint8List fileBytes, String fileName) {
              setState(() {
                // showFileName = "Now File Name: $fileName";
                audioFile = fileBytes;
                audioFileName = fileName;
              });
            },
          ),
          SizedBox(height: 20),
          RequestButtonWidget(
            audioFile: audioFile,
            audioFileName: audioFileName,
          ),
        ],
      );
  }
}

class RequestButtonWidget extends StatelessWidget {
  final Uint8List audioFile;
  final String audioFileName;

  const RequestButtonWidget({
    Key? key,
    required this.audioFile,
    required this.audioFileName,
  }) : super(key: key);

  // Button to request API
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: audioFile.isNotEmpty
            ? () async {
                try {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FutureBuilder<List<String?>>(
                        future: GetApiResult(audioFile, audioFileName)
                            .getApiResult()
                            .timeout(const Duration(seconds: 30)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // 로딩 중일 때 표시할 위젯 (로딩창)
                            return Center(child: LoadingPage());
                          // } else if (snapshot.hasError) {
                          //   // 에러 발생 시 표시할 위젯
                          //   return Center(
                          //       child: Text('에러 발생: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            return ApiResultPage(
                              result: snapshot.data!,
                              audioSource: audioFile,
                              // gender: gender,
                            );
                          } else {
                            return AlertDialog(
                              title: Text('error'),
                              content: const Text(
                                  'Try again'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  );
                } catch (e) {
                  // print('에러 발생: $e');
                  // Fluttertoast.showToast(
                  //   msg: '작업이 타임아웃되었습니다.',
                  //   toastLength: Toast.LENGTH_LONG,
                  //   gravity: ToastGravity.BOTTOM,
                  //   timeInSecForIosWeb: 3,
                  //   backgroundColor: Colors.red,
                  //   textColor: Colors.white,
                  // );
                }
              }
            : null, // audioFile이 비어 있으면 onPressed를 null로 설정하여 버튼 비활성화
        style: ElevatedButton.styleFrom(
          backgroundColor: audioFile.isNotEmpty ? Colors.white : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Result',
          style: TextStyle(
            fontSize: 20,
            color: audioFile.isNotEmpty
                ? Color.fromRGBO(153, 0, 153, 1)
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
