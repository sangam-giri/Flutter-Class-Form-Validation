import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Something';
                      }
                    }),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Something';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter valid email';
                      }
                    }),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Validated');
                } else {
                  print('Not Validated');
                }
              },
              child: const Text('Submit')),
        ],
      ),
    );
  }
}
