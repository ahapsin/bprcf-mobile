import 'package:bprcf/pages/dashboard/cubit/router_cubit.dart';
import 'package:bprcf/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterPage extends StatelessWidget {
  RouterCubit routerCubit = RouterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouterCubit()..getData(user: '2'),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Map creds = {'user_id': '1'};
                      routerCubit.getData(user: '2');
                    },
                    child: Text('data1'),
                  ),
                  TextButton(
                    onPressed: () => routerCubit.getData(user: '7'),
                    child: Text('data7'),
                  ),
                ],
              ),
            ),
            BlocBuilder<RouterCubit, RouterState>(
                bloc: routerCubit,
                builder: (context, state) {
                  if (state is RouterLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is RouterError) {
                    return Center(
                      child: Text('error'),
                    );
                  }
                  if (state is RouterLoaded) {
                    print(state.user['data']['email']);
                    return Center(
                      child: Text('${state.user['data']['email']}'),
                    );
                  }
                  return Text('no_data');
                }),
          ],
        ),
      )),
    );
  }
}
