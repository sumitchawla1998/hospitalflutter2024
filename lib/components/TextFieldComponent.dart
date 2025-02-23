import 'package:flutter/material.dart';
class TextFieldComponent extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  bool? enabled = true;
  TextFieldComponent(this.controller,this.hinttext,[this.enabled]);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.circular(14),
      ),
      child: TextField(
        enabled: enabled,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 18,color:Color(0xffBDBDBD)),
          hintText: '$hinttext',
          focusedBorder: UnderlineInputBorder( //Outline border type for TextFeild
              borderSide: BorderSide(
                color:Color(0xffD3D3D3),
                width: 2,
              )
          ),
          enabledBorder: UnderlineInputBorder( //Outline border type for TextFeild
              borderSide: BorderSide(
                color:Color(0xffD3D3D3),
                width: 2,
              )
          ),

        ),
      ),
    );
  }
}
