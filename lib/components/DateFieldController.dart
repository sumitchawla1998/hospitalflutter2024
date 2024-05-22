import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateFieldComponent extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  bool? enabled = true;
  DateFieldComponent(this.controller,this.hinttext,[this.enabled]);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.circular(14),
      ),
      child: TextField(
        onTap: () async {
          DateTime? pickeddate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2050));
          controller.text = DateFormat("dd-MM-yyyy").format(pickeddate!).toString();
        },
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
