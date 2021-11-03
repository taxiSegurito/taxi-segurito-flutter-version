import 'base_company_screen.dart';
import 'company_screen_functionality.dart';

// ignore: must_be_immutable
class CompanyRegisterScreen extends BaseCompanyScreen {
  CompanyScreenFunctionality funcionality = new CompanyScreenFunctionality();
  @override
  void eventAction() {
    funcionality.onPressedBtnRegister();
  }

  @override
  CompanyScreenFunctionality getFunctionality() {
    return funcionality;
  }

  @override
  String getButtonText() {
    return 'Registrar';
  }

  @override
  String getScreenTitle() {
    return 'Registrar Compañia';
  }

  @override
  String getDialogTitle() {
    return 'Registro Exitoso';
  }
}
