import 'package:authentication_study/common/component/paginateion_list_view.dart';
import 'package:authentication_study/order/component/order_card.dart';
import 'package:authentication_study/order/model/order_model.dart';
import 'package:authentication_study/order/provider/order_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationListView<OrderModel>(
      provider: orderProvider,
      itemBuilder: <OrderModel>(_, index, model) {
        return OrderCard.fromModel(model: model);
      },
    );
  }
}
