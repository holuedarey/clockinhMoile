class EnvironmentConfiguration {
  static const IS_PRODUCTION =
  bool.fromEnvironment('dart.vm.product', defaultValue: false);
}
