import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_bloc_base/stx_bloc_base.dart';

import 'package:flutter_guidelines/localization/index.dart';
import 'bloc/chats_bloc.dart';

export 'pages/index.dart';

class ChatsScreen extends StatelessWidget implements AutoRouteWrapper {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<ChatsBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        switch (state.status) {
          case NetworkStatus.initial:
          case NetworkStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case NetworkStatus.success:
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.chats.length,
              itemBuilder: (context, index) {
                final chat = state.chats[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(chat.name),
                );
              },
            );
          case NetworkStatus.failure:
            return Center(child: Text(state.errorMessage ?? ''));
        }
      },
    );
  }
}
