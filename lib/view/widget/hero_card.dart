import 'package:dota_app_swirf_labs_test_case/common/colors.dart';
import 'package:dota_app_swirf_labs_test_case/common/constants/assets_image.dart';
import 'package:dota_app_swirf_labs_test_case/common/router/routes.dart';
import 'package:dota_app_swirf_labs_test_case/common/string_format/string_format.dart';
import 'package:dota_app_swirf_labs_test_case/common/text_widget/text_widget.dart';
import 'package:dota_app_swirf_labs_test_case/provider/heroes_list_provider.dart';
import 'package:dota_app_swirf_labs_test_case/view/detail_hero/detail_hero.dart';
import 'package:dota_app_swirf_labs_test_case/view/model/hero_model.dart';
import 'package:dota_app_swirf_labs_test_case/view/widget/refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HeroListContent {
  static Widget allHeroesTabView(
      HeroesListProvider provider,
      BuildContext context,
      List<String> filterList,
      List<String> initialFilter) {
    List<String> chosenRoles = provider.heroesFilterHome;
    return RefreshIndicatorWidget.main(
      onRefresh: () => Provider.of<HeroesListProvider>(context, listen: false)
          .getAllHeroes(provider.heroesFilterHome),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                ...filterList.map((filter) {
                  return ChoiceChip(
                    labelPadding: const EdgeInsets.fromLTRB(0, 3, 5, 5),
                    elevation: 0.5,
                    selected: chosenRoles.contains(filter),
                    selectedColor: ConstColors.white,
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (chosenRoles.contains(filter))
                          Image.asset(assetsImagesIcSelect,
                              color: chosenRoles.contains(filter)
                                  ? ConstColors.red50
                                  : ConstColors.white,
                              width: 20),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget.smallBold(filter,
                            color: provider.heroesFilterHome.contains(filter)
                                ? ConstColors.red50
                                : ConstColors.white),
                      ],
                    ),
                    backgroundColor: ConstColors.red50,
                    onSelected: (bool value) {
                      if (value) {
                        chosenRoles.add(filter);
                        provider.getAllHeroes(chosenRoles);
                      } else {
                        chosenRoles.remove(filter);
                        provider.getAllHeroes(chosenRoles);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ],
            ),
          ),
          if (provider.isLoading != true)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextWidget.mainBold(
                  '${provider.heroesList.length} Heroes Found',
                  color: ConstColors.white.withOpacity(0.8)),
            ),
          provider.isLoading
              ? Lottie.asset(assetsLoading,
                  width: MediaQuery.of(context).size.width)
              : provider.heroesList.isEmpty
                  ? Column(
                      children: [
                        Lottie.asset(assetsEmptyState,
                            width: MediaQuery.of(context).size.width,
                            height: 200),
                        TextWidget.mediumLargeBold('Empty Data',
                            color: ConstColors.white.withOpacity(0.8)),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              backgroundColor:
                                  MaterialStateProperty.all(ConstColors.red50),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              chosenRoles.clear();
                              chosenRoles.addAll(filterList);
                              Provider.of<HeroesListProvider>(context,
                                      listen: false)
                                  .getAllHeroes(initialFilter);
                            },
                            child: const Text('Retry'))
                      ],
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 0),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.heroesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return heroCard(
                              provider.heroesList[index],
                              () => Navigator.pushNamed(
                                  context, Routes.detailHeroes,
                                  arguments: HeroDetailArgument(
                                      heroesModel:
                                          provider.heroesList[index])));
                        },
                      ),
                    ),
        ],
      ),
    );
  }

  static Widget allHeroesTabViewCategory(
      HeroesListProvider provider,
      List<HeroesModel> heroesModelList,
      BuildContext context,
      List<String> filterList,
      List<String> initialFilter) {
    return RefreshIndicatorWidget.main(
      onRefresh: () => Provider.of<HeroesListProvider>(context, listen: false)
          .getAllHeroes(provider.heroesFilterHome),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          if (provider.isLoading != true)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
              child: TextWidget.mainBold(
                  '${heroesModelList.length} Heroes Found',
                  color: ConstColors.white.withOpacity(0.8)),
            ),
          provider.isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Lottie.asset(assetsLoading,
                      width: MediaQuery.of(context).size.width),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: heroesModelList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return HeroListContent.heroCard(
                          heroesModelList[index],
                          () => Navigator.pushNamed(
                              context, Routes.detailHeroes,
                              arguments: HeroDetailArgument(
                                  heroesModel: provider.heroesList[index])));
                    },
                  ),
                ),
        ],
      ),
    );
  }

  static Widget heroCard(
    HeroesModel heroesModel,
    Function() onClick,
  ) {
    var heroesListfix1 = heroesModel.roles.toString().split("[").join("");
    var heroesListfix2 = heroesListfix1.split("]").join("");
    Color color = ConstColors.white;
    switch (heroesModel.primaryAttr) {
      case 'agi':
        color = ConstColors.green40;
        break;
      case 'str':
        color = ConstColors.red50;
        break;
      case 'int':
        color = ConstColors.blue40;
        break;
      default:
        color = ConstColors.white;
    }
    return InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 5, top: 10, right: 5),
          child: Container(
            decoration: BoxDecoration(
              color: ConstColors.dark60,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: ConstColors.gray10.withOpacity(0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  spreadRadius: 0,
                ),
              ],
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://api.opendota.com${heroesModel.img}',
                    color: Colors.white.withOpacity(0.8),
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/empty_food.png');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget.smallBold(heroesModel.localizedName ?? '',
                        color: ConstColors.white),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget.smallXXS(heroesListfix2,
                        color: ConstColors.white.withOpacity(0.5),
                        textOverflow: TextOverflow.ellipsis),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              color: color.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget.smallXXS(
                            heroesModel.primaryAttr!.toCapitalized(),
                            color: ConstColors.white.withOpacity(0.5),
                            textOverflow: TextOverflow.ellipsis),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  static Widget similarHeroesCard(
      HeroesModel heroesModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.detailHeroes,
            arguments: HeroDetailArgument(heroesModel: heroesModel)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(color: ConstColors.dark60),
                child: SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    'https://api.opendota.com${heroesModel.img}',
                    color: ConstColors.dark40.withOpacity(0.8),
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container();
                    },
                  ),
                ),
              ),
              TextWidget.mediumLargeBold(heroesModel.localizedName ?? '',
                  color: ConstColors.white.withOpacity(0.5))
            ],
          ),
        ),
      ),
    );
  }
}
