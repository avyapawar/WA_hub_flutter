import 'package:get/get.dart';
class LocaleString extends Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'title' : 'Welcome' 
    },
     'hi_IN' : {
      'title' : 'स्वागत' 
    }
  };

}