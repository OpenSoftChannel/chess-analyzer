import 'package:charts_painter/chart.dart';
import 'package:chess/ui/views/components/line_chart/line_chart_popup_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../domain/Assets/styles.dart';
import '../shared/popup_panel/popup_panel_view.dart';
import 'line_chart_viewmodel.dart';

class LineChart extends StatelessWidget {
  final Color color;

  const LineChart({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LineChartViewModel(),
        builder: (context, viewModel, child) => MouseRegion(
              cursor: SystemMouseCursors.none,
              onHover: ((pointer) => viewModel.onHover(pointer)),
              onExit: ((pointer) => viewModel.disablePopup()),
              child: Stack(
                children: [
                  Chart(
                    state: ChartState<void>(
                      data: ChartData.fromList(
                        viewModel.chartTestData
                            .map(
                                (e) => ChartItem<GestureDetector>(e.toDouble()))
                            .toList(),
                        axisMax: 8,
                      ),
                      itemOptions: BarItemOptions(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        barItemBuilder: (_) => BarItem(
                          color: Colors.transparent,
                          radius:
                              BorderRadius.vertical(top: Radius.circular(12.0)),
                        ),
                      ),
                      behaviour: ChartBehaviour(
                        isScrollable: false,
                        onItemHoverEnter: ((value) =>
                            viewModel.enablePopup(value)),
                        onItemClicked: (value) {
                          // print(value);
                        },
                      ),
                      backgroundDecorations: [
                        SparkLineDecoration(
                          stretchLine: true,
                          smoothPoints: true,
                          fill: true,
                          lineColor: color,
                        ),
                      ],
                    ),
                  ),
                  PopupPanel(
                    x: viewModel.mouseX,
                    y: viewModel.mouseY,
                    isVisible: viewModel.isInRegion,
                    render: LineChartPopup(
                      line: "1",
                      move: "qc4..kef5",
                      advantage: "22",
                    ),
                  )
                ],
              ),
            ));
  }
}
