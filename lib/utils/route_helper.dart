import 'dart:async';

import 'package:flutter/material.dart';

class RouteHelper {
  static pushWidget(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
