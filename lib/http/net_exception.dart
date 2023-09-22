class NetException implements Exception {
  final String? message;
  final String? request;
  final int? code;

  NetException({this.message = 'mistake', this.code = 9999, this.request = ''});

  @override
  String toString() {
    return "code:$code, request:$request, message:$message";
  }
}
