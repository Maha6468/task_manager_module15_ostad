import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_module15_ostad/ui/screens/join_with_us.dart';
import '../widgets/screen_background.dart';
import 'your_email_address.dart';
import 'main_nav_bar_holder_screen.dart';

class Get_Started_With extends StatefulWidget {
  const Get_Started_With({super.key});

  @override
  State<Get_Started_With> createState() => _Get_Started_WithState();
}

class _Get_Started_WithState extends State<Get_Started_With> {
  @override
  Widget build(BuildContext context) {

    void _onTabSignUp(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Join_With_Us()));
    }

    void _onTabForgetPassword(){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>Your_Email_Address()));
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenBackground(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
                //Spacer(),
                Text('Get Started With',
                  style: Theme.of(context).textTheme.titleLarge,      //p
                ),
                const SizedBox(height: 25,),
        
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 20,),
                FilledButton(
        
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavBarHolderScreen()));
                    },
                    child: Icon(Icons.arrow_circle_right_outlined)),
                const SizedBox(height: 35,),
        
                Center(
                  child: Column(
                    children: [
                      TextButton(onPressed: _onTabForgetPassword, child: Text('Forget password')),
                      RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            children: [
                              TextSpan(
                                  text: 'Sign Up', style: TextStyle(color: Colors.green),
        
                                  recognizer: TapGestureRecognizer()..onTap =_onTabSignUp
                              ),
                            ],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ),
                //Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}