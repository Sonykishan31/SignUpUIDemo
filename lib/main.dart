import 'package:flutter/material.dart';

import 'NextScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Registration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _list;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _searchText = "";
  List names = new List(); // names we get from API
  List filteredNames = new List(); // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 16.0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sony Kishan"),
              accountEmail: Text("SonyKishan31@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.android
                        ? Colors.black
                        : Colors.blue,
                child: Text(
                  "SK",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Search'),
              trailing: Icon(Icons.search),
              onTap: () {
                // Update the state of the app
                // ...

                // Then c
                // lose the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Wallet'),
              trailing: Icon(Icons.account_balance_wallet),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Likes'),
              trailing: Icon(Icons.thumb_up),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Dislikes'),
              trailing: Icon(Icons.thumb_down),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Messages'),
              trailing: Icon(Icons.textsms),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              trailing: Icon(Icons.settings),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        padding: new EdgeInsets.all(20.0),
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _usernameController,
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  labelStyle: Theme.of(context).textTheme.headline),
            ),
            SizedBox(height: 10),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16),
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Enter your Mobile Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  filled: true,
                  labelStyle: Theme.of(context).textTheme.headline),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16),
                  contentPadding: EdgeInsets.all(15),
                  filled: true,
                  hintText: 'Enter your Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  labelStyle: Theme.of(context).textTheme.headline),
            ),
            SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  hintText: 'Enter your Address',
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  labelStyle: Theme.of(context).textTheme.headline),
            ),
            SizedBox(height: 20),
            Container(
              width: 120,
              height: 40,
              child: RaisedButton(
                textColor: Colors.white,
                elevation: 10,
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white)),
                onPressed: () => Navigator.push(context, _createRoute()),
//                    Toast.show(
//                        '♥  ' + _usernameController.text + ' ♥', context,
//                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM),
                color: Colors.blue,
                child: const Text('Submit', style: TextStyle(fontSize: 20)),
              ),
            )

//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NextScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 5.0);
        var end = Offset.zero;
        var curve = Curves.bounceIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
//          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
//        _filter.clear();
      }
    });
  }
}
