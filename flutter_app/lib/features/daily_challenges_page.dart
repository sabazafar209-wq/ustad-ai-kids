import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'rewards_providers.dart';

class DailyChallengesPage extends ConsumerWidget {
  const DailyChallengesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenges = ref.watch(dailyChallengesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Challenges'),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(dailyChallengesProvider.notifier).resetAll();
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset challenges',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: challenges.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: challenges.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final c = challenges[index];

                  return Card(
                    child: ListTile(
                      title: Text(c.title),
                      subtitle: Text(c.description),
                      leading: CircleAvatar(child: Text(c.xpReward.toString())),
                      trailing: c.completed
                          ? const Icon(Icons.check, color: Colors.green)
                          : ElevatedButton(
                              onPressed: () async {
                                final messenger = ScaffoldMessenger.of(context);
                                await ref.read(dailyChallengesProvider.notifier).complete(c.id);
                                messenger.showSnackBar(SnackBar(
                                  content: Text('Completed! +${c.xpReward} XP, +${c.coinsReward} coins'),
                                ));
                              },
                              child: const Text('Complete'),
                            ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
