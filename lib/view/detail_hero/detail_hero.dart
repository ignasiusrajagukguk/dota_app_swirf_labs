import 'package:dota_app_swirf_labs_test_case/common/colors.dart';
import 'package:dota_app_swirf_labs_test_case/common/string_format/string_format.dart';
import 'package:dota_app_swirf_labs_test_case/common/text_widget/text_widget.dart';
import 'package:dota_app_swirf_labs_test_case/provider/heroes_list_provider.dart';
import 'package:dota_app_swirf_labs_test_case/view/model/hero_model.dart';
import 'package:dota_app_swirf_labs_test_case/view/widget/hero_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeroDetailArgument {
  HeroesModel? heroesModel;

  HeroDetailArgument({required this.heroesModel});
}

class HeroDetail extends StatefulWidget {
  final HeroDetailArgument argument;
  const HeroDetail({super.key, required this.argument});

  @override
  State<HeroDetail> createState() => _HeroDetailState();
}

class _HeroDetailState extends State<HeroDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.dark50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstColors.dark50,
        leadingWidth: 64,
        actions: [
          Container(
            width: 64,
          )
        ],
        titleSpacing: 0,
        title: Center(
          child: TextWidget.mainBold(
            widget.argument.heroesModel?.localizedName ?? '',
            color: ConstColors.white.withOpacity(0.8),
          ),
        ),
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: ConstColors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  'https://api.opendota.com${widget.argument.heroesModel?.img}',
                  color: ConstColors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget.small(
                  roles(),
                  color: ConstColors.white.withOpacity(0.8),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: ConstColors.dark60,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      heroInformation('Type',
                          widget.argument.heroesModel!.attackType ?? ''),
                      heroInformation('Max Atk',
                          '${widget.argument.heroesModel!.baseAttackMin} - ${widget.argument.heroesModel!.baseAttackMax}'),
                      heroInformation('Health',
                          widget.argument.heroesModel!.baseHealth!.toString()),
                      heroInformation('MSPD',
                          widget.argument.heroesModel!.moveSpeed!.toString()),
                      heroInformation(
                          'Attr',
                          widget.argument.heroesModel!.primaryAttr!
                              .toCapitalized()),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextWidget.smallBold('Similar Heroes',
                    color: ConstColors.white.withOpacity(0.8)),
                const SizedBox(height: 10),
                similarHeroes()
              ],
            ),
          ),
        ],
      ),
    );
  }

  String roles() {
    var heroesListfix1 =
        widget.argument.heroesModel?.roles.toString().split("[").join("");
    var heroesListfix2 = heroesListfix1?.split("]").join("");
    return heroesListfix2!;
  }

  Color color() {
    Color color = ConstColors.white;
    switch (widget.argument.heroesModel?.primaryAttr) {
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
    return color;
  }

  Widget heroInformation(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextWidget.smallX(title, color: ConstColors.white.withOpacity(0.5)),
        TextWidget.smallBold(value, color: ConstColors.white.withOpacity(0.8))
      ],
    );
  }

  Widget similarHeroes() {
    return Consumer<HeroesListProvider>(builder: (context, provider, child) {
      final memberCommunityList = provider.heroesList
          .where((element) => (element.primaryAttr ==
                  widget.argument.heroesModel!.primaryAttr &&
              element.attackType == widget.argument.heroesModel!.attackType &&
              element.heroId != widget.argument.heroesModel!.heroId))
          .toList();
      switch (widget.argument.heroesModel!.primaryAttr) {
        case 'agi':
          memberCommunityList.sort(
            (a, b) {
              return b.moveSpeed!.compareTo(a.moveSpeed!);
            },
          );
          break;
        case 'str':
          memberCommunityList.sort(
            (a, b) {
              return b.baseAttackMax!.compareTo(a.baseAttackMax!);
            },
          );
          break;
        case 'int':
          memberCommunityList.sort(
            (a, b) {
              return b.baseMana!.compareTo(a.baseMana!);
            },
          );
          break;
        default:
      }
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return HeroListContent.similarHeroesCard(
              memberCommunityList[index], context);
        },
      );
    });
  }
}
