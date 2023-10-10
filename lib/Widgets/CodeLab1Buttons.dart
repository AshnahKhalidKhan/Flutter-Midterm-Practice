import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CodeLab1Buttons extends StatefulWidget
{
  const CodeLab1Buttons({super.key});

  @override
  State<CodeLab1Buttons> createState() => _CodeLab1ButtonsState();
}

class _CodeLab1ButtonsState extends State<CodeLab1Buttons>
{

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: ListView
      (
        padding: EdgeInsets.all(20.0),
        children: 
        [
          Center
          (
            child: Column
            (
              children: 
              [
                Image.network
                (
                  // http.get('').toString(),
                  'https://www.perfecto.io/sites/default/files/image/2021-05/image-blog-flutter-appium.jpg',
                  width: 100.0,
                  height: 100.0,
                ),
                Text("Link say image accessed"),
              ],
            ),
          ),
          Center
          (
            child: Column
            (
              children: 
              [
                Image.asset
                (
                  'lib/Assets/logo.jpg',
                  width: 100.0,
                  height: 100.0,
                ),
                Text("Assets say image accessed"),
              ],
            ),
          ),
          SizedBox(height: 50.0),
          TextField
          (
            controller: _usernameController,
            decoration: InputDecoration
            (
              filled: true,
              labelText: 'Username',
            ),
          ),
          SizedBox(height: 50.0),
          TextField
          (
            controller: _usernameController,
            textAlign: TextAlign.center,
            expands: false,
            decoration: InputDecoration
            (
              filled: true,
              label: Center
              (
                child: Text
                (
                  "Center mein hua wa ho",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField
          (
            controller: _passwordController,
            decoration: InputDecoration
            (
              filled: true,
              labelText: 'Password',
              suffixIcon: IconButton
              (
                onPressed: ()
                {
                  setState( ()
                  {
                    showPassword = !showPassword;
                  });
                }, 
                icon: Icon(showPassword ? Icons.visibility_off_rounded : Icons.visibility_rounded),
              ),
            ),
            obscureText: showPassword,
          ),
          OverflowBar
          (
            alignment: MainAxisAlignment.center,
            overflowAlignment: OverflowBarAlignment.center,
            children:
            [
              TextButton
              (
                onPressed: ()
                {
                  _usernameController.clear();
                  _passwordController.clear();
                }, 
                child: Text("CANCEL")),
              TextButton
              (
                onPressed: () {}, 
                child: Text("OK")
              ),
            ],
          ),
          Column
          (
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              TextButton
              (
                onPressed: ()
                {
                  _usernameController.clear();
                  _passwordController.clear();
                }, 
                child: Text("Amber CANCEL"),
                style: TextButton.styleFrom
                (
                  backgroundColor: Colors.amber,
                ),
              ),
            ],
          ),
          Container
          (
            child: TextButton
            (
              onPressed: () {}, 
              child: Text("Black OK"),
              style: TextButton.styleFrom
              (
                backgroundColor: Colors.black,
              ),
            ),
          ),
          Center
          (
            child: GestureDetector
            (
              child: Text
              (
                "Forgot Password?",
                style: TextStyle
                (
                  color: Colors.green,
                ),
              ),
              onTap: ()
              {
                print("Green wala forgot passwordddddddddddddddd");
              },
            ),
          ),
          Container
          (
            // height: 50.0,
            padding: EdgeInsets.all(20.0),
            color: Colors.orange,
            child: GestureDetector
            (
              child: Text
              (
                "Forgot Password?",
                textAlign: TextAlign.center,
                style: TextStyle
                (
                  color: Colors.white,
                ),
              ),
              onTap: ()
              {
                print("Printingggggggggggg");
              },
            ),
          ),
          ElevatedButton.icon
          (
            onPressed: () {},
            icon: Icon(Icons.alarm),
            label: Text("NEXT"),
          ),
          FloatingActionButton.extended
          (
            onPressed: () {}, 
            label: Text("EXTENDED FLOATING ACTION BUTTON"),
            icon: Icon(Icons.expand_circle_down_rounded),
          ),
          FloatingActionButton
          (
            onPressed: () {},
            backgroundColor: Colors.yellow,
            child: Icon(Icons.mobile_friendly_rounded),
          ),
          FilledButton
          (
            onPressed: () {}, 
            child: Text("FILLED BUTTON"),
          ),
          FilledButton.tonal
          (
            onPressed: () {}, 
            child: Text("FILLED BUTTON TONAL"),
          ),
          FilledButton.icon
          (
            onPressed: () {}, 
            icon: Icon(Icons.calendar_month_rounded), 
            label: Text("FILLED BUTTON ICON"),
          ),
          FilledButton.tonalIcon
          (
            onPressed: () {},
            icon: Icon(Icons.calendar_month_rounded),  
            label: Text("FILLED BUTTON TONAL ICON"),
          ),
          Column
          (
            crossAxisAlignment: CrossAxisAlignment.center,
             children:
             [
              Badge
              (
                backgroundColor: Colors.green,
                smallSize: 30.0,
                largeSize: 30.0,
                offset: Offset(15.0, -5.0),
                label: Icon(Icons.add, size: 20.0),
                child: Icon(Icons.shopping_bag_rounded, size: 50.0),
              ),
            ]
          ),
        ],
      ),
    );
  }
}