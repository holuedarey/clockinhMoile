import 'package:flutter/material.dart';

import '../../Util/constant.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Padding(
            padding:  EdgeInsets.fromLTRB(kRegularPadding, kMediumPadding, kSmallPadding,kSmallPadding ),
            child: Image.asset(
              width: 50,
              height: 50,
              "assets/logo_dark.png",
            ),
          ),
      );
  }
  
}