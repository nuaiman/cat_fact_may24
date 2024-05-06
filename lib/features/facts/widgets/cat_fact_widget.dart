import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/facts_notifier.dart';

class CatFactWidget extends ConsumerWidget {
  const CatFactWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, watch, child) {
        final fact = ref.watch(factsProvider);

        return AnimatedOpacity(
          opacity: fact.isNotEmpty ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: fact.isNotEmpty
              ? TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.9, end: 1.0),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          fact,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ),
                    );
                  },
                )
              : const SizedBox(),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../notifiers/facts_notifier.dart';

// class CatFactWidget extends ConsumerWidget {
//   const CatFactWidget({Key? key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Consumer(
//       builder: (context, watch, child) {
//         final fact = ref.watch(factsProvider);

//         return AnimatedOpacity(
//           opacity: fact.isNotEmpty ? 1.0 : 0.0,
//           duration: const Duration(milliseconds: 500),
//           child: fact.isNotEmpty
//               ? TweenAnimationBuilder<double>(
//                   tween: Tween<double>(begin: 0.9, end: 1.0),
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                   builder: (context, value, child) {
//                     return Transform.scale(
//                       scale: value,
//                       child: Container(
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Text(
//                           fact,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 18.0),
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               : const SizedBox(),
//         );
//       },
//     );
//   }
// }
