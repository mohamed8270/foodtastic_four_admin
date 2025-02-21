import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';
import 'package:foodtastic_four_admin/utils/logging/logging.dart';
import 'package:go_router/go_router.dart';


class Middleware {
  Future<String?> routeMiddleware(GoRouterState state) async {
    // get the route path
    var path = state.uri.path;

    // log the application path
    AppLogger.debug(path.toString());

    // check the route path and return boolean
    bool isPublicPath = path == '/signup' || path == '/login' || path == '/' || path == '/onboard';

    // get the user registered token
    String? token = await LocalStorage.token();

    // check the boolean conditions
    AppLogger.debug('Route path is: ${isPublicPath.toString()}');
    AppLogger.debug('User token: ${token.toString()}');

    // conditions to check the routes
    if(isPublicPath && token != null && token.isNotEmpty) {
      return '/bottomNavbar/home';
    } else if(!isPublicPath && (token == null || token.isEmpty)) {
      return '/signup';
    }
    return null;
  }
}