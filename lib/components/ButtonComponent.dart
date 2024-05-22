import 'package:flutter/material.dart';
class ButtonComponent extends StatelessWidget {
  ButtonComponent(this.callback,this.btntext);

  VoidCallback callback;
  String btntext;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: callback,
        child: Text('$btntext',style: TextStyle(fontSize: 18),),
        style: ElevatedButton.styleFrom(
          backgroundColor:Color(0xff28b6f6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            // <-- Radius
          ),
        ),
      ),
    );
  }
}
