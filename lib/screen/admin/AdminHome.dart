import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:ui_design/PageNavigation.dart';
import 'package:ui_design/component/employeetask.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Map<String, dynamic>> _employeeList = [];
  late var _totalTask;
  Map<String, dynamic>? dataMap;

  @override
  void initState() {
    super.initState();
    getAllEmployees();
  }

  getAllEmployees() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .where("Type", isEqualTo: "user")
        .get()
        .then((response) {
      List<Map<String, dynamic>> tempRecords = [];
      response.docs.forEach((element) {
        tempRecords.add({...element.data(), "id": element.id});
      });

      setState(() {
        _employeeList = tempRecords;
      });
    });

    // Fetch _totalTask after getting employees
    gettotoalTaskData();
  }

  gettotoalTaskData() async {
    QuerySnapshot doc =
        await FirebaseFirestore.instance.collection("Tasks").get();
    setState(() {
      _totalTask = doc.size; // Assuming you want to count the number of tasks
      dataMap = {
        "Total": _totalTask,
        "Assigned": _totalTask,
        "Submitted": 0,
        "Rejected": 0,
      };
    });
  }


  @override
  Widget build(BuildContext context) {
    if (dataMap == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xfffDDDFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Umer Lodhi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Are you ready to get back to work?',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 7, 160, 112),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              dataMap != null
                  ? PieChart(
                      dataMap: dataMap?.map((key, value) =>
                              MapEntry(key, value.toDouble())) ??
                          {},
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 50,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 20,
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                        showChartValues: true,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                      colorList: [
                        Colors.tealAccent,
                        Colors.lightGreen,
                        Colors.lightBlueAccent,
                        Colors.redAccent,
                      ],
                    )
                  : CircularProgressIndicator(),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "All Team",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Column(
                children: _employeeList
                    .map(
                      (emp) => Padding(
                        padding: const EdgeInsets.all(8.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EmployeeTaskdetail(data: emp),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "${emp["imgUrl"]}",
                                    ),
                                  ),
                                  Text(
                                    "${emp["Name"]}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  emp["activeTask"] == ""
                                      ? Text(
                                          "No Task",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : Text(
                                          "Assigned",
                                          style: TextStyle(
                                            color: Colors.lightGreen,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
