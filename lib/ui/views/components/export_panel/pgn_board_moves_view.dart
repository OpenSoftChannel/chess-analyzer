import 'package:flutter/material.dart';
import '../../../../domain/Assets/styles.dart';
import '../shared/IconButton/elevated_icon_button.dart';
import '../shared/icon_label_value/icon_label_value_view.dart';
import '../shared/pgn_grid/pgn_grid_view.dart';

class PgnBoardMoves extends StatelessWidget {
  const PgnBoardMoves({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconLabelValue(
                icon: Icons.book,
                label: "Opening:",
                value: "Italian Game: Giuoco Pianissimo, Normal",
              ),
              IconLabelValue(
                icon: Icons.book,
                label: "Conclusion:",
                value: "White Resigns",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.mainThemeBackground,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  "FEN: r1bqkbnr/pppp1ppp/2n5/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R w KQkq - 2 3",
                  style: TextStyle(color: ThemeColors.mainText),
                ),
              ),
              ElevatedIconButton(
                icon: Icons.copy,
                label: "",
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedIconButton(
          icon: Icons.copy,
          label: "Copy PGN",
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: ThemeColors.mainThemeBackground,
            margin: const EdgeInsets.all(10),
            child: const PgnGrid(),
          ),
        ),
      ],
    );
  }
}
