import 'package:hive_flutter/hive_flutter.dart';
import 'package:pool_timer/domain/models.dart';

class GroupListHelper {
  final Box _box;

  GroupListHelper() : _box = Hive.box('GroupList');

  List<Group> get groupList {
    List? fromHive = _box.get('list');
    List<Group> groupList = [];

    if (fromHive != null) {
      for (var group in fromHive) {
        if (group is Group) groupList.add(group);
      }
    }

    return groupList;
  }

  void storeGroup(Group group) async {
    List<Group> groupList = this.groupList;
    groupList.add(group);
    await _box.put('list', groupList);
  }

  listener() {
    return _box.listenable();
  }

  void deleteGroup(int id) async {
    List<Group> groupList = this.groupList;
    groupList.removeWhere((group) => group.id == id);
    await _box.put('list', groupList);
  }
}
