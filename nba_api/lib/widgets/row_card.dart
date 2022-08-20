import 'package:flutter/material.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/widgets/team_logo_image.dart';

import '../constants/constants.dart';

class CustomRowCard extends StatefulWidget {
  const CustomRowCard({Key? key, required this.teams}) : super(key: key);

  final List<TeamModel> teams;

  @override
  State<CustomRowCard> createState() => _CustomRowCardState();
}

class _CustomRowCardState extends State<CustomRowCard> {
  final String _logoMainPath = 'assets/team_logos/';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.teams.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: PaddingItems().paddingCard,
          child: GestureDetector(
            onTap: () {},
            child: _customCard(index, context),
          ),
        );
      },
    );
  }

  Card _customCard(int index, BuildContext context) {
    double elevation = 15;

    return Card(
      elevation: elevation,
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomImageAsset(
              team: widget.teams[index],
              logoMainPath: _logoMainPath,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.teams[index].full_name.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
