import 'dart:developer';

import 'package:research_vbm/page/file_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_vbm/widget/diagnostics_item_button.dart';
import 'package:research_vbm/widget/drop_down_button.dart';
import 'package:research_vbm/widget/user_info_box.dart';

void main() async {
  log('시작');
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: MyPage(),
      ),
    );
  }
}

List<String> list = ['Korean', 'English'];

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String? dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    // const primaryColor = Color.fromRGBO(153, 0, 153, 1);
    const h3 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    const userInfoTextStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(153, 0, 153, 1),
    );

    return Scaffold(
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
      //     child: Image.asset(
      //       'assets/images/mago-word-dark.png',
      //     ),
      //   ),
      //   leadingWidth: 130,
      //   backgroundColor: Colors.white,
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background_3.jpg'), // 배경 이미지
          ),
        ),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // main page
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text("Dementia-Depression",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 30),
                      // subtitle
                      Text('Vocal Detector',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 200),
                      // get started button
                      SizedBox(
                        width: 650,
                        child: Text(
                          'Distinguishing dementia and depression, two prevalent age-related disorders, remains challenging due to shared symptoms. We pioneer a voice-based approach, using machine learning and deep learning on short recordings, to achieve rapid and accurate diagnosis. This pilot study highlights the potential of vocal biomarkers for early detection and improved management of these debilitating conditions. Our future aim is to expand this framework, predicting and monitoring a wider range of age-related diseases for personalized healthcare and a healthier aging population.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Prediction of\nDementia/Depression',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Language',
                        style: h3,
                      ),
                      MyDropdownButton(
                        items: ['English', 'Korean'],
                        value: 'English',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Personal Information',
                        style: h3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Age',
                            style: userInfoTextStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          UserInfoBox(
                            title: 'age',
                            size: 100,
                            inputType: 'num',
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            'Gender',
                            style: userInfoTextStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyDropdownButton(
                            items: ['male', 'female'],
                            value: 'male',
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Text(
                            'Years of education',
                            style: userInfoTextStyle,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          UserInfoBox(
                            title: 'education',
                            size: 100,
                            inputType: 'num',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Diagnostic Item',
                        style: h3,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemButton(buttonText: 'Dementia', buttonValue: 1),
                          SizedBox(
                            width: 40,
                          ),
                          ItemButton(buttonText: 'Depression', buttonValue: 2),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(child: ExampleDragTarget()),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1.5,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'By using this service, you agree to the terms of service and privacy policy.\nResearch partners can use the service in bulk and free without time constraints.\nContact: powerzines@snu.ac.kr',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
