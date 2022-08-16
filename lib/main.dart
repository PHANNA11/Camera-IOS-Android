import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Camera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

File? file;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: file == null
              ? const SizedBox()
              : Image(image: FileImage(File(file!.path))),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                getgallary();
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.image),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                getCamera();
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }

  Future<void> getCamera() async {
    final files = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      file = File(files!.path);
    });
  }

  Future<void> getgallary() async {
    final files = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(files!.path);
    });
  }
}
