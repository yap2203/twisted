import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import 'app.dart';

void main() {
  runApp(const App());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter 3D'),
        ),
        body:const Center(
          child: Column(
            children: [
              Text('Hello World!'),
              SizedBox(height:400, child: Flutter3DViewer(src: 'assets/3d/kuronami-vandal.glb')),
            ],
          ),
        ),
      ),
    );
  }
}




