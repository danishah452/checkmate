import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/controller/home_controller.dart';
import 'package:flutter_app/styles/colors.dart';
import 'package:provider/provider.dart';

import '../../components/loading_widget.dart';
import '../../helper/toast.dart';
import '../../models/Getorders.dart';
import '../Form.dart';
import 'OrderDetail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {


    configure();
    // TODO: implement initState
    super.initState();
  }


  configure() async {

    HomeProvider homeProvider =
    Provider.of<HomeProvider>(context, listen: false);

    homeProvider.getorders();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return  DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade500,
          title: Text('Orders'),
          bottom: TabBar(
            indicatorColor: background,
            indicatorWeight: 5.0,
            labelColor: Colors.white,
            labelPadding: EdgeInsets.only(top: 10.0),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'New Orders',
                // icon: Icon(
                //   Icons.cake,
                //   color: Colors.white,
                // ),
                // iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              //child: Image.asset('images/android.png'),

              Tab(
                text: 'Ongoing Orders',
                // icon: Icon(
                //   Icons.radio,
                //   color: Colors.white,
                // ),
                // iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                text: 'Past Orders',
                // icon: Icon(
                //   Icons.card_giftcard,
                //   color: Colors.white,
                // ),
                // iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
        homeProvider.getorder?.data==null
        ? Container()

        :
    RefreshIndicator(
    onRefresh: _pullRefresh,
    child: Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 0.0, vertical: 10.0),
    child:
            ListView.builder(
              itemCount: homeProvider.getorder?.data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    List<OrderMeasurement>? orderMeasurements = homeProvider
                        .getorder?.data![index].orderMeasurements;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => OrderDetail()));

                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(

                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Order Id: ",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    "${homeProvider.getorder?.data![index].id}",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 8,),
                              // Row(
                              //   children: [
                              //     Text(
                              //       "Category: ",
                              //       style: TextStyle(fontSize: 12.0),
                              //     ),
                              //     Text(
                              //         "${homeProvider.getorder?.data![index]}",
                              //       style: TextStyle(fontSize: 12.0),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(height: 8,),

                              Row(
                                children: [
                                  Text(
                                    "Decided Total:  ",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    "${homeProvider.getorder?.data![index].decidedTotal}",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Status: ",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    "${homeProvider.getorder?.data![index].orderStatues}",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Delivery Date:   ",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    "${homeProvider.getorder?.data![index].deliveryDate}",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

    )),



            Center(
                child: Text(
                  'This is Ongoing Order Tab',
                  style: TextStyle(fontSize: 32),
                )),
            Center(
                child: Text(
                  'This is Past Order Tab',
                  style: TextStyle(fontSize: 32),
                )),
          ],
        ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  PostTaskScreen()));

          // Add your onPressed code here!
        },
        backgroundColor: primaryColor,

        label: Text("New Order"),
        icon: Icon(Icons.navigation),
      ),
    ));
  }

  Future<void> _pullRefresh() async {

    setState(()  {
      configure();
    });
    // why use freshNumbers var? https://stackoverflow.com/a/52992836/2301224
  }
}

