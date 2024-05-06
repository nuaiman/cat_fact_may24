import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/facts_notifier.dart';
import '../widgets/cat_fact_widget.dart';

class CatFactScreen extends ConsumerWidget {
  const CatFactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Facts 🐾'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CatFactWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(factsProvider.notifier).getCatFact();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
