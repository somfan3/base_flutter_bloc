import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/common/global_loading/src/loading_controller.dart';

class GlobalLoadingOverlay extends StatefulWidget {
  final Widget child;

  const GlobalLoadingOverlay({
    super.key,
    required this.child,
  });

  @override
  State<GlobalLoadingOverlay> createState() => _GlobalLoadingOverlayState();
}

class _GlobalLoadingOverlayState extends State<GlobalLoadingOverlay> {
  final _loadingController = LoadingController();

  bool isShow = false;

  _show() {
    setState(() {
      isShow = true;
    });
  }

  _hide() {
    setState(() {
      isShow = false;
    });
  }

  @override
  void initState() {
    _loadingController.initialize(showCallback: _show, hideCallback: _hide);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isShow,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            widget.child,
            if (isShow) ...{
              ModalBarrier(
                  dismissible: false, color: Colors.black.withOpacity(0.7)),
            },
            if (isShow) ...{
              const Center(child: CircularProgressIndicator()),
            }
          ],
        ),
      ),
    );
  }
}
