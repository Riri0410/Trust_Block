import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_block/utils/colors.dart';
import 'package:trust_block/widgets.dart/textInputBox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _publicKeyController = TextEditingController();
  final TextEditingController _privateKeyController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _publicKeyController.dispose();
    _privateKeyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset(
                'lib/assets/logo.svg',
                height: 256,
                //color: primaryColor,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                  textEditingController: _privateKeyController,
                  hintText: "Enter your Private key",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _publicKeyController,
                  hintText: "Enter your Public key",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: const Text("Log In"),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  color: textFieldColorBG,
                ),
              ),
              Container(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an Account? "),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                  Center(
                      child: Container(
                    child: const Text(
                      "Sign Up Here!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ))
                ],
              ),
              Container(
                height: 300,
              ),
            ],
          )),
    ));
  }
}
