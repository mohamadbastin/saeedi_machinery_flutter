import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:saeedi_machinery/pages/home/home.dart';
import 'package:saeedi_machinery/pages/featured/featured.dart';
import 'package:saeedi_machinery/pages/about/about.dart';
import 'package:saeedi_machinery/pages/main.dart';
import 'package:saeedi_machinery/pages/profile/profile.dart';
import 'style.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  print("object is running now");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MyWhite,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: MedWhiteLightText,
        ),
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/reset-pass': (context) => ForgotPasswordScreen(),
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _isLoggedInn;
  String _token;
  @override
  void initState() {
    _isLoggedInn = _isLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isLoggedInn,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MyProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == 0) {
            return LoginScreen();
          } else if (snapshot.data == 1) {
            return MyHomePage(title: 'Flutter Demo Home Page');
          }
        }

        return Container();
      },
    );
  }

  Future<int> _isLoggedIn() async {
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await _prefs;
    final String token = (prefs.getString('username') ?? 'none');
    print("token");
    print(token);
    if (token == 'none') {
      return Future.value(0);
    } else {
      _token = token;
      return Future.value(1);
    }
    // return Future.value(1);
  }
}

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "assets/icons/logo.svg",
          height: 150,
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String url =
      "https://www.saeedimachinery.com/wp-json/saeediapi/v1/logincheck/";

  _login() async {
    print("here");
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ));

    if (_usernameController.text != null &&
        _passwordController.text != null &&
        _usernameController.text.contains("@")) {
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      // dio.options.headers["authorization"] =
      //     "Basic Y2tfNjI1MjU4NjJjOGZlNzg2ZWY3NTFmMzBlMzE1NjRmMmNkMjc3YjQzZTpjc18xNGE0YTBlYjU4MmRhNTZlZTg2ZjIwYjljZTRlMWJmNTUzMjdlYzA1";
      Response response;
      // var data = json.encode({
      //   "email": "bastinmohamad@gmail.com",
      //   "username": "mmdboob",
      //   "mobile": "+989981072593",
      //   "password": "09379852503"
      // });
      var data = json.encode({
        "email": _usernameController.text,
        "password": _passwordController.text
      });
      print(data);
      response = await dio.post(url, data: data).then((response) => response);

      print(response);

      if (response.statusCode == 200) {
        Navigator.pop(context);
        var un = response.data["data"]["user_login"];
        print(un);
        final SharedPreferences prefs = await _prefs;
        prefs.setString('username', un);
        prefs.setString("email", _usernameController.text);
        Navigator.popAndPushNamed(context, '/home');
      } else {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Container(
                    child: Center(
                      child: Text(response.data),
                    ),
                    height: 200,
                  ),
                ));
      }
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Container(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("please fill the form",
                            style: TextStyle(fontSize: 20)),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("ok", style: TextStyle(fontSize: 20)))
                      ],
                    ),
                  ),
                ),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 70, right: 20),
              child: TextButton(
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () => Navigator.popAndPushNamed(context, '/home'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/icons/logo.svg",
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10)),
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: 'Email',
                    icon: Icon(Icons.mail),
                    // border: InputBorder
                  ),
                  // cursorWidth: 30,
                  controller: _usernameController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10)),
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: 'Password',
                    icon: Icon(Icons.lock),

                    // border: InputBorder
                  ),
                  // cursorWidth: 30,
                  controller: _passwordController,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => _login(),
                      child: Container(
                        height: 50,
                        width: 300,
                        //
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: TextButton(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/reset-pass'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: Colors.black54,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(color: Colors.white)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.white)),
                  // height: 40,
                  // width: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, '/signup'),
                    ),
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  String url =
      "https://www.saeedimachinery.com/wp-json/saeediapi/v1/registration/";

  _signup() async {
    print("here");
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ));

    if (_emailController.text != null &&
        _passwordController.text != null &&
        _usernameController.text != null &&
        _phoneController.text != null &&
        _emailController.text.contains("@")) {
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] =
          "Basic Y2tfNjI1MjU4NjJjOGZlNzg2ZWY3NTFmMzBlMzE1NjRmMmNkMjc3YjQzZTpjc18xNGE0YTBlYjU4MmRhNTZlZTg2ZjIwYjljZTRlMWJmNTUzMjdlYzA1";
      Response response;
      // var data = json.encode({
      //   "email": "bastinmohamad@gmail.com",
      //   "username": "mmdboob",
      //   "mobile": "+989981072593",
      //   "password": "09379852503"
      // });
      var data = json.encode({
        "email": _emailController.text,
        "mobile": _phoneController.text,
        "username": _usernameController.text,
        "password": _passwordController.text
      });
      print(data);
      response = await dio.post(url, data: data).then((response) => response);

      print(response);

      if (response.statusCode == 200) {
        Navigator.pop(context);

        final SharedPreferences prefs = await _prefs;
        prefs.setString('username', _usernameController.text);
        prefs.setString("email", _emailController.text);
        Navigator.popAndPushNamed(context, '/home');
      } else {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Container(
                    child: Center(
                      child: Text(response.data),
                    ),
                    height: 200,
                  ),
                ));
      }
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Container(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("please fill the form",
                            style: TextStyle(fontSize: 20)),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("ok", style: TextStyle(fontSize: 20)))
                      ],
                    ),
                  ),
                ),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 70, right: 20),
                child: TextButton(
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Navigator.popAndPushNamed(context, '/home'),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/icons/logo.svg",
                  height: 150,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10)),
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Email',
                      icon: Icon(Icons.mail),
                      // border: InputBorder
                    ),
                    // cursorWidth: 30,
                    controller: _emailController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10)),
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Username',
                      icon: Icon(Icons.person),
                      // border: InputBorder
                    ),
                    // cursorWidth: 30,
                    controller: _usernameController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10)),
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Mobile',
                      icon: Icon(Icons.phone),
                      // border: InputBorder
                    ),
                    // cursorWidth: 30,
                    controller: _phoneController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10)),
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Password',
                      icon: Icon(Icons.lock),

                      // border: InputBorder
                    ),
                    // cursorWidth: 30,
                    controller: _passwordController,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _signup(),
                        child: Container(
                          height: 50,
                          width: 300,
                          //
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text("SIGN UP",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(right: 40),
                      //     child: TextButton(
                      //       child: Text(
                      //         "Forgot Password",
                      //         style: TextStyle(fontSize: 16),
                      //       ),
                      //       onPressed: null,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.black54,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(color: Colors.white)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.white)),
                    // height: 40,
                    // width: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () =>
                            Navigator.popAndPushNamed(context, '/login'),
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _usernameController = new TextEditingController();
  // TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 70, right: 20),
              child: TextButton(
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () => Navigator.popAndPushNamed(context, '/home'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/icons/logo.svg",
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10)),
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: 'Email',
                    icon: Icon(Icons.mail),
                    // border: InputBorder
                  ),
                  // cursorWidth: 30,
                  controller: _usernameController,
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.black38),
              //       borderRadius: BorderRadius.circular(10)),
              //   width: 300,
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   child: TextFormField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       focusedBorder: InputBorder.none,
              //       enabledBorder: InputBorder.none,
              //       errorBorder: InputBorder.none,
              //       disabledBorder: InputBorder.none,
              //       labelText: 'Password',
              //       icon: Icon(Icons.lock),

              //       // border: InputBorder
              //     ),
              //     // cursorWidth: 30,
              //     controller: _passwordController,
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 300,
                      //
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextButton(
                          child: Text("Reset Password",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(right: 40),
                    //     child: TextButton(
                    //       child: Text(
                    //         "Forgot Password",
                    //         style: TextStyle(fontSize: 16),
                    //       ),
                    //       onPressed: null,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: Colors.black54,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(color: Colors.white)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.white)),
                  // height: 40,
                  // width: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                    ),
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
