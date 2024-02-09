import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../domain/services/local_db/app_services.dart';
import '../../domain/services/local_db/chat_services_sqflt.dart';
import '../app/theme_provider.dart';
import 'app.dart';

class AppScope extends StatelessWidget {
  const AppScope({
    required this.db,
    required this.messagesDB,
    super.key,
  });

  final DB db;
  final MessageDB messagesDB;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(
              value: messagesDB,
            ),
            RepositoryProvider.value(
              value: db,
            ),
            RepositoryProvider(
              create: (context) => AppServices(),
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
