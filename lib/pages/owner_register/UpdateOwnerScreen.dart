import 'package:taxi_segurito_app/models/owner.dart';

import 'ScreenOwnerBase.dart';
import 'owner_register_functionality.dart';

// ignore: must_be_immutable
class UpdateOwnerScreen extends ScreenOwnerBase {
  Owner owner = new Owner.init();

  /*Company company =
      new Company(idCompany: '1', companyName: 'San bernardo', nit: '543234');*/
  UpdateOwnerScreen(this.owner);

  RegisterOwnerFunctionality registerOwnerFunctionality =
      new RegisterOwnerFunctionality();

  @override
  RegisterOwnerFunctionality functionality() {
    company.idCompany = owner.idCompany;
    return registerOwnerFunctionality;
  }

  @override
  String tittleDialog() {
    return 'Actualizado Exitoso';
  }

  @override
  String tittleScreen() {
    return 'Actualizacion del Propietario';
  }

  @override
  String textButtom() {
    return 'Actualizar';
  }

  @override
  String textDeleteButton() {
    return 'Cancelar';
  }

  @override
  eventActionUpdate() {
    registerOwnerFunctionality.onPressedbtnUpdateOwner();
  }

  @override
  eventActionDelete() {
    registerOwnerFunctionality.onPressedbtnDeleteOwner();
  }
}
