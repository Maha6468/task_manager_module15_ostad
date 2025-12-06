
import 'package:flutter/material.dart';
import 'package:task_manager_module15_ostad/ui/screens/get_started_with_page.dart';
import 'package:task_manager_module15_ostad/ui/screens/join_with_us.dart';
import 'package:task_manager_module15_ostad/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager_module15_ostad/ui/screens/splash_screen.dart';
import 'package:task_manager_module15_ostad/ui/screens/update_profile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Colors.amber,
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600
              )
          ),


          inputDecorationTheme: InputDecorationTheme(

            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
          ),


          filledButtonTheme: FilledButtonThemeData(
               style: FilledButton.styleFrom(
                   backgroundColor: Colors.green,
                   fixedSize: Size.fromWidth(double.maxFinite),
                   padding: EdgeInsets.symmetric(vertical: 12),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                   )
               )
          )
      ),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen':(_) => SplashScreen(),
        '/Login': (_)=> Get_Started_With(),
        '/SignUp': (_)=> Join_With_Us(),
        '/NavBar': (_)=> MainNavBarHolderScreen(),
        '/updateProfile': (_)=> UpdateProfile(),
      },
    );
  }
}