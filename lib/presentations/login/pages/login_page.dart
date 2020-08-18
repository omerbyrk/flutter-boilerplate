import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widgets/index.dart';
import '../bloc/index.dart';
import '../widgets/index.dart';

class LoginPage extends StatelessWidget {
  final LoginBloc _loginBloc = GetIt.instance.get<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginBloc,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  LoginPageTop(),
                  SizedBox(
                    height: convertSize(15),
                  ),
                  LoginPageFormTitle(),
                  Divider(),
                  SizedBox(
                    height: convertSize(10),
                  ),
                  LoginPageForm()
                ],
              ),
            ),
            blocMessageBuilder(context, _loginBloc),
            blocProgressBuilder(context, _loginBloc)
          ],
        ),
      ),
    );
  }
}
