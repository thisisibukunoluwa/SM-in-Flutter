import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user.g.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class User {
//   final String name;
//   final int age;

//   const User({required this.name, required this.age});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'] as String,
//       age: json['age'] as int,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       name: map['name'] as String,
//       age: map['age'] as int,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'age': age,
//     };
//   }

//   User copyWith({String? name, int? age}) {
//     return User(
//       name: name ?? this.name,
//       age: age ?? this.age,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is User && other.name == name && other.age == age;
//   }

//   @override
//   int get hashCode => name.hashCode ^ age.hashCode;

//   @override
//   String toString() {
//     return 'User{name: $name, age: $age}';
//   }
// }

class User {
  final String name;
  final String email;

  const User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  User copyWith({String? name, String? email}) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User{name: $name, email: $email}';
  }
}

// the difference betweeen this and StateProvider, is that we can create multiple fns and they will reside in one single class
// also, easier to test and more robust

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref);
}

// final userRepositoryProvider = Provider.autoDispose((ref) => UserRepository(ref));

class UserRepository {
  final Ref ref;
  UserRepository(this.ref);
  Future<User> fetchUserData(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    return http
        .get(Uri.parse(url))
        .then((value) => User.fromJson(jsonDecode(value.body)));
  }
}
