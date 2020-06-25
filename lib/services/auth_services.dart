part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignUpSignInResult> signUp(
      String email, String password, String name, String phoneNumber) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user =
          result.user.convertToUser(name: name, phoneNumber: phoneNumber);
      await UserServices.updateUser(user);
      return SignUpSignInResult(user: user);
    } catch (e) {
      return SignUpSignInResult(message: e.toString());
    }
  }

  static Future<SignUpSignInResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = await result.user.fromFireStore();
      return SignUpSignInResult(user: user);
    } catch (e) {
      return SignUpSignInResult(message: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignUpSignInResult {
  final User user;
  final String message;

  SignUpSignInResult({this.user, this.message});
}
