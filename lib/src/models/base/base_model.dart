class BaseModel {
  bool isError;
  String message;
  dynamic data;

  BaseModel({this.isError, this.message, this.data});

  BaseModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('is_error')) isError = json['is_error'];

    if (json.containsKey('message')) message = json['message'];

    if (json.containsKey('data') && json['data'] != '') {
      data = json['data'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}
