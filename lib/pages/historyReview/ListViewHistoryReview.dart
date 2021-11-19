import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/HistoryReview.dart';

import 'HistoryReviewData.dart';

List<HistoryReviewModel> listHistoryReviewGlobal = [];

class ListViewHistoryReview extends StatefulWidget {
  List<dynamic>? listHistoryReview = listHistoryReviewGlobal;
  void Function(dynamic dynamicObject)? callback;
  _ListViewHistoryReviewState _containerListViewState =
      new _ListViewHistoryReviewState();
  ListViewHistoryReview({Key? key, this.callback}) : super(key: key);

  @override
  _ListViewHistoryReviewState createState() {
    return _containerListViewState;
  }

  set setCallbak(function) {
    this.callback = function;
  }
}

class _ListViewHistoryReviewState extends State<ListViewHistoryReview> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return new Container(
      height: height,
      width: width,
      child: ListView.builder(
        itemCount: listHistoryReviewGlobal.length,
        itemBuilder: (context, index) {
          HistoryReviewModel historyReviewModel =
              listHistoryReviewGlobal[index];
          return new HistoryReviewData(
            historyReviewModel: historyReviewModel,
          );
        },
      ),
    );
  }
}
