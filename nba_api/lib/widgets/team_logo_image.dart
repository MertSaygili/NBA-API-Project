import 'package:flutter/material.dart';

import '../model/team_model.dart';

class CustomImageAsset extends StatefulWidget {
  const CustomImageAsset({
    Key? key,
    required this.team,
  });

  final TeamModel? team;

  @override
  State<CustomImageAsset> createState() => _CustomImageAssetState();
}

class _CustomImageAssetState extends State<CustomImageAsset> {
  String _logoMainPath = 'assets/team_logos/';

  String getPath() {
    if (widget.team!.name?.compareTo('Trail Blazers') == 0) {
      _logoMainPath = '${_logoMainPath}TrailBlazers.png';
    } else {
      _logoMainPath = _logoMainPath = '$_logoMainPath${widget.team?.name}.png';
    }

    return _logoMainPath;
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getPath(),
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }
}
