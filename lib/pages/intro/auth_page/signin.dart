import 'package:bprcf/pages/dashboard/dashboard.dart';
import 'package:bprcf/pages/dashboard/verification/verification_page.dart';
import 'package:bprcf/pages/home.dart';
import 'package:bprcf/pages/intro/auth_page/forgot_pass.dart';
import 'package:bprcf/pages/intro/auth_page/signup.dart';
import 'package:bprcf/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      SizedBox(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Masuk ke Akun Anda',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                      _buildUsername(),
                      _buildPassword(),
                      _buildForgotLink(context),
                    ],
                  ),
                ),
                _buildSigninButton(context),
                _buildLinkSignup(context),
              ],
            ),
          )),
    );
  }

  _buildUsername() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _usernameController,
        validator: (value) =>
            value!.isEmpty ? 'please enter valid username' : null,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo)),
            focusColor: Colors.indigo,
            labelText: 'Username'),
      ),
    );
  }

  _buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _passwordController,
        validator: (value) => value!.isEmpty ? 'please enter password' : null,
        obscureText: true,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), labelText: 'Password'),
      ),
    );
  }

  _buildSigninButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.indigo[800],
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextButton(
            onPressed: () {
              Map creds = {
                'username': _usernameController.text,
                'password': _passwordController.text,
                'device_name': 'mobile'
              };

              if (_formKey.currentState!.validate()) {
                // print(creds);
                Provider.of<Auth>(context, listen: false).login(creds: creds);
                Provider.of<Auth>(context, listen: false).getDeviceDetails();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerificationPage()));
              }
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Dashboard()));
            },
            child: const Text(
              "Masuk",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          // image: DecorationImage(
          //     image: NetworkImage(
          //         'https://www.pngkey.com/png/full/666-6663236_blue-header-png-6-png-image-blue.png'),
          //     fit: BoxFit.fitHeight),
          ),
      child: SizedBox(
        height: 400,
        child: Image.asset(
          "assets/bitmap.png",
          scale: 3,
        ),
      ),
    );
  }

  _buildLinkSignup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignUp()));
        },
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Tidak Punya Akun ? '),
                TextSpan(
                    text: 'Daftar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.indigo[800]))
              ]),
        ),
      ),
    );
  }

  _buildForgotLink(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
              children: <TextSpan>[
                const TextSpan(
                    text: 'Lupa kata sandi ? ',
                    style: TextStyle(color: Colors.indigo)),
              ]),
        ),
      ),
    );
  }
}
