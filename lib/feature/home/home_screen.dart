import 'package:chrconnecthpdraft/feature/home/components/appointments/appointments.dart';
import 'package:chrconnecthpdraft/feature/home/components/inbox/inbox.dart';
import 'package:chrconnecthpdraft/feature/home/components/more_resources.dart';
import 'package:chrconnecthpdraft/feature/home/components/welcoming.dart';
import 'package:flutter/material.dart';

import 'components/reminders/reminders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/background.png'),
        const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Welcoming(
                  state: WelcomingStates.evening,
                  name: "Linda",
                ),
              ),
              SizedBox(height: 32),
              Reminders(),
              SizedBox(height: 32),
              Appointments(verticalLayout: true),
              SizedBox(height: 32),
              Inbox(verticalLayout: true),
              SizedBox(height: 32),
              MoreResources(),
              SizedBox(height: 88),
            ],
          ),
        ),
      ],
    );
  }
}
