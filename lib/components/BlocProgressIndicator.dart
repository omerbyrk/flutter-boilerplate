import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/components/AppCircularProgressIndicator.dart';
import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProgressIndicator<BlocType extends Bloc> extends HookWidgetBase {
  @override
  Widget build(BuildContext context) {
    Bloc bloc = BlocProvider.of<BlocType>(context);
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if ((state is BlocInProgressStateBase)) {
            return Positioned.fill(
                child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: AppCircularProgressIndicator(
                        color: Colors.black,
                        sizePercent: .3,
                      ),
                    )));
          } else
            return Container();
        });
  }
}
