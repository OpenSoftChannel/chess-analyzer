import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';

import '../../../../domain/Assets/styles.dart';
import 'export_panel_viewmodel.dart';

class ExportPanel extends StatelessWidget {
  const ExportPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => ExportPanelViewModel()),
      builder: (context, viewModel, child) =>
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_city,
                  color: ThemeColors.mainText,
                ),
                Text(
                  "Location:",
                  style: TextStyle(
                    color: ThemeColors.mainText,
                  ),
                ),
                Text(
                  "Brisbane, Austratia",
                  style: TextStyle(
                    color: ThemeColors.mainText,
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
