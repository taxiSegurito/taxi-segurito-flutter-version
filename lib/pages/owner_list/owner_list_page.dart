import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/buttons/refresh_button.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/components/inputs/SearchBar.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/services/owner_service.dart';
import 'widgets/owner_list.dart';

class OnwerListPage extends StatefulWidget {
  OnwerListPage({Key? key}) : super(key: key);

  @override
  _OnwerListPageState createState() => _OnwerListPageState();
}

class _OnwerListPageState extends State<OnwerListPage> {
  OwnerService _ownersService = OwnerService();
  late Future<List<Owner>> owners;

  @override
  initState() {
    super.initState();
    owners = _ownersService.select();
  }

  void _loadOwners() {
    setState(() {
      owners = _ownersService.select();
    });
  }

  void _searchOwners(String value) {
    setState(() {
      owners = _ownersService.selectByNameCiOrPhone(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar = new AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Dueños",
        textAlign: TextAlign.right,
        style: TextStyle(),
      ),
    );

    Widget searchbar = Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(right: 8),
            child: CustomTextFieldSearch(
              callbackValueSearch: _searchOwners,
              hint: 'Buscar por nombre, Ci ...',
            ),
          ),
        ),
        RefreshButton(_loadOwners),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: appbar,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: new EdgeInsets.only(
                  top: 5.0, bottom: 10.0, left: 20.0, right: 20.0),
              child: searchbar,
            ),
            Expanded(
              child: OwnerList(owners),
            )
          ],
        ),
      ),
    );
  }
}
