import 'package:flutter/material.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/widgets/team_logo_image.dart';

import '../constants/constants.dart';

class CustomTeamCard extends StatefulWidget {
  const CustomTeamCard({Key? key, required this.teams}) : super(key: key);

  final List<TeamModel> teams;

  @override
  State<CustomTeamCard> createState() => _CustomTeamCardState();
}

class _CustomTeamCardState extends State<CustomTeamCard> {
  final String _logoMainPath = 'assets/team_logos/';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.teams.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: PaddingItems().paddingCard,
          child: _customCard(index, context),
        );
      },
    );
  }

  Card _customCard(int index, BuildContext context) {
    double elevation = 20;

    return Card(
      elevation: elevation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomImageAsset(
              team: widget.teams[index],
              logoMainPath: _logoMainPath,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.teams[index].full_name.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              padding: PaddingItems().paddingIcon,
              alignment: Alignment.centerRight,
              icon: IconItems().iconNext,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: CustomImageAsset(
                              team: widget.teams[index],
                              logoMainPath: _logoMainPath,
                            ),
                          ),
                          ListTile(
                            contentPadding: PaddingItems().paddingBottomSheet,
                            title: Text(
                              widget.teams[index].full_name.toString(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            subtitle: Text(
                              'Conference: ${widget.teams[index].conference.toString()}\nCity: ${widget.teams[index].city.toString()}',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
