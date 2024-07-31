import 'package:get/get.dart';

class CounterController extends GetxController{
  static CounterController get to {
    try{
      return Get.find<CounterController>();
    } catch (e){
      return Get.put(CounterController());
    }
  }
  int counter = 0;
  void incrementCounter() {
      counter++;
      update();
  
  }
}