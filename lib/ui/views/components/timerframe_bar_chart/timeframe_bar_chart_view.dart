import 'package:chess/ui/views/components/timerframe_bar_chart/timeframe_bar_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../domain/Assets/styles.dart';
import '../game_accuracy_slider/game_accuracy_slider.dart';
import '../shared/popup_panel/popup_panel_view.dart';

class TimeframeBarChart extends StatelessWidget {
  const TimeframeBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => TimeframeBarChartViewModel()),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => MouseRegion(
        cursor: viewModel.isCursorVisible,
        onHover: (event) => viewModel.mousePositionChanged(event),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: viewModel.chartData
                    .map((e) => Container(
                          height: viewModel.getElementHeight(e),
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: GameAccuracySlider(
                            move: e.move,
                            black: e.blackTime,
                            white: e.whiteTime,
                            rounding: 12,
                            width: 10,
                            onWhiteHoverEnter: viewModel.whiteBarHoverEnter,
                            onWhiteHoverExit: (() =>
                                viewModel.whiteBarHoverExit(e)),
                            onBlackHoverEnter: viewModel.blackBarHoverEnter,
                            onBlackHoverExit: (() =>
                                viewModel.blackBarHoverExit(e)),
                            blackColor: ThemeColors.mainThemeBackground,
                          ),
                        ))
                    .toList(),
              ),
            ),
            PopupPanel(
              isVisible: viewModel.itemHovered,
              x: viewModel.mouseX,
              y: viewModel.mouseY,
              render: Text(
                "Time spent on move #${viewModel.selectedItem?.move ?? "0"}: ${viewModel.selectedItem?.time ?? "0"}",
                style: TextStyle(color: ThemeColors.mainText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
