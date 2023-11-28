import 'package:calculator_project/controller/calculate_controller.dart';
import 'package:calculator_project/widgets/btn_values.dart';
import 'package:calculator_project/widgets/input_wiget.dart';
import 'package:calculator_project/widgets/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatefulWidget {
  final String value;
  final bool modeCheck;
  final GlobalKey<InputWidgetState> inputWidgetKey;
  // Thêm tham số controller vào constructor
  const ButtonWidget({
    Key? key,
    required this.value,
    required this.modeCheck,
    required this.inputWidgetKey,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isPressed = false;

  var controller = Get.find<CalculateController>();
  @override
  Widget build(BuildContext context) {
    const deletebutton = Colors.red;
    const clearbutton = Color.fromARGB(255, 101, 244, 54);
    const expressionbutton = Color.fromARGB(255, 244, 165, 54);
    Color darkBtnBgColor = isPressed
        ? Colors.lightBlueAccent
        : const Color.fromARGB(255, 47, 57, 70);
    Color lightBtnBgColor = isPressed
        ? Colors.lightBlueAccent
        : const Color.fromARGB(255, 255, 255, 255);

    return Listener(
      onPointerUp: (_) => setState(() {
        [Btn.del].contains(widget.value)
            ? controller.deleteBtnAction()
            : [Btn.clr].contains(widget.value)
                ? controller.clearInputAndOutput()
                : [Btn.calculate].contains(widget.value)
                    ? controller.equalPressed()
                    : controller.onBtnTapped(widget.value);
        isPressed = false;
        widget.inputWidgetKey.currentState?.changeState();
      }),
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.fromLTRB(2, 3, 2, 3),
        decoration: BoxDecoration(
          color: widget.modeCheck ? darkBtnBgColor : lightBtnBgColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color:
                  widget.modeCheck ? Colors.black54 : Colors.blueGrey.shade200,
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(4, 4), //changes position of shadow
            ),
            BoxShadow(
              color: widget.modeCheck ? Colors.blueGrey.shade700 : Colors.white,
              spreadRadius: 0.5,
              blurRadius: 15,
              offset: const Offset(-4, -4), //changes position of shadow
            ),
          ],
        ),
        // child: InkWell(
        child: Center(
          child: Text(
            widget.value,
            style: TextStyle(
              color: [Btn.del].contains(widget.value)
                  ? deletebutton
                  : [Btn.clr].contains(widget.value)
                      ? clearbutton
                      : [
                          Btn.open,
                          Btn.close,
                          Btn.multiply,
                          Btn.add,
                          Btn.subtract,
                          Btn.divide,
                          Btn.calculate,
                        ].contains(widget.value)
                          ? expressionbutton
                          : widget.modeCheck
                              ? DarkColors.btnTextColor
                              : LightColors.btnTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
