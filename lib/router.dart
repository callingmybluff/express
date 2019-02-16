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

  dynamic perform( String action, [bool getExpressRoute = false] ) {
    currentRouter = this.routes[currentRouter.getRoute(action)];
    if (getExpressRoute)
      return currentRouter;
    else
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return WillPopScope(
            child: currentRouter.build(context),
            onWillPop: () {
              print("Going back .......... ");
            },
          );
        },
      );
  }
}
