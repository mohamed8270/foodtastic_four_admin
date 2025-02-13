import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/features/wrapper/wrapper.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrapper();
  }
}

