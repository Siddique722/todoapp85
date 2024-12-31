import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  
  bool isHide=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: TextFormField(
            obscureText: isHide,
            decoration: InputDecoration(
              suffixIcon: IconButton(onPressed: (){
                if(isHide==true)
                  {
                    isHide=false;
                  }
                else {
                  isHide=true;
                }

                setState(() {

                });
              }, icon: Icon(Icons.remove_red_eye))
            ),
            
          ),
        ),
      ),
    );
  }
}
