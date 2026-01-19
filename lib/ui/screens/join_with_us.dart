import 'package:flutter/material.dart';

import '../../data/service/api_caller.dart';
import '../utils/urls.dart';
import '../widgets/screen_background.dart';
import 'pin_verification.dart';

class Join_With_Us extends StatefulWidget {
  const Join_With_Us({super.key});

  @override
  State<Join_With_Us> createState() => _Join_With_UsState();
}

 class _Join_With_UsState extends State<Join_With_Us> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signUpInProgress = false;







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    'Join with us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
              
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
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
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(hintText: 'First name'),
                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return 'please enter your First Name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(hintText: 'Last name'),
              
                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return 'please enter your Last Name';
                      }
                    },
              
              
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(hintText: 'Mobile'),
              
                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return 'please enter your Mobile number';
                      }
                      if( value.trim().length !=11){
                        return "Enter 11 digit number";
                      }
                    },
              
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: 'Password'),
              
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
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: !_signUpInProgress,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: FilledButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                           // Pin_Verification();
                             //Navigator.push(context, MaterialPageRoute(builder: (context)=>Pin_Verification()));
                            _signUp();
                          }

                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              children: [
                                TextSpan(
                                    text: 'Sign in',
                                    style: TextStyle(color: Colors.green)),

              
                              ],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                  ),
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
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileController.clear();
    _passwordController.clear();
  }


  Future<void> _signUp()async{
    setState(() {
      _signUpInProgress = true;
    });

    Map<String,dynamic>requestBody = {
      "email":_emailController.text,
      "firstName":_firstNameController.text,
      "lastName":_lastNameController.text,
      "mobile":_mobileController.text,
      "password":_passwordController.text,
    };

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );

    setState(() {
      _signUpInProgress = false;
    });

    if(response.isSuccess){
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up success..!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),

      );
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
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}





