import 'package:express/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(),
    );
  }
}

class Express {
  MaterialApp _app;
  final ExpressRouter router;

  Express(
    {
      @required this.router,

      /// MaterialApp's key
      Key key,
      /// MaterialApps's showPerformance
      bool showPerformanceOverlay = false,
      Locale locale,
      Iterable<LocalizationsDelegate> localizationsDelegates,
      LocaleResolutionCallback localeResolutionCallback,
      LocaleListResolutionCallback localeListResolutionCallback,
      Iterable<Locale> supportedLocales = const <Locale> [Locale('en', 'US')],
      ThemeData theme,
      String title = '',

      /// The widget to pass in case no route was found
      Widget notFoundWidget,

      // Just defaults:
      navigatorObservers: const <NavigatorObserver>[],
    }) {
      print("GGot the router:");
      print(this.router.initialRoute);
      // In case  the standard `/` was not passed, add it ourselves
      if (this.router.routes.containsKey('/'))
        this.router.add('/', this.router.routes[this.router.initialRoute]);
    _app = MaterialApp(

      //FUTURE: Consider adding them?
      //checkerboardOffscreenLayers: ,
      //checkerboardRasterCacheImages: ,
      //color: ,
      //debugShowCheckedModeBanner: ,
      //debugShowMaterialGrid: ,
      //navigatorKey: ,
      navigatorObservers: navigatorObservers,
      //showSemanticsDebugger: ,

      key: key,
      showPerformanceOverlay: showPerformanceOverlay,

      locale: locale,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      theme: theme,
      title: title,

      // Forbidden stuff since they are related to routing
      //home: ,
      //onGenerateTitle: ,
      //routes: ,

      initialRoute: this.router.initialRoute,
      onGenerateRoute: router.onRoute,
      onUnknownRoute: router.onNotFound,
    );
  }
  MaterialApp render() {
    return _app;
  }
}
