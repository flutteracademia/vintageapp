
// ignore_for_file: unnecessary_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintageapp/onboarding/sign_up_page.dart';
// Create a variable that stores the converted currency 
// Create a function that multiplies the value given by the textfield
// Store the variable that we created 
// Display the variable

class ForgotPasswordMaterialPage extends StatefulWidget {
  const ForgotPasswordMaterialPage({super.key});

  @override
  State<ForgotPasswordMaterialPage>  createState()=> _ForgotPasswordMaterialPageState(); 
}
class _ForgotPasswordMaterialPageState extends State<ForgotPasswordMaterialPage> {
double result =0;
  final TextEditingController textEditingController = TextEditingController();
  void convert() {
     result = double.parse(textEditingController.text) * 81;
     setState(() {
             
            });
  }
  @override
  Widget build(BuildContext context) {
  // OutlineInputborder is a function or method that when called sets the border of the text field
    const border = OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                  style:BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              );
    // ignore: unused_local_variable
    const underlineInputBorder = UnderlineInputBorder();
    return  Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(''),
       ),
      body:Center( 
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          // int => string integervalue.toString()
          //  string  => int  int.parse(stringvalue)
          const SizedBox(height: 10),
          SvgPicture.asset("assets/Vector.svg",
          width: 50,
          height: 50,
          ),
          const SizedBox(height: 10),
          Text('VINTAGE',
          style:  GoogleFonts.montserrat(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade900
          ),      
          ),
          const SizedBox(height: 50,),
            Text('Forgot Password'
            ,
          style:  GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade900
          ),      
            ),
            const SizedBox(height: 8,),
            Text('Enter your Email, we will send you a verification code.',
            textAlign: TextAlign.center,
          style:  GoogleFonts.inter(
            fontSize: 17,
            color: Colors.grey
          ),      
            ),
            const SizedBox(height: 7,),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: textEditingController,
              style:  GoogleFonts.inter(
                color: Colors.grey,
                
              ),
              decoration:  InputDecoration(
                hintText: 'Your email',
                hintStyle: const TextStyle(
                  color: Colors.black54
                ),
                prefixIcon: const Icon(Icons.email_outlined),
                prefixIconColor: Colors.grey, 
                filled: true,
                fillColor: Colors.grey.shade100,
                 enabledBorder: border,
              ),
              keyboardType:   TextInputType.name
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(onPressed:null,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueGrey.shade900,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity,50),
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(50)
              )
            ), 
            child: const Text('Send Code',
            style: TextStyle(fontWeight: FontWeight.w300,
            color: Colors.white),)
            ),
            ),
        ],
      ),
      ) 
    );
  }
}


