import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MainProvider with ChangeNotifier{
  // ATTRIBUTE
  bool _isOn = true;
  Color _background = Colors.white;
  Color _lamp = Colors.black;
  String _text = 'Off';

  // GETTER
  bool get isOn => _isOn;
  Color get background => _background;
  Color get lamp => _lamp;
  String get text => _text;

  // SETTER
  set isOn(bool isOn){
    this._isOn = isOn;
    notifyListeners();
    if(isOn){
      background = Colors.white;
      lamp = Colors.black;
      text = 'Off';
    }
    else{
      background = Colors.black;
      lamp = Colors.white;
      text = 'On';
    }
  }

  set background(Color background){
    this._background = background;
    notifyListeners();
  }

  set lamp(Color lamp){
    this._lamp = lamp;
    notifyListeners();
  }

  set text(String text){
    this._text = text;
    notifyListeners();
  }
}