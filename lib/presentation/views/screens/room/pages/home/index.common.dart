import 'package:app/domain/data/models/room.model.dart';
import 'package:app/domain/services/helpers/navigation.helper.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/home/home.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/button.dart';
import 'package:app/presentation/views/widgets/custom/placeholder/room.placeholder.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
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
    return SingleChildScrollView(
        child: Column(
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
          height: 40,
        ),
        model.locked
            ? const Center(child: CircularProgressIndicator())
            : model.rooms.isEmpty
                ? const RoomPlaceholder()
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
                            itemCount: model.rooms.length,
                            itemBuilder: (context, index) => InkWell(
                                  child: _RoomItem(
                                      model.rooms[index],
                                      () => model.selectRoom(
                                          context, model.rooms[index])),
                                )))
                    : Center(
                        child: InkWell(
                        child: _RoomItem(model.rooms.first,
                            () => model.selectRoom(context, model.rooms.first)),
                      )),
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Button(
              'Créer un salon',
              () => NavigationHelper.navigateToCreationRoom(context),
              isOutlined: true,
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Button('Rejoindre un salon',
                () => NavigationHelper.navigateToAccessRoom(context))),
      ],
    ));
  }
}

class _RoomItem extends StatelessWidget {
  final Room room;
  final VoidCallback onTap;

  const _RoomItem(this.room, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 150,
          width: 100,
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          room.avatar ?? 'https://source.unsplash.com/random'),
                      fit: BoxFit.cover),
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextVariant(room.name ?? ''),
              const TextVariant('Type'),
            ],
          ),
        ));
  }
}
