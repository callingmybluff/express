# express

A plugin to separate the app into Routers, Controller, Models, and Views easily.

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
- Work on passing data
- Modify the flow to call the router instead of simply calling the navigator.
- Link pages using `actions` or `events` to allow a whole graph of connections easily.