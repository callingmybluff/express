import 'package:express_app/router.dart';
import 'package:flutter/material.dart';

class Express extends InheritedWidget {
  final MaterialApp app;
  final ExpressRouter router;
  final Map<String, dynamic> parameters;
  static BuildContext _latestContext;

  Express(
    {
      @required this.router,
      this.parameters = const {},

      // Do not modify the routing attributes as they will be overriden
      @required this.app,
      Key key,
    }) : super(key: key, child: app) {
      this.router.init(app.home);
    }

  perform( String action ) {
    Navigator.of(Express._latestContext).pushReplacement(router.perform(action));
  }

  static Express of(BuildContext context) {
    Express._latestContext = context;
    return context.inheritFromWidgetOfExactType(Express) as Express;
  }
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
