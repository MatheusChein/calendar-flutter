import 'package:calendar_app/components/time_slot.dart';
import 'package:calendar_app/pages/home/widgets/calendar.dart';
import 'package:flutter/material.dart';

import '../../../components/confirmation_dialog.dart';
import '../../../components/custom_text.dart';
import '../../../components/responsive.dart';
import '../../../constants/colors.dart';

class MainSection extends StatefulWidget {
  const MainSection({
    Key? key,
  }) : super(key: key);

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  Widget renderResponsiveGroup(BuildContext context,
      {required List<Widget> children}) {
    return ResponsiveWidget.isLargeScreen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          )
        : SizedBox(
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          );
  }

  final List<String> timeSlots = <String>[
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
  ];

  String selectedTimeSlot = '';

  String selectedDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

  void setSelectedDate(dateString) {
    setState(() {
      selectedDate = dateString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: Container(
        height: 700,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 6),
              color: boxShadowColor,
              blurRadius: 12,
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      label: 'Matheus Chein',
                      size: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      label: 'Reunião de 30 min',
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 1000,
                    ),
                    child: Calendar(
                      setSelectedDate: setSelectedDate,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CustomText(
                            label:
                                'Escolha seu horário para o dia $selectedDate'),
                        SizedBox(height: 12),
                        Container(
                          height: 500,
                          child: ListView.separated(
                            padding: EdgeInsets.only(top: 12),
                            scrollDirection: Axis.vertical,
                            itemCount: timeSlots.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TimeSlot(
                                isSelected:
                                    timeSlots[index] == selectedTimeSlot,
                                label: timeSlots[index],
                                onTap: () {
                                  setState(
                                    () {
                                      if (timeSlots[index] ==
                                          selectedTimeSlot) {
                                        selectedTimeSlot = '';
                                        return;
                                      }

                                      selectedTimeSlot = timeSlots[index];
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            ConfirmationDialog(),
                                      );
                                    },
                                  );
                                },
                                color: timeSlots[index] == selectedTimeSlot
                                    ? primaryColor
                                    : Colors.white,
                                hoveringColor:
                                    timeSlots[index] == selectedTimeSlot
                                        ? Colors.white
                                        : primaryColor,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
