import 'package:flutter/material.dart';

class BoolSelected extends StatefulWidget {
  const BoolSelected({super.key});

  @override
  State<BoolSelected> createState() => _BoolSelectedState();
}

class _BoolSelectedState extends State<BoolSelected> {
  bool selected=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: GestureDetector(
        onTap: (){
          if(selected==true)
            {
              selected=false;
            }
          else
          {
            selected=true;
          }

          setState(() {

          });
        },
        child: Container(height: 300,width: 300,
        color://if(selected==true){colors.black}
        // else {colors.blue}
        selected==true// use for main condition
            ?// use for if
        Colors.black
            :// esle
        Colors.blue,
          child: Center(child: Text(
            selected==true?'Selected': 'unSelect'
            ,style: TextStyle(
              color:selected==true?Colors.white
                  : Colors.black),),),
        ),
      ),),
    );
  }
}
/*
 if(t/f)
 {
 
 }else {
 }
 ---ternary operator
 (condition)t/f?--> use for if

  statement
  :--> use for false
   statment

* */
