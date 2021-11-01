import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/HistoryReview.dart';
import 'package:taxi_segurito_app/models/ReportCar.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/providers/ImageAccessProvider.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';
import 'package:intl/intl.dart';

class HistoryReviewData extends StatefulWidget {
  HistoryReviewModel? historyReviewModel;

  HistoryReviewData({
    Key? key,
    this.historyReviewModel,
  }) : super(key: key);

  @override
  _HistoryReviewDataState createState() => _HistoryReviewDataState();
}

class _HistoryReviewDataState extends State<HistoryReviewData> {
  @override
  Widget build(BuildContext context) {
    String formatter =
        DateFormat('yMd').format(widget.historyReviewModel!.dateRegister!);
    Image imagedefault = new Image.asset(
      "assets/images/userDefault.png",
    );
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);

    Image imageMain =
        ImagesFileAdapter().viewImg64(widget.historyReviewModel!.photo!);

    Container columnOne = new Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            image: DecorationImage(image: imageMain.image, fit: BoxFit.cover),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );

    Container columnTwo = new Container(
      margin: EdgeInsets.only(
        left: 10,
      ),
      //height: 60,
      child: Container(
        //color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: Text(
                widget.historyReviewModel!.name!,
              ),
              subtitle: Text(
                widget.historyReviewModel!.pleik!,
              ),
            )
          ],
        ),
      ),
    );

    Container columnThree = new Container(
      height: 60,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Align(
                child: Text(formatter),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
    Container containerOwnerData = new Container(
      //height: 110,
      color: Color.fromRGBO(246, 246, 246, 1),
      margin:
          new EdgeInsets.only(top: 5.0, bottom: 5.0, left: 00.0, right: 00.0),
      child: Material(
        child: InkWell(
          splashColor: colorMain,
          child: Container(
            margin: new EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: columnOne,
                    ),
                    Expanded(
                      flex: 1,
                      child: columnTwo,
                    ),
                    Expanded(
                      flex: 0,
                      child: columnThree,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: RatingBarIndicator(
                        rating: double.parse(
                            widget.historyReviewModel!.calification!),
                        itemSize: 25,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(child: Text(widget.historyReviewModel!.coment!))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );

    return containerOwnerData;
  }
}
