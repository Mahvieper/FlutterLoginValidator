import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyApp(),));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email,_pass;

  _showSnackbar() {
    var snackBar = new SnackBar(content: Text("Login Successful"));

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Demo Login Page"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
              TextFormField(
                validator: (val) => !val.contains("@") ? "Email Id is not Valid" : null ,
              onSaved: (val) => _email = val,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email"
              ),
            ),
            TextFormField(
              onSaved: (val) => _pass = val,
              validator: (val) => val.length < 6  ? "Password length should be Greater than 6" : null ,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password"
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  if(formKey.currentState.validate()) {
                    formKey.currentState.save();

                    _showSnackbar();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
