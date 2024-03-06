import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:chrconnecthpdraft/feature/home/components/appointments/appointments.dart';
import 'package:chrconnecthpdraft/feature/home/components/inbox/inbox.dart';
import 'package:chrconnecthpdraft/feature/home/components/more_resources.dart';
import 'package:chrconnecthpdraft/feature/home/components/reminders/reminders.dart';
import 'package:chrconnecthpdraft/feature/home/components/welcoming.dart';
import 'package:chrconnecthpdraft/feature/onboarding/components/onboarding_message.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final bgColor = const Color.fromARGB(255, 174, 146, 205);
  int onboardingPosition = 0;

  void _onNextEvent() {
    setState(() {
      onboardingPosition = onboardingPosition + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'Close',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: getWidget(),
        ));
  }

  Widget getWidget() {
    switch (onboardingPosition) {
      case 1:
        return _getRemindersPage();
      case 2:
        return _getAppointmentPage();
      case 3:
        return _getInboxPage();
    }
    return _buildWelcomePage();
  }

  ListView _getRemindersPage() {
    return ListView(children: [
      const SizedBox(height: 32),
      ScaleTransition(
        scale: CurvedAnimation(
          parent: AnimationController(
            duration: const Duration(seconds: 2),
            vsync: this,
          )..forward(),
          curve: Curves.fastOutSlowIn,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: AbsorbPointer(child: Reminders()),
          ),
        ),
      ),
      const SizedBox(height: 20),
      OnboardingMessage(
        key: Key('Key-$onboardingPosition'),
        onNextEvent: _onNextEvent,
        message: context.localizations.onboarding_reminders_message,
        actionText: context.localizations.onboarding_reminders_action,
      )
    ]);
  }

  ListView _getAppointmentPage() {
    return ListView(children: [
      const SizedBox(height: 32),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: AnimationController(
                duration: const Duration(milliseconds: 400),
                vsync: this,
              )..forward(),
              curve: Curves.linear,
            )),
            child: const AbsorbPointer(
              child: Appointments(
                verticalLayout: true,
                showSingle: true,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      OnboardingMessage(
        key: Key('Key-$onboardingPosition'),
        onNextEvent: _onNextEvent,
        message: context.localizations.onboarding_appointments_message,
        actionText: context.localizations.onboarding_appointments_action,
      )
    ]);
  }

  ListView _getInboxPage() {
    return ListView(children: [
      const SizedBox(height: 32),
      OnboardingMessage(
        key: Key('Key-$onboardingPosition'),
        onNextEvent: () {
          Navigator.pop(context);
        },
        message: context.localizations.onboarding_inbox_message,
        actionText: context.localizations.onboarding_inbox_action,
      ),
      const SizedBox(height: 20),
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: AnimationController(
            duration: const Duration(milliseconds: 400),
            vsync: this,
          )..forward(),
          curve: Curves.linear,
        )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: AbsorbPointer(
              child: Column(
                children: [
                  Inbox(verticalLayout: true),
                  SizedBox(height: 20),
                  MoreResources(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  ListView _buildWelcomePage() {
    return ListView(children: [
      Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Welcoming(
            state: WelcomingStates.evening,
            name: "Linda",
          ),
        ),
      ),
      const SizedBox(height: 20),
      OnboardingMessage(
        key: Key('Key-$onboardingPosition'),
        onNextEvent: _onNextEvent,
        message: context.localizations.onboarding_init_message,
        actionText: context.localizations.onboarding_init_action,
      )
    ]);
  }
}
