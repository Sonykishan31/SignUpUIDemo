import 'package:flutter/material.dart';



class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final _emailConroller = TextEditingController();

  final _passwordConroller = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text("Login"),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.search), onPressed: () {})
//        ],
      ),
      body: Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
//              initialValue: '',
                keyboardType: TextInputType.emailAddress,
                controller: _emailConroller,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
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
                obscureText: true,
                controller: _passwordConroller,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(),
//                suffixIcon: Icon(
//                  Icons.error,
//                ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  textColor: Colors.white,
                  elevation: 2,
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white)),
//                  onPressed: () => Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => NextScreen())),
////
                  onPressed: () {
                    validateUserInputs();
                  },
                  color: Colors.blue,
                  child: const Text('Login', style: TextStyle(fontSize: 20)),
                ),
              )
            ]),
      ),
    );
  }

  validateUserInputs() {
//    String errMsg = "";
//
//    if (_emailConroller.text.toString().trim().isEmpty) {
//      errMsg = "Please Enter Email Address";
//    } else if (!Utils.isEmail(_emailConroller.text.toString().trim())) {
//      errMsg = "Please Enter Valid Email Address";
//    } else if (_passwordConroller.text.toString().trim().isEmpty) {
//      errMsg = "Please Enter Password";
//    } else if (_passwordConroller.text.toString().trim().length < 6) {
//      errMsg = "Password must be 6 characters long.";
//    } else {
//      errMsg = "You are logged in successfully.";
//    }
//
//    final snackBar = SnackBar(content: Text(errMsg));
//    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
