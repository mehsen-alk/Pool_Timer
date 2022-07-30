import 'dart:async';
import 'package:pool_timer/app/notification/notification_api.dart';
import 'package:pool_timer/data/local/group_list_helper.dart';
import 'package:pool_timer/domain/models.dart';
import 'package:pool_timer/presentation/base/base_view_model.dart';

class AddNewGroupViewModel extends BaseViewModel
    with AddNewGroupViewModelInput, AddNewGroupViewModelOutput {
  Group group = Group('', 0, 60, 0, false, '', DateTime.now(), 0);
  final StreamController _groupStream = StreamController<Group>.broadcast();
  late StreamSubscription streamSubscription;
  final GroupListHelper _helper = GroupListHelper();

  @override
  void start() {}

  @override
  void depose() {
    _groupStream.close();
  }

  @override
  Stream get groupStream => _groupStream.stream;

  @override
  setGroup() {
    groupSink.add(group);
  }

  @override
  Sink get groupSink => _groupStream.sink;

  @override
  setDeposit(String? deposit) {
    group.setDeposit(deposit);
  }

  @override
  setDepositExist(bool? depositExist) {
    group.setDepositExist(depositExist);
  }

  @override
  setDurationInMinute(int? durationInMinute) {
    group.setDuration(durationInMinute);
  }

  @override
  setGroupName(String? groupName) {
    group.setName(groupName);
  }

  @override
  setGroupNumberOfMember(int? numberOfMember) {
    group.setNumberOfMember(numberOfMember);
  }

  @override
  setPaid(int? paid) {
    group.setPaid(paid);
  }

  @override
  saveGroup(Group group) {
    setTimerNotification();
    group.id =
        ((_helper.groupList.isEmpty ? 0 : _helper.groupList.last.id) ?? 0) + 1;
    _helper.storeGroup(group);
  }

  @override
  setTimerNotification() {
    NotificationApi.showNotification(id: 2, title: 'added Successfully');

    if (group.durationInMinute! > 10) {
      NotificationApi.showScheduleNotification(
          id: 0,
          title: '10 minute remaining',
          scheduleDate: group.registerTime
              .add(Duration(minutes: group.durationInMinute! - 10)));
    }

    NotificationApi.showScheduleNotification(
        id: 1,
        title: 'finish!',
        scheduleDate:
            group.registerTime.add(Duration(minutes: group.durationInMinute!)));
  }
}

abstract class AddNewGroupViewModelInput {
  setGroupName(String? groupName);
  setGroupNumberOfMember(int? numberOfMember);
  setDurationInMinute(int? durationInMinute);
  setPaid(int? paid);
  setDepositExist(bool? depositExist);
  setDeposit(String? deposit);
  setGroup();
  setTimerNotification();
  Sink get groupSink;
}

abstract class AddNewGroupViewModelOutput {
  saveGroup(Group group);
  Stream get groupStream;
}
