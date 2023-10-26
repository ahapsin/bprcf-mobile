import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MutationPage extends StatelessWidget {
  const MutationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RemoteDataSource remoteDataSource = RemoteDataSource();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: _cardBuildWidget(),
            ),
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: FutureBuilder<Map<String, dynamic>?>(future: remoteDataSource.getMutation(), 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(color: Colors.indigo.shade800,),
                  );
                }
                return const Center(child: Text('no data'),);
              }),
            )
          ],
        ),
      ),
    );
  }

  _cardBuildWidget() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.indigo.shade800,
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
