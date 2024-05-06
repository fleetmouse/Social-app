import 'package:image_picker/image_picker.dart';

pickImage() async {
  final ImagePicker imagePicker =
      ImagePicker(); //create an instance of the image picker
  XFile? file = await imagePicker.pickImage(
      source: ImageSource
          .gallery); //The XFile is a class provided by the image_picker
  if (file != null) {
    return await file.readAsBytes();
  }
}
