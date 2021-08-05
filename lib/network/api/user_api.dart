import 'package:flutter/services.dart';
import 'package:traveloka_clone/models/entities/user_profile_model.dart';

class FakeUserApi implements UserApi {
  @override
  Future<UserProfileModel> getUserProfile() async {
    String data = await rootBundle.loadString('assets/json/user_profile.json');
    return userProfileFromJson(data);
  }
}

abstract class UserApi {
  Future<UserProfileModel> getUserProfile();
}
