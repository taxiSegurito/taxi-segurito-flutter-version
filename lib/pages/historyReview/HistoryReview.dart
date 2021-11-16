import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/historyReview/ListViewHistoryReview.dart';
import 'package:taxi_segurito_app/services/HistoryReviewService.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import '../../../components/sidemenu/side_menu.dart';

class HistoryReview extends StatefulWidget {
  HistoryReview({Key? key}) : super(key: key);
  late int idUser;

  @override
  _HistoryReviewState createState() => _HistoryReviewState();
}

class _HistoryReviewState extends State<HistoryReview> {
  AuthService _authService = AuthService();

  Color colorMain = Color.fromRGBO(242, 212, 61, 1);

  selectHistoryReviewDataBase() async {
    widget.idUser = await _authService.getCurrentId();
    listHistoryReviewGlobal.clear();
    try {
      selectHistoryReview(widget.idUser).then((value) {
        listHistoryReviewGlobal = value;
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    selectHistoryReviewDataBase();
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
