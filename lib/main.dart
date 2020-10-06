import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: MyHomePage(title: 'Sign up'),
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
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailConroller = TextEditingController();
  final _addressController = TextEditingController();
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
//      drawer: Drawer(
//        elevation: 16.0,
//        child: ListView(
//          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            UserAccountsDrawerHeader(
//              accountName: Text("Sony Kishan"),
//              accountEmail: Text("SonyKishan31@gmail.com"),
//              currentAccountPicture: CircleAvatar(
//                backgroundColor:
//                    Theme.of(context).platform == TargetPlatform.android
//                        ? Colors.black
//                        : Colors.blue,
//                child: Text(
//                  "SK",
//                  style: TextStyle(fontSize: 30.0),
//                ),
//              ),
//            ),
//            ListTile(
//              title: Text('Search'),
//              trailing: Icon(Icons.search),
//              onTap: () {
//                // Update the state of the app
//                // ...
//
//                // Then c
//                // lose the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Wallet'),
//              trailing: Icon(Icons.account_balance_wallet),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Likes'),
//              trailing: Icon(Icons.thumb_up),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Dislikes'),
//              trailing: Icon(Icons.thumb_down),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Messages'),
//              trailing: Icon(Icons.textsms),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Settings'),
//              trailing: Icon(Icons.settings),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//          ],
//        ),
//      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
//centerTitle: true, // To make appbar text in center
//        leading: IconButton(
//            icon: Icon(Icons.menu),
//            onPressed: () => _scaffoldKey.currentState.openDrawer()),
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
//              initialValue: '',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              controller: _nameController,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
//                suffixIcon: Icon(
//                  Icons.error,
//                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
//              initialValue: '',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: _mobileController,
              maxLength: 10,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Enter Mobile',
                counterText: '',
                border: OutlineInputBorder(),
//                suffixIcon: Icon(
//                  Icons.error,
//                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
//              initialValue: '',
              keyboardType: TextInputType.emailAddress,
              controller: _emailConroller,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                border: OutlineInputBorder(),
//                suffixIcon: Icon(
//                  Icons.error,
//                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
//              initialValue: '',
              controller: _addressController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Enter Address',
                border: OutlineInputBorder(),
//                suffixIcon: Icon(
//                  Icons.error,
//                ),
              ),
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
                    borderRadius: new BorderRadius.circular(10),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  validateUserInputs();
                },
                color: Colors.blue,
                child: const Text('Submit', style: TextStyle(fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }

  validateUserInputs() {
    String errMsg = "";

    if (_nameController.text.toString().trim().isEmpty) {
      errMsg = "Please Enter Name";
    } else if (_mobileController.text.toString().trim().isEmpty) {
      errMsg = "Please Enter Mobile Number";
    } else if (_mobileController.text.toString().trim().length < 10) {
      errMsg = "Please Enter Valid Mobile Number";
    } else if (_emailConroller.text.toString().trim().isEmpty) {
      errMsg = "Please Enter Email Address";
    } else if (!isEmail(_emailConroller.text.toString().trim())) {
      errMsg = "Please Enter Valid Email Address";
    } else if (_addressController.text.toString().trim().isEmpty) {
      errMsg = "Please Enter Address";
    } else {
      Navigator.push(context, _createRoute());
      return;
    }

    final snackBar = SnackBar(content: Text(errMsg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
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

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    print(regExp.hasMatch(em));
    return regExp.hasMatch(em);
  }
}
