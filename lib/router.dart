import 'package:express_app/route.dart';
import 'package:flutter/material.dart';

class ExpressRouter {
  final Map<String, ExpressRoute> routes;
  ExpressRoute currentRouter;

  init( Widget firstRoute ) {
    this.currentRouter = routes.values.first;

    routes.forEach((key, value) {
      if (value.runtimeType == firstRoute.runtimeType)
        this.currentRouter = value;
    });
  }

  /// Cannot install a MaterialPageRoute<dynamic> after disposing it.
  //final _cashedRoutes = Map<String, MaterialPageRoute>();
  String initialRoute;

  ExpressRouter({@required this.routes});

  perform( String action ) {
    print("Performing dis " + action);
    currentRouter = this.routes[currentRouter.getRoute(action)];
    return MaterialPageRoute(
      builder: currentRouter.build,
    );
  }
}
