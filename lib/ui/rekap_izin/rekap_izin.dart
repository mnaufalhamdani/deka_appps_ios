import 'package:deka_appps_ios/extensions/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import 'bloc/remote/remote_rekap_izin_bloc.dart';
import 'item/rekap_izin_tile.dart';

class RekapIzin extends StatefulWidget {
  static const nameRoute = 'RekapIzin';
  const RekapIzin({super.key});

  @override
  State<RekapIzin> createState() => _RekapIzinState();
}

class _RekapIzinState extends State<RekapIzin> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteRekapIzinBloc>(
        create: (context) => get()..add(GetRekapIzin(NIK_EXAMPLE)),
        child: Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody()
        )
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(varRekapIzin)
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteRekapIzinBloc, RemoteRekapIzinState> (
      builder: (_,state) {
        if (state is RemoteRekapIzinLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteRekapIzinError) {
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: const Icon(Icons.refresh), onPressed: () {
                    setState(() {
                      BlocProvider.of<RemoteRekapIzinBloc>(context).add(GetRekapIzin(NIK_EXAMPLE));
                    });
                  }),
                  Text(state.error?.message ?? "Error Unknown", textAlign: TextAlign.center)
                ],
              ),
          );
        }
        if (state is RemoteRekapIzinDone) {
          return ListView.builder(
            itemBuilder:  (context, index){
              return RekapIzinTile(
                rekapIzin: state.model![index],
              );
            },
            itemCount: state.model!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
