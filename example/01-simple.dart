import 'package:express_app/route.dart';
import 'package:express_app/router.dart';
import 'package:express_app/express.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Express(
      router: ExpressRouter(
        routes: {
          '/': ExpressRoute(
            build: (BuildContext context) => FirstPage(),
            actions: {
              'next': '/secondPage',
            },
          ),
          '/secondPage': ExpressRoute(
            build: (BuildContext context) => SecondPage(),
            actions: {
              'back': '/',
            }
          )
        },
      ),
      app: MaterialApp(
        home: FirstPage(),
      ),
    )
  );
}

class FirstPage extends StatelessWidget {
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
              Express.of(context).perform("next");
            },
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String title = "default title";
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
