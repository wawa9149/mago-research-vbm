import 'dart:typed_data';

import 'package:flutter/material.dart';

class ApiResultPage extends StatelessWidget {
  ApiResultPage({required this.result, required this.audioSource, Key? key})
      : super(key: key);

  List<String?> result = [];
  Uint8List audioSource = Uint8List(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/images/ABM_Study_Background_2.png'), // 배경 이미지
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                      width: 650,
                      height: 250,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        // 배경색 (흰색) 및 투명도
                        borderRadius:
                            BorderRadius.circular(10), // 테두리의 모서리를 둥글게 만듦
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jobs',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('결과 사본은 검사 7일 후에 삭제됩니다.'),
                            DataTable(
                              columns: [
                                DataColumn(label: Text('File')),
                                DataColumn(label: Text('Status')),
                                DataColumn(label: Text('Created at')),
                                DataColumn(label: Text('Accuracy')),
                                DataColumn(label: Text('Language')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('A1')),
                                  DataCell(Text('B1')),
                                  DataCell(Text('A1')),
                                  DataCell(Text('B1')),
                                  DataCell(Text('A1')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('A1')),
                                  DataCell(Text('B1')),
                                  DataCell(Text('A1')),
                                  DataCell(Text('B1')),
                                  DataCell(Text('A1')),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 800,
                  height: 250,
                  margin: const EdgeInsets.fromLTRB(0, 30, 30, 0),
                  decoration: BoxDecoration(
                    // 배경색 (흰색) 및 투명도
                    borderRadius: BorderRadius.circular(10), // 테두리의 모서리를 둥글게 만듦
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Dementia-Depression',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Vocal Detector',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                // 배경색 (흰색) 및 투명도
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Results',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STT(Speech to Text)',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 700,
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(230, 230, 230, 0.65),
                              // 배경색 (흰색) 및 투명도
                              borderRadius:
                                  BorderRadius.circular(10), // 테두리의 모서리를 둥글게 만듦
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Text(
                                result[0]!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
