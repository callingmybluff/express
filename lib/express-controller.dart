import 'package:express/express-view.dart';
import 'package:flutter/material.dart';

class ExpressController {
  ExpressView view;
  ExpressController({@required this.view});

  Widget render(BuildContext context) {
    print("Sir, yes sir");
    return this.view.render(context);
  }

  addData(String key, dynamic value) {
    this.view.addData(key, value);
  }
  removeData(String key) {
    this.view.removeData(key);
  }
}
