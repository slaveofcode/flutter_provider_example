import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/application_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Consumer<ApplicationColor>(
              builder: (ctx, applicationColor, _) => Text(
                'Example Provider',
                style: TextStyle(color: applicationColor.activeColor),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (ctx, applicationColor, _) => AnimatedContainer(
                    width: 100,
                    height: 100,
                    color: applicationColor.activeColor,
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text('Green'),
                    ),
                    Consumer<ApplicationColor>(
                      builder: (ctx, applicationColor, _) =>
                          Switch(
                        value: applicationColor.isRed,
                        onChanged: (newVal) {
                          // Only if widget has no access to ApplicationColor ChangeNotifier
                          // final appColor = Provider.of<ApplicationColor>(ctx, listen: false);
                          // appColor.setToRed = newVal;
                          applicationColor.setToRed = newVal;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text('Red'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        create: (BuildContext context) => ApplicationColor(),
      ),
    );
  }
}
