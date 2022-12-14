// ignore_for_file: must_be_immutable
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_matrix_of_skills/src/core/constants/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class CircularChart extends StatelessWidget {
  final Map<String, dynamic> data;
  const CircularChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Platform.isWindows ? (data.keys.toList().length > 6) ? (MediaQuery.of(context).size.width * 0.3) : (MediaQuery.of(context).size.width * 0.25) : (MediaQuery.of(context).size.height * 0.25),
      width: Platform.isWindows ?  (data.keys.toList().length > 6) ? (MediaQuery.of(context).size.width * 0.3) : (MediaQuery.of(context).size.width * 0.25) : (MediaQuery.of(context).size.height * 0.25),
      child: SfCircularChart(
        legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.scroll,
            textStyle: whiteTextColor,
            position: (data.keys.toList().length > 6) ? LegendPosition.right : LegendPosition.bottom),
        series: [
          PieSeries(
            explode: true,
            explodeAll: true,
            dataSource: data.keys.toList().sublist(2),
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                showZeroValue: false,
                textStyle: (data.keys.toList().length > 6) ?
                const TextStyle(color: MyColors.customBlack, fontWeight: FontWeight.bold, fontSize: 18)
                    :
                const TextStyle(color: MyColors.mainBeige, fontWeight: FontWeight.bold, fontSize: 14)
            ),

            xValueMapper: (key, index) => key,
            yValueMapper: (key, index) => data[key],
          ),
        ],
      ),
    );
  }
}
