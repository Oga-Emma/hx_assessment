import 'package:flutter/material.dart';
import 'package:helper_widgets/empty_space.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EmptySpace(
                multiple: 16,
              ),
              Text(
                "Welcome!",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                ),
              ),
              EmptySpace.v4(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password (Min 8 characters)",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              EmptySpace.v4(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot password?"),
                ),
              ),
              EmptySpace.v4(),
              SizedBox(
                height: 52,
                width: double.maxFinite,
                child: MaterialButton(
                  color: Theme.of(context).accentColor,
                  child: Text("LOG IN"),
                  onPressed: () {},
                ),
              ),
              EmptySpace.v4(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User? "),
                  TextButton(
                    onPressed: () {},
                    child: Text("Create a new account"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
