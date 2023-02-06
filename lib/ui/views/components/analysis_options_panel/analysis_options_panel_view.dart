import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:charts_painter/chart.dart';

import '../../../../domain/Assets/styles.dart';
import '../shared/tab_buton/tab_button_view.dart';
import 'analysis_options_panel_viewmodel.dart';

class AnalysisOptionsPanel extends StatelessWidget {
  const AnalysisOptionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => AnalysisOptionPanelViewModel()),
      builder: ((context, viewModel, child) => Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TabButton(
                      icon: Icons.line_axis,
                      iconSize: 15,
                      label: "Analysis Chart",
                      isActive: true,
                      callback: () => {},
                    ),
                  ),
                  Expanded(
                    child: TabButton(
                      icon: Icons.timer,
                      iconSize: 15,
                      label: "Move Times",
                      isActive: false,
                      callback: () => {},
                    ),
                  ),
                  Expanded(
                    child: TabButton(
                      icon: Icons.share,
                      iconSize: 15,
                      label: "Share and export",
                      isActive: false,
                      callback: () => {},
                    ),
                  ),
                  Expanded(
                    child: TabButton(
                      icon: Icons.difference,
                      iconSize: 15,
                      label: "Variations",
                      isActive: false,
                      callback: () => {},
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 10,
                child: Chart(
                    state: ChartState<void>(
                  data: ChartData.fromList(
                    viewModel.chartTestData
                        .map((e) => ChartItem<GestureDetector>(e.toDouble()))
                        .toList(),
                    axisMax: 8,
                  ),
                  itemOptions: BarItemOptions(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    barItemBuilder: (_) => BarItem(
                      color: Colors.red,
                      radius: BorderRadius.vertical(top: Radius.circular(12.0)),
                    ),
                  ),
                  behaviour: ChartBehaviour(
                    isScrollable: false,
                    onItemHoverEnter: (value) {
                      print(value);
                    },
                    onItemHoverExit: (value) {
                      print(value);
                    },
                    onItemClicked: (value) {
                      print(value);
                    },
                  ),
                  backgroundDecorations: [
                    SparkLineDecoration(
                      smoothPoints: true,
                      fill: true,
                      lineColor: Theme.of(context).accentColor,
                    ),
                  ],
                )),
              )
            ],
          )),
    );
  }
}
