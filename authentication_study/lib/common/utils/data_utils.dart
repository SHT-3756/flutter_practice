import 'package:authentication_study/common/const/data.dart';

class DataUtils {
  // string 형태로 이미지 한개 받기
  static pathToUrl(String value) {
    // value 는 thumbUrl 이다.
    return 'http://$ip$value';
  }

  // list 형태로 이미지 여러개 받기
  static listPathsToUrls(List<String> paths){
    return paths.map((e)=> pathToUrl(e)).toList();
  }
}