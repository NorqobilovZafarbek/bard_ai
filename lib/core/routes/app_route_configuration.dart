
import 'package:go_router/go_router.dart';

import '../../presentation/pages/chat/chat_page.dart';
import '../../presentation/pages/history/history_page.dart';
import '../../presentation/pages/home/home_page.dart';
import 'app_route_constants.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRouteConstants.homeRouteName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/chat',
        name: AppRouteConstants.chatRouteName,
        builder: (context, state) => const ChatPage(),
      ),
      GoRoute(
        path: '/history',
        name: AppRouteConstants.historyRouteName,
        builder: (context, state) => const HistoryPage(),
      ),
    ],
    // errorPageBuilder: (context, state) {
    //   return const MaterialPage(
    //     child: ErrorPage(),
    //   );
    // },
  );
// redirect: (context, state) {
//   if (!isAuth && state.matchedLocation.startsWith('/${AppRouteConstants.homeRouteName}')) {
//     return context.namedLocation(AppRouteConstants.chatRouteName);
//   } else {
//     return null;
//   }
// },
}
