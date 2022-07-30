import 'dart:async';
import 'package:pool_timer/data/local/group_list_helper.dart';
import 'package:pool_timer/domain/models.dart';
import 'package:pool_timer/presentation/base/base_view_model.dart';

class GroupListViewModel extends BaseViewModel
    with GroupListViewModelInput, GroupListViewModelOutput {
  StreamController<List<Group>> groupListStreamController = StreamController();
  StreamController refresh = StreamController();

  final GroupListHelper _helper = GroupListHelper();

  @override
  void start() {
    groupListStreamController.add(_helper.groupList);
    r();
  }

  void r() async {
    await Future.delayed(const Duration(seconds: 1));
    refresh.add(0);
  }

  @override
  void depose() {
    groupListStreamController.close();
    refresh.close();
  }

  @override
  Stream<List<Group>> get groupList => groupListStreamController.stream;

  @override
  Stream get refreshScreen => refresh.stream;
}

abstract class GroupListViewModelInput {}

abstract class GroupListViewModelOutput {
  Stream get refreshScreen;
  Stream<List<Group>> get groupList;
}
