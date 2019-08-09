# Provider Pattern (26 July 2019)
<img src="https://user-images.githubusercontent.com/48744669/61939475-8cf42100-afbd-11e9-8eed-dbbdde1cabeb.png" width="20%"/>
<img src="https://user-images.githubusercontent.com/48744669/61939476-8cf42100-afbd-11e9-8e59-44a0b72fa32f.png" width="20%"/>

## Overview
<b>Provider Pattern</b> is another pattern design approach when building apps on flutter. We can say that this pattern is suitable for newbie in flutter because the concept is simpler than one of the famous pattern in flutter : BLoC (Business Logic Component) pattern. In BLoC, we use Stream, Sink, Rx when designing our layout and business logic. Because of this, many newbie flutter developer feel confused when applied this pattern into their project. Provider pattern works similarly like DataBinding in android. It is not as same as the android, but we can take the concept from DataBinding to make us easier to understand what is going on in this pattern.

## Getting started
Please add this dependency in pubspec.yaml

    flutter :
      provider : 3.0.0
      
This is the latest version when i write this README. Please check the newest version in this link : https://pub.dev/packages/provider

## MainProvider

    class MainProvider with ChangeNotifier
    
In DataBinding android, we extend the model class with 'BaseObservable' while in flutter we extend 'ChangeNotifier'. In this class, we  define the changable propoerty in our layout as private, for example the text, background color, etc. Then, we set the getter and setter for each property. Notice that the setter getter format is pretty different from the setter getter in other programming language. This is because of we write a code in Dart language, which is the base language that used in this framework.

### Getter
    Color get lamp => _lamp;
    
Getter method in dart programming language is different from the other languages. In dart, we can use 'get' prefix to show that this is a getter method. We don't use bracket in the getter method.
    
### Setter
    void setLamp(Color lamp){
      this._lamp = lamp;
      notifyListeners();
    }

Notice that in the setter method, we called a function named 'notifyListeners()'.<strong> Basically, this is the key of provider pattern</strong>. When this method is called, all the consumer widget will listen to the change and do rebuild itself. So, be carefull when using this method, it will refresh all the widget that listen to the provider.
#### Note : if you want to use provider without listen to any changes, you can use this line of code instead of Consumer() :
        YourProvider _provider = Provider.of<YourProvider>(context, listen:false);

### ChangeNotifierProvider()
Place this widget in the root of your layout. It has 2 mandatory parameter :

    1. builder : used to create the instance of your provider
    2. child   : used to define widget inside <strong>ChangeNotifierProvider()</strong>
    
The function of this widget is to define the provider only once for your entire layout inside this widget. So, when you need to access the provider that already initiate in <strong>ChangeNotifierProvider()</strong>, you can use <strong>Consumer</strong> or <strong>Provider.of()</strong>

### Consumer
This widget is used to access the existing provider. It will lift up to the parent that has <strong>ChangeNotifierProvider()</strong>. When it find this widget, it will take the instance of your provider and return it in the argument. It has 1 optional parameter :

    1. builder : it has access to your provider and it needs a return;
    
Widget inside <strong>Consumer</strong> will be rebuild if <strong>notifyListener()</strong> is called.

### Provider.of()
Provider.of() is the alternative way when you don't want to use Consumer. It has the same functionality as the <strong>Consumer()</strong>, but you can add an optional argument called <strong>listen</strong>. If you set it to 'false', then the widget won't be rebuild when <strong>notifyListener()</strong> is called.

## Tips and Trick
### Put Consumer as deep as possible
Please use Consumer() in the widget that need it. Because Consumer will listen to any changes and rebuild your widget when notifyListener() is called in our provider class.

### Avoid calling notifyListener() inside Consumer()
Forever loop will occur when you call notifyListener() inside the Consumer() because when you called notifyListener(), it will update/rebuild the widget, and it will call the notifyListener() again.

### Avoid creating your provider besides ChangeNotifierProvider()
1 page / layout of your apps may have more than 1 provider, but each provider should be initiate in the ChangeNotifierProvider() only to make sure that all your state and data that store in that provider won't loss.

### Use Consumer(context, listen:false) if needed
Rebuild all the widget makes your apps heavy. If you don't need changes in that widget but still need it to access some data, please use <strong>Consumer(context, listen:false)</strong>



