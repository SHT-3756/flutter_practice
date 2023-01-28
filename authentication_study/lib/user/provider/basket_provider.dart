import 'package:authentication_study/product/model/product_model.dart';
import 'package:authentication_study/user/model/basket_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// null 체크를 위한 import
import 'package:collection/collection.dart';

class BasketProvider extends StateNotifier<List<BasketItemModel>> {
  BasketProvider() : super([]);

  // 장바구니에 아이템 추가 로직
  Future<void> addToBasket({
    // ProductModel 을 전부다 받는다. (내가 추가하려는 상품 id )
    required ProductModel product,
  }) async {
    // 1) 아직 장바구니에 해당되는 상품이 없다면,
    // 장바구니에 상품을 추가한다.

    // 2) 만약에 이미 존재한다면,
    // 장바구니에 있는 값에 + 1 해준다.
    // (장바구니에 id == 상품 id )

    // 장바구니 속 상품 존재여부 상태 (true 존재, false 미 존재)
    final exists =
        state.firstWhereOrNull((element) => element.product.id == product.id) !=
            null;

    if (exists) {
      // 장바구니에 이미 존재한다면
      state = state
          .map((e) =>
              // 장바구니에 상품 id 와 추가하려는 id 값이 같으면 카운트만 + 1 해준다. 같지 않으면 그대로 반환
              e.product.id == product.id ? e.copyWith(count: e.count + 1) : e)
          .toList();
    } else {
      // 장바구니에 존재하지 않다면
      state = [
        ...state,
        BasketItemModel(
          product: product,
          count: 1,
        )
      ];
    }
  }

  // 장바구니 삭제
  Future<void> removeFromBasket({
    required ProductModel product,
    // 강제 삭제를 위한 파라미터, true 면 카운트와 관계없이 삭제
    bool isDelete = false,
  }) async {
    // 1) 장바구니에 상품이 존재할때
    // 1-1) 상품의 카운트가 1 보다 크면 -1

    // 1-2) 상품의 카운트가 1 이면 삭제한다.
    // 2) 상품이 존재하지 않을때
    // 즉시 함수 반환하고 아무것도 하지 않는다.

    // 장바구니 속 상품 존재여부 상태 (true 존재, false 미 존재)
    final exists =
        state.firstWhereOrNull((element) => element.product.id == product.id) !=
            null;

    if (!exists) {
      // 상품이 존재 하지 않을때 바로 반환
      return;
    }

    // 무조건 존재하기때문에 fistWhereOrNull 이 아닌 firstWhere 을 사용
    // 존재 상품
    final existingProduct =
        state.firstWhere((element) => element.product.id == product.id);


    if (existingProduct.count == 1 || isDelete) {
      // 상품 카운트가 1 이면, 장바구니 속 상품 id 와 해당 상품 id 를 비교해서, 해당되는 상품 말고 다른 것들만 list 로 리턴한다.
      // 또는 isDelete(강제삭제) 가 true 이면 삭제
      state =
          state.where((element) => element.product.id != product.id).toList();
    } else {
      // 상품 카운트가 1보다 크다면, 카운트 -1
      state = state
          .map((e) =>
              // 장바구니에 상품 id 와 삭제하려는 id 값이 같으면 카운트만 - 1 해준다. 같지 않으면 그대로 반환
              e.product.id == product.id ? e.copyWith(count: e.count - 1) : e)
          .toList();
    }
  }
}
