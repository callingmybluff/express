# Express App

A plugin for Flutter to better separate the app into Routers, Controller, Models, and Views easily.

## Status

Please note version's number. This is still a beta, and only published to get feedback to include suggestions while working on it.

## Examples

    void main() {
      runApp(
        Express(
          router: ExpressRouter(
            {
              '/secondPage': ExpressController(
                view: SecondPage(),
              ),
              '/': ExpressController(
                view: FirstPage(),
              ),
            }
          ),
        )
        // Express is not a widget. Do not forget to call the render function
        .render()
      );
    }

For more examples, please refer to [their folder](https://github.com/callingmybluff/express/tree/master/example).


## TODO
- Find a way for the `StatefulWidget` to work
- Work on passing data
- Modify the flow to call the router instead of simply calling the navigator.
- Link pages using `actions` or `events` to allow a whole graph of connections easily.
- Use models