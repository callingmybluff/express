import 'package:express/controller.dart';
import 'package:express/router.dart';
import 'package:express/view.dart';
import 'package:express/express.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Express(
      router: ExpressRouter(
        {
          '/': ExpressController(
            view: FirstPage(),
          ),
          '/secondPage': ExpressController(
            view: SecondPage(),
          ),
        }
      ),
    )
    // Express is not a widget. Do not forget to call the render function
    .render()
  );
}

class FirstPage extends ExpressViewStateless {
  @override
  build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("1st page"),
          RaisedButton(
            child: Text("Go 2 page 2"),
            onPressed: () {
              print("Click");
              Navigator.of(context).pushNamed('/secondPage');
            },
          )
        ],
      ),
    );
  }
}

class SecondPage extends ExpressViewStateless {
  String title = "default title";
  @override
  build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(title),
      ),
    );
  }
}