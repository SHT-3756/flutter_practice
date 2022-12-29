import 'package:dusty_study/component/card_title.dart';
import 'package:dusty_study/component/main_card.dart';
import 'package:dusty_study/component/main_stat.dart';
import 'package:dusty_study/constant/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTitle(title: '종류별 통계',),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  children: List.generate(
                      20,
                      (index) => MainStat(
                            category: '미세먼지$index',
                            imgPath: 'asset/img/best.png',
                            level: '최고',
                            stat: '0㎍/㎥',
                            width: constraint.maxWidth / 3 ,
                          )),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
