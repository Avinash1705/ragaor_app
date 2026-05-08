import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';
import 'package:rozgar_flutter_app/utils/AppConstants.dart';

class CompanyProfileController {

  static String url =
      ApiConstants.companyProfileUpdate;

  Future<Map<String, dynamic>> updateCompanyProfile({
    required String userId,
    required String companyName,
    required String companyType,
    required String city,
    required String state,
    required String gst,
    required File companyLogo,
  }) async {

    try {

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      /// TEXT FIELDS
      request.fields['user_id'] = userId;
      request.fields['company_name'] = companyName;
      request.fields['company_type'] = companyType;
      request.fields['city'] = city;
      request.fields['state'] = state;
      request.fields['gst'] = gst;

      /// IMAGE FILE
      request.files.add(
        await http.MultipartFile.fromPath(
          'company_logo',
          companyLogo.path,
        ),
      );

      /// SEND REQUEST
      var response = await request.send();

      /// RESPONSE
      var responseData = await response.stream.bytesToString();

      print("RESPONSE = $responseData");

      return jsonDecode(responseData);

    } catch (e) {

      print("ERROR = $e");

      return {
        "status": false,
        "message": e.toString(),
      };
    }
  }
}