import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/model/request/login_request.dart';
import 'package:e_commerce_app/data/model/request/sign_up_request.dart';
import 'package:e_commerce_app/data/model/response/add_to_cart_dm/AddToCartResponseDM.dart';
import 'package:e_commerce_app/data/model/response/category_response_dm/category_or_brands_response_dm.dart';
import 'package:e_commerce_app/data/model/response/get_cart_Data_response_DM/get_cart_data_response_dm.dart';
import 'package:e_commerce_app/data/model/response/login_respnose/login_respnose_dm.dart';
import 'package:e_commerce_app/data/model/response/products_response_dm/product_response_dm.dart';
import 'package:e_commerce_app/data/model/response/sign_up_response_dm/sign_up_response_dm.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/get_cart_data_response_entity.dart';
import 'package:e_commerce_app/presentation/utils/shared_prefrence.dart';
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

  Future<Either<Failures, ProductResponseDm>> getAllProducts() async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var url =
            Uri.https(ApiConstants.baseUrl, ApiConstants.getProductsEndPoint);

        var response = await http.get(url);
        var productResponse =
            ProductResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          return right(productResponse);
        } else {
          return left(ServerError(
              errorMessege: productResponse.statusMsg == null
                  ? productResponse.message!
                  : productResponse.message!));
        }
      } else {
        return left(
            NetworkError(errorMessege: "check your internet connection"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, AddToCartResponseDm>> addToCart(
      String productID) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url =
            Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartEndPoint);

        var response = await http.post(url, body: {
          "productId": productID,
        }, headers: {
          "token": token.toString(),
        });
        var addToCartREsponse =
            AddToCartResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(addToCartREsponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(
              errorMessege: addToCartREsponse.message ?? "Error 401"));
        } else {
          return left(ServerError(
              errorMessege: addToCartREsponse.statusMsg == null
                  ? addToCartREsponse.message!
                  : addToCartREsponse.message!));
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

  Future<Either<Failures, GetCartDataResponseEntity>> getCart() async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url =
            Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartEndPoint);

        var response = await http.get(url, headers: {
          "token": token.toString(),
        });
        var cartResponse =
            GetCartDataResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(cartResponse);
        } else if (response.statusCode == 401) {
          return Left(
              ServerError(errorMessege: cartResponse.message ?? "Error 401"));
        } else {
          return left(ServerError(
              errorMessege: cartResponse.statusMsg == null
                  ? cartResponse.message!
                  : cartResponse.message!));
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

  Future<Either<Failures, GetCartDataResponseEntity>> deleteCartItem(
      String productID) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url = Uri.https(ApiConstants.baseUrl,
            "${ApiConstants.addToCartEndPoint}/${productID.trim()}");

        var response = await http.delete(url, headers: {
          "token": token.toString(),
        });
        var deleteCartItemResponse =
            GetCartDataResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          print(deleteCartItemResponse.status);

          return right(deleteCartItemResponse);
        } else if (response.statusCode == 401) {
          print(deleteCartItemResponse.message);
          return Left(ServerError(
              errorMessege: deleteCartItemResponse.message ?? "Error 401"));
        } else {
          return left(ServerError(
              errorMessege: deleteCartItemResponse.statusMsg == null
                  ? deleteCartItemResponse.message!
                  : deleteCartItemResponse.message!));
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

  Future<Either<Failures, GetCartDataResponseEntity>> updateCartItem({
    required String productID,
    required int count,
  }) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url = Uri.https(ApiConstants.baseUrl,
            "${ApiConstants.addToCartEndPoint}/$productID");

        var response = await http.put(url, body: {
          "count": "$count"
        }, headers: {
          "token": token.toString(),
        });
        var updateCartItemResponse =
            GetCartDataResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(updateCartItemResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(
              errorMessege: updateCartItemResponse.message ?? "Error 401"));
        } else {
          return left(ServerError(
              errorMessege: updateCartItemResponse.statusMsg == null
                  ? updateCartItemResponse.message!
                  : updateCartItemResponse.message!));
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
}
