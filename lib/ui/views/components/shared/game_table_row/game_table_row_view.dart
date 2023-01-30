import 'package:chess/ui/views/components/shared/IconButton/elevated_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../../../Assets/styles.dart';
import '../card_component.dart';

// ignore: must_be_immutable
class GameTableRow extends StatelessWidget {
  late String? whiteImageSource;
  late String? whiteName;
  late String? whiteOpening;
  late String? whiteElo;
  late String? blackImageSource;

  late String? blackName;
  late String? blackOpening;
  late String? blackElo;
  late String? date;
  late String? score;

  GameTableRow({
    super.key,
    this.whiteImageSource,
    this.whiteOpening,
    this.whiteName,
    this.whiteElo,
    this.blackImageSource,
    this.blackName,
    this.blackOpening,
    this.blackElo,
    this.date,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      render: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      whiteImageSource ?? GeneralTheme.defaultImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              whiteName ?? "--",
                              style: TextStyle(color: ThemeColors.mainText),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          ElevatedIconButton(
                            icon: Icons.book,
                            label: whiteOpening ?? "",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Divider(
                    height: 1,
                    color: ThemeColors.innerText,
                  ),
                ),
                ElevatedIconButton(
                  icon: null,
                  label: whiteElo != null ? "Rated: $whiteElo" : "Unrated",
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      blackImageSource ?? GeneralTheme.defaultImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              blackName ?? "--",
                              style: TextStyle(color: ThemeColors.mainText),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          ElevatedIconButton(
                            icon: Icons.book,
                            label: blackOpening ?? "",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Divider(
                    height: 1,
                    color: ThemeColors.innerText,
                  ),
                ),
                ElevatedIconButton(
                  icon: blackElo != null ? Icons.show_chart_rounded : null,
                  label: blackElo != null ? "Rated: $blackElo" : "Unrated",
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              date ?? "--",
              style: TextStyle(color: ThemeColors.mainText),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              score ?? "--",
              style: TextStyle(color: ThemeColors.mainText),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
