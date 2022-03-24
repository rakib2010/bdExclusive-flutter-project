import 'package:bdexclusive/helper/http_helper.dart';
import 'package:bdexclusive/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';


class registration extends StatelessWidget {
  const registration({Key? key}) : super(key: key);

  static const String _title = 'BdExclusive';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      );

  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  save() async {
    String name = _nameController.value.text;
    String username = _usernameController.value.text;
    String password = _passwordController.value.text;
    var user = User(name: name, username: username, password: password);
    print(user);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
    prefs.setString("username", username);
    prefs.setString("password", password);

    signUp(user).then((res) {
      print(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Register here',
                  style: TextStyle(fontSize: 25, color: Colors.indigo),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
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
            Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_nameController.value.text != "" &&
                        _usernameController.value.text != "" &&
                        _passwordController.value.text != "") {
                      save();
                      Fluttertoast.showToast(
                          msg: "Registration Sucsessfull",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.white,
                          textColor: Colors.green,
                          fontSize: 16.0);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Registration Failed",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.white,
                          textColor: Colors.red,
                          fontSize: 16.0);
                    }
                  },
                )),
            Row(
              children: <Widget>[
                const Text(
                  'Go to Login page',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Click here',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));

                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
