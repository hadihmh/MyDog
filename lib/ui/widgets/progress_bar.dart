import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    return SpinKitSquareCircle(
      color: Colors.black,
      size: 90.0,
      controller: animationController,
    );
  }

  @override
  void dispose() {
    
    animationController.dispose();
    super.dispose();
  }
}
