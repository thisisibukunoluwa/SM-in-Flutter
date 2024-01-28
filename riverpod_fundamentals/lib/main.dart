import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fundamentals/home_page.dart';
import 'package:riverpod_fundamentals/logger_riverpod.dart';
import 'package:riverpod_fundamentals/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';


// beacause we are using riverpodgen , we can tak ein multiple params , unlike , with .family 
@riverpod
Future<User> fetchUser(FetchUserRef ref, {required String input, required int someValue, required bool secondValue}) {
  final userRepository = ref.read(userRepositoryProvider);
  return userRepository.fetchUserData(input);
}

// final fetchUserProvider =
//     FutureProvider.family.autoDispose((ref, String input) {
//   // ref.keepAlive(); // - you want to preserve the state of the FutureProvider
//   // ref.onDispose(() {}); // - when the ref is disposed what do you want to do ?
//   final userRepository = ref.read(userRepositoryProvider);
//   return userRepository.fetchUserData(input);
// });

final streamProvider = StreamProvider.autoDispose((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

void main() {
  runApp(ProviderScope(
    observers: [LoggerRiverpod()],
    overrides: [
      //helps with testing
      // streamProvider.overrideWith((ref) => null)
    ],
    child: MyApp(),
  ));
}

//Providers
//Provider
//StateProvider
//StateNotifier aand StateNotifierProvider
//ChangeNotifierProvider
//FutureProvider
//StreamProvider

//WidgetRef helps us to talk from a provider to a widget from a provider

//ProviderRef allows us to talk from a provider to another provider

//Ref - superclass to ProviderRef

// final nameProvider = Provider<String>((ref){
//     return 'Ibukunoluwa';
// });

// final nameProvider = StateProvider<String?>((ref) => '');

// it justs wants a class that is inheriting from statenotifier
// first tye is the class we are returning , second is the state of that class
//

// final userProvider = StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier(
// ));

// final userChangeNotifierProvider = ChangeNotifierProvider((ref) => UserNotifierChange());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Riverpod tutorial',
      home: MyHomePage(),
    );
  }
}
