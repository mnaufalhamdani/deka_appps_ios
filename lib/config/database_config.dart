import 'dart:async';

import 'package:deka_appps_ios/config/migration_scripts.dart';
import 'package:deka_appps_ios/models/entities/master_reason/master_reason.dart';
import 'package:deka_appps_ios/models/entities/master_reason/master_reason_dao.dart';
import 'package:deka_appps_ios/models/entities/master_reason/master_reason_dao_impl.dart';
import 'package:deka_appps_ios/models/entities/master_reason_type/master_reason_type.dart';
import 'package:deka_appps_ios/models/entities/master_reason_type/master_reason_type_dao.dart';
import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android.dart';
import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android_dao.dart';
import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android_dao_impl.dart';
import 'package:deka_appps_ios/models/entities/profile/profile.dart';
import 'package:deka_appps_ios/models/entities/profile/profile_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/entities/master_reason_type/master_reason_type_dao_impl.dart';
import '../models/entities/profile/profile_dao_impl.dart';

part 'database_config_impl.dart';

@Database(version: 8, entities: [
  ProfileEntity,
  PengaturanAutocodeAndroidEntity,
  MasterReasonEntity,
  MasterReasonTypeEntity
])
abstract class DatabaseConfig extends FloorDatabase {
  ProfileDao get profileDao;
  PengaturanAutocodeAndroidDao get pengaturanAutocodeAndroidDao;
  MasterReasonDao get masterReasonDao;
  MasterReasonTypeDao get masterReasonTypeDao;
}