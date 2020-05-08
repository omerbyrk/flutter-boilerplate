import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BlocFlushbarShow<BlocType extends Bloc> extends HookWidgetBase {
  @override
  Widget build(BuildContext context) {
    Bloc bloc = BlocProvider.of<BlocType>(context);

    return BlocBuilder(
        bloc: bloc,
        builder: (_, state) {
          print("called");
          return HookBuilder(
            builder: (_) {
              if (state is BlocOnMessageStateBase)
                return this.showMessage(state.message, state.type);
              return Container();
            },
          );
        });
  }
}
