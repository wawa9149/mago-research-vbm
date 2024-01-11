import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> items;
  late String value;

  MyDropdownButton({
    required this.items,
    required this.value,
  });

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            widget.value = value;
          });
        }
      },
      icon: const Icon(Icons.arrow_drop_down, color: Color.fromRGBO(153, 0, 153, 1),),
      underline: Container(
        height: 1,
        color: Color.fromRGBO(153, 0, 153, 1),
      )
    );
  }
}
