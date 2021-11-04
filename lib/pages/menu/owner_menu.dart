import 'package:taxi_segurito_app/pages/menu/base_menu.dart';
import 'package:taxi_segurito_app/pages/menu/menu_item.dart';

class OwnerMenu extends Menu {
  OwnerMenu({String? name}) : super(name: name);

  @override
  List<MenuItem> getItems() {
    return [
      MenuItem(
        text: 'Ver lista de conductores',
        iconPath: 'assets/icons/taxi-driver-menu.png',
        pageRoute: 'driverList',
      ),
      MenuItem(
        text: 'Ver lista de vehículos',
        iconPath: 'assets/icons/vehicle-menu.png',
        pageRoute: 'vehiclesList',
      ),
      MenuItem(
        text: 'Registrar conductor',
        iconPath: 'assets/icons/add-driver-menu.png',
        pageRoute: 'registerDriver',
      ),
    ];
  }
}
