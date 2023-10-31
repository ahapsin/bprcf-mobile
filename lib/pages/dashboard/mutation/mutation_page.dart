import 'dart:ffi';

import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:bprcf/data/helper/currency_format.dart';
import 'package:bprcf/data/model/mutation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MutationPage extends StatelessWidget {
  const MutationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RemoteDataSource remoteDataSource = RemoteDataSource();
    return Scaffold(
        appBar: AppBar(
          title: Text('Mutasi'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          foregroundColor: Colors.indigo[800],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 220,
              child: Container(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: ListView(
                  itemExtent: MediaQuery.of(context).size.width * 0.8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _cardBuildWidget(context),
                    _cardBuildWidget(context),
                    _cardBuildWidget(context),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPilTab(context, 'Oktober', true),
                    _buildPilTab(context, 'November', false),
                    _buildPilTab(context, 'Desember', false),
                    _buildPilTab(context, 'januari', false),
                    _buildPilTab(context, 'Februari', false),
                    _buildPilTab(context, 'Maret', false),
                    _buildPilTab(context, 'April', false),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.563,
                child: Container(
                    color: Colors.grey.shade100,
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: FutureBuilder<Map<String, dynamic>?>(
                        future: remoteDataSource.getMutation(),
                        builder: (context, snapshot) {
                          print(snapshot);
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.indigo.shade800,
                            ));
                          } else {
                            if (snapshot.hasData) {
                              //print(snapshot.data?.length);
                              //  return Text('data : ${snapshot.data?.length}');
                              final data = snapshot.data?['data'];
                              return ListView.builder(
                                  itemCount: data?.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: _buildLeading(
                                          data[index]['trans_type']),
                                      title: Text('${data[index]['desc']}'),
                                      iconColor: Colors.indigo.shade800,
                                      trailing: _buildColorText(
                                          data[index]['trans_type'],
                                          CurrencyFormat.convertToIdr(
                                              data[index]['amount'] / 100, 2)),
                                      subtitle:
                                          Text('${data[index]['trans_code']}'),
                                    );
                                  });
                            } else {
                              return Text('nodata');
                            }
                          }
                        }))),
          ],
        ));
  }

  _buildPilTab(BuildContext context, String text, bool aktif) {
    bool isActive = aktif;
    return Padding(
      padding: const EdgeInsets.only(right: 5.0,bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.indigo.shade800 : Colors.grey.shade300,
        ),
        width: MediaQuery.of(context).size.width * 0.25,
        child: Center(
            child: Text(
          text,
          style:
              TextStyle(color: isActive ? Colors.white : Colors.indigo.shade800),
        )),
      ),
    );
  }

  _buildLeading(String data) {
    if (data == "in") {
      return const Icon(
        Iconsax.receive_square,
        color: Colors.green,
      );
    }
    if (data == "out") {
      return const Icon(
        Iconsax.send_square,
        color: Colors.red,
      );
    }
  }

  _buildColorText(String type, String text) {
    if (type == "in") {
      return Text(
        text,
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      );
    }
    if (type == "out") {
      return Text(
        text,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      );
    }
  }

  _cardBuildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.indigo.shade800,
            // image: DecorationImage(
            //   image: NetworkImage('https://2.bp.blogspot.com/-_QxczlLhANs/T8W1drL2JCI/AAAAAAAAADw/ZW97jsUrYIU/s1600/mega+mendung+setengah.png'),
            //   fit: BoxFit.cover,
            // ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TabunganCF',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/cf.png',
                  scale: 5,
                )
              ],
            ),
            Text(
              '0013000344',
              style: GoogleFonts.mohave(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              'SETIADI SIDARTA',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
