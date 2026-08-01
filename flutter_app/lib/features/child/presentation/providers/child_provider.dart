import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/local_child_storage.dart';
import '../../domain/models/child_profile.dart';

final childStorageProvider = Provider<LocalChildStorage>((ref) {
  return LocalChildStorage();
});

class ChildNotifier extends StateNotifier<ChildProfile?> {
  final LocalChildStorage storage;

 ChildNotifier(this.storage) : super(null) {
  loadChild();
}

  Future<void> loadChild() async {
    state = await storage.getChild();
  }

  Future<void> saveChild(ChildProfile child) async {
    await storage.saveChild(child);
    state = child;
  }

  Future<void> deleteChild() async {
    await storage.deleteChild();
    state = null;
  }
}

final childProvider =
    StateNotifierProvider<ChildNotifier, ChildProfile?>((ref) {
  return ChildNotifier(
    ref.read(childStorageProvider),
  );
});