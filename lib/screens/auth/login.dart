import 'package:flutter/material.dart';
import 'package:flutter_ex_ecom/repository/authrepo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController contName = TextEditingController();
  TextEditingController contPassword = TextEditingController();

  input(
    cont,
    hintText,
  ) {
    return TextField(
      controller: cont,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }

  login() {
    AuthRepo()
        .loginUser(contName.text.trim(), contPassword.text.trim())
        .then((value) {
      if (value == 'NA') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User or Password is Incorrect')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Success Token : $value')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            input(contName, 'Enter Name'),
            const SizedBox(
              height: 14,
            ),
            input(contPassword, 'Enter Password'),
            const SizedBox(
              height: 14,
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    ));
  }
}
