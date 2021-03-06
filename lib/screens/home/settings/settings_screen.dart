import 'package:flutter/material.dart';

import 'package:flutter_guidelines/core/index.dart';
import 'package:flutter_guidelines/localization/index.dart';

export 'pages/index.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.settings.tr(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => RootScaffold.openDrawer(context),
        ),
      ),
      body: Center(
        child: Text(
          LocaleKeys.settingsScreenTitle.tr(),
        ),
      ),
    );
  }
}
