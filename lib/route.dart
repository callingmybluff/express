
import 'package:flutter/material.dart';

class ExpressRoute {
  final Map<String, String> actions;
  final Widget Function(BuildContext) build;

  ExpressRoute({
    this.actions,
    this.build,
  });

  getRoute( String action ) {
    if (!actions.containsKey(action))
      throw new Exception("Desired action is not known. Where to go now?");
    return actions[action];
  }
}