import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:flutter/material.dart';

class TermPage extends StatelessWidget {
  const TermPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    final RemoteDataSource remoteDataSource = RemoteDataSource();
    return Scaffold(
        appBar: AppBar(
          title: Text('Terms and Conditions'),
          backgroundColor: Colors.indigo.shade800,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      FutureBuilder<Map<String, dynamic>?>(future: remoteDataSource.getTerms(), builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        } else {
                          if(snapshot.hasData){
                             return Text("${snapshot.data!['terms_credit_application']}");
                          } else {
                            return const Center(child: Text('no data'));
                          }
                        }
                       
                      })
                    ],
                  )),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigo[800],
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Ajukan Sekarang",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ));
  }
}
