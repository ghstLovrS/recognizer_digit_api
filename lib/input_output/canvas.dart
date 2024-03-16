import 'package:recognizer_digit_api/server/DrawingPoints.dart';
import 'package:recognizer_digit_api/screen/PainterClass.dart';
import 'package:flutter/material.dart';

List<DrawingPoint> points = [];

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final Offset localPosition =
                renderBox.globalToLocal(details.globalPosition);
            points.add(DrawingPoint(
              points: localPosition,
              paint: Paint()
                ..strokeCap = StrokeCap.round
                ..isAntiAlias = true
                ..color = Colors.black
                ..strokeWidth = 25.0,
            ));
          });
        },
        onPanStart: (details) {
          setState(() {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final Offset localPosition =
                renderBox.globalToLocal(details.globalPosition);
            points.add(DrawingPoint(
              points: localPosition,
              paint: Paint()
                ..strokeCap = StrokeCap.round
                ..isAntiAlias = true
                ..color = Colors.black
                ..strokeWidth = 25.0,
            ));
          });
        },
        onPanEnd: (details) {
          setState(() {
            points.add(DrawingPoint(
              points: Offset.zero, // You can adjust this value as needed
              paint: Paint(),
            ));
          });
        },
        child: CustomPaint(
          size: Size.fromHeight(450.0),
          painter: DrawingPainter(pointsList: points),
        ),
      ),
    );
  }
}

class Draw1 extends ChangeNotifier {
  Widget cleancanvas() {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.clear),
      onPressed: () {
        points.clear();
        notifyListeners();
      },
    );
  }

  void clean() {
    points.clear();
    notifyListeners();
  }
}
