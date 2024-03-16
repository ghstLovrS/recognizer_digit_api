//screen/Layout.dart
import 'package:recognizer_digit_api/input_output/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:recognizer_digit_api/screen/widget.dart';
import 'package:recognizer_digit_api/input_output/canvas.dart';

class Layout extends StatelessWidget {
  static GlobalKey previewContainer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final showresult = Provider.of<Output>(context);
    final draw = Provider.of<Draw1>(context);

    return Scaffold(
      appBar: appbar(),
      body: Column(
        children: <Widget>[
          RepaintBoundary(
            key: previewContainer,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.76,
              color: Colors.white,
              child: DrawingBoard(),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
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
                ),
              );

              var image = await takeScreenShot(previewContainer);
              showresult.showdialongoutput(context, image);
              draw.clean();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              height: 60.0,
              margin: EdgeInsets.only(
                  left: 20.0, right: 100.0, top: 0.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              child: Text(
                'Identify',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: draw.cleancanvas(),
      ),
    );
  }

  PreferredSizeWidget appbar() {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        'Draw',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.orange[900],
    );
  }
}
