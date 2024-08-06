import 'package:flutter/material.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  String name = '';
  String password = '';
  bool islogged = false;

  final _nameController = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwords = TextEditingController();
  final _repassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Center(
          child: islogged ? _buildSucess() : _buildLogin(),
        ));
  }

  Widget _buildSucess() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check,
          color: Colors.green,
        ),
        Text("Sucess"),
      ],
    );
  }

  Widget _buildLogin() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Username"),
              validator: (text) => text!.isEmpty ? 'Enter Name' : null,
            ),
            TextFormField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email Address'),
              validator: (text) {
                if (text!.isEmpty) {
                  return "Email cannot be empty";
                }
                final regex = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
                if (!regex.hasMatch(text)) {
                  return "Invalid email format";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: _passwords,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  final regex = RegExp(
                      r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$");
                  if (!regex.hasMatch(text)) {
                    return "Invalid password format";
                  }
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: _repassword,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  final regex = RegExp(
                      r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$");
                  if (!regex.hasMatch(text)) {
                    return "Invalid password format";
                  }
                  if (_passwords.text != text) {
                    return "Passwords do not match";
                  }
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: validate,
              child: const Text("LogIn"),
            ),
          ],
        ),
      ),
    );
  }

  void validate() {
    final form = _formKey.currentState;
    if (form?.validate() == false) {
      return;
    }
    setState(() {
      islogged = true;
      name = _nameController.text;
      password = _emailcontroller.text;
    });
  }
}
