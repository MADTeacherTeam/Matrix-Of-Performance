import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../components/drawer/desktop_drawer.dart';


class DesktopScaffold extends StatelessWidget {
  DesktopScaffold({Key? key}) : super(key: key);

  static void setUpWindowsEnvironment() {
    // Windows window set up parameters
    doWhenWindowReady(() {
      final win = appWindow;
      const initialSize = Size(1350, 750);
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = "Matrix Of Performance";
      win.show();
    }
    );
  }
  final PageController pageController = PageController();
 // Navigation element
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainOuterColor,
      body: WindowBorder(
        color: MyColors.mainOuterColor,
        width: 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesktopDrawer(pageController: pageController, child: WindowTitleBarBox(child: MoveWindow())),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 31),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: pageList,
                    ),
                  ),
                  RightSide(
                    child: Container(),
                  ),
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}








class RightSide extends StatelessWidget { // right side of Windows window with movable area and buttons title bar row
  final Widget child;
  const RightSide({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      color: MyColors.mainOuterColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        WindowTitleBarBox(
          child: Row(
            children: [Expanded(child: MoveWindow()), const WindowButtons()],
          ),
        ),
        child
      ]),
    );
  }
}




class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  WindowButtonsState createState() => WindowButtonsState();
}

class WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
          colors: buttonColors,
          onPressed: maximizeOrRestore,
        )
            : MaximizeWindowButton(
          colors: buttonColors,
          onPressed: maximizeOrRestore,
        ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}


