import 'package:bprcf/pages/dashboard/placholder/context_placeholder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late List<TextEditingController?> controls;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP Verification',
          style: TextStyle(color: Colors.indigo.shade800),
        ),
        iconTheme: IconThemeData(color: Colors.indigo.shade800),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Lottie.asset('assets/lottie/otp.json'),
            OtpTextField(
              numberOfFields: 5,
              showFieldAsBox: true,
              borderColor: Colors.indigo.shade800,
              onCodeChanged: (String code) {},
              handleControllers: (controllers) => {controls = controllers},
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification code"),
                        content: Text('code entered $verificationCode'),
                      );
                    });
              },
            ),
            
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContextPlaceholder()));
              },
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Tidak Menerima Kode ? '),
                      TextSpan(
                          text: 'Kirim Ulang',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[800]))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
