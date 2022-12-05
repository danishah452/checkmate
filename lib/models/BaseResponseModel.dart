class BaseAPIResponse {
  bool? status;
  String? message;

  BaseAPIResponse({this.status, this.message});

  BaseAPIResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
