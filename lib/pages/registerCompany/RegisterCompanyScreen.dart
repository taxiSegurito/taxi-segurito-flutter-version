import 'package:taxi_segurito_app/pages/registerCompany/BaseScreenCompany.dart';
import 'package:taxi_segurito_app/pages/registerCompany/ScreensCompanyFunctionality.dart';

class RegisterCompanyScreen extends BaseScreenCompany {
  ScreensCompanyFunctionality screensCompanyFunctionality =
      new ScreensCompanyFunctionality();
  @override
  void eventAction() {
    screensCompanyFunctionality.onPressedBtnRegister();
  }

  @override
  ScreensCompanyFunctionality functionality() {
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
