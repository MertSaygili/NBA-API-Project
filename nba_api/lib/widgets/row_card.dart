import 'package:flutter/material.dart';
import 'package:nba_api/model/team_model.dart';

class CustomRowCard extends StatefulWidget {
  const CustomRowCard({Key? key, required this.team}) : super(key: key);

  final List<TeamModel> team;

  @override
  State<CustomRowCard> createState() => _CustomRowCardState();
}

class _CustomRowCardState extends State<CustomRowCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ListTile()],
    );
  }
}
