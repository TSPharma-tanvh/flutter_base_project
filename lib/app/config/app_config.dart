import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:isolate';
import 'package:flutter/services.dart';

class AppConfigs {
  static const environment = Environments.qa;

  static void configEnvironment() {
    EnvironmentConfig.setEnvironment(environment);
  }

  static Future<bool> checkPermissions() async {
    PermissionStatus locationPermissionStatus =
        await Permission.location.status;

    if (locationPermissionStatus.isGranted) {
      return true;
    } else {
      await requestPermissions();
      return false;
    }
  }

  static Future<void> requestPermissions() async {
    await Permission.location.request();
    await checkPermissions();
  }
}
