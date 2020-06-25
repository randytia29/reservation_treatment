part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phoneNumber;

  User(this.id, this.email, {this.name, this.phoneNumber});

  @override
  List<Object> get props => [id, email, name, phoneNumber];
}
