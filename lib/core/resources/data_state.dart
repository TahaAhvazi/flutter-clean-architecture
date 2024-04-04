import 'package:http/http.dart';

abstract class DataState<T> {
  final T? data;
  final ClientException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ClientException error) : super(error: error);
}
