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
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: PaddingItems().paddingIcon,
      alignment: Alignment.centerRight,
      icon: IconItems().iconNext,
      onPressed: () {
        showModalBottomSheet(
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SizedBox(
                // height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: IconItems().iconClose,
                      ),
                    ),
                    Padding(padding: PaddingItems().paddingBottomSheet),
                    SizedBox(
                      child: CustomImageAsset(
                        team: widget.team,
                        logoMainPath: widget.logoMainPath,
                      ),
                    ),
                    ListTile(
                      contentPadding: PaddingItems().paddingBottomSheet,
                      title: Text(
                        widget.team.full_name.toString(),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      subtitle: Text(
                        'Conference: ${widget.team.conference.toString()}\nCity: ${widget.team.city.toString()}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            onPrimary: Colors.black,
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.more_horiz),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
