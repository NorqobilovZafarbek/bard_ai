import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/services/local_db/chat_services_sqflt.dart';
import '../../presentation/blocs/chat_bloc/chat_bloc.dart';
import '../app/app_theme.dart';
import '../app/theme_provider.dart';
import '../routes/app_route_configuration.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final mode = Provider.of<ThemeProvider>(context);
    print('------------------------- MyApp');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatBloc(
            context.read<DB>(),
            context.read<MessageDB>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: mode.mode(),
        title: 'Bard Ai',
        routerConfig: AppRouter().router,
      ),
    );
  }
}
