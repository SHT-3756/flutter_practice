import 'package:dusty_study/model/stat_model.dart';
import 'package:dusty_study/model/status_model.dart';

class StatAndStatusModel {
  // 미세먼지 / 초미세먼지 등 이름
  final ItemCode itemCode;
  final StatusModel status;
  final StatModel stat;

  StatAndStatusModel({
    required this.itemCode,
    required this.status,
    required this.stat,
  });
}
