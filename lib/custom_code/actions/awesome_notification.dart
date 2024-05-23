// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:awesome_notifications/awesome_notifications.dart';

Future awesomeNotification(
  int idRecordatorio,
  String? recordatorioTarea,
  String? mensajeRecordatorio,
  int? recordatorioDia,
  int? recordatorioMes,
  int? recordatorioHora,
  int? recordatorioMinutos,
  bool? recordatorioTareaTurnOn,
) async {
  /// Inicializa las notificaciones
  AwesomeNotifications().initialize(
      '',
      [
        //Recordatorio
        NotificationChannel(
            channelGroupKey: 'scheduled_channel_group',
            channelKey: 'recordatorio',
            channelName: 'recordatorio tarea',
            channelDescription: 'Notificacion para los recordatorios',
            ledColor: Colors.white,
            defaultColor: const Color.fromRGBO(5, 168, 235, 1),
            importance: NotificationImportance.High),
      ],
      debug: true);

  //
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();

  if (recordatorioTareaTurnOn == true) {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: idRecordatorio,
          channelKey: 'recordatorio',
          title: recordatorioTarea,
          body: mensajeRecordatorio,
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          notificationLayout: NotificationLayout.Default,
        ),
        schedule: NotificationCalendar(
            day: recordatorioDia,
            month: recordatorioMes,
            hour: recordatorioHora,
            minute: recordatorioMinutos,
            second: 00,
            timeZone: localTimeZone,
            preciseAlarm: true,
            repeats: true));
  }
  if (recordatorioTareaTurnOn == false) {
    await AwesomeNotifications().cancel(idRecordatorio);
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
