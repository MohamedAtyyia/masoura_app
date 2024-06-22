import 'package:certivicate/auth/data/repo/home_repo_impl.dart';
import 'package:certivicate/auth/manager/cubit/authentication_cubit.dart';
import 'package:certivicate/auth/view/widget/creat_account_body.dart';
import 'package:certivicate/core/util/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        getIt.get<HomeRepoAuthImple>(),
      )..inilize(),
      child: const SafeArea(
          child: Scaffold(
        body: CreateAccountBody(),
      )),
    );
  }
}
