import '../../domain/models/child_profile.dart';

abstract class ChildRepository {
  Future<void> saveChild(ChildProfile child);

  Future<ChildProfile?> getChild();

  Future<void> deleteChild();
}