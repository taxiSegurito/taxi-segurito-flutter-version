import 'package:taxi_segurito_app/pages/menu/base_menu.dart';
import 'package:taxi_segurito_app/pages/menu/menu_item.dart';

class AdminMenu extends Menu {
  AdminMenu({String? name}) : super(name: name);
  @override
  List<MenuItem> getItems() {
    return [
      MenuItem(
        text: 'Ver lista de Dueños',
        iconPath: 'assets/icons/owner-menu.png',
        pageRoute: 'userList',
      ),
      MenuItem(
        text: 'Ver lista de Compañias',
        iconPath: 'assets/icons/company-menu.png',
        pageRoute: 'companyList',
      ),
      MenuItem(
        text: 'Registrar Dueño',
        iconPath: 'assets/icons/add-owner-menu.png',
        pageRoute: 'registerOwner',
      ),
      MenuItem(
        text: 'Registrar Compañia',
        iconPath: 'assets/icons/add-company-menu.png',
        pageRoute: 'registerCompany',
      ),
    ];
  }
}
