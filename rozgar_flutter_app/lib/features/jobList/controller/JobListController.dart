import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';

import '../models/JobModel.dart';



final jobProvider =
FutureProvider<List<JobModel>>((ref) async {
  final response = await http.get(
    Uri.parse(ApiConstants.jobList),
  );

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);

    return data
        .map((e) => JobModel.fromJson(e))
        .toList();
  } else {
    throw Exception("Failed to load jobs");
  }
});