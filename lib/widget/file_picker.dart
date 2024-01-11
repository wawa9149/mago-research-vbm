import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DropZoneContainer extends StatelessWidget {
  final Uint8List audioFile;
  final String audioFileName;
  final Function(Uint8List, String) onFileSelected;

  const DropZoneContainer({
    Key? key,
    required this.audioFile,
    required this.audioFileName,
    required this.onFileSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // drag and drop zone
          InkWell(
              child: Container(
                width: 600,
                height: 150,
                child: ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['aac', 'mp3', 'wav', 'flac', 'm4a'],
                    );
                    if (result != null && result.files.isNotEmpty) {
                      onFileSelected(
                          result.files.first.bytes!, result.files.first.name);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(101,59,191,1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.black,
                  ),
                      child: const Text(
                          "Drop Your File\nor Click to Record",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NEXONLv1GothicBold',
                            fontSize: 25,
                          ),
                        ),
                      ),
                  ),
                ),
          // Text(
          //   context
          //       .findAncestorStateOfType<ExampleDragTargetState>()!
          //       .showFileName,
          //   style: const TextStyle(
          //     color: Colors.black,
          //   ),
          // ),
        ],
      );
  }
}
