import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:research_vbm/data/animal_type_data.dart';

class UserInfoBox extends StatefulWidget {
  final String title;
  final double size;
  final String inputType;

  UserInfoBox({
    required this.title,
    required this.size,
    required this.inputType,
  });

  @override
  _UserInfoBoxState createState() => _UserInfoBoxState();
}

class _UserInfoBoxState extends State<UserInfoBox> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _errorText;
  // bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: 38,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(153, 0, 153, 1),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              width: 1,
              color: Color.fromRGBO(153, 0, 153, 1)
            ),
          ),
          errorText: _errorText,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: _getInputFormatters(),
        // onEditingComplete: () {
        //   _validateAndSetError(_controller.text);
        // },
      ),
    );
  }

  List<TextInputFormatter> _getInputFormatters() {
    if (widget.title == 'age' || widget.title == 'education') {
      // 숫자만 입력 허용
      // _isValid = true;
      User(info: widget.title, data: _controller.text);
      return [FilteringTextInputFormatter.digitsOnly];
    // } else if (widget.title == 'gender' || widget.title == 'language') {
    //   _isValid = true;
    //   // male 또는 female만 입력 허용
    //   return [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))];
    } else {
      // _isValid = false;
      // 기본 설정 (다른 경우)
      return [];
    }
  }

  // void _validateAndSetError(String value) {
  //   setState(() {
  //     _errorText = _validateInput(value);
  //   });
  // }

  // String? _validateInput(String value) {
  //   if (widget.title == 'gender') {
  //     // gender일 경우 특정 단어만 허용
  //     if (value.toLowerCase() == 'female' || value.toLowerCase() == 'male') {
  //       return null; // 유효한 입력
  //     } else {
  //       return 'Invalid input. Please enter either "female" or "male".';
  //     }
  //   } else {
  //     // 다른 경우에는 유효성 검사를 수행하지 않음
  //     return null;
  //   }
  // }
}
