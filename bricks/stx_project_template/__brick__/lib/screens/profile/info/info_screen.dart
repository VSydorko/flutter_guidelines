import 'package:flutter/material.dart';

import 'package:{{project_name}}/localization/index.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return Center(
      child: Text(
        LocaleKeys.profileInfoScreenTitle.tr(),
      ),
    );
  }
}