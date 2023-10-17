import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:bprcf/pages/dashboard/profile/bloc/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';

class ProfilePageDash extends StatefulWidget {
  const ProfilePageDash({super.key});

  @override
  State<ProfilePageDash> createState() => _ProfilePageDashState();
}

class _ProfilePageDashState extends State<ProfilePageDash> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(remoteDataSource: RemoteDataSource())..add(LoadProfile()),
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoding) {
              return const Center(child: CircularProgressIndicator());
              print("loading");
            } else if (state is ProfileLoaded) {
              final data = state.profile;
              print("loaded");
            } else if (state is ProfileError) {
              return Center(
                child: Text('error'),
              );
            }
            return const SizedBox(
              child: Text('data'),
            );
          },
        ),
      ),
    );
  }

  _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://play-lh.googleusercontent.com/-WtmWXbjrtbaZNz9_5RuEqZFnka6X-4f2_JHSrtkMcZOWZk3o3Ypb_G4g5W8WYGVIEgI"),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Setiadi Sidarta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '@adi',
                    style: TextStyle(color: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('edit profil'),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.indigo.shade800),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  _buildCardData(String _label, _icons, _valueText) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade200,
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _label,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Container(margin: EdgeInsets.all(5), child: _icons),
                  Flexible(child: Text(_valueText)),
                ],
              ),
            ],
          ),
        ));
  }
}
