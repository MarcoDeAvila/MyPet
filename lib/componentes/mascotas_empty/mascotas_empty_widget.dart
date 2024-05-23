import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mascotas_empty_model.dart';
export 'mascotas_empty_model.dart';

class MascotasEmptyWidget extends StatefulWidget {
  const MascotasEmptyWidget({super.key});

  @override
  State<MascotasEmptyWidget> createState() => _MascotasEmptyWidgetState();
}

class _MascotasEmptyWidgetState extends State<MascotasEmptyWidget> {
  late MascotasEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MascotasEmptyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 500.0,
        decoration: BoxDecoration(),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tu mascota deberia estar aqui 🐾',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Antipasto_bold',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
              Text(
                'Lista vacía',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Antipasto_Regular',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
