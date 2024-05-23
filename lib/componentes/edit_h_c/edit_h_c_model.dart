import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_h_c_widget.dart' show EditHCWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditHCModel extends FlutterFlowModel<EditHCWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for motivo widget.
  FocusNode? motivoFocusNode;
  TextEditingController? motivoTextController;
  String? Function(BuildContext, String?)? motivoTextControllerValidator;
  String? _motivoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa el motivo de visita.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCancel widget.
  ClinicaRecord? singleDelteHCQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonActualizar widget.
  ClinicaRecord? singleUpdateHCQuery;

  @override
  void initState(BuildContext context) {
    motivoTextControllerValidator = _motivoTextControllerValidator;
  }

  @override
  void dispose() {
    motivoFocusNode?.dispose();
    motivoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
