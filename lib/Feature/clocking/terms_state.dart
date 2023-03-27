part of 'package:sng/provider/terms_provider.dart';

abstract class TermsState {
  void termsSuccess(String msg);
  void termsProfileSuccess(String msg);
  void termsError(String error);
}
