import 'package:taxi_segurito_app/pages/menu/baseMenu.dart';
import 'package:taxi_segurito_app/pages/menu/menuItem.dart';

class OwnerMenu extends Menu {
  OwnerMenu.initial() : super.initial();
  OwnerMenu(String name) : super(name);

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
        pageRoute: '',
      ),
      MenuItem(
        text: 'Registrar conductor',
        iconPath: 'assets/icons/add-driver-menu.png',
        pageRoute: 'driverRegistration',
      ),
    ];
  }
}
