import 'package:calculator_project/widgets/btn_dark_light_mode.dart';
import 'package:calculator_project/widgets/btn_values.dart';
import 'package:calculator_project/widgets/btn_widget.dart';
import 'package:calculator_project/widgets/input_wiget.dart';
import 'package:calculator_project/widgets/theme_color.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool darkMode = false;
  bool isTapped = false;
  GlobalKey<InputWidgetState> inputWidgetKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:
            darkMode ? DarkColors.scaffoldBgColor : LightColors.scaffoldBgColor,
        body: SafeArea(
          child: Column(
            children: [
              //darklight mode

              SizedBox(
                width: screenSize.width,
                height: screenSize.width / 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ThemeButton((isSwitched) {
                      setState(() {
                        darkMode = isSwitched ? true : false;
                      });
                    })
                  ],
                ),
              ),

              //out put
              InputWidget(key: inputWidgetKey,
                modeCheck: darkMode,
              ),

              // button
              Wrap(
                runSpacing: 16.0,
                children: Btn.buttonValues
                    .map((value) => SizedBox(
                        width: screenSize.width / 4,
                        height: screenSize.width / 5,
                        child: ButtonWidget(
                          value: value,
                          modeCheck: darkMode,
                          inputWidgetKey: inputWidgetKey,
                        )))
                    .toList(),
              ),
              SizedBox(
                width: screenSize.width,
                height: screenSize.width / 30,
              )
            ],
          ),
        ));
  }
}
