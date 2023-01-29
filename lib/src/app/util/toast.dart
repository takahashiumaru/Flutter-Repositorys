import 'package:animated_check/animated_check.dart';
import 'package:animated_cross/animated_cross.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  Toast(BuildContext context) : _toast = FToast().init(context);
  final FToast _toast;

  void success(String message) {
    _toast
      ..removeCustomToast()
      ..showToast(
        child: ToastSuccess(message: message),
        fadeDuration: const Duration(milliseconds: 200),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 5),
      );
  }

  void fail(String message) {
    _toast
      ..removeCustomToast()
      ..showToast(
        child: ToastFail(message: message),
        fadeDuration: const Duration(milliseconds: 200),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 5),
      );
  }
}

class ToastSuccess extends StatefulWidget {
  const ToastSuccess({
    super.key,
    required this.message,
  });
  final String message;

  @override
  State<ToastSuccess> createState() => _ToastSuccessState();
}

class _ToastSuccessState extends State<ToastSuccess> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.greenAccent[200],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedCheck(
            progress: _animation,
            color: Colors.black,
            size: 40,
          ),
          const SizedBox(width: 6),
          Text(widget.message),
        ],
      ),
    );
  }
}

class ToastFail extends StatefulWidget {
  const ToastFail({
    super.key,
    required this.message,
  });
  final String message;

  @override
  State<ToastFail> createState() => _ToastFailState();
}

class _ToastFailState extends State<ToastFail> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.redAccent[100],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedCross(
            progress: _animation,
            color: Colors.black,
            size: 40,
          ),
          const SizedBox(width: 6),
          Text(widget.message),
        ],
      ),
    );
  }
}
