import 'package:taxi_segurito_app/models/Company.dart';
import 'BaseScreenCompany.dart';
import 'ScreensCompanyFunctionality.dart';

// ignore: must_be_immutable
class UpdateCompanyScreen extends BaseScreenCompany {
  Company company = new Company();
  UpdateCompanyScreen(this.company);
  ScreensCompanyFunctionality screensCompanyFunctionality =
      new ScreensCompanyFunctionality();
  @override
  void eventAction() {
    screensCompanyFunctionality.onPressedBtnUpdate();
  }

  @override
  ScreensCompanyFunctionality functionality() {
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
