import 'package:flutter/material.dart';
import 'package:nba_api/widgets/team_logo_image.dart';

import '../constants/constants.dart';
import '../model/team_model.dart';

class CustomSheetModel extends StatefulWidget {
  const CustomSheetModel(
      {Key? key, required this.team, required this.logoMainPath})
      : super(key: key);

  final TeamModel team;
  final String logoMainPath;

  @override
  State<CustomSheetModel> createState() => _CustomSheetModelState();
}

class _CustomSheetModelState extends State<CustomSheetModel> {
  final OutlineInputBorder _bottomSheetBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: PaddingItems().paddingIcon,
      alignment: Alignment.centerRight,
      icon: IconItems().iconNext,
      onPressed: () {
        showModalBottomSheet(
            shape: _bottomSheetBorder,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _closeSheetButton(context),
                    Padding(padding: PaddingItems().paddingBottomSheet),
                    _teamLogo(context),
                    _teamInformation(context),
                    _playerInformationButton()
                  ],
                ),
              );
            });
      },
    );
  }

  Padding _playerInformationButton() {
    return Padding(
      padding: PaddingItems().paddingImage,
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: () {},
          child: _buttonText(),
        ),
      ),
    );
  }

  Align _closeSheetButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: IconItems().iconClose,
      ),
    );
  }

  SizedBox _teamLogo(BuildContext context) {
    return SizedBox(
      child: CustomImageAsset(
        team: widget.team,
        logoMainPath: widget.logoMainPath,
      ),
    );
  }

  ListTile _teamInformation(BuildContext context) {
    return ListTile(
      contentPadding: PaddingItems().paddingBottomSheet,
      title: Text(
        widget.team.full_name.toString(),
        style: Theme.of(context).textTheme.headline2,
      ),
      subtitle: Text(
        'Conference: ${widget.team.conference.toString()}\nCity: ${widget.team.city.toString()}',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Row _buttonText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Text('Players'),
        SizedBox(width: 10),
        Icon(Icons.arrow_circle_right_outlined),
      ],
    );
  }
}
