import '../../../domain/entities/user_model.dart';

abstract class IBaseUserRepository {
  Stream<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}
