import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay {

  LoadingOverlay.of(BuildContext context) {
    _overlayState = Navigator.of(context).overlay;
  }
  OverlayState? _overlayState;
  late OverlayEntry _overlayEntry;

  void show() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return ColoredBox(
          color: Colors.black.withOpacity(.5),
          child: const Center(
            child: SpinKitThreeBounce(
              color: Colors.white,
            ),
          ),
        );
      },
    );
    _overlayState?.insert(_overlayEntry);
  }

  void hide() {
    _overlayEntry.remove();
  }
}
