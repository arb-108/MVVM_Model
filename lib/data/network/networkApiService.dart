import 'dart:convert';
import 'dart:io';

import 'package:app_mvvm/data/app_exception.dart';
import 'package:app_mvvm/data/network/baseApiService.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class networkApiService implements BaseApiService {
  dynamic responseJson;
  @override
  Future getGetApiResponse(String url) async {
    try {
      Response response = await http
          .get(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'x-api-key': 'reqres-free-v1',
            },
          )
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    try {
      Response response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'x-api-key': 'reqres-free-v1',
            },
            body: jsonEncode(data),
          )
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    print('Response'+responseJson.toString());
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201: // Created
        return jsonDecode(response.body);

      case 204: // No Content
        return null;

      case 400:
        throw BadRequestException(
          jsonDecode(response.body)['error'] ?? 'Bad Request',
        );

      case 401:
        throw UnauthorizedException(
          jsonDecode(response.body)['message'] ?? 'Unauthorized Request',
        );

      case 403:
        throw ForbiddenException(
          jsonDecode(response.body)['message'] ?? 'Access Denied',
        );

      case 404:
        throw NotFoundException('Requested resource not found');

      case 408:
        throw TimeoutException('Request Timeout');

      case 500:
      case 502:
      case 503:
      case 504:
        throw InternalServerErrorException(
          'Server Error (${response.statusCode})',
        );

      default:
        throw FetchDataException('Unexpected error: ${response.statusCode}');
    }
  }
}
