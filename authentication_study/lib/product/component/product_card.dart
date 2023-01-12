import 'package:authentication_study/common/const/colors.dart';
import 'package:authentication_study/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Image image;
  final String name;
  final String detail;
  final int price;

  const ProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
  }) : super(key: key);

  factory ProductCard.fromModel({
    required RestaurantProductModel model,
  }) {
    return ProductCard(
      image: Image.network(
        model.imgUrl,
        width: 110,
        height: 110,
        fit: BoxFit.cover,
      ),
      name: model.name,
      detail: model.detail,
      price: model.price,
    );
  }

  // Image.asset(
  // 'asset/img/food/ddeok_bok_gi.jpg',
  // width: 110,
  // height: 110,
  // fit: BoxFit.cover,
  // ),

  @override
  Widget build(BuildContext context) {
    // IntrinsicHeight: 내부의 모든 위젯들이 최대크기를 차지한 위젯만큼 높이를 차지한다.
    //IntrinsicWidth:  내부의 모든 위젯들이 최대너비를 차지한 위젯만큼 너비를 차지한다.
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: image,
          ),
          SizedBox(width: 16.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '떡볶이',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '전통 떡볶이의 정석!\n맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.맛있습니다.',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14.0,
                  color: BODY_TEXT_COLOR,
                ),
              ),
              Text(
                'W10000',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
