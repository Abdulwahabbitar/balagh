import 'package:flutter/material.dart';

import '../../../../core/utils/theme/theme_color/theme_light_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText, required this.icon, this.controller});
 final String labelText;
 final IconData icon;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
  onFieldSubmitted: (value){
        if(controller != null){
          controller!.text= value;
        }
  },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon,color: ThemeLightColor.secondaryColor,),
        contentPadding: EdgeInsets.only(left: 20),
        labelStyle: TextStyle(color: ThemeLightColor.primaryColor,),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeLightColor.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeLightColor.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20)),

      ),
    );
  }
}
