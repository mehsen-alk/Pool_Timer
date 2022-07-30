import 'package:flutter/material.dart';
import 'package:pool_timer/data/local/group_list_helper.dart';
import 'package:pool_timer/domain/models.dart';
import 'package:pool_timer/presentation/add_new_group/add_new_group_view.dart';
import 'package:pool_timer/presentation/group_list/group_bubble.dart';
import 'package:pool_timer/presentation/group_list/group_list_viewmodel.dart';

class GroupList extends StatefulWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  final GroupListViewModel _viewModel = GroupListViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.start();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.depose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewGroup()));
        },
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          builder: (context, box, widget) {
            _viewModel.start();
            return StreamBuilder(
              stream: _viewModel.refreshScreen,
              builder: (c, s) {
                _viewModel.r();
                return StreamBuilder<List<Group>?>(
                    stream: _viewModel.groupList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data!.isNotEmpty) {
                        List<GroupBubble> groupsBubble = [];
                        snapshot.data!.forEach((group) {
                          groupsBubble.add(GroupBubble(group));
                        });

                        return ListView(
                          shrinkWrap: true,
                          children: groupsBubble,
                        );
                      } else {
                        return const Center(child: Text('no data'));
                      }
                    });
              },
            );
          },
          valueListenable: GroupListHelper().listener(),
        ),
      ),
    );
  }
}
