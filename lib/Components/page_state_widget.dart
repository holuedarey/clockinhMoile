import 'package:flutter/material.dart';
import 'animated_switcher.dart';
import 'error_switcher.dart';
import 'no_data.dart';

enum PageState { loading, loaded, noData, error }

class PHPageStateWidget extends StatelessWidget {
  final PageState pageState;
  final WidgetBuilder builder;
  final WidgetBuilder? noDataBuilder;
  final VoidCallback onRetry;
  final String noDataMessage;
  final LoaderType? variationBLoader;
  final String? errorMessage;

  const PHPageStateWidget(
      {required this.pageState,
        required this.builder,
        this.noDataBuilder,
        required this.onRetry,
        required this.noDataMessage,
        this.variationBLoader,
        this.errorMessage,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget pageBody = const SizedBox.shrink();
    switch (pageState) {
      case PageState.loading:
        pageBody = LoaderAnimatedSwitcher(
          variationBLoader: variationBLoader,
        );
        break;
      case PageState.loaded:
        pageBody = Builder(builder: builder);
        // pageBody = ShowUp(delay: 20, child: Builder(builder: builder));
        break;
      case PageState.error:
        pageBody = ErrorSwitcher(
          onRetry: onRetry,
          errorMessage: errorMessage,
        );
        break;
      case PageState.noData:
        if (noDataBuilder != null) {
          pageBody = Builder(builder: noDataBuilder!);
        } else {
          pageBody = PHNoData(noDataMessage);
        }

        break;
    }

    return pageBody;
  }
}
