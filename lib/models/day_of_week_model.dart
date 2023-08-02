import 'package:desafio_barber_flutter/models/time_model.dart';

extension HelpDayOfWeekModel on List<DayOfWeekModel> {
  bool containsThisDateAndIsAvailable(DateTime date) {
    return any((element) =>
        (
              element.date.day,
              element.date.month,
              element.date.year,
            ) ==
            (
              date.day,
              date.month,
              date.year,
            ) &&
        !element.isFullComplete);
  }

  DayOfWeekModel firstBasedOnDateTime(DateTime date) {
    return firstWhere((element) =>
        (
          element.date.day,
          element.date.month,
          element.date.year,
        ) ==
        (
          date.day,
          date.month,
          date.year,
        ));
  }

  DayOfWeekModel get firstDayOfWeekAvailable {
    return firstWhere((element) => !element.isFullComplete);
  }
}

class DayOfWeekModel {
  final String nameDayOfWeek;
  final DateTime date;

  List<TimeInHoursModel> timesAvailable;

  DayOfWeekModel({
    required this.nameDayOfWeek,
    required this.date,
    required this.timesAvailable,
  });

  void clearAllSelected() {
    for (var element in timesAvailable) {
      element.isSelected = false;
    }
  }

  bool get isFullComplete {
    return timesAvailable.every((time) => !time.isAvailable);
  }

  static List<DayOfWeekModel> get fakeList => [
        DayOfWeekModel(
          nameDayOfWeek: 'Segunda-feira',
          date: DateTime(2023, 07, 31),
          timesAvailable: TimeInHoursModel.fakeListUnavailable,
        ),
        DayOfWeekModel(
          nameDayOfWeek: 'Terça-feira',
          date: DateTime(2023, 08, 01),
          timesAvailable: TimeInHoursModel.fakeList,
        ),
        DayOfWeekModel(
          nameDayOfWeek: 'Quarta-feira',
          date: DateTime(2023, 08, 02),
          timesAvailable: TimeInHoursModel.fakeList,
        ),
        DayOfWeekModel(
          nameDayOfWeek: 'Quinta-feira',
          date: DateTime(2023, 08, 03),
          timesAvailable: TimeInHoursModel.fakeList,
        ),
        DayOfWeekModel(
          nameDayOfWeek: 'Sexta-feira',
          date: DateTime(2023, 08, 04),
          timesAvailable: TimeInHoursModel.fakeList,
        ),
        DayOfWeekModel(
          nameDayOfWeek: 'Sábado',
          date: DateTime(2023, 08, 05),
          timesAvailable: TimeInHoursModel.fakeList,
        ),
        DayOfWeekModel(
          nameDayOfWeek: 'Domingo',
          date: DateTime(2023, 08, 06),
          timesAvailable: TimeInHoursModel.fakeList,
        ),
      ];
}
