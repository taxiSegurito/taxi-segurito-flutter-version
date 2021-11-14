import 'dart:convert';
import 'package:taxi_segurito_app/models/HistoryReview.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'package:http/http.dart' as http;

Future<List<HistoryReviewModel>> selectHistoryReview(String criteria) async {
  try {
    final queryParams = {'criteria': criteria};

    final endpoint = Uri.http(
      Server.host,
      '${Server.baseEndpoint}/HistoryReview/historyReview_controller.php',
      queryParams,
    );
    var response = await http.get(endpoint);

    if (response.statusCode == 200) {
      return convertToList(response);
    }

    return [];
  } catch (exception) {
    return [];
  }
}

List<HistoryReviewModel> convertToList(response) {
  List<HistoryReviewModel> listCompany = [];
  for (var singleOwner in json.decode(response.body)) {
    listCompany.add(
      HistoryReviewModel.fromJson(singleOwner),
    );
  }
  return listCompany;
}
