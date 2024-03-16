//screen/widget.dart
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Widgetshow extends ChangeNotifier {}

takeScreenShot(GlobalKey previewContainer) async {
  RenderRepaintBoundary? boundary = previewContainer.currentContext!
      .findRenderObject() as RenderRepaintBoundary?;
  ui.Image image = await boundary!.toImage();

  var bytedata = await image.toByteData(format: ui.ImageByteFormat.png);

  Uint8List pngBytes = bytedata!.buffer.asUint8List();

  return pngBytes;
}

changeimagepathtobyte(imagepath) async {
  String path = imagepath.toString();
  final ByteData bytedata = await rootBundle.load(path.split('\'')[1]);
  final Uint8List list = bytedata.buffer.asUint8List();

  return list;
}

Widget appbar() {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      'Draw',
      style:
          //Theme.of(context).textTheme.headline1,
          TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.orange[900],
  );
}
