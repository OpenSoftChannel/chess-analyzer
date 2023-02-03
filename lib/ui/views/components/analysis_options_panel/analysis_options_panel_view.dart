import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../Assets/styles.dart';
import '../shared/tab_buton/tab_button_view.dart';
import 'analysis_options_panel_viewmodel.dart';

class AnalysisOptionsPanel extends StatelessWidget {
  const AnalysisOptionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => AnalysisOptionPanelViewModel()),
      builder: ((context, viewModel, child) => Row(
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
          )),
    );
  }
}
