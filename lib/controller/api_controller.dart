import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mappage/constant/constant.dart';

class ApiController extends GetxController {
  var isLoading = true.obs;
  late String base64Image;
  late Uint8List bytes;

  @override
  void onInit() {
    print("Api Called");
    fetchApiData();
    super.onInit();
  }

  void fetchApiData() async {
    isLoading(true);
    final response = await http.get(Uri.parse(Constants.mapmycrop_url));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // print(responseBody.toString());
      // print(responseBody['image'].toString());
      base64Image = responseBody['image'].toString();
      bytes = base64Decode(base64Image);
      // print("bytesImage$bytes");
      isLoading(false);
    } else {
      isLoading(false);
      print('Failed to fetch data');
    }
  }
}
