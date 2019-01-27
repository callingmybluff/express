import 'package:express/controller.dart';
import 'package:flutter/material.dart';

class ExpressRouter {
  final Map<String, ExpressController> routes;

  /// Cannot install a MaterialPageRoute<dynamic> after disposing it.
  //final _cashedRoutes = Map<String, MaterialPageRoute>();
  String initialRoute;

  ExpressRouter([this.routes = const {}]) {
    print("Lengths is " + routes.length.toString());
    if (routes.length > 0) {
      print(routes.keys.first);
      this.initialRoute = routes.keys.first;
    }
  }

  ExpressRouter add(String route, ExpressController controller) {
    if (this.initialRoute == null)
      this.initialRoute = route;
    this.routes[route] = controller;

    // Allow concat calls
    return this;
  }
  Route onRoute(RouteSettings routeSettings) {
    print("Looking inside our routes ... for " + routeSettings.name);
    String routeName = routeSettings.name;
    //if (routeName == '/')
    //  routeName = this.initialRoute;
    if ( !this.routes.containsKey( routeName ) )
      // Return failure (will go to `onNotFound`)
      return null;

    print("Returning route for " + routeName);
    return this._newRoute(routeSettings, this.routes[routeName]);
  }
  _newRoute(RouteSettings routeSettings, ExpressController controller) {
    print("Makde new route for " + routeSettings.name);
    return MaterialPageRoute(
      settings: routeSettings,
      builder: controller.render,
    );
  }

  Route onNotFound(RouteSettings routeSettings) {
    throw new Exception("This should never be the case as `onRoute` never returns null. Hanlding non-existing routes should be there, too (" + routeSettings.name + ")");
  }
}
