import 'package:chess/domain/Assets/styles.dart';
import 'package:chess/ui/views/components/export_panel/export_panel_view.dart';
import 'package:chess/ui/views/components/line_chart/line_chart_view.dart';
import 'package:chess/ui/views/components/shared/IconButton/elevated_icon_button.dart';
import 'package:chess/ui/views/components/variations_panel/variations_panel_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math;

import '../shared/tab_buton/tab_button_view.dart';
import '../timerframe_bar_chart/timeframe_bar_chart_view.dart';
import 'analysis_options_panel_viewmodel.dart';

class AnalysisOptionsPanel extends StatelessWidget {
  const AnalysisOptionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => AnalysisOptionPanelViewModel()),
      onViewModelReady: (viewModel) => viewModel.ready(),
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
                      isActive: viewModel.isAdvantageOpen,
                      callback: () => viewModel.advantageOpen(),
                    ),
                  ),
                  Expanded(
                    child: TabButton(
                      icon: Icons.timer,
                      iconSize: 15,
                      label: "Move Times",
                      isActive: viewModel.isTimeframeOpen,
                      callback: () => viewModel.openTimeframe(),
                    ),
                  ),
                  Expanded(
                    child: TabButton(
                      icon: Icons.share,
                      iconSize: 15,
                      label: "Share and export",
                      isActive: viewModel.isExportOpen,
                      callback: () => viewModel.openExport(),
                    ),
                  ),
                  Expanded(
                    child: TabButton(
                      icon: Icons.difference,
                      iconSize: 15,
                      label: "Variations",
                      isActive: viewModel.isVaritationsOpen,
                      callback: () => viewModel.openVariations(),
                    ),
                  ),
                  Expanded(
                    child: TabButton(
                      color: ThemeColors.defaultBtnColor,
                      iconSize: 15,
                      isActive: true,
                      icon: Icons.arrow_back_outlined,
                      label: "Return",
                      callback: () => viewModel.returnToParent(),
                    ),
                  )
                ],
              ),
              if (viewModel.isAdvantageOpen)
                Expanded(
                  flex: 10,
                  child: Container(
                    color: ThemeColors.cardBackground,
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: Column(
                      children: [
                        Expanded(
                          child: LineChart(
                            color: ThemeColors.mainText,
                            popUpDirection: 0,
                            popUpBoxColor: ThemeColors.mainText,
                            popUpFontColor: ThemeColors.cardBackground,
                          ),
                        ),
                        Expanded(
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationX(math.pi),
                            child: LineChart(
                              color: ThemeColors.mainThemeBackground,
                              popUpDirection: math.pi,
                              popUpBoxColor: ThemeColors.mainText,
                              popUpFontColor: ThemeColors.cardBackground,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else if (viewModel.isExportOpen)
                Expanded(
                  flex: 10,
                  child: Container(
                    color: ThemeColors.cardBackground,
                    child: const ExportPanel(),
                  ),
                )
              else if (viewModel.isTimeframeOpen)
                Expanded(
                  flex: 10,
                  child: Container(
                      color: ThemeColors.cardBackground,
                      child: const TimeframeBarChart()),
                )
              else if (viewModel.isVaritationsOpen)
                Expanded(
                    flex: 10,
                    child: Container(
                        color: ThemeColors.cardBackground,
                        child: VariationsPanel()))
            ],
          )),
    );
  }
}
