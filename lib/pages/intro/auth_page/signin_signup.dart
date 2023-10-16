import 'package:bprcf/pages/dashboard/dashboard.dart';
import 'package:bprcf/pages/intro/auth_page/signin.dart';
import 'package:bprcf/pages/intro/auth_page/signup.dart';
import 'package:bprcf/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInSignUp extends StatelessWidget {
  const SignInSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Consumer<Auth>(builder: (context, auth, child) {
          if (auth.authenticated) {
            return const Dashboard();
          } else {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  // decoration: BoxDecoration(
                  //   color: Colors.indigo[800],
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(200),
                  //   ),
                  // ),
                  child: Image.asset(
                    "assets/bitmap.png",
                    scale: 3,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 140.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.indigo[800],
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              "Buat Akun",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        },
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: 'Sudah Punya Akun ? '),
                                TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo[800]))
                              ]),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }
        }));
  }
}
