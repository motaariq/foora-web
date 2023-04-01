class ImageModel {
  bool? success;
  String? message;

  ImageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}
