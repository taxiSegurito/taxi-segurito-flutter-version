import 'package:taxi_segurito_app/models/company.dart';
import 'base_company_screen.dart';
import 'company_screen_functionality.dart';

// ignore: must_be_immutable
class CompanyEditScreen extends BaseCompanyScreen {
  Company company = new Company();
  CompanyEditScreen(this.company);
  CompanyScreenFunctionality screensCompanyFunctionality =
      new CompanyScreenFunctionality();
  @override
  void eventAction() {
    screensCompanyFunctionality.onPressedBtnUpdate();
  }

  @override
  CompanyScreenFunctionality functionality() {
    return screensCompanyFunctionality;
  }

  @override
  String textButton() {
    return 'Actualizar';
  }

  @override
  String titleScreen() {
    return 'Actualizar Compañia';
  }

  @override
  String tittleDialog() {
    return 'Actualizacion Exitosa';
  }
}
