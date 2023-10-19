import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Page'),
      ),
      body: const Center(
        child: Text('This is the Drawer Page'),
      ),
    );
  }
}
