import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:bprcf/data/model/me/data.dart';
import 'package:bprcf/data/model/me/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dart_casing/dart_casing.dart';
import 'package:line_icons/line_icon.dart';

class ProfilePageDash extends StatelessWidget {
  const ProfilePageDash({super.key});

  @override
  Widget build(BuildContext context) {
    final RemoteDataSource remoteDataSource = RemoteDataSource();
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: FutureBuilder(
            future: remoteDataSource.getProfile(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if(snapshot.hasData){
                return Text(snapshot.data['data']['username']);
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }),
      ),
    );
  }

  _buildCard(String fullname, nickname, avatar) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(avatar),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullname,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '@$nickname',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text('edit profil'),
                  //   style: ElevatedButton.styleFrom(
                  //       shape: StadiumBorder(),
                  //       primary: Colors.indigo.shade800),
                  // ),
                ],
              ),
            ],
          )),
    );
  }

  _buildCardData(String label, icons, valueText) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade200,
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.indigo.shade400),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5),
                        child: Icon(
                          icons,
                          color: Colors.indigo.shade400,
                        )),
                    Flexible(
                        child: Text(
                      valueText,
                      style: const TextStyle(fontSize: 16),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
