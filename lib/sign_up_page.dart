

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintageapp/login_in_page.dart';
// Create a variable that stores the converted currency 
// Create a function that multiplies the value given by the textfield
// Store the variable that we created 
// Display the variable

class SecondPageMaterialPage extends StatefulWidget {
  const SecondPageMaterialPage({super.key});

  @override
  State<SecondPageMaterialPage>  createState()=> _SecondPageMaterialPageState(); 
}
class _SecondPageMaterialPageState extends State<SecondPageMaterialPage> {
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
            Text('Create Account'
            ,
          style:  GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade900
          ),      
            ),
            const SizedBox(height: 8,),
            Text('We are here to help you!'
            ,
          style:  GoogleFonts.inter(
            fontSize: 17,
            color: Colors.grey
          ),      
            ),
            const SizedBox(height: 7,),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
             style:  GoogleFonts.inter(
                color: Colors.grey,
                
              ),
              decoration:  InputDecoration(
                hintText: 'Your name',
                hintStyle: const TextStyle(
                  color: Colors.black54
                ),
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.grey, 
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: border,
              ),
              keyboardType:   TextInputType.name
            ),
          ),
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
            child: TextField(
              style: GoogleFonts.inter(
               color: Colors.grey
              ),
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline_sharp),
                prefixIconColor: Colors.grey,
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: border,
                
              ),
            ) ),
       
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(onPressed:convert,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueGrey.shade900,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity,50),
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(50)
              )
            ), 
            child: const Text('Create Account')
            ),
            ),
            const SizedBox(height: 10,),
            // Line that seperates widget
          const Row(
            children: <Widget>[
              Expanded(child: Divider(
                // Space at the end
                endIndent: 10,
                // Space at the begininig
                indent: 10,
              )
              ),

              Text("or"),

              Expanded(child: Divider(
                                endIndent: 10,
                indent: 10,
              )
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Column(
            children: [
             Padding(
               padding: const EdgeInsets.all(14.0),
               child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                minimumSize: const Size(double.infinity,50),
                shape:  RoundedRectangleBorder(  borderRadius:  BorderRadius.circular(5) ),
                side: const BorderSide(color: Colors.grey,
                   ),
               ),
               
               onPressed: null ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  SvgPicture.asset("assets/Google - Original.svg",
                         width: 20,
                         height: 20,
                         ),
                          const SizedBox(width: 7),
                   Text('Continue with Google',
                   textAlign: TextAlign.center,
                   style: GoogleFonts.inter(
                    fontWeight:FontWeight.bold,
                    color: Colors.blueGrey.shade900,
                   ),),
                 ],
               )
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(14.0),
               child: TextButton(
                style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                minimumSize: const Size(double.infinity,50),
                shape:  RoundedRectangleBorder(  borderRadius:  BorderRadius.circular(5) ),
                side: const BorderSide(color: Colors.grey,
                   
                    )
               ),onPressed: null ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  SvgPicture.asset("assets/_Facebook.svg",
                         width: 20,
                         height: 20,
                         ),
                         const SizedBox(width: 7),
                   Text('Continue with Facebook',
                   textAlign: TextAlign.center,
                   style: GoogleFonts.inter(
                    fontWeight:FontWeight.bold,
                    color: Colors.blueGrey.shade900,),
                   ),
                 ],
               )
               ),
             ),
             SizedBox(height: 15,),
             RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                   text: 'Do have account?',
                   style: TextStyle(
                    color: Colors.grey
                   )
                  ),
                  TextSpan(
                    text: 'Sign In',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w300,
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInMaterialPage()),
                      );
                    },
                    )

                ]
              ),
             )
            ],
          )
        ],
      ),
      ) 
    );
  }
}


