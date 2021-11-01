import 'dart:convert';
import 'package:taxi_segurito_app/models/HistoryReview.dart';
import 'env.dart';
import 'package:http/http.dart' as http;

Future<List<HistoryReviewModel>> selectHistoryReview(String criteria) async {
  try {
    String path = Service.urlLocal +
        "HistoryReview/historyReview_controller.php?criteria=" +
        criteria;

    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return Future<List<HistoryReviewModel>>.value(
        convertToList(response),
      );
    } else {
      return Future<List<HistoryReviewModel>>.value(
        [],
      );
    }
  } catch (exception) {
    return Future<List<HistoryReviewModel>>.value(
      [],
    );
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
