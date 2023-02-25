import 'package:flutter/material.dart';

import '../Util/asset_image_paths.dart';
import '../Util/constant.dart';
import '../component/ph_button.dart';

class ErrorSwitcher extends StatelessWidget {
  final VoidCallback onRetry;
  final String? errorMessage;

  const ErrorSwitcher({required this.onRetry, Key? key, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return _ErrorWidget(
      onRetry: onRetry,
      errorMessage: errorMessage,
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key, required this.onRetry, this.errorMessage})
      : super(key: key);

  final VoidCallback onRetry;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetImagePaths.spilledCream),
          Text(
            "Oops!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: Text(
              errorMessage ??
                  "Something wrong happened, kindly hit the retry button",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: const Color(0xff6f7aa0), fontWeight: FontWeight.w600),
            ),
          ),
          // const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kExtraMediumPadding, horizontal: kRegularPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PhButton(
                  buttonCallBack: onRetry,
                    buttonName: "Try again",
                ),
                Visibility(
                  visible: !(ModalRoute.of(context)?.isCurrent ?? false),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Not now",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
