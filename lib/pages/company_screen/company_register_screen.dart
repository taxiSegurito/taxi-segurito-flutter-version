import 'base_company_screen.dart';
import 'company_screen_functionality.dart';

// ignore: must_be_immutable
class CompanyRegisterScreen extends BaseCompanyScreen {
  CompanyScreenFunctionality screensCompanyFunctionality =
      new CompanyScreenFunctionality();
  @override
  void eventAction() {
    screensCompanyFunctionality.onPressedBtnRegister();
  }

  @override
  CompanyScreenFunctionality functionality() {
    return screensCompanyFunctionality;
  }

  @override
  String textButton() {
    return 'Registrar';
  }

  @override
  String titleScreen() {
    return 'Registrar Compañia';
  }

  @override
  String tittleDialog() {
    return 'Registro Exitoso';
  }
}
