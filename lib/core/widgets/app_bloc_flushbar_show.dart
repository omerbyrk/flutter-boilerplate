import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bases/bloc_state_base.dart';
import 'app_widget_extension.dart';

class AppBlocFlushbarShow<BlocType extends Bloc> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bloc bloc = BlocProvider.of<BlocType>(context);

    return BlocBuilder(
        cubit: bloc,
        builder: (_, state) {
          if (state is BlocOnMessageStateBase)
            return this.showMessage(context, state.message, state.type);
          return Container();
        });
  }
}
