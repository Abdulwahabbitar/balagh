import 'package:flutter/material.dart';

import '../../../../core/utils/theme/theme_color/theme_light_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.icon, this.controller});
 final String hintText;
 final IconData icon;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
cursorColor: Colors.white,
  onFieldSubmitted: (value){
        if(controller != null){
          controller!.text= value;
        }
  },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Color(0xffD9D9D9).withOpacity(0.5) ),
        fillColor:ThemeLightColor.primaryColor ,
        contentPadding: EdgeInsets.only(right: 30),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeLightColor.primaryColor,
              width: 2,

            ),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeLightColor.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12)),

      ),
    );
  }
}
