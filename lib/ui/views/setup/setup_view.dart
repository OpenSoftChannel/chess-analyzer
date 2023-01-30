import 'package:chess/ui/views/components/shared/card_component.dart';
import 'package:chess/ui/views/components/shared/table_datepicker_header/table_datepicker_header_view.dart';
import 'package:chess/ui/views/components/shared/table_header_scorepicker/table_header_scorepicker_view.dart';
import 'package:chess/ui/views/components/shared/table_input_header/table_textfield_header_view.dart';
import 'package:chess/ui/views/setup/setup_viewmodel.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';
import '../components/setup/setup_welcome_component.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: Container(
        color: ThemeColors.mainThemeBackground,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Select the game interval",
                        style: TextStyle(
                            color: ThemeColors.mainText, fontSize: 22),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => ThemeColors.cardBackground)),
                      onPressed: (() async => await model.intervalPicker()),
                      child: Icon(
                        Icons.timer,
                        color: ThemeColors.mainText,
                        size: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Incremental interval",
                        style: TextStyle(
                            color: ThemeColors.mainText, fontSize: 22),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => ThemeColors.cardBackground)),
                      onPressed: (() async =>
                          await model.selectIncrementInterval()),
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: ThemeColors.mainText,
                        size: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Begin Game",
                        style: TextStyle(
                            color: ThemeColors.mainText, fontSize: 22),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => ThemeColors.cardBackground)),
                      onPressed: (() async => await model.beginGame()),
                      child: Icon(
                        Icons.not_started_outlined,
                        color: ThemeColors.mainText,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 0,
                    child: CardComponent(
                      render: Row(
                        children: [
                          TableTextfieldHeaderView(
                            flex: 2,
                            icon: Expanded(
                              flex: 0,
                              child: WhiteKing(
                                size: 50,
                              ),
                            ),
                            label: "White",
                            aligment: TextAlign.center,
                            callback: model.whiteFilterChanged,
                          ),
                          TableTextfieldHeaderView(
                            flex: 2,
                            icon: Expanded(
                              flex: 0,
                              child: BlackKing(
                                size: 50,
                              ),
                            ),
                            label: "Black",
                            aligment: TextAlign.center,
                            callback: model.blackFilterChanged,
                          ),
                          TableDatePickerHeaderView(
                              flex: 1,
                              alignment: TextAlign.center,
                              icon: Icons.date_range,
                              label: "Date",
                              callback: model.dateFilterSelected),
                          TableHeaderScorePicker(
                              flex: 1,
                              alignment: TextAlign.center,
                              icon: Icons.bar_chart,
                              label: "Outcomes",
                              callback: model.scoreFilter),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: ListView.builder(
                      itemCount: 56,
                      itemBuilder: (context, index) => CardComponent(
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
                                        "https://yt3.ggpht.com/ytc/AL5GRJVSGg8d7zwUuFS4Xb5-qZnHQC47ViYgo4N-OhShuw=s48-c-k-c0x00ffffff-no-rj",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Kristifor Milchev - London system",
                                          style: TextStyle(
                                              color: ThemeColors.mainText),
                                          textAlign: TextAlign.start,
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
                                  Text(
                                    "Rated: 1900",
                                    style:
                                        TextStyle(color: ThemeColors.mainText),
                                    textAlign: TextAlign.end,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.network(
                                        "https://yt3.ggpht.com/ytc/AL5GRJVSGg8d7zwUuFS4Xb5-qZnHQC47ViYgo4N-OhShuw=s48-c-k-c0x00ffffff-no-rj",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Steve Oniel - Karokhan Defence",
                                          style: TextStyle(
                                              color: ThemeColors.mainText),
                                          textAlign: TextAlign.start,
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
                                  Text(
                                    "Rated: 1950",
                                    style:
                                        TextStyle(color: ThemeColors.mainText),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "10-02-1993",
                                style: TextStyle(color: ThemeColors.mainText),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "1-0",
                                style: TextStyle(color: ThemeColors.mainText),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
      viewModelBuilder: () => SetupViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(context),
    );
  }
}
