import 'package:firebase_auth/firebase_auth.dart' as f;

import 'package:highlights/domain/core/value_objects.dart';
import 'package:highlights/domain/authentication/user.dart';

/// Extension class for User from FirebaseAuth.
///
/// Its only responsibility is extend User to provide a [toDomainUser]
/// method to allow _converting_ from Firebase User to app domain User.
extension FirebaseUserUserDomainX on f.User {
  User toDomainUser() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
