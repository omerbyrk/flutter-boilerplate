import 'package:covid19_app/core/blocs/bases/bloc_state_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_circular_progress_indicator.dart';


class BlocProgressIndicator<BlocType extends Bloc> extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Bloc bloc = BlocProvider.of<BlocType>(context);
    return BlocBuilder(
        cubit: bloc,
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
