import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fundamentals/home_page.dart';
import 'package:riverpod_fundamentals/user.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// final nameProvider = Provider<String>((ref){
//     return 'Ibukunoluwa';
// });

// final nameProvider = StateProvider<String?>((ref) => '');

// it justs wants a class that is inheriting from statenotifier 
// first tye is the class we are returning , second is the state of that class 
final userProvider = StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier(
 
));

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
