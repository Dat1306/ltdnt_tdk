import 'package:calculator_project/widgets/theme_color.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  // bool
  final Function(bool) didTapButton;
  // 2
  const ThemeButton(this.didTapButton, {Key? key}) : super(key: key);
  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
              BoxShadow(
                color: isSwitched ? Colors.black54 : Colors.blueGrey.shade200,
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(4, 4),
                 // changes position of shadow
              ),
              BoxShadow(
                color: isSwitched ?  Colors.blueGrey.shade700 : Colors.white ,
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(-4, -4), // changes position of shadow
              ),
            ],
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: isSwitched
                ? DarkColors.scaffoldBgColor
                : const Color.fromARGB(255, 255, 255, 255)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              top: 3.0,
              left: isSwitched ? 60.0 : 0.0,
              right: isSwitched ? 0.0 : 60.0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isSwitched = !isSwitched;
                    widget.didTapButton(isSwitched);
                  });
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: isSwitched
                      ? Icon(
                          Icons.sunny,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          size: 35,
                          key: UniqueKey(),
                        )
                      : Icon(
                          Icons.dark_mode_rounded,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 35,
                          key: UniqueKey(),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
