import 'package:app/domain/data/models/user.model.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/main/pages/ranking.viewmodel.dart';
import 'package:app/presentation/views/widgets/custom/placeholder/ranking.placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RankingViewModel?.buildWithProvider(
        builder: (context, widget) => _RankingBody());
  }
}

class _RankingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RankingViewModel model = RankingViewModel?.provide(context);
    return model.locked
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () => model.reloadData(),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  delegate: _PodiumBody(),
                  pinned: true,
                ),
                SliverPersistentHeader(
                  delegate: _RestRankingBody(
                      MediaQuery.of(context).size.height -
                          250 -
                          kToolbarHeight -
                          kBottomNavigationBarHeight -
                          86),
                  pinned: true,
                ),
              ],
            ));
  }
}

class _RestRankingBody extends SliverPersistentHeaderDelegate {
  final double height;
  @override
  double get maxExtent => height;
  _RestRankingBody(this.height);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final RankingViewModel model = RankingViewModel?.provide(context);
    return SizedBox(
        height: height,
        child: model.rankings.isEmpty
            ? const RankingPlaceholder()
            : ListView.separated(
                controller: model.rankingController,
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                itemCount: model.rankings.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemBuilder: (context, index) =>
                    RankingWidget(index: index, user: model.rankings[index])));
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get minExtent => maxExtent;
}

class _PodiumBody extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final RankingViewModel model = RankingViewModel?.provide(context);
    return Container(
        color: Colors.transparent, //Theme.of(context).scaffoldBackgroundColor,
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
              bottom: 1,
              left: 60,
              child: model.podiums.length > 1
                  ? PodiumWidget(
                      user: model.podiums[1],
                      position: 2,
                    )
                  : const SizedBox()),
          Positioned(
              bottom: 1,
              right: 60,
              child: model.podiums.length > 2
                  ? PodiumWidget(
                      user: model.podiums[2],
                      position: 3,
                    )
                  : const SizedBox()),
          Align(
              alignment: Alignment.center,
              child: PodiumWidget(
                user: model.podiums[0],
                position: 1,
              ))
        ]));
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 250;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class PodiumWidget extends StatelessWidget {
  final User user;
  final int position;
  const PodiumWidget({Key? key, required this.user, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: position == 1 ? 230 : 175,
      width: 100,
      child: Column(
        children: [
          Text(
            position.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          Visibility(
              visible: position == 1,
              child: Image.asset(
                'assets/images/crown.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: position == 1 ? 5 : 0,
          ),
          Container(
            height: position == 1 ? 100 : 90,
            width: position == 1 ? 100 : 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: AppColors.primaryVariantColor, width: 4),
                image: const DecorationImage(
                    image: NetworkImage('https://source.unsplash.com/random'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            user.fullName ?? '',
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          Text(
            user.points.toString(),
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

class RankingWidget extends StatelessWidget {
  final int index;
  final User user;
  const RankingWidget({Key? key, required this.index, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text((index + 4).toString()),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              border: Border.all(color: AppColors.primaryColor, width: 2),
              color: CustomColors.silver),
          child: Row(
            children: [
              const CircleAvatar(
                  radius: 21,
                  backgroundImage:
                      NetworkImage('https://source.unsplash.com/random')),
              const SizedBox(
                width: 8,
              ),
              Text(user.fullName ?? ''),
              const Spacer(),
              Text(user.points.toString()),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ))
      ],
    );
  }
}
