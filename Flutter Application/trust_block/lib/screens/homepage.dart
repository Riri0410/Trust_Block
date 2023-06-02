import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_block/utils/colors.dart';
import 'package:trust_block/widgets.dart/textInputBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              Container(
                child: Text(
                  "Hi Divye",
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              Container(
                child: const Text("Log In"),
                height: 140,
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
                height: 3,
              ),
            ],
          )),
    ));
  }
}
