import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeedi_machinery/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Profile extends StatelessWidget {
//   // This widget is the root of your application.
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   // var prefs;
//   var username = " ";
//   var email = " ";

//   doo() async {
//     final SharedPreferences prefs = await _prefs;
//     username = prefs.getString("username") ?? "none";
//     email = prefs.getString("email") ?? "none";
//     print(email);
//   }

//   logout() async {
//     final SharedPreferences prefs = await _prefs;
//     prefs.setString("username", "none");
//     prefs.setString("email", "none");
//     print("loged Out");
//   }

//   @override
//   Widget build(BuildContext context) {
//     // doo();
//     return FutureBuilder(
//         future: doo(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               backgroundColor: MyDarkOrange,
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else {
//             return Scaffold(
//               backgroundColor: MyDarkOrange,
//               appBar: AppBar(
//                 title: Center(child: Text(username)),
//                 automaticallyImplyLeading: false,
//                 backgroundColor: MyGray,
//               ),
//               body: Center(
//                 child: Container(
//                   height: 300,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(username,
//                           style: TextStyle(color: Colors.white, fontSize: 20)),
//                       Text(email,
//                           style: TextStyle(color: Colors.white, fontSize: 20)),
//                       Container(
//                         height: 50,
//                         width: 100,
//                         //
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                             color: MyDarkOrange,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Center(
//                           child: username == "none"
//                               ? TextButton(
//                                   child: Text(
//                                       "Login",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 20)),
//                                   onPressed: () => {Navigator.popAndPushNamed(context, '/login')},
//                                 )
//                               : TextButton(
//                                   child: Text("Logout",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 20)),
//                                   onPressed: () => {logout()},
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//         });
//   }
// }

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // var prefs;
  var username = " ";
  var email = " ";

  doo() async {
    final SharedPreferences prefs = await _prefs;
    username = prefs.getString("username") ?? "none";
    email = prefs.getString("email") ?? "none";
    print(email);
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("username", "none");
    prefs.setString("email", "none");
    print("loged Out");
  }

  @override
  Widget build(BuildContext context) {
    // doo();
    return FutureBuilder(
        future: doo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: MyDarkOrange,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: MyDarkOrange,
              appBar: AppBar(
                title: Center(child: Text("Profile")),
                automaticallyImplyLeading: false,
                backgroundColor: MyGray,
              ),
              body: Center(
                child: Container(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(username == "none" ? " " : username,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(username == "none" ? " " : email,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Container(
                        height: 50,
                        width: 100,
                        //
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: MyDarkOrange,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: username == "none"
                              ? TextButton(
                                  child: Text("Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  onPressed: () => {
                                    Navigator.popAndPushNamed(context, '/login')
                                  },
                                )
                              : TextButton(
                                  child: Text("Logout",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  onPressed: () => {setState((){
                                    logout();
                                  })},
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
