import 'package:flutter/material.dart';

class ItemButton extends StatefulWidget {
  final String buttonText;
  final int buttonValue;

  const ItemButton({super.key, required this.buttonText, required this.buttonValue});

  @override
  State<ItemButton> createState() => _ItemButtonState();
}

class _ItemButtonState extends State<ItemButton> {
  bool isPressed = false;
  int selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 120,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            // 두 버튼 중 하나만 선택되도록 처리
            if (selectedButton == widget.buttonValue) {
              selectedButton = 0; // 이미 선택된 버튼을 다시 누르면 선택 해제
            } else {
              selectedButton = widget.buttonValue;
            }
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedButton == widget.buttonValue ? const Color.fromRGBO(153, 0, 153, 0.2) : const Color.fromRGBO(230, 230, 230, 0.65),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(widget.buttonText, style: TextStyle(fontSize: 20, color: const Color.fromRGBO(153, 0, 153, 1),)),
      ),
    );
  }
}
