import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/historyReview/ListViewHistoryReview.dart';
import 'package:taxi_segurito_app/services/HistoryReviewService.dart';
import '../../../components/sidemenu/side_menu.dart';

class HistoryReview extends StatefulWidget {
  HistoryReview({Key? key}) : super(key: key);
  String? idUser;

  @override
  _HistoryReviewState createState() => _HistoryReviewState();
}

class _HistoryReviewState extends State<HistoryReview> {
  Color colorMain = Color.fromRGBO(242, 212, 61, 1);

  selectHistoryReviewDataBase(String criteria) {
    listHistoryReviewGlobal.clear();
    try {
      selectHistoryReview(criteria).then((value) {
        listHistoryReviewGlobal = value;
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.idUser = "55";
    selectHistoryReviewDataBase(widget.idUser!);
  }

  @override
  Widget build(BuildContext context) {
    ListViewHistoryReview listViewHistoryReview = new ListViewHistoryReview();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        elevation: 0,
        title: Text(
          'Historial de reseñas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: SideMenu(),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(child: listViewHistoryReview),
            )
          ],
        ),
      ),
    );
  }
}
