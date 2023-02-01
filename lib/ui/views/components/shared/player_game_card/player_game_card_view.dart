import 'package:chess/ui/views/components/shared/player_game_card/player_game_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../../../../Assets/styles.dart';
import '../IconButton/elevated_icon_button.dart';

// ignore: must_be_immutable
class PlayerGameCard extends StatelessWidget {
  late String? imageSource;
  late String? name;
  late String? opening;
  late String? elo;

  PlayerGameCard(
      {super.key, this.imageSource, this.name, this.elo, this.opening});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => PlayerGameCardViewModel()),
      builder: (context, viewModel, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(
                imageSource ?? GeneralTheme.defaultImage,
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
                        name ?? "--",
                        style: TextStyle(color: ThemeColors.mainText),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ElevatedIconButton(
                      icon: Icons.book,
                      label: opening ?? "",
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
            label: elo != null ? "Rated: $elo" : "Unrated",
          )
        ],
      ),
    );
  }
}
