import 'package:flutter/material.dart';

import '../models/day_of_week_model.dart';
import '../scheduling/scheduling_client_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SchedulingClientPage(
                      listOdDaysAvailable: DayOfWeekModel.fakeList,
                    ),
                  ),
                );
              },
              child: const Text('Cadastrar Cliente'),
            ),
          ),
        ],
      ),
    );
  }
}
