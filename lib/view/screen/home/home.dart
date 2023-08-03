import 'package:dota_app_swirf_labs_test_case/common/colors.dart';
import 'package:dota_app_swirf_labs_test_case/common/constants/assets_image.dart';
import 'package:dota_app_swirf_labs_test_case/provider/heroes_list_provider.dart';
import 'package:dota_app_swirf_labs_test_case/view/widget/hero_card.dart';
import 'package:dota_app_swirf_labs_test_case/view/widget/refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> filterList = [
    'Initiator',
    'Durable',
    'Disabler',
    'Support',
    'Escape',
    'Pusher',
    'Nuker',
    'Carry',
  ];
  List<String> initialFilter = [];
  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 9, vsync: this)
      ..addListener(() {
        if (_tabController.index != _tabController.previousIndex) {}
      });
    initialFilter.addAll(filterList);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<HeroesListProvider>(context, listen: false)
          .getAllHeroes(initialFilter);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ConstColors.dark50,
          leadingWidth: 64,
          titleSpacing: 0,
          title: Center(
            child: Image.asset(
              assetsDotaIconAppBar,
              height: 60,
            ),
          ),
        ),
        body: CupertinoPageScaffold(
          backgroundColor: ConstColors.dark50,
          child:
              Consumer<HeroesListProvider>(builder: (context, provider, child) {
            return RefreshIndicatorWidget.main(
              onRefresh: () =>
                  Provider.of<HeroesListProvider>(context, listen: false)
                      .getAllHeroes(provider.heroesFilterHome),
              child: Stack(
                children: [
                  TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: <Widget>[
                        HeroListContent.allHeroesTabView(
                            provider, context, filterList, initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroesInitiator,
                            context,
                            filterList,
                            initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroeDurable,
                            context,
                            filterList,
                            initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroeDisabler,
                            context,
                            filterList,
                            initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroeSupport,
                            context,
                            filterList,
                            initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroeEscape,
                            context,
                            filterList,
                            initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroesPusher,
                            context,
                            filterList,
                            initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroesNuker,
                            context,
                            filterList,
                            initialFilter),
                        HeroListContent.allHeroesTabViewCategory(
                            provider,
                            provider.heroesCarry,
                            context,
                            filterList,
                            initialFilter),
                      ]),
                  Container(
                    color: ConstColors.dark50,
                    child: TabBar(
                        labelColor: ConstColors.white,
                        indicatorColor: ConstColors.red50,
                        automaticIndicatorColorAdjustment: true,
                        unselectedLabelColor:
                            ConstColors.white.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        controller: _tabController,
                        isScrollable: true,
                        tabs: [
                          const Tab(
                            child: Text('All'),
                          ),
                          Tab(
                            child: Text(filterList[0]),
                          ),
                          Tab(
                            child: Text(filterList[1]),
                          ),
                          Tab(
                            child: Text(filterList[2]),
                          ),
                          Tab(
                            child: Text(filterList[3]),
                          ),
                          Tab(
                            child: Text(filterList[4]),
                          ),
                          Tab(
                            child: Text(filterList[5]),
                          ),
                          Tab(
                            child: Text(filterList[6]),
                          ),
                          Tab(
                            child: Text(filterList[7]),
                          ),
                        ]),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
