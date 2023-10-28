class ImageListModel {
  List<String>? message;
  String? status;

  ImageListModel({this.message, this.status});

  ImageListModel.fromJson(Map<String, dynamic>? json) {
    message = json?['message'].cast<String>();
    status = json?['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
