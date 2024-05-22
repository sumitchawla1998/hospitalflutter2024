import 'package:flutter/material.dart';
class DropdownComponent extends StatefulWidget {
  List<String> list;
  String? drpvalue;
  ValueChanged<String?>? onChanged;
  DropdownComponent(this.drpvalue, this.list,this.onChanged);

  @override
  State<DropdownComponent> createState() => _DropdownComponentState();
}

class _DropdownComponentState extends State<DropdownComponent> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 24),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide( color:Color(0xffD3D3D3),
          width: 2.0,) ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: widget.drpvalue,
          // Step 4.
          items: widget.list?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 18),
              ),
            );
          }).toList(),
          // Step 5.
          onChanged: (String? newValue) {
            setState(() {
              widget.drpvalue = newValue!;
            });
            widget.onChanged!(newValue);
          },
        ),
      ),
    );
  }
}
