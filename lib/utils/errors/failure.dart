import 'package:dio/dio.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

abstract class Failure {
  final String error;

  Failure({required this.error});
}

class ServerFailure extends Failure {
  ServerFailure({required super.error});
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(error: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(error: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(error: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(error: 'Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data!);
      case DioExceptionType.cancel:
        return ServerFailure(error: 'Something went wrong with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure(error: 'Connection Error with ApiServer');
      case DioExceptionType.unknown:
        return ServerFailure(error: 'Unxcepted Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int code, dynamic response) {
    if (response is Map<String, dynamic>) {
      switch (response['status']) {
        case 400:
        case 401:
        case 403:
          return ServerFailure(error: response['ErrorMessage']);
        case 404:
          return ServerFailure(error: 'Your request not found');
        case 406:
          return ServerFailure(error: 'Please send Token');
        case 500:
        case 502:
        case 503:
          return ServerFailure(
              error: 'Internal server error, Please try again');
        default:
          return ServerFailure(
              error: 'OOPs Something went wrong, Please try again');
      }
    } else if (response is String) {
      switch (code) {
        case 400:
        case 401:
        case 403:
          return ServerFailure(error: response);
        case 404:
          return ServerFailure(error: 'Your request not found');
        case 500:
        case 502:
        case 503:
          return ServerFailure(
              error: 'Internal server error, Please try again');
        default:
          return ServerFailure(
              error: 'OOPs Something went wrong, Please try again');
      }
    } else {
      return ServerFailure(error: 'Unexpected response format');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.error});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.error});
}

// class StripeFailure extends Failure {
//   StripeFailure({required super.error});
//   factory StripeFailure.fromStripeException(StripeException stripeException) {
//     switch (stripeException.error.code) {
//       case FailureCode.Canceled:
//         return StripeFailure(error: stripeException.error.message!);
//       case FailureCode.Timeout:
//         return StripeFailure(error: stripeException.error.message!);
//       case FailureCode.Failed:
//         return StripeFailure(error: stripeException.error.message!);
//       default:
//         return StripeFailure(error: stripeException.error.message!);
//     }
//   }
// }
