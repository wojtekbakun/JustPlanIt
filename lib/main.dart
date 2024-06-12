import 'package:flutter/material.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Calendar(),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    calendar.Event event = calendar.Event(
      summary: 'My Event',
      description: 'A description of my event',
      start: calendar.EventDateTime(dateTime: DateTime.now()),
      end: calendar.EventDateTime(
          dateTime: DateTime.now().add(Duration(hours: 1))),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call a function to add the event to Google Calendar
            debugPrint("Adding event to Google Calendar");
            addToGoogleCalendar(event);
            debugPrint("Done");
          },
          child: const Text('Add Event to Google Calendar'),
        ),
      ),
    );
  }
}

void addToGoogleCalendar(calendar.Event event) async {
  try {
    await clientViaUserConsent(
            ClientId(
                "358106263610-ps2ep03p0gp9k3jcluj2q1jolktuidff.apps.googleusercontent.com",
                "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"),
            [calendar.CalendarApi.calendarScope],
            prompt)
        .then((AuthClient client) async {
      try {
        var calendarApi = calendar.CalendarApi(client);
        var addedEvent =
            await calendarApi.events.insert(event, "primary").then((value) {
          print("ADDEDDD_________________${value.status}");
          if (value.status == "confirmed") {
            debugPrint('Event added in google calendar');
          } else {
            debugPrint("Unable to add event in google calendar");
          }
        });
        debugPrint("Event added: ${addedEvent.htmlLink}");
      } catch (e) {
        debugPrint("Error adding event $e");
      }
    });
  } catch (e) {
    debugPrint("Error adding event: $e");
  }
}

void prompt(String url) async {
  // Otwórz URL w przeglądarce, aby użytkownik mógł zatwierdzić dostęp
  html.window.open(url, '_blank');
  debugPrint("Odpalam linku: $url");
  //await launchUrlString(url);
}
