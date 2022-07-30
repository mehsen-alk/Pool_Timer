import 'package:flutter/material.dart';
import 'package:pool_timer/data/local/group_list_helper.dart';
import 'package:pool_timer/domain/models.dart';
import 'package:pool_timer/presentation/group_details/group_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupBubble extends StatelessWidget {
  const GroupBubble(this._group, {Key? key}) : super(key: key);
  final Group _group;

  String _getRemaining() {
    Duration remaining = (_group.registerTime
        .add(Duration(minutes: _group.durationInMinute!))
        .difference(DateTime.now()));

    String result =
        '${remaining.inHours.remainder(24).abs()}:${remaining.inMinutes.remainder(60).abs()}:${remaining.inSeconds.remainder(60).abs()}';
    return result;
  }

  bool _finish() {
    bool done =
        (_group.registerTime.add(Duration(minutes: _group.durationInMinute!)))
            .isAfter(DateTime.now());

    return done;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroupDetailsView(_group)));
        },
        onLongPress: () {
          GroupListHelper().deleteGroup(_group.id!);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _finish() ? Colors.green : Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Group: ${_group.id}'),
                    Text('remaining: ${_getRemaining()}')
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('number: ${_group.numberOfMember}'),
                    Text('paid: ${_group.paid}'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
