import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

class ChoosePictureMode extends StatelessWidget {
  final VoidCallback galleryClick;
  final VoidCallback cameraClick;
  const ChoosePictureMode(
      {required this.galleryClick, required this.cameraClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextVariant('Selectionner le mode voulu'),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            onTap: galleryClick,
            child: Row(
              children: const <Widget>[
                Icon(Icons.photo_album),
                TextVariant('Galerie')
              ],
            ),
          ),
          const Divider(
            color: CustomColors.lightGrey,
          ),
          InkWell(
            onTap: cameraClick,
            child: Row(
              children: const <Widget>[
                Icon(Icons.camera),
                TextVariant('Caméra')
              ],
            ),
          )
        ],
      ),
    );
  }
}
