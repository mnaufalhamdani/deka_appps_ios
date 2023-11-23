import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android.dart';
import 'package:floor/floor.dart';

@dao
abstract class PengaturanAutocodeAndroidDao {
  @Insert()
  Future<void> insertPengaturanAutocodeAndroid(PengaturanAutocodeAndroidEntity model);

  @delete
  Future<void> deletePengaturanAutocodeAndroid(PengaturanAutocodeAndroidEntity model);

  @Query('DELETE FROM pengaturan_autocode_android')
  Future<void> deleteAll();

  @Query('SELECT * FROM pengaturan_autocode_android')
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroid();

  @Query('SELECT * FROM pengaturan_autocode_android WHERE code = :code')
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroidOne(String code);

  @Query('SELECT * FROM pengaturan_autocode_android WHERE code LIKE :code')
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroidByCode(String code);
}