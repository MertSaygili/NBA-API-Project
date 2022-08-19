import 'package:flutter/material.dart';
import 'package:nba_api/model/team_model.dart';

class CustomRowCard extends StatefulWidget {
  const CustomRowCard({Key? key, required this.team, required this.index})
      : super(key: key);

  final List<TeamModel>? team;
  final int index;

  @override
  State<CustomRowCard> createState() => _CustomRowCardState();
}

class _CustomRowCardState extends State<CustomRowCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          child: ListTile(
            leading: Image.asset("assets/team_logos/Timberwolves.png",
                color: Colors.red),
            title: Text(widget.team?[widget.index].id.toString() ?? 'hjj'),
          ),
        ),
      ],
    );
  }
}
