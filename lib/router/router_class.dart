import 'package:go_router/go_router.dart';
import 'package:meditate_me_app/pages/main_page.dart';
import 'package:meditate_me_app/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.mainPage,
        builder: (context, index){
          return const MainPage();
        }
      )
    ],
  );
}
