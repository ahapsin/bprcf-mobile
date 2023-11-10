import 'dart:ffi';

import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:bprcf/data/helper/currency_format.dart';
import 'package:bprcf/data/model/mutation.dart';
import 'package:bprcf/pages/dashboard/mutation/cubit/mutation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class MutationPage extends StatelessWidget {
  const MutationPage({super.key});

  @override
  Widget build(BuildContext context) {
    MutationCubit mutationCubit = MutationCubit();
// listPilTab();
    DateTime now = DateTime.now();
    List sortedMonth = listPilTab(now.month);
    Map stringMonth = {
      1: "Januari",
      2: "Februari",
      3: "Maret",
      4: "April",
      5: "Mei",
      6: "Juni",
      7: "Juli",
      8: "Agustus",
      9: "September",
      10: "Oktober",
      11: "November",
      12: "Desember",
    };
    return BlocProvider(
      create: (context) => MutationCubit()..getData(dataBody: {}),
      child: Scaffold(
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
                      // _cardBuildWidget(context),
                      // _cardBuildWidget(context),
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
                      for (var data in sortedMonth)
                        _buildPilTab(context, stringMonth[data],
                            data == now.month ? false : false, () {
                          var monthSelected = data.toString().padLeft(2, '0');
                          Map dataBody = {
                            "acc_number": "0011002933",
                            "start_date": "2023-$monthSelected-01",
                            "end_date": "2023-$monthSelected-31"
                          };
                          mutationCubit.getData(dataBody: dataBody);
                          print(dataBody);
                        }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.563,
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0, right: 20.0),
                    child: Container(
                      color: Colors.grey.shade100,
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: BlocBuilder<MutationCubit, MutationState>(
                          bloc: mutationCubit,
                          builder: (context, state) {
                            if (state is MutationLoading) {
                              return Center(
                                  child: Lottie.asset(
                                      'assets/lottie/otp.json'));
                            }
                            if (state is MutationLoaded) {
                              int lengthData = state.mutations.length;
                              if (lengthData == 0) {
                                return Center(
                                  child: Lottie.asset(
                                      'assets/lottie/not_found.json',
                                      width: 250),
                                );
                              }
                              return ListView.builder(
                                  itemCount: state.mutations.length,
                                  itemBuilder: (context, index) {
                                    var amount =
                                        state.mutations[index].amount / 100;
                                    return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                      elevation: 0,
                                      child: ListTile(
                                        leading: Icon(Iconsax.money),
                                        trailing: Text(
                                            '${CurrencyFormat.convertToIdr(amount, 2)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: amount <= 0
                                                    ? Colors.red
                                                    : Colors.green)),
                                        title: Text(
                                            '${state.mutations[index].desc}'),
                                        subtitle: Text(
                                            '${state.mutations[index].posting_date} ${state.mutations[index].entry_time}'),
                                      ),
                                    );
                                  });
                            }
                            return Center(
                              child: Lottie.asset('assets/lottie/otp.json',
                                  width: 150),
                            );
                          }),
                    ),
                  )),
            ],
          )),
    );
  }

  listPilTab(int initMonth) {
    int startMonth = initMonth;
    List numOfMonth = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    List sortMonth = [];
    List sortMonthLast = [];
    for (var i = 0; i < numOfMonth.length; i++) {
      if (numOfMonth[i] >= startMonth) {
        sortMonth.add(numOfMonth[i]);
        continue;
      }

      if (numOfMonth[i] <= startMonth) {
        sortMonthLast.add(numOfMonth[i]);
        continue;
      }
    }
    List sortedMonth = sortMonth + sortMonthLast;

    return sortedMonth;
  }

  _buildPilTab(
      BuildContext context, String text, bool aktif, VoidCallback callback) {
    bool isActive = aktif;
    return Padding(
      padding: const EdgeInsets.only(right: 5.0, bottom: 10),
      child: GestureDetector(
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isActive ? Colors.indigo.shade800 : Colors.grey.shade300,
          ),
          width: MediaQuery.of(context).size.width * 0.25,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.indigo.shade800),
          )),
        ),
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
            //color: Colors.indigo.shade800,
            image: DecorationImage(
              image: AssetImage('assets/backdrop.png'),
              fit: BoxFit.cover,
            ),
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
              '0011002933',
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
