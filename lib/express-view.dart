import 'package:flutter/material.dart';

abstract class ExpressView {
  // TODO: How and where to attach this data?
  final Map<String, dynamic> data = Map<String, dynamic>();

  addData(String key, dynamic value) {
    this.data[key] = value;
  }
  removeData(String key) {
    // Returns the value, if exists
    this.data.remove(key);
  }

  render(BuildContext context);
}

abstract class ExpressViewStateful extends StatefulWidget with ExpressView {
  render(BuildContext context) {
    print("Asking to render page stateful");
    return this.createElement();
  }
}

abstract class ExpressViewStateless extends StatelessWidget with ExpressView {
  ExpressViewStateless() {
    print("#### Make new");
  }
  render(BuildContext context) {
    print("Asking to render page stateless");
    return this.build(context);
  }
}
