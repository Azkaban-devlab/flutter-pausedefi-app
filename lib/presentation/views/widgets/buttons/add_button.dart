import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  /// label
  // final String label;

  // icon
  //final Icon icon;

  /// OnPressed Callback
  final VoidCallback onPressed;

  /// isOutlined
  final bool isOutlined;

  const AddButton( /*this.icon,*/ this.onPressed, {this.isOutlined = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        child: isOutlined
            ? OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: AppColors.primaryVariantColor,
                side: const BorderSide(
                    color: AppColors.primaryVariantColor, width: 2),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: onPressed,
            child: Icon(
              Icons.add, size: 48.0,color: Colors.red,),
            )
            : ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: onPressed,
            child: Icon(
              Icons.add, size: 48.0,color: AppColors.onPrimaryColor,),
            )

        );
  }
}
