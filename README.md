# image_picker_getx

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


----------------------
ImagePicker
get install image_picker
Configuration
IOS
Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:
<!-- Added keys for permissions -->
<key>NSPhotoLibraryUsageDescription</key>
<string>Describe why your app needs permission for the photo library.</string>
<key>NSCameraUsageDescription</key>
<string>Describe why your app needs access to the camera.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Describe why your app needs access to the microphone, if you intend to record videos.</string>
Android
It is no longer required to add android:requestLegacyExternalStorage="true" as an attribute to the <application> tag in AndroidManifest.xml, as image_picker has been updated to make use of scoped storage.
var imagePath=''.obs;
var imageSize = ''.obs;
Future<void> pickImage(ImageSource imageSource)async{
 XFile? pickImage=await ImagePicker().pickImage(source: imageSource);
 if(pickImage!=null){
   imagePath.value=pickImage.path;
   imageSize.value="${((File(imagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)}Mb";

 }else{
   Get.snackbar('Error', "No image selected");
 }
}
Obx(()=>controller.imagePath.value ==''? const Text("No Image selected"): Image(image: FileImage(File(controller.imagePath.value)))),
Obx(() =>controller.imageSize.value==''? const Text("") : Text(controller.imageSize.value)),
