part of 'extensions.dart';

extension FirebaseUserExtensions on FirebaseUser {
  User convertToUser(
          {String name = 'No Name', String phoneNumber = '+62xxxx'}) =>
      User(this.uid, this.email, name: name, phoneNumber: phoneNumber);

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
