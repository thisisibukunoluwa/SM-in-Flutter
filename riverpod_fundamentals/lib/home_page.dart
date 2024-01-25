import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fundamentals/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  // void onSubmit(WidgetRef ref, String value) {
  //  final name = ref.read(nameProvider.notifier).update((state) => value);
  // }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }
  void onSubmitName(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(nameProvider) ?? '';

    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title:Text(user.name)
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(onSubmitted: (value) => onSubmitName(ref, value)),
            TextField(onSubmitted: (value) => onSubmitAge(ref, value)),
            Center(child: Text(user.age.toString()))
          ],
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         final name = ref.watch(nameProvider);
//         return Scaffold(
//           appBar: AppBar(),
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 Text(
//                   name,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

