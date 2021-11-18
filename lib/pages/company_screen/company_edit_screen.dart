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
  CompanyScreenFunctionality getFunctionality() {
    return screensCompanyFunctionality;
  }

  @override
  String getButtonText() {
    return 'Actualizar';
  }

  @override
  String getScreenTitle() {
    return 'Actualizar Compañia';
  }

  @override
  String getDialogTitle() {
    return 'Actualizacion Exitosa';
  }
}
