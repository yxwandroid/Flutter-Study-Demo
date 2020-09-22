// import 'package:flutter/material.dart';
//
// class CustomSliderScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Color Picker Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Color Picker Demo"),
//         ),
//         body: SafeArea(
//           child: ColorPicker(300),
//         ),
//       ),
//     );
//   }
// }
//
// class _SliderIndicatorPainter extends CustomPainter {
//   final double position;
//
//   _SliderIndicatorPainter(this.position);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawCircle(
//         Offset(position, size.height / 2), 12, Paint()..color = Colors.black);
//   }
//
//   @override
//   bool shouldRepaint(_SliderIndicatorPainter old) {
//     return true;
//   }
// }
//
//
//
//
//
// class ColorPicker extends StatefulWidget {
//   final double width;
//
//   ColorPicker(this.width);
//
//   @override
//   _ColorPickerState createState() => _ColorPickerState();
// }
//
// class _ColorPickerState extends State<ColorPicker> {
//   final List<Color> _colors = [
//     Color.fromARGB(255, 255, 0, 0),
//     Color.fromARGB(255, 255, 128, 0),
//     Color.fromARGB(255, 255, 255, 0),
//     Color.fromARGB(255, 128, 255, 0),
//     Color.fromARGB(255, 0, 255, 0),
//     Color.fromARGB(255, 0, 255, 128),
//     Color.fromARGB(255, 0, 255, 255),
//     Color.fromARGB(255, 0, 128, 255),
//     Color.fromARGB(255, 0, 0, 255),
//     Color.fromARGB(255, 127, 0, 255),
//     Color.fromARGB(255, 255, 0, 255),
//     Color.fromARGB(255, 255, 0, 127),
//     Color.fromARGB(255, 128, 128, 128),
//   ];
//   double _colorSliderPosition = 0;
//   double _shadeSliderPosition;
//   Color _currentColor;
//   Color _shadedColor;
//
//   @override
//   initState() {
//     super.initState();
//     _currentColor = _calculateSelectedColor(_colorSliderPosition);
//     _shadeSliderPosition = widget.width / 2; //center the shader selector
//     _shadedColor = _calculateShadedColor(_shadeSliderPosition);
//   }
//
//   _colorChangeHandler(double position) {
//     //handle out of bounds positions
//     if (position > widget.width) {
//       position = widget.width;
//     }
//     if (position < 0) {
//       position = 0;
//     }
//     print("New pos: $position");
//     setState(() {
//       _colorSliderPosition = position;
//       _currentColor = _calculateSelectedColor(_colorSliderPosition);
//       _shadedColor = _calculateShadedColor(_shadeSliderPosition);
//     });
//   }
//
//   _shadeChangeHandler(double position) {
//     //handle out of bounds gestures
//     if (position > widget.width) position = widget.width;
//     if (position < 0) position = 0;
//     setState(() {
//       _shadeSliderPosition = position;
//       _shadedColor = _calculateShadedColor(_shadeSliderPosition);
//       print(
//           "r: ${_shadedColor.red}, g: ${_shadedColor.green}, b: ${_shadedColor.blue}");
//     });
//   }
//
//   Color _calculateShadedColor(double position) {
//     double ratio = position / widget.width;
//     if (ratio > 0.5) {
//       //Calculate new color (values converge to 255 to make the color lighter)
//       int redVal = _currentColor.red != 255
//           ? (_currentColor.red +
//                   (255 - _currentColor.red) * (ratio - 0.5) / 0.5)
//               .round()
//           : 255;
//       int greenVal = _currentColor.green != 255
//           ? (_currentColor.green +
//                   (255 - _currentColor.green) * (ratio - 0.5) / 0.5)
//               .round()
//           : 255;
//       int blueVal = _currentColor.blue != 255
//           ? (_currentColor.blue +
//                   (255 - _currentColor.blue) * (ratio - 0.5) / 0.5)
//               .round()
//           : 255;
//       return Color.fromARGB(255, redVal, greenVal, blueVal);
//     } else if (ratio < 0.5) {
//       //Calculate new color (values converge to 0 to make the color darker)
//       int redVal = _currentColor.red != 0
//           ? (_currentColor.red * ratio / 0.5).round()
//           : 0;
//       int greenVal = _currentColor.green != 0
//           ? (_currentColor.green * ratio / 0.5).round()
//           : 0;
//       int blueVal = _currentColor.blue != 0
//           ? (_currentColor.blue * ratio / 0.5).round()
//           : 0;
//       return Color.fromARGB(255, redVal, greenVal, blueVal);
//     } else {
//       //return the base color
//       return _currentColor;
//     }
//   }
//
//   Color _calculateSelectedColor(double position) {
//     //determine color
//     double positionInColorArray =
//         (position / widget.width * (_colors.length - 1));
//     print(positionInColorArray);
//     int index = positionInColorArray.truncate();
//     print(index);
//     double remainder = positionInColorArray - index;
//     if (remainder == 0.0) {
//       _currentColor = _colors[index];
//     } else {
//       //calculate new color
//       int redValue = _colors[index].red == _colors[index + 1].red
//           ? _colors[index].red
//           : (_colors[index].red +
//                   (_colors[index + 1].red - _colors[index].red) * remainder)
//               .round();
//       int greenValue = _colors[index].green == _colors[index + 1].green
//           ? _colors[index].green
//           : (_colors[index].green +
//                   (_colors[index + 1].green - _colors[index].green) * remainder)
//               .round();
//       int blueValue = _colors[index].blue == _colors[index + 1].blue
//           ? _colors[index].blue
//           : (_colors[index].blue +
//                   (_colors[index + 1].blue - _colors[index].blue) * remainder)
//               .round();
//       _currentColor = Color.fromARGB(255, redValue, greenValue, blueValue);
//     }
//     return _currentColor;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         // Center(
//         //   child: GestureDetector(
//         //     behavior: HitTestBehavior.opaque,
//         //     onHorizontalDragStart: (DragStartDetails details) {
//         //       print("_-------------------------STARTED DRAG");
//         //       _colorChangeHandler(details.localPosition.dx);
//         //     },
//         //     onHorizontalDragUpdate: (DragUpdateDetails details) {
//         //       _colorChangeHandler(details.localPosition.dx);
//         //     },
//         //     onTapDown: (TapDownDetails details) {
//         //       _colorChangeHandler(details.localPosition.dx);
//         //     },
//         //     //This outside padding makes it much easier to grab the   slider because the gesture detector has
//         //     // the extra padding to recognize gestures inside of
//         //     child: Padding(
//         //       padding: EdgeInsets.all(15),
//         //       child: Container(
//         //         width: widget.width,
//         //         height: 15,
//         //         decoration: BoxDecoration(
//         //           border: Border.all(width: 2, color: Colors.grey[800]),
//         //           borderRadius: BorderRadius.circular(15),
//         //           gradient: LinearGradient(colors: _colors),
//         //         ),
//         //         child: CustomPaint(
//         //           painter: _SliderIndicatorPainter(_colorSliderPosition),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         Center(
//           child: GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onHorizontalDragStart: (DragStartDetails details) {
//               print("_-------------------------STARTED DRAG");
//               _shadeChangeHandler(details.localPosition.dx);
//             },
//             onHorizontalDragUpdate: (DragUpdateDetails details) {
//               _shadeChangeHandler(details.localPosition.dx);
//             },
//             onTapDown: (TapDownDetails details) {
//               _shadeChangeHandler(details.localPosition.dx);
//             },
//             //This outside padding makes it much easier to grab the slider because the gesture detector has
//             // the extra padding to recognize gestures inside of
//             child: Padding(
//               padding: EdgeInsets.all(15),
//               child: Container(
//                 width: widget.width,
//                 height: 15,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 2, color: Colors.grey[800]),
//                   borderRadius: BorderRadius.circular(15),
//                   gradient: LinearGradient(
//                       colors: [Colors.black, _currentColor, Colors.white]),
//                 ),
//                 child: CustomPaint(
//                   painter: _SliderIndicatorPainter(_shadeSliderPosition),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // Container(
//         //   height: 50,
//         //   width: 50,
//         //   decoration: BoxDecoration(
//         //     color: _shadedColor,
//         //     shape: BoxShape.circle,
//         //   ),
//         // )
//       ],
//     );
//   }
// }
