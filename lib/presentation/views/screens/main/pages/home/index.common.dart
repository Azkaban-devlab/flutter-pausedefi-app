import 'package:app/domain/data/models/room.model.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/roundings.dart';
import 'package:app/presentation/viewmodels/home/home.viewmodel.dart';
import 'package:app/presentation/views/screens/main/pages/home/room/room.creation.screen.dart';
import 'package:app/presentation/views/widgets/buttons/button.dart';
import 'package:app/presentation/views/widgets/buttons/default_button.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/buttons/secondary_button.dart';
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
                            itemCount: model.rooms.length,
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
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Button(
              'Créer un salon',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          const RoomCreationScreen())), //TODO handle in better way to reload data on pop
              isOutlined: true,
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Button('Rejoindre un salon', () => null)),
      ],
    );
  }
}

class _RoomItem extends StatelessWidget {
  final Room room;

  const _RoomItem(this.room);

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
              image: const DecorationImage(
                  image: NetworkImage('https://source.unsplash.com/random'),
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
    );
  }
}
