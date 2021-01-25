import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

/// Wrapper class for OAuth credentials for Google sign in
///
/// The original purpose of this class was to make it possible
/// to write unit testing that includes static method calls. Concretely,
/// `GoogleAuthProvider.credential()` couldn't be mocked, so test couldn't
/// be passed
@lazySingleton
class AuthProviderManager {
  const AuthProviderManager();

  OAuthCredential getGoogleOAuthCredential(
    GoogleSignInAuthentication authentication,
  ) {
    return GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
  }
}
