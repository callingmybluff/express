import 'package:express_app/route.dart';
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

  void perform( String action ) {
    ExpressHome homeHolder = ExpressHome.of(Express._latestContext);
    if (homeHolder == null)
      Navigator.of(Express._latestContext).pushReplacement(router.perform(action));
    else {
      _ExpressHome theHome = homeHolder.child;
      ExpressRoute route = router.perform(action, true) as ExpressRoute;
      print(route);
      theHome.child.value = route.build(Express._latestContext);
      //theHome.child.value = router.perform(action).currentResult;
    }
  }

  static Express of(BuildContext context) {
    Express._latestContext = context;
    return context.inheritFromWidgetOfExactType(Express) as Express;
  }
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

/// Holds the home of the app
class ExpressHome extends InheritedWidget {
  ExpressHome({Widget child}) : super(child: _ExpressHome(child: ValueNotifier(child)));

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static ExpressHome of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ExpressHome) as ExpressHome;
  }
}


class _ExpressHome extends StatefulWidget {
  final ValueNotifier<Widget> child;
  _ExpressHome({this.child});

  @override
  State<_ExpressHome> createState() => _ExpressHomeState();
}

class _ExpressHomeState extends State<_ExpressHome> {
  @override
  initState() {
    widget.child.addListener(() {
      if (mounted)
        setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child.value;
  }
}
