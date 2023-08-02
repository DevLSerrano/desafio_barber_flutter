import 'package:flutter/material.dart';

import '../models/day_of_week_model.dart';

class SchedulingClientPage extends StatefulWidget {
  final List<DayOfWeekModel> listOdDaysAvailable;

  const SchedulingClientPage({
    super.key,
    required this.listOdDaysAvailable,
  });

  @override
  State<SchedulingClientPage> createState() => _SchedulingClientPageState();
}

class _SchedulingClientPageState extends State<SchedulingClientPage> {
  final textControllerDate = TextEditingController();
  late DayOfWeekModel selectedDayOfWeek;
  bool get isButtonEnabled {
    return selectedDayOfWeek.timesAvailable
        .any((element) => element.isSelected);
  }

  @override
  void initState() {
    updateModelsWhenSelectedTime(
      widget.listOdDaysAvailable.firstDayOfWeekAvailable.date,
    );

    super.initState();
  }

  void updateModelsWhenSelectedTime(DateTime date) {
    textControllerDate.text = '${date.day}/${date.month}/${date.year}';
    setState(() {
      selectedDayOfWeek = widget.listOdDaysAvailable.firstBasedOnDateTime(date);
      selectedDayOfWeek.clearAllSelected();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Agendar Cliente'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Cliente',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: textControllerDate,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        selectableDayPredicate: (date) {
                          return widget.listOdDaysAvailable
                              .containsThisDateAndIsAvailable(date);
                        },
                        initialDate: widget
                            .listOdDaysAvailable.firstDayOfWeekAvailable.date,
                        firstDate: DateTime(2023, 1, 1),
                        lastDate: DateTime(2024, 1, 1),
                      ).then((value) {
                        if (value != null) {
                          updateModelsWhenSelectedTime(value);
                        }
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'Dia da semana',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.date_range_outlined)),
                  ),
                  const SizedBox(height: 16),
                  const Text('Selecione um horário disponível'),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverAnimatedGrid(
              initialItemCount: selectedDayOfWeek.timesAvailable.length,
              itemBuilder: (context, index, animation) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedDayOfWeek.timesAvailable[index].isAvailable) {
                      setState(() {
                        selectedDayOfWeek.clearAllSelected();
                        selectedDayOfWeek.timesAvailable[index].isSelected =
                            !selectedDayOfWeek.timesAvailable[index].isSelected;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      selectedDayOfWeek.timesAvailable[index].isAvailable
                          ? selectedDayOfWeek.timesAvailable[index].isSelected
                              ? Colors.green
                              : Colors.blue
                          : Colors.grey,
                    ),
                  ),
                  child: Text(
                    selectedDayOfWeek.timesAvailable[index].time,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: isButtonEnabled ? () {} : null,
                child: const Text('Agendar'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
