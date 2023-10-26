import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:bprcf/pages/dashboard/profile/bloc/profile_bloc.dart';
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
        child: FutureBuilder<Map<String, dynamic>?>(
            future: remoteDataSource.getProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.indigo.shade800,
                ));
              } else {
                if (snapshot.hasData) {
                  // return Text("${snapshot.data!['data']['ID']}");
                  return Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      _buildCard("${snapshot.data!['data']['customer']['name']}", Casing.lowerCase("${snapshot.data!['data']['customer']['short_name']}"),"${snapshot.data!['data']['profile_photo']}"),
                      _buildCardData(
                          'Nomor Rekening', Iconsax.card, "${snapshot.data!['data']['account'][0]['account_number']}"),
                      _buildCardData(
                          'Alamat',
                          Iconsax.home,
                          Casing.titleCase(
                              "${snapshot.data!['data']['customer']['address']}")),
                      _buildCardData('Nomor Handphone', Iconsax.mobile,
                          "${snapshot.data!['data']['customer']['phone_number']}"
                             ),
                      _buildCardData(
                          'Tanggal Lahir', Iconsax.calendar, "${snapshot.data!['data']['customer']['birth_date']}"),
                    ]),
                  );
                } else {
                  return const Center(child: Text('no data'));
                }
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
