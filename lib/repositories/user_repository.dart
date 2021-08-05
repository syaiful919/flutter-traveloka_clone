import 'package:traveloka_clone/models/entities/user_profile_model.dart';
import 'package:traveloka_clone/network/api/user_api.dart';

class UserRepository {
  final UserApi _api = FakeUserApi();

  Future<UserProfileModel> getUserProfile() => _api.getUserProfile();
}
