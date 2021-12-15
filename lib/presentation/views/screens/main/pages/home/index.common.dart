import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/home/home.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/buttons/secondary_button.dart';
import 'package:app/presentation/views/widgets/custom/component_scaffold.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///
/// [HomeCommonScreen]
///
class HomeCommonScreen extends StatelessWidget {
  ///
  /// Constructor
  ///
  const HomeCommonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeViewModel?.buildWithProvider(
            builder: (_, __) => _HomeCommonBody()));
  }
}

class _HomeCommonBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel model = HomeViewModel.provide(context);
    // TODO: implement build
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Image(
          image: AssetImage('assets/images/logo-color.png'),
          fit: BoxFit.fitHeight,
          height: 80,
        ),
        const SizedBox(
          height: 90,
        ),
        model.locked
            ? const Center(child: CircularProgressIndicator())
            : model.rooms.isEmpty
                ? const Text('No rooms')
                : model.rooms.length > 1
                    ? SizedBox(
                        height: 300,
                        child: GridView.builder(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2),
                            itemCount: 6,
                            itemBuilder: (context, index) => InkWell(
                                  child: _RoomItem(model.rooms[index]),
                                )))
                    : Center(
                        child: InkWell(
                        child: _RoomItem(model.rooms.first),
                      )),
        const SizedBox(
          height: 50,
        ),
        SecondaryTextButton(
          label: 'Créer un salon',
          onTap: () => null,
          uppercase: true,
        ),
        PrimaryTextButton(
          label: 'Rejoindre un salon',
          onTap: () => null,
          uppercase: true,
        )
      ],
    );
  }
}

class _RoomItem extends StatelessWidget {
  Room room;

  _RoomItem(this.room);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 100,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
              border: Border.all(color: AppColors.primaryColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextVariant(room.name ?? ''),
          const TextVariant('Type'),
        ],
      ),
    );
  }
}
