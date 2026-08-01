import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/child_profile.dart';
import '../repositories/child_repository.dart';

class LocalChildStorage implements ChildRepository {
  static const _childKey = 'child_profile';

  @override
  Future<void> saveChild(ChildProfile child) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _childKey,
      jsonEncode(child.toJson()),
    );
  }

  @override
  Future<ChildProfile?> getChild() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(_childKey);

    if (json == null) {
      return null;
    }

    return ChildProfile.fromJson(
      jsonDecode(json),
    );
  }

  @override
  Future<void> deleteChild() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_childKey);
  }
}