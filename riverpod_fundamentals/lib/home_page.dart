import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fundamentals/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userNo = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(fetchUserProvider(input: userNo, someValue: 1, secondValue:false)).when(data: (data) {
        return Column(
          children: [
            TextField(
              onSubmitted: (value) => setState(() {
                userNo = value;
              }),
            ),
            Center(
              child: Text(data.email),
            )
          ],
        );
      }, error: (error, stacktrace) {
        return Center(
          child: Text(error.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}







// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

  // void onSubmit(WidgetRef ref, String value) {
  //  final name = ref.read(nameProvider.notifier).update((state) => value);
  // }

  // void onSubmitAge(WidgetRef ref, String value) {
  // ref.read(userProvider.notifier).updateName(value);
  // ref.read(userChangeNotifierProvider).updateName(value);
  // }

  // void onSubmitName(WidgetRef ref, String value) {
  // ref.read(userProvider.notifier).updateAge(int.parse(value));
  // ref.read(userChangeNotifierProvider).updateAge(int.parse(value));
  // }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(nameProvider) ?? '';

    // final user = ref.watch(userProvider);
    // final user = ref.watch(userProvider.select((value) => value.name));

    //changeNotifierProvider is mutable, we can change the value of the user obejct outside the class and thats a very bad thing tbh , its not recommended
    // final user = ref.watch(userChangeNotifierProvider).user;

//     return Scaffold(
//       appBar: AppBar(title: Text(user)),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             TextField(onSubmitted: (value) => onSubmitName(ref, value)),
//             TextField(onSubmitted: (value) => onSubmitAge(ref, value)),
//             Center(child: Text(user.toString()))
//           ],
//         ),
//       ),
//     );
//   }
// }

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

    // return ref.watch(fetchUserProvider).when(
    //     data: (data) {
    //     return Scaffold(
    //       appBar: AppBar(),
    //       body:Column(
    //         children: [
    //           TextField(),
    //           Center(
    //             child: Text(data.email),
    //           )
    //         ],
    //       ),
    //     );
    //   }, error: (error, stacktrace) {
    //     return Center(
    //       child: Text(error.toString()),
    //     );
    //   }, loading: () {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   });
    // }
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: ref.watch(streamProvider).when(data: (data) {
    //     return const Column(
    //       children: [
    //         Center(
    //           child: Text(''),
    //         )
    //       ],
    //     );
    //   }, error: (error, stacktrace) {
    //     return Center(
    //       child: Text(error.toString()),
    //     );
    //   }, loading: () {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }),
    // );
//   }
// }
