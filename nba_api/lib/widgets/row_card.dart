import 'package:flutter/material.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/widgets/team_logo_image.dart';

class CustomRowCard extends StatefulWidget {
  const CustomRowCard({Key? key, required this.teams}) : super(key: key);

  final List<TeamModel> teams;

  @override
  State<CustomRowCard> createState() => _CustomRowCardState();
}

class _CustomRowCardState extends State<CustomRowCard> {
  final String _logoMainPath = 'assets/team_logos/';

  @override
  void initState() {
    super.initState();
    print(widget.teams.length);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.teams.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [],
          ),
        );
      },
    );
  }
}
