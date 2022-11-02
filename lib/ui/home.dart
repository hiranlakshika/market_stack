import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../blocs/market_stack_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MarketStackBloc _marketStackBloc = GetIt.I<MarketStackBloc>();
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<FirebaseRemoteConfig> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            _loadingWidget();
          }
          if (snapshot.hasData) {
            debugPrint('Firebase Remote Config initialized');
          }
          return const SizedBox();
        },
        future: _marketStackBloc.initRemoteConfig(),
      ) /*Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Selected date: $_selectedDate'),
                Text('Selected date count: $_dateCount'),
                Text('Selected range: $_range'),
                Text('Selected ranges count: $_rangeCount')
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 80,
            right: 0,
            bottom: 0,
            child: SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)), DateTime.now().add(const Duration(days: 3))),
            ),
          )
        ],
      )*/
      ,
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget _emptyItemsText() {
    return const Center(
      child: Text('Sorry we don\'t have anything to show'),
    );
  }
}
