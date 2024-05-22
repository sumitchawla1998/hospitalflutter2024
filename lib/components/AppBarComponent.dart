import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  AppBarComponent(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      elevation: 0,
      toolbarHeight: 90,
      centerTitle: true,
      title: Text(
        "$title",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      backgroundColor: Color(0xffffffff),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90);
}
