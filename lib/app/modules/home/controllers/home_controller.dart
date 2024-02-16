import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  var imagePath=''.obs;
  var imageSize = ''.obs;
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> pickImage(ImageSource imageSource)async{
   XFile? pickImage=await ImagePicker().pickImage(source: imageSource);
   if(pickImage!=null){
     imagePath.value=pickImage.path;
     imageSize.value="${((File(imagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)}Mb";

   }else{
     Get.snackbar('Error', "No image selected");
   }
  }
}