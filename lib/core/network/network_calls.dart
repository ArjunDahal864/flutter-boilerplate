import 'package:boiler/core/error/exceptions.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:dio/dio.dart';

class NetworkCalls {
  Dio dio;
  NetworkCalls({required this.dio,});


  // get call for the api
  Future<Response> get({required String url}) async {
    var response = await dio.get(kBaseURL + url);
    return _checkResponse(response);
  }

  // post call for the api
  Future<Response> post({required String url, required Map data}) async {
    var response = await dio.post(kBaseURL + url, data: data);
    return _checkResponse(response);
  }

  // put call for the api
  Future<Response> put({required String url, required Map data}) async {
    var response = await dio.put(kBaseURL + url, data: data);
    return _checkResponse(response);
  }

  // delete call for the api
  Future<Response> delete({required String url}) async {
    var response = await dio.delete(kBaseURL + url);
    return _checkResponse(response);
  }

  // check response and throw exception on status code
  // if status code is not 200
  Response _checkResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 202:
        return response;
      case 203:
        return response;
      case 204:
        return response;
        // failing cases add more if need more functionality
      case 400:
        throw BadRequestException(response.data['message'],);
      case 401:
        throw AuthenticationException(response.data['message']);
      case 403:
        throw ForbiddenException(response.data['message']);
      case 404:
        throw NotFoundException(response.data['message']);
      case 500:
        throw InternalServerException(response.data['message']);
      default:
        throw UnknownException("Something went wrong");
    }
  }
}

