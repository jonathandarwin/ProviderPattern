import 'package:flutter/material.dart';
import 'package:provider_pattern/main_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(Main());

class Main extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Provider Pattern",
      home: RootLayout(),
    );
  }
}

class RootLayout extends StatelessWidget{
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      builder: (context) => MainProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider Pattern'),
        ),
        body: Lamp(),
        floatingActionButton: SwitchLamp(),
      ),
    );
  }
}

class Lamp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Consumer<MainProvider>(
      builder: (context, provider, _) => Container(
        color: provider.background,
        child: Center(
          child: Icon(Icons.lightbulb_outline,
            color: provider.lamp,),
        ),
      ),
    );
  }
}

class SwitchLamp extends StatelessWidget{  
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<MainProvider>(context); 

    return Consumer<MainProvider>(
      builder: (contexet, provider, _) => FloatingActionButton(
        onPressed: (){
          provider.setIsOn(provider.isOn == false);        
        },
        child: Text(provider.text),
      ),
    );
  }
}