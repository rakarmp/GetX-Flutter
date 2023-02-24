import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/headline_response.dart';
import '../../../data/technology_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/entertainment_response.dart';
import '../../../utils/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final authToken = GetStorage();
  final _getConnect = GetConnect();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<HeadlineResponse> getHeadline() async {
    final response = await http.get(Uri.parse(BaseUrl.headline));
    if (response.statusCode == 200) {
      return HeadlineResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }

  Future<TechnologyResponse> getTechnology() async {
    final response = await http.get(Uri.parse(BaseUrl.technology));
    if (response.statusCode == 200) {
      return TechnologyResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }

  Future<SportsResponse> getSports() async {
    final response = await http.get(Uri.parse(BaseUrl.sports));
    if (response.statusCode == 200) {
      return SportsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }

  Future<EntertainmentResponse> getEntertainment() async {
    final response = await http.get(Uri.parse(BaseUrl.entertainment));
    if (response.statusCode == 200) {
      return EntertainmentResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }

  // Future<HeadlineResponse> getHeadline() async {
  //   //memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
  //   final response = await _getConnect.get(BaseUrl.headline);
  //   //mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
  //   return HeadlineResponse.fromJson(jsonDecode(response.body));
  // }
}
