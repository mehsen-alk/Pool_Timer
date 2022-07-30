import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pool_timer/app/notification/notification_api.dart';
import 'package:pool_timer/domain/models.dart';
import 'package:pool_timer/presentation/group_list/group_list_view.dart';
import 'package:pool_timer/presentation/resources/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(GroupAdapter());
  await Hive.openBox('groupList');

  NotificationApi.init();

  runApp(const BoolApp());
}

class BoolApp extends StatelessWidget {
  const BoolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, d) => MaterialApp(
        theme: getAppTheme(),
        home: const GroupList(),
      ),
    );
  }
}
