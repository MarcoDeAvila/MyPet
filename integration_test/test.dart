import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_peti2/flutter_flow/flutter_flow_drop_down.dart';
import 'package:my_peti2/flutter_flow/flutter_flow_icon_button.dart';
import 'package:my_peti2/flutter_flow/flutter_flow_widgets.dart';
import 'package:my_peti2/flutter_flow/flutter_flow_theme.dart';
import 'package:my_peti2/index.dart';
import 'package:my_peti2/main.dart';
import 'package:my_peti2/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:my_peti2/backend/firebase/firebase_config.dart';
import 'package:my_peti2/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    _overrideOnError();
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('HU-1-Mascotas', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SeleccionMascotaWidget(),
      ),
    ));

    expect(find.byKey(ValueKey('itemPerfilMascota_i9ph')), findsWidgets);
  });

  testWidgets('HU-2-RegistrarMascota', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.tap(find.byKey(ValueKey('IconButton_1un1')));
    expect(find.byKey(ValueKey('NombreValue')), findsOneWidget);
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.enterText(find.byKey(ValueKey('NombreValue')), 'McFly');
    await tester.enterText(find.byKey(ValueKey('EdadValue')), '3');
    await tester.enterText(find.byKey(ValueKey('PesoValue')), '26');
    await tester.enterText(
        find.byKey(ValueKey('RazaValue')), 'Golden Retriever');
    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('EspecieValue')),
      matching: find.text('Perro'),
    ));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.tap(find.byKey(ValueKey('Button_14ug')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    expect(find.byKey(ValueKey('itemPerfilMascota_i9ph')), findsOneWidget);
  });

  testWidgets('HU-3-Vacunas', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SeleccionMascotaWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('SeleccionMascota_kes3')));
    expect(find.byKey(ValueKey('NavBar1_4bja')), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('vacunasValue')));
    expect(find.byKey(ValueKey('Text_7wr7')), findsOneWidget);
  });

  testWidgets('HU-4-Historias', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SeleccionMascotaWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('SeleccionMascota_kes3')));
    expect(find.byKey(ValueKey('NavBar1_4bja')), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('historiasValue')));
    expect(find.byKey(ValueKey('Text_tsxz')), findsOneWidget);
  });

  testWidgets('HU-5-Recordatorios', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SeleccionMascotaWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('SeleccionMascota_kes3')));
    expect(find.byKey(ValueKey('NavBar1_4bja')), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('recordValue')));
    expect(find.byKey(ValueKey('Text_uiwd')), findsOneWidget);
  });

  testWidgets('HU-6-Consejos', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SeleccionMascotaWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('SeleccionMascota_kes3')));
    expect(find.byKey(ValueKey('NavBar1_4bja')), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('consejosValue')));
    expect(find.byKey(ValueKey('Text_5s8d')), findsOneWidget);
  });

  testWidgets('HU-7-EditarDatosMascota', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SeleccionMascotaWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('SeleccionMascota_kes3')));
    expect(find.byKey(ValueKey('NavBar1_4bja')), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('Icon_8t4c')));
    expect(find.byKey(ValueKey('TextFieldNombre_ugm6')), findsOneWidget);
    await tester.enterText(find.byKey(ValueKey('TextFieldNombre_ugm6')), 'Doc');
    await tester.tap(find.byKey(ValueKey('Button_c77r')));
    expect(find.byKey(ValueKey('itemPerfilMascota_i9ph')), findsOneWidget);
  });

  testWidgets('HU-8-EliminarMascota', (WidgetTester tester) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'correo_prueba@gmail.com', password: 'mypet123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SeleccionMascotaWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('SeleccionMascota_kes3')));
    expect(find.byKey(ValueKey('NavBar1_4bja')), findsOneWidget);
    await tester.tap(find.byKey(ValueKey('Icon_8t4c')));
    expect(find.byKey(ValueKey('TextFieldNombre_ugm6')), findsOneWidget);
    await tester.enterText(find.byKey(ValueKey('TextFieldNombre_ugm6')), 'Doc');
    await tester.tap(find.byKey(ValueKey('Button_c18x')));
    expect(find.byKey(ValueKey('itemPerfilMascota_i9ph')), findsNothing);
  });

  testWidgets('HU-9-login', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.enterText(
        find.byKey(ValueKey('CorreoValue')), 'correo_prueba@gmail.com');
    await tester.enterText(find.byKey(ValueKey('PasswordValue')), 'mypet123');
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.tap(find.byKey(ValueKey('Button_brdq')));
    expect(find.byKey(ValueKey('IconButton_1un1')), findsOneWidget);
  });

  testWidgets('HU-9-Register', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.enterText(
        find.byKey(ValueKey('CorreoValue')), 'correo_prueba@gmail.com');
    await tester.enterText(find.byKey(ValueKey('PasswordValue')), 'mypet123');
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.tap(find.byKey(ValueKey('Button_u71a')));
    expect(find.byKey(ValueKey('IconButton_1un1')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
