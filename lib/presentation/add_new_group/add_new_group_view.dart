import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pool_timer/presentation/add_new_group/add_new_group_viewmodel.dart';

class AddNewGroup extends StatefulWidget {
  const AddNewGroup({Key? key}) : super(key: key);

  @override
  State<AddNewGroup> createState() => _AddNewGroupState();
}

class _AddNewGroupState extends State<AddNewGroup> {
  final AddNewGroupViewModel _viewModel = AddNewGroupViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.depose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new group'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (groupName) {
                    _viewModel.setGroupName(groupName);
                  },
                  style: const TextStyle(),
                  decoration: const InputDecoration(
                    labelText: 'group name',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  onChanged: (numberOfMember) {
                    _viewModel
                        .setGroupNumberOfMember(int.parse(numberOfMember));
                  },
                  style: const TextStyle(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'number of member',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: TextEditingController(text: '60'),
                  onChanged: (durationInMinute) {
                    _viewModel.setDurationInMinute(int.parse(durationInMinute));
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'number of minute',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  onChanged: (paid) {
                    _viewModel.setPaid(int.parse(paid));
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'paid',
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'deposits',
                      style: TextStyle(
                        color: _viewModel.group.depositExist!
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    Checkbox(
                        value: _viewModel.group.depositExist!,
                        onChanged: (_) {
                          setState(() {
                            _viewModel.setDepositExist(_);
                          });
                        }),
                  ],
                ),
                (_viewModel.group.depositExist!
                    ? TextField(
                        onChanged: (deposit) {
                          _viewModel.setDeposit(deposit);
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          labelText: 'deposit',
                        ),
                      )
                    : Container()),
                ElevatedButton(
                    onPressed: () async {
                      _viewModel.saveGroup(_viewModel.group);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Save'),
                        Icon(Icons.save),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
