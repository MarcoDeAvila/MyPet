import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/componentes/eliminar_perfil/eliminar_perfil_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'editar_mascota_widget.dart' show EditarMascotaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarMascotaModel extends FlutterFlowModel<EditarMascotaWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? imagen;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFieldNombre widget.
  FocusNode? textFieldNombreFocusNode;
  TextEditingController? textFieldNombreTextController;
  String? Function(BuildContext, String?)?
      textFieldNombreTextControllerValidator;
  String? _textFieldNombreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa el nombre';
    }

    return null;
  }

  // State field(s) for TextFieldEdad widget.
  FocusNode? textFieldEdadFocusNode;
  TextEditingController? textFieldEdadTextController;
  String? Function(BuildContext, String?)? textFieldEdadTextControllerValidator;
  // State field(s) for TextFieldPeso widget.
  FocusNode? textFieldPesoFocusNode;
  TextEditingController? textFieldPesoTextController;
  String? Function(BuildContext, String?)? textFieldPesoTextControllerValidator;
  // State field(s) for TextFieldRaza widget.
  FocusNode? textFieldRazaFocusNode;
  TextEditingController? textFieldRazaTextController;
  String? Function(BuildContext, String?)? textFieldRazaTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MascotasRecord? singleUpdateMascota;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    textFieldNombreTextControllerValidator =
        _textFieldNombreTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldNombreFocusNode?.dispose();
    textFieldNombreTextController?.dispose();

    textFieldEdadFocusNode?.dispose();
    textFieldEdadTextController?.dispose();

    textFieldPesoFocusNode?.dispose();
    textFieldPesoTextController?.dispose();

    textFieldRazaFocusNode?.dispose();
    textFieldRazaTextController?.dispose();
  }
}
