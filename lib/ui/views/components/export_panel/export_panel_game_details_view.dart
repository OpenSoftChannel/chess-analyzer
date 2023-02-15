import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../domain/Assets/styles.dart';
import '../horizontal_score_indicator/horizontal_score_indicator_view.dart';
import '../shared/IconButton/elevated_icon_button.dart';
import '../shared/icon_label_value/icon_label_value_view.dart';

class ExportPanelGameDetails extends StatelessWidget {
  const ExportPanelGameDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.mainThemeBackground,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    IconLabelValue(
                      widget: WhiteKing(
                        size: 35,
                        fillColor: ThemeColors.mainText,
                      ),
                      label: "White",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IconLabelValue(
                      label: "DAHI301",
                    ),
                    IconLabelValue(
                      label: "1500 Elo - Source - Lichess",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.mainThemeBackground,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    IconLabelValue(
                      widget: WhiteKing(
                        size: 35,
                        fillColor: ThemeColors.innerText,
                      ),
                      label: "Black",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IconLabelValue(
                      label: "BEHI201",
                    ),
                    IconLabelValue(
                      label: "1500 Elo - Source - Lichess",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const HorizontalScoreIndicator(),
        Row(
          children: [
            Expanded(
              child: IconLabelValue(
                icon: Icons.location_city,
                label: "Location:",
                value: "Brisbane, Austratia",
              ),
            ),
            Expanded(
              child: IconLabelValue(
                icon: Icons.event,
                label: "Event:",
                value: "Rated Classical game",
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: IconLabelValue(
                icon: Icons.remove_circle_outline_sharp,
                label: "Termination:",
                value: "Normal",
              ),
            ),
            Expanded(
              child: IconLabelValue(
                icon: Icons.difference_outlined,
                label: "Variant:",
                value: "Standard",
              ),
            )
          ],
        ),
        IconLabelValue(
          icon: Icons.date_range_rounded,
          label: "Date:",
          value: "05/01/2025",
        ),
      ],
    );
  }
}
