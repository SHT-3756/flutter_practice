import 'package:intl/intl.dart';

import 'package:flutter_stock/data/source/remote/dto/intraday_info_dto.dart';
import 'package:flutter_stock/domain/model/intraday_info.dart';

extension ToIntradayInfo on IntradayInfoDto {
  IntradayInfo toIntradayInfo() {
    final formatter = DateFormat('yyy-<<-ddHH:mm:ss');
    return IntradayInfo(
      date: formatter.parse(timestamp),
      close: close,
    );
  }
}
