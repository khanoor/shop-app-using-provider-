import 'package:producthub/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.erroe() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message Data: $data";
  }
}
