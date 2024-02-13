import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../domain/services/local_db/chat_services_sqflt.dart';
import '../app/theme_provider.dart';
import 'app.dart';

class AppScope extends StatefulWidget {
  const AppScope({
    required this.db,
    required this.messagesDB,
    super.key,
  });

  final DB db;
  final MessageDB messagesDB;

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("---------------- AppScope");
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(
              value: widget.messagesDB,
            ),
            RepositoryProvider.value(
              value: widget.db,
            ),
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
            ),
          ],
          child: const MyApp(),
        );
      },
    );
  }
}
