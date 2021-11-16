import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'owner_list_item.dart';

class OwnerList extends StatelessWidget {
  Future<List<Owner>> ownersFuture;
  OwnerList(this.ownersFuture);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return new Container(
      height: height,
      width: width,
      child: FutureBuilder(
        future: ownersFuture,
        builder: (_, AsyncSnapshot<List<Owner>> snapshot) {
          if (snapshot.hasData) {
            final owners = snapshot.data!;
            return ListView.builder(
              itemCount: owners.length,
              itemBuilder: (context, index) {
                final owner = owners[index];
                return OwnerListItem(owner);
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
