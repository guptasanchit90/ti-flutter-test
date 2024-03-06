import 'package:flutter/material.dart';

class OnboardingMessage extends StatefulWidget {
  final void Function() onNextEvent;
  final String message;
  final String actionText;

  const OnboardingMessage(
      {super.key,
      required this.onNextEvent,
      required this.message,
      required this.actionText});

  @override
  State<OnboardingMessage> createState() => _OnboardingMessageState();
}

class _OnboardingMessageState extends State<OnboardingMessage> {
  bool _showAction = false;
  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _showMessage = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        _showAction = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          _getMessage(context),
          const SizedBox(height: 12),
          _getActionButton(context),
        ],
      ),
    );
  }

  AnimatedOpacity _getMessage(BuildContext context) {
    return AnimatedOpacity(
        opacity: _showMessage ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Text(
          widget.message,
          style: Theme.of(context).textTheme.displayMedium,
        ));
  }

  AnimatedOpacity _getActionButton(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showAction ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              iconColor: Colors.black,
              alignment: Alignment.centerLeft,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
            ),
            onPressed: () {
              widget.onNextEvent();
            },
            icon: const Icon(Icons.arrow_back),
            label: Text(
              widget.actionText,
              style: Theme.of(context).textTheme.displaySmall!,
            ),
          )),
    );
  }
}
