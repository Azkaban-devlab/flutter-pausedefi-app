import 'package:app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class AnimatedToggle extends StatelessWidget {
  final List<String> values;
  final VoidCallback? onToggle;
  final Function(int)? navigatePageController;
  final int index;

  const AnimatedToggle(
      {Key? key,
      required this.values,
      required this.index,
      this.onToggle,
      this.navigatePageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 40;
    return Container(
      width: width,
      height: 38,
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: 38,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                values.length,
                (index) => InkWell(
                    onTap: () {
                      if (values.length > 2 && navigatePageController != null) {
                        navigatePageController!(index);
                      } else {
                        onToggle!();
                      }
                      /*model.index = index;
                      model.notifyListeners();*/
                    },
                    child: Container(
                        width: values.length > 2 ? (width / 3) : (width / 2),
                        height: 38,
                        alignment: Alignment.center,
                        child: Text(
                          values[index],
                          style: const TextStyle(color: Colors.grey),
                        ))),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment: values.length > 2
                ? (index == 0
                    ? Alignment.centerLeft
                    : index == 2
                        ? Alignment.centerRight
                        : Alignment.center)
                : index == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
            child: Container(
              width: values.length > 2 ? (width / 3) : (width / 2),
              height: 38,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                values[index],
                style: const TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
