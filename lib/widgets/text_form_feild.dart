import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ...existing code...
import 'package:screentasia/screentasia.dart';


class Customtextfeild extends StatelessWidget {  

  final TextEditingController?  controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final String? hintText;
  final Color? color;
  final double? height;
  final bool? enabled;
  final void Function()? ontap;
  final bool? borderEnabled;



 


  const Customtextfeild({
    super.key,
    this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.obscureText = false,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.textDirection,
    this.validator,    
    this.hintText,
    this.color,
    this.height,
    this.enabled,
    this.ontap,
    this.borderEnabled
 
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextFormField(      
      onTap:ontap ,
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      style: Theme.of(context).textTheme.titleSmall ,      
      textDirection: textDirection,
      decoration: InputDecoration( 
      hintText:hintText ,
      hintStyle: 
        TextStyle(
          color:Colors.grey , 
          fontSize:
          context.isMobile
          ? 11.sp.ap(
              adaptivePercentage:
                  const AdaptivePercentage(
                    tablet:
                        80,
                    desktop:
                        60,
                  ),
            )
          : 12
        ),
      errorStyle: 
        TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize:context.isMobile?
           12.sp:
           context.isTablet?14.sp
           :16.sp,
          height: height?? 1, 
        ),         
      prefixIcon: prefixIcon, 
      suffixIcon: suffixIcon,         
      fillColor:color?? theme.colorScheme.background,
      filled: true,  
          
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.transparent, // Your #a8a7ae or #dddce0 color
          width: 1.0,
       ),
      ),
      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.transparent, // Usually a stronger color for focus
        width: 2.0, // Often slightly thicker to indicate focus
      )),
      // border: 
      // OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(16),          
      //   borderSide: BorderSide(
      //     color: theme.colorScheme.outline,
      //   )//Hides the border 
      // ),                                        
      ),
    );
  }
}

