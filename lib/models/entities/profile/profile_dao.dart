import 'package:deka_appps_ios/models/entities/profile/profile.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProfileDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEntity(ProfileEntity model);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateEntity(ProfileEntity model);

  @delete
  Future<void> deleteEntity(ProfileEntity model);

  @Query('DELETE FROM profile')
  Future<void> deleteAll();

  @Query('SELECT * FROM profile')
  Future<List<ProfileEntity>> getProfile();
}