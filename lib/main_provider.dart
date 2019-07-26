import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MainProvider with ChangeNotifier{
  bool _isOn;
  Color _background;
  Color _lamp;
  String _text = 'Off';

  bool get isOn => _isOn;
  Color get background => _background;
  Color get lamp => _lamp;
  String get text => _text;

  void setIsOn(bool isOn){
    this._isOn = isOn;
    notifyListeners();
    if(isOn){
      setBackground(Colors.white);
      setLamp(Colors.black);
      setText('Off');
    }
    else{
      setBackground(Colors.black);
      setLamp(Colors.white);
      setText('On');
    }
  }

  void setBackground(Color background){
    this._background = background;
    notifyListeners();
  }

  void setLamp(Color lamp){
    this._lamp = lamp;
    notifyListeners();
  }

  void setText(String text){
    this._text = text;
    notifyListeners();
  }
}