import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/pages/owner_info/owner_info_page.dart';

class OwnerListItem extends StatelessWidget {
  Owner owner;
  OwnerListItem(this.owner);

  @override
  Widget build(BuildContext context) {
    Image imagedefault = new Image.asset(
      "assets/images/user_default.png",
    );

    Color colorMain = Color.fromRGBO(255, 193, 7, 1);

    Widget ownerImage = Container(
      alignment: Alignment.centerRight,
      width: 70,
      height: 70,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        image: DecorationImage(image: imagedefault.image, fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );

    Widget ownerInfo = Container(
      margin: EdgeInsets.only(left: 10),
      height: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            child: Text(
              owner.fullName,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600),
            ),
            alignment: Alignment.centerLeft,
          ),
          Align(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    "CI:",
                    style: TextStyle(
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
                Text(
                  owner.ci,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            alignment: Alignment.centerLeft,
          ),
          Align(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.phone,
                    size: 17,
                    color: Color.fromRGBO(207, 207, 207, 1),
                  ),
                ),
                Text(
                  owner.cellPhone,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );

    return Container(
      height: 110,
      color: Color.fromRGBO(246, 246, 246, 1),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
      child: Material(
        child: InkWell(
          splashColor: colorMain,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OwnerInfoPage(owner)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: ownerImage,
                ),
                Expanded(
                  flex: 1,
                  child: ownerInfo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
