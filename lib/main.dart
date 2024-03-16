//main.dart
import 'package:recognizer_digit_api/HoemPage.dart';
import 'package:recognizer_digit_api/input_output/camera_gallery.dart';
import 'package:recognizer_digit_api/input_output/output.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:digit_finder/screen/Output.dart';
import 'package:recognizer_digit_api/input_output/canvas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Output>(create: (_) => Output()),
        ChangeNotifierProvider<CameraGallery>(create: (_) => CameraGallery()),
        ChangeNotifierProvider<Draw1>(create: (_) => Draw1()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: //Layout(),
            //UploadImage(),
            HomePage(),
        //mainpage(),
      ),
    );
  }
}
