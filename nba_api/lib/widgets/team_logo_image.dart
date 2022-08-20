// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, must_be_immutable

import 'package:flutter/material.dart';

import '../model/team_model.dart';

class CustomImageAsset extends StatefulWidget {
  const CustomImageAsset({
    Key? key,
    required this.team,
    required this.logoMainPath,
  });

  final TeamModel team;
  final String logoMainPath;

  @override
  State<CustomImageAsset> createState() => _CustomImageAssetState();
}

class _CustomImageAssetState extends State<CustomImageAsset> {
  String getPath() {
    String logoMainPath = widget.logoMainPath;

    if (widget.team.name?.compareTo('Trail Blazers') == 0) {
      logoMainPath = logoMainPath + 'TrailBlazers.png';
    } else {
      String? x = widget.team.name;
      if (x != null) {
        logoMainPath = logoMainPath + x + '.png';
      }
    }

    return logoMainPath;
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getPath(),
      height: 100,
      width: 100,
      fit: BoxFit.fill,
    );
  }
}
