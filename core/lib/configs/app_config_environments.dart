part of '../core.dart';

class EnvironmentConfig {
  static void setEnvironment(String value) {
    AppSPCore.set(AppSPCore.environment, value);
  }

  static String? getEnvironment() {
    return AppSPCore.get(AppSPCore.environment);
  }
}

class Environments {
  static const String production = 'production';
  static const String qa = 'qa';
  static const String dev = 'dev';
  static final String _currentEnvironments =
      EnvironmentConfig.getEnvironment() ?? qa;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.dev,
      'url': 'https://dev.trungsoncare.com/',
    },
    {
      'env': Environments.qa,
      'url': 'https://trungsoncare.com/',
    },
    {
      'env': Environments.production,
      'url': 'https://trungsoncare.com/',
    },
  ];

  static String getUrl() {
    return _availableEnvironments.firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )['url'] ??
        '';
  }

  static String getEnvironment() {
    return _availableEnvironments.firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )['env'] ??
        Environments.dev;
  }
}
