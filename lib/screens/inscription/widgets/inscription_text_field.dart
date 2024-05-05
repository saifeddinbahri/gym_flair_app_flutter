
import 'package:flutter/material.dart';
import 'package:gym_flair/shared/sizes.dart';

class InscriptionFormField extends TextFormField {
  InscriptionFormField({
    super.focusNode,
    super.onTap,
    super.key,
    super.readOnly = false,
    required TextEditingController super.controller,
    String? hintText,
    Widget? icon,
    super.obscureText,
    super.validator,
    required BuildContext context
  }) : super(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).
           size.height*ConstantSizes.inputVerticalPadding,
          horizontal: MediaQuery.of(context).
          size.width*ConstantSizes.inputHorizontalPadding
      ),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surfaceVariant,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyLarge,
      suffixIcon: icon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none ,
        borderRadius: BorderRadius.circular(
          ConstantSizes.circularRadius
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
            ConstantSizes.circularRadius
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
            ConstantSizes.circularRadius
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
            ConstantSizes.circularRadius
        ),
      ),
    ),
  );
}