import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final _emailConroller = TextEditingController();
  final _passwordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                obscureText: true,
                controller: _passwordConroller,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
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
                width: 120,
                height: 40,
                child: RaisedButton(
                  textColor: Colors.white,
                  elevation: 10,
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NextScreen())),
//                    Toast.show(
//                        '♥  ' + _usernameController.text + ' ♥', context,
//                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM),
                  color: Colors.blue,
                  child: const Text('Login', style: TextStyle(fontSize: 20)),
                ),
              )
            ]),
      ),
    );
  }
}
