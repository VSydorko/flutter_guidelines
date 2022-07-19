import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:{{project_name}}/blocs/index.dart';
import 'package:{{project_name}}/services/index.dart';

class StateWrapper extends StatelessWidget {
  const StateWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..appStarted(),
        ),
      ],
      child: child,
    );
  }
}
