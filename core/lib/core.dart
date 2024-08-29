library core;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:core/locales/generated/l10n.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'configs/app_config_environments.dart';
part 'cubit/core_state.dart';
part 'di.dart';
part 'remote/app_base_repo.dart';
part 'storage/app_secure_storage.dart';
part 'storage/app_shared_preferences.dart';
part 'theme/app_text_style.dart';
part 'theme/app_theme.dart';
part 'utils/datetime/datetime_utils.dart';
part 'utils/device/device_utils.dart';
part 'utils/device/file_utils.dart';
part 'utils/app/log.dart';
part 'utils/app/result_utils.dart';
part 'utils/validation/validate_utils.dart';
part 'utils/string/string_utils.dart';
part 'widgets/base/widget_utils.dart';
part 'widgets/base/core_widget.dart';
part 'widgets/snack_bar/snack_bar.dart';
part 'widgets/border/border.dart';
part 'widgets/base/brand_loading.dart';

part 'utils/device/edge_insets_utils.dart';
part 'utils/device/responsive_utils.dart';
part 'theme/app_colors.dart';
part 'widgets/assets/base_image.dart';
part 'widgets/assets/base_svg.dart';
