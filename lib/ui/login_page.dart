import 'package:flutter/material.dart';
import 'package:fluttertest/ui/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Custom Title')), body: const Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";
  TextEditingController controller = TextEditingController();

  void onClick() {
    name = controller.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  name: name,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              labelText: "Type Your Name:",
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: Colors.lightGreen)),
              suffixIcon: IconButton(
                icon: const Icon(Icons.done),
                splashColor: Colors.white,
                tooltip: "Submit",
                onPressed: onClick,
              )),
        ),
      ),
    );
  }
}
