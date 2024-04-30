import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/model/request/login_request.dart';
import 'package:e_commerce_app/data/model/request/sign_up_request.dart';
import 'package:e_commerce_app/data/model/response/brands_response_entity/brands_response_dm.dart';
import 'package:e_commerce_app/data/model/response/category_response_dm/category_response_dm.dart';
import 'package:e_commerce_app/data/model/response/login_respnose/login_respnose_dm.dart';

import 'package:e_commerce_app/data/model/response/sign_up_response_dm/sign_up_response_dm.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, SignUpResponseDm>> signUp(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        SignUpRequest signUpRequest = SignUpRequest(
          email: email,
          name: name,
          password: password,
          phone: phone,
          rePassword: rePassword,
        );
        Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.signUpEndPoint);
        var response = await http.post(
          url,
          body: signUpRequest.toJson(),
        );
        var signUpResponse =
            SignUpResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(signUpResponse);
        } else {
          return Left(ServerError(
              errorMessege: signUpResponse.errors != null
                  ? signUpResponse.errors!.msg!
                  : signUpResponse.message ?? "failure "));
        }
      } else {
        // no internet connection
        return Left(NetworkError(
            errorMessege: "no internet connection , check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, LoginResponseDM>> login(
    String email,
    String password,
  ) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginEndPoint);
        LoginRequest loginRequest =
            LoginRequest(email: email, password: password);

        var response = await http.post(url, body: loginRequest.toJson());
        var loginResponse = LoginResponseDM.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          return right(loginResponse);
        } else {
          return left(ServerError(
              errorMessege: loginResponse.statusMsg == null
                  ? loginResponse.message!
                  : loginResponse.message!));
        }
      } else {
        return left(
            NetworkError(errorMessege: "check your internet connection"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, CategoryOrBrandsResponseDm>>
      getAllCategories() async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var url =
            Uri.https(ApiConstants.baseUrl, ApiConstants.getCategoriesEndPoint);

        var response = await http.get(url);
        var categoryResponse =
            CategoryOrBrandsResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          return right(categoryResponse);
        } else {
          return left(ServerError(
              errorMessege: categoryResponse.statusMsg == null
                  ? categoryResponse.message!
                  : categoryResponse.message!));
        }
      } else {
        return left(
            NetworkError(errorMessege: "check your internet connection"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, CategoryOrBrandsResponseDm>> getAllBrands() async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var url =
            Uri.https(ApiConstants.baseUrl, ApiConstants.getBrandsEndPoint);

        var response = await http.get(url);
        var brandsResponse =
            CategoryOrBrandsResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          return right(brandsResponse);
        } else {
          return left(ServerError(
              errorMessege: brandsResponse.statusMsg == null
                  ? brandsResponse.message!
                  : brandsResponse.message!));
        }
      } else {
        return left(
            NetworkError(errorMessege: "check your internet connection"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }
}
