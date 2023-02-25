import 'package:flutter/material.dart';

import '../Util/asset_image_paths.dart';
// import 'package:todlr/utils/asset_image_paths.dart';

enum LoaderType { transparent, todlrOfficial }

class LoaderAnimatedSwitcher extends StatefulWidget {
  final LoaderType? variationBLoader;
  const LoaderAnimatedSwitcher(
      {Key? key, this.variationBLoader = LoaderType.todlrOfficial})
      : super(key: key);

  @override
  _LoaderAnimatedSwitcherState createState() => _LoaderAnimatedSwitcherState();
}

class _LoaderAnimatedSwitcherState extends State<LoaderAnimatedSwitcher>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: ScaleTransition(
            scale: Tween(begin: 0.75, end: 2.0).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInCirc)),
            child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                    widget.variationBLoader == LoaderType.todlrOfficial
                        ? AssetImagePaths.progressBarII
                        : AssetImagePaths.progressBar)),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.repeat(reverse: true);
  }
}
