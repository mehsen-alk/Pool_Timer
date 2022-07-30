import 'package:flutter/material.dart';
import 'package:pool_timer/domain/models.dart';
import 'package:pool_timer/app/extension.dart';

class GroupDetailsView extends StatefulWidget {
  final Group _group;

  const GroupDetailsView(this._group, {Key? key}) : super(key: key);

  @override
  _GroupDetailsViewState createState() => _GroupDetailsViewState();
}

class _GroupDetailsViewState extends State<GroupDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${(widget._group.name).nullOrEmpty() ? widget._group.id : widget._group.name}'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GroupDetailsCard(title: 'id: ', content: '${widget._group.id}'),
          GroupDetailsCard(
              title: 'name: ',
              content:
                  ' ${widget._group.name.nullOrEmpty() ? 'Not set' : widget._group.name}'),
          GroupDetailsCard(
              title: 'number of member: ',
              content: ' ${widget._group.numberOfMember}'),
          GroupDetailsCard(
              title: 'number of minute: ',
              content: ' ${widget._group.durationInMinute}'),
          GroupDetailsCard(
              title: 'register time: ',
              content: ' ${widget._group.registerTime}'),
          GroupDetailsCard(
              title: 'paid: ', content: '${widget._group.paid} s.p'),
          GroupDetailsCard(
              title: 'deposit: ',
              content:
                  ' ${widget._group.depositExist! ? widget._group.deposit : 'None'}'),
        ],
      ),
    );
  }
}

class GroupDetailsCard extends StatelessWidget {
  const GroupDetailsCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  Text(content),
                ],
              )),
        ),
      ),
    );
  }
}
