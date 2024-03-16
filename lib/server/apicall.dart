import 'package:dio/dio.dart';

Future<String> identifyDigitFromAssets(imagepath) async {
  String url = "https://digitrecogapi.herokuapp.com/digit/";

  FormData formdata = FormData.fromMap({
    'file': MultipartFile.fromBytes(imagepath.buffer.asUint8List(),
        filename: "assets/download (1).png")
  });

  Dio dio = Dio();
  late Response response;

  try {
    response = await dio.post(url, data: formdata);
    print(response.data);
    return response.data['digit'];
  } catch (e) {
    if (e is DioError) {
      if (e.response?.statusCode == 500) {
        return 'Server Error';
      }
    }
    // Handle other exceptions here
    return 'Error: $e';
  }
}
