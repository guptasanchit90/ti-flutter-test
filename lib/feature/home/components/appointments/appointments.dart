import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:chrconnecthpdraft/feature/home/components/section/section_column.dart';
import 'package:flutter/material.dart';

import '../section/section.dart';
import '../section/section_row.dart';
import 'appointments_item.dart';

class Appointments extends StatelessWidget {
  const Appointments({
    Key? key,
    this.verticalLayout = false,
    this.showSingle = false,
  }) : super(key: key);

  final bool verticalLayout;
  final bool showSingle;

  @override
  Widget build(BuildContext context) {
    return Section(
      name: context.localizations.upcoming_appointments,
      showViewAll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(context.localizations.today),
                  selected: true,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('June 13'),
                  selected: false,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('July 25'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _sectionLayoutContent(),
        ],
      ),
    );
  }

  Widget _sectionLayoutContent() {
    var children = [
      AppointmentsItem(
        date: DateTime.now(),
        duration: const Duration(minutes: 30),
        title: "Counselling Session",
        subtitle: "Dr. Gregory House",
        place: 'LMC Optometry & Eye Care',
        cta: "Join virtual visit",
        image: Image.asset('images/house.png').image,
        condensed: verticalLayout,
      ),
      AppointmentsItem(
        date: DateTime.now(),
        duration: const Duration(minutes: 30),
        title: "Counselling Session",
        subtitle: "Dr. Gregory House",
        place: 'LMC Optometry & Eye Care',
        cta: "Check in",
        image: Image.asset('images/house.png').image,
        condensed: verticalLayout,
      ),
    ];
    children = showSingle ? [children.first] : children;

    return verticalLayout
        ? SectionColumn(children: children)
        : SectionRow(children: children);
  }
}
