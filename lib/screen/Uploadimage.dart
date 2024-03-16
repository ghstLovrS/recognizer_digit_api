//screen/Uploadimage.dart
import 'dart:io';
import 'dart:typed_data';

import 'package:recognizer_digit_api/input_output/camera_gallery.dart';
import 'package:recognizer_digit_api/input_output/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UploadImage extends StatelessWidget {
  static GlobalKey previewContainer1 = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final devicephoto = Provider.of<CameraGallery>(context);
    final showresult1 = Provider.of<Output>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('Upload Image'),
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: previewContainer1,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              //width: MediaQuery.of(context).size.width,
              width: double.infinity,

              color: Colors.white,
              height: 400,

              child:
                  Consumer<CameraGallery>(builder: (context, provider, child) {
                return provider.imagereturn() == 'yes'
                    ? Image.file(provider.imageFile as File)
                    : Image.asset(
                        'assets/download.png',
                        fit: BoxFit.cover,
                      ); //drawprovider.drawingBoard(context);
              }),
            ),
          ),
          // ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 5.0),
                borderRadius: BorderRadius.circular(15.0)),
            child: ElevatedButton(
              child: Text(
                'Upload Photo',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              onPressed: () {
                devicephoto.showdialong(context);
              },
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              //MediaQuery.of(context).size.width,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black, width: 5.0),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                'Identify',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Identifying...'),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.orange),
                          ),
                        ],
                      ),
                    );
                  });

              String path = devicephoto.imageFile.toString();

              path = path.split('\'')[1];
              final ByteData bytedata = await rootBundle.load(path);
              // print("--------------2222222");
              final Uint8List list = bytedata.buffer.asUint8List();

              showresult1.showdialongoutput(context, list);
            },
          ),
        ],
      ),
    );
  }
}
