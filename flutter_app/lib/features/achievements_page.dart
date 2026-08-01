import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'rewards_providers.dart';

class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievements = ref.watch(achievementsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: achievements.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: achievements.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final a = achievements[index];

                  return Card(
                    child: ListTile(
                      leading: Text(
                        a.emoji,
                        style: const TextStyle(fontSize: 28),
                      ),
                      title: Text(a.title),
                      subtitle: Text(a.description),
                      trailing: a.unlocked
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : TextButton(
                              onPressed: () async {
                                await ref.read(achievementsProvider.notifier).unlock(a.id);
                              },
                              child: const Text('Unlock'),
                            ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
