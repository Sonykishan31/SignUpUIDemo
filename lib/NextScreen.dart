import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text("Login Screen"),
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
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Email',
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
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Password',
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
