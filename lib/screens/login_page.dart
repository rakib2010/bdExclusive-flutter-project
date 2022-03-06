import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginform/helper/http_helper.dart';
import 'package:loginform/model/UserModel.dart';
import 'package:loginform/screens/home_page.dart';
import 'package:loginform/model/user_payload.dart';
import 'package:loginform/screens/registration_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  login() async{
    String username = _usernameController.value.text;
    String password = _passwordController.value.text;
    var user = UserPayload(username: username, password: password);

    signIn(user).then((res) {

      Map<String, dynamic> map = jsonDecode(res.body);

      print(map['status']);
      if(map['status'] == 'Success'){
        Fluttertoast.showToast(
            msg: "Login Sucsess",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.green,
            fontSize: 16.0);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homePage()));


      }else {
        Fluttertoast.showToast(
            msg: "Login Failed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0);
      }

    });

    // if(_usernameController.text == "rakib" && _passwordController.text == "123"){
    //   Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => const homePage()));
    //
    // }else{
    //   Fluttertoast.showToast(
    //       msg: "Login Failed",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 3,
    //       backgroundColor: Colors.white,
    //       textColor: Colors.red,
    //       fontSize: 16.0);
    // }




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
        'BdExclusive'
      ),

    ),

      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[

              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'User Login',
                    style: TextStyle(fontSize: 25, color: Colors.indigo),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('Forgot Password',),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      login();
                    },
                  )
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const registration()));

                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}
