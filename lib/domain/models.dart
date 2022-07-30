import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 1)
class Group {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? numberOfMember;
  @HiveField(2)
  int? durationInMinute;
  @HiveField(3)
  int? paid;
  @HiveField(4)
  bool? depositExist;
  @HiveField(5)
  String? deposit;
  @HiveField(6)
  DateTime registerTime;
  @HiveField(7)
  int? id;

  Group(this.name, this.numberOfMember, this.durationInMinute, this.paid,
      this.depositExist, this.deposit, this.registerTime, this.id);

  setName(String? name) {
    this.name = name;
  }

  setNumberOfMember(int? numberOfMember) {
    this.numberOfMember = numberOfMember;
  }

  setDuration(int? durationInMinute) {
    this.durationInMinute = durationInMinute;
  }

  setPaid(int? paid) {
    this.paid = paid;
  }

  setDepositExist(bool? depositExist) {
    this.depositExist = depositExist;
  }

  setDeposit(String? deposit) {
    this.deposit = deposit;
  }
}
