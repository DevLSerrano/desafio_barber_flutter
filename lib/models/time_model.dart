class TimeInHoursModel {
  String time;
  bool isAvailable;
  bool isSelected;

  TimeInHoursModel({
    required this.time,
    this.isAvailable = true,
    this.isSelected = false,
  });

  static List<TimeInHoursModel> get fakeList => [
        TimeInHoursModel(
          time: '08:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '09:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '10:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '11:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '12:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '13:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '14:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '15:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '16:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '17:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '18:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '19:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
        TimeInHoursModel(
          time: '20:00',
          isAvailable: DateTime.now().microsecond % 2 == 0,
        ),
      ];

  static List<TimeInHoursModel> get fakeListUnavailable => [
        TimeInHoursModel(
          time: '08:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '09:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '10:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '11:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '12:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '13:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '14:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '15:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '16:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '17:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '18:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '19:00',
          isAvailable: false,
        ),
        TimeInHoursModel(
          time: '20:00',
          isAvailable: false,
        ),
      ];
}
