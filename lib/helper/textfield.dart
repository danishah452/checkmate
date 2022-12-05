


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/app_theme.dart';
import '../styles/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField( {Key? key, required this.name, required this.controller, required this.image}) : super(key: key);
 final String name;
 final  image;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(

        controller: controller,
        scrollPadding: EdgeInsets.only(
            bottom: 1000000),
        keyboardType: TextInputType.number,

        maxLines: 1,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            labelText: name,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.black,
                height: 0,
                width: 3,
                child: Image.asset(image,
                  color: primaryColor,),
              ),
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 0.2,
              color: primaryColor,
            ),
            border: UnderlineInputBorder()),
      ),
    );
  }
}
