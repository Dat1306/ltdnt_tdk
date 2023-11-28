import 'package:calculator_project/controller/data.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final bool modeCheck;
  const InputWidget({
    Key? key,
    required this.modeCheck,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {
   bool isStateChanged = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
           Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16),
            child: Text(
              Data.userInput.isEmpty ? "0" : Data.userInput,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: widget.modeCheck ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16),
            child: Text(
              Data.userOutput,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: widget.modeCheck ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          ],
        ),
      ),
    );
  }
    void changeState() {
    // Thay đổi trạng thái của widget
    setState(() {
      isStateChanged = !isStateChanged;
    });
  }
}
