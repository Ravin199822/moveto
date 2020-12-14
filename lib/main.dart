import 'package:flutter/material.dart';
import 'package:moveto/screens/dashboard.dart';
import './screens/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'globals.dart' as globals;


// import './screens/registration.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('user_id');
  print(email);
  runApp(MaterialApp(home: email == null ? Login() : Dashboard()));
  // runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // bool flag = false;
  // getStringValuesSF(context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return String
  //   String std = prefs.getString('user_id');
  //   runApp(MaterialApp(home: email == null ? Login() : Home()));
  //   if (std != null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Dashboard()),
  //     );
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Login()),
  //     );
  //   }
  //   // String name = prefs.getString('display_name');
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // actions: getStringValuesSF(context),
      // home: flag ? MyHomePage(title: 'Flutter Login') : Dashboard,
    );
  }
}
