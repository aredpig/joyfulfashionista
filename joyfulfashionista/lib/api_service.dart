import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:joyfulfashionista/shared_services.dart';
import './config.dart';
import 'model/cart_request_model.dart';
import 'model/cart_response_model.dart';
import 'model/category.dart';
import 'model/customer.dart';
import 'model/customer_detail_model.dart';
import 'model/login_model.dart';
import 'model/order.dart';
import 'model/product.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  static String apiURL = Config.url;

  Future<bool> createCustomer(CustomerModel model) async {
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret),
    );
    bool ret = false;
    try {
      var response = await Dio().post(Config.url + Config.customerURL,
          data: model.toJson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }));

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }

    return ret;
  }

  Future<bool> addCart(int pid, int qty) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded',
    };
    // Post the id and
    String id = pid.toString();
    String quantity = qty.toString();
    var response = await client.post(
        Uri.parse("https://joyfulteams.shop/wp-json/cocart/v2/cart/add-item"),
        headers: requestHeaders,
        body: {
          "id": id,
          "quantity": quantity,
        });
    var ret = false;
    if (response.statusCode == 200) {
      print(response.body);
      ret = true;
    } else {
      ret = false;
    }

    return ret;
  }

  Future<LoginResponse> loginCustomer(
      String username, String password) async {
    LoginResponse model;

    try {
      var response = await Dio().post(Config.tokenURL,
          data: {
            'username': username,
            'password': password,
          },
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        model = LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return model;
  }

  Future<LoginResponse> NameTag(
      String username) async {
    LoginResponse model;
    try {
      var response = await Dio().post(Config.tokenURL,
          data: {
            'username': username,
          },
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        model = LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return model;
  }

  Future<List<Category>> getCategories() async {
    List<Category> data = <Category>[];

    try {
      String url = Config.url +
          Config.categoriesURL +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Category.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<List<Product>> getProducts({
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    List<int> productIDs,
    String sortBy,
    String sortOrder = "asc",
  }) async {
    List<Product> data = <Product>[];

    try {
      String parameter = "";

      if (strSearch != null) {
        parameter += "&search=$strSearch";
      }
      if (pageSize != null) {
        parameter += "&per_page=$pageSize";
      }
      if (pageNumber != null) {
        parameter += "&page=$pageNumber";
      }
      if (tagName != null) {
        parameter += "&tag=$tagName";
      }
      if (productIDs != null) {
        parameter += "&include=${productIDs.join(",").toString()}";
      }
      if (categoryId != null) {
        parameter += "&category=$categoryId";
      }
      if (sortBy != null) {
        parameter += "&orderby=$sortBy";
      }
      if (sortOrder != null) {
        parameter += "&order=$sortOrder";
      }
      String url = Config.url +
          Config.productsURL +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secret}&${parameter.toString()}";
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Product.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<CartResponseModel> addtoCart(CartRequestModel model) async {
    LoginResponse _result = await SharedService.loginDetails();
    print(_result.data.id);
    model.userId = int.parse(_result.data.id);

    CartResponseModel responseModel;

    try {
      String url = Config.url + Config.addtoCartUrl;

      var response = await Dio().post(
        url,
        data: model.toJson(),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        responseModel = CartResponseModel.fromJson(response.data);
        print(json.encode(responseModel));
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode == 404);
      } else {
        print(e.message);
        //print(e.request);
      }
    }
    return responseModel;
  }

  Future<CartResponseModel> getCartItems() async {
    CartResponseModel responseModel;
    LoginResponse _result = await SharedService.loginDetails();
    try {
      String url = Config.url + Config.cartURL + "?user_id=" + _result.data.id;
      print(url);
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        responseModel = CartResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode == 404);
      } else {
        print(e.message);
        //print(e.request);
      }
    }
    return responseModel;
  }

  Future<CustomerDetailModel> customerDetails() async {
    CustomerDetailModel responseModel;
    LoginResponse _result = await SharedService.loginDetails();
    try {
      String url = Config.url +
          Config.customerURL +
          "/${_result.data.id}?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
      print(url);
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        responseModel = CustomerDetailModel.fromJson(response.data);
        print(responseModel.firstName);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode == 404);
      } else {
        print(e.message);
        //print(e.request);
      }
    }
    return responseModel;
  }

  Future<bool> createOrder(OrderModel model) async {
    LoginResponse _result = await SharedService.loginDetails();
    print(Config.url + Config.orderURL);
    model.customerId = int.parse(_result.data.id);
    bool isOrderCreated = false;
    var authToken = base64.encode(
      utf8.encode(Config.key + ':' + Config.secret),
    );

    print(authToken);
    print(model.paymentMethod);
    print(model.toJson());
    try {
      var response = await Dio().post(
        Config.url + Config.orderURL,
        data: model.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        isOrderCreated = true;
      }
    } on DioError catch (e) {
      print(e.response);
      if (e.response.statusCode == 404) {
        print(e.response.statusCode == 404);
      } else {
        print(e.message);
        //print(e.request);
      }
    }
    return isOrderCreated;
  }
}
