# Provider Pattern (26 July 2019)
<img src="https://user-images.githubusercontent.com/48744669/61939475-8cf42100-afbd-11e9-8eed-dbbdde1cabeb.png" width="20%"/>
<img src="https://user-images.githubusercontent.com/48744669/61939476-8cf42100-afbd-11e9-8e59-44a0b72fa32f.png" width="20%"/>

## Overview
<b>Provider Pattern</b> is another pattern design approach when building apps on flutter. We can say that this pattern is suitable for newbie in flutter because the concept is simpler than one of the famous pattern in flutter : BLoC (Business Logic Component) pattern. In BLoC, we use Stream, Sink, Rx when designing our layout and business logic. Because of this, many newbie flutter developer feel confused when applied this pattern into their project. Provider pattern works similarly like DataBinding in android. It is not as same as the android, but we can take the concept from DataBinding to make us easier to understand what is going on in this pattern.

## Getting started
Please add this dependency in pubspec.yaml

    flutter :
      provider : 3.0.0
      
Please check the newest version in this link : https://pub.dev/packages/provider

## MainProvider

    class MainProvider with ChangeNotifier
    
In DataBinding android, we extend the model class with 'BaseObservable' while in flutter we extend 'ChangeNotifier'. In this class, we  define the changable propoerty in our layout as private, for example the text, background color, etc. Then, we set the getter and setter for each property. Notice that the setter getter format is pretty different from the setter getter in other programming language. This is because of we write a code in Dart language, which is the base language that used in this framework.

### Getter
    Color get lamp => _lamp;
    
### Setter
    void setLamp(Color lamp){
      this._lamp = lamp;
      notifyListeners();
    }

Notice that in the setter method, we called a function named 'notifyListeners()'. This method is as same as the 'notifyPropertyChanged()' in DataBinding android. notifyListeners() called when we change the value of the property in the layout. This method will notify all the widget that listen to changed property and update the value.
