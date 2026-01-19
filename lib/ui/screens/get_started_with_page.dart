import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_module15_ostad/ui/screens/join_with_us.dart';
import '../../data/service/api_caller.dart';
import '../utils/urls.dart';
import '../widgets/screen_background.dart';
import 'your_email_address.dart';
import 'main_nav_bar_holder_screen.dart';

class Get_Started_With extends StatefulWidget {
  const Get_Started_With({super.key});

  @override
  State<Get_Started_With> createState() => _Get_Started_WithState();
}

class _Get_Started_WithState extends State<Get_Started_With> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signInProgress = false;


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
            padding: EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Expanded(child: SizedBox()),
                  //Spacer(),
                  const SizedBox(height: 140,),
                  Text('Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),

                    validator: (String ? value){

                      if(value == null || value.isEmpty){
                        return 'please enter your email';
                      }

                      final emailRegExp = RegExp(  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                      if(!emailRegExp.hasMatch(value)){
                        return 'Please enter valid email';
                      }

                      return null;

                    },

                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),

                    obscureText: true,
                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return 'please enter your password';
                      }

                      if(value.length <= 6){
                        return 'Enter password more than 6';
                      }

                      return null;
                    },

                  ),
                  const SizedBox(height: 20,),
                  FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signIn();
                        }
                      },
                      child: Icon(Icons.arrow_circle_right_outlined)),
                  const SizedBox(height: 35,),

                  Center(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: _onTabForgetPassword,
                            child: Text('Forget password',style: TextStyle(color: Colors.black),)
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Sign Up', style: TextStyle(color: Colors.green,fontSize: 18),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =_onTabSignUp
                                ),
                              ],

                          ),
                        )
                      ],
                    ),
                  ),
                  //Expanded(child: SizedBox()),
                  //Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  _clearTextField(){
    _emailController.clear();
    _passwordController.clear();
  }


  Future<void> _signIn()async{
    setState(() {
      _signInProgress = true;
    });

    Map<String,dynamic>requestBody = {
      "email":_emailController.text,
      "password":_passwordController.text,
    };

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );

    setState(() {
      _signInProgress = false;
    });

    if(response.isSuccess){
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign In success..!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),

      );

      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => MainNavBarHolderScreen()));

    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.responseData['data']),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),

      );
    }}



  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


}