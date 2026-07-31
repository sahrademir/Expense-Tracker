import 'package:flutter/material.dart';

import 'package:expense_tracker_flutter/core/colors.dart';

import 'package:expense_tracker_flutter/widgets/auth_card.dart';
import 'package:expense_tracker_flutter/widgets/auth_header.dart';
import 'package:expense_tracker_flutter/widgets/custom_text_field.dart';
import 'package:expense_tracker_flutter/widgets/primary_button.dart';

import 'package:expense_tracker_flutter/services/api_service.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({
    super.key
  });


  @override
  State<LoginScreen> createState() => _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen> {


  final usernameController = TextEditingController();

  final passwordController = TextEditingController();


  bool isLoading = false;



  @override
  void dispose() {

    usernameController.dispose();

    passwordController.dispose();

    super.dispose();

  }





  Future<void> login() async {


    setState(() {

      isLoading = true;

    });



    try {


      await ApiService.login(

        usernameController.text.trim(),

        passwordController.text.trim(),

      );



      if(!mounted) return;


      Navigator.pushReplacementNamed(
        context,
        "/dashboard",
      );


    }


    catch(e){


      if(!mounted) return;


      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(

          content: Text(
            e.toString(),
          ),

        ),

      );


    }



    finally{


      if(mounted){

        setState(() {

          isLoading=false;

        });

      }

    }



  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      resizeToAvoidBottomInset: true,


      body: Stack(

        children: [


          const AuthHeader(),



          SafeArea(

            child: Column(

              children: [


                const Spacer(),



                AuthCard(

                  heightFactor: 0.46,


                  child: Column(

                    mainAxisSize: MainAxisSize.min,


                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [


                      const Text(

                        "SIGN IN",

                        style: TextStyle(

                          fontSize:24,

                          fontWeight:FontWeight.w600,

                          color:AppColors.text,

                        ),

                      ),



                      const SizedBox(height:24),





                      CustomTextField(

                        hintText:"Username",

                        controller:usernameController,

                      ),



                      const SizedBox(height:12),





                      CustomTextField(

                        hintText:"Password",

                        obscureText:true,

                        controller:passwordController,

                      ),




                      const SizedBox(height:18),





                      Center(

                        child:GestureDetector(

                          onTap:(){

                            Navigator.pushReplacementNamed(

                              context,

                              "/register",

                            );

                          },


                          child:const Text.rich(

                            TextSpan(

                              text:"Don't have an account? ",

                              children:[

                                TextSpan(

                                  text:"Sign Up",

                                  style:TextStyle(

                                    fontWeight:FontWeight.bold,

                                  ),

                                ),

                              ],

                            ),

                          ),

                        ),

                      ),




                      const SizedBox(height:18),




                      PrimaryButton(
                        text: isLoading ? "LOADING..." : "SIGN IN",
                        onPressed: () {
                          if (!isLoading) {
                            login();
                          }
                        },
                      ),



                    ],

                  ),

                ),

              ],

            ),

          ),


        ],

      ),

    );

  }


}