import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/styles/colors.dart';
import 'package:velocity_x/velocity_x.dart';



class OrderDetail extends StatefulWidget {
  const OrderDetail( {Key? key}) : super(key: key);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
backgroundColor: primaryColor,
          title: const Text('Order Detail   آرڈر کی تفصیل'),
        ),
        body:
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Items",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color(0xffadadad),
                              fontWeight: FontWeight.bold)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount:
                     3,
                      itemBuilder: (context, idx) {
                        return  Container(

                          color: Theme.of(context).scaffoldBackgroundColor,
                          child:
                         Column(
                            children: [
                              Divider(
                                color: Theme.of(context).cardColor,
                                thickness: 1.0,
                              ),
                              Container(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   'images/ic_veg.png',
                                      //   scale: 2.5,
                                      // ),
                                      SizedBox(
                                        width: 20.0,
                                      ),

                                      Text(
                                       "Title", overflow: TextOverflow.ellipsis,   softWrap: false,
                                        style: Theme.of(context).textTheme.headline4!.copyWith(
                                            fontWeight: FontWeight.bold, fontSize: 15.0),
                                      ),
                                      Spacer(),
                                      Text(
                                       "Qty",
                                        style: Theme.of(context).textTheme.headline4!.copyWith(
                                            fontWeight: FontWeight.w500, fontSize: 15.0),
                                      ),
                                      SizedBox(
                                        width: 50.0,
                                      ),

                                      Text(
                                        '\$ price',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(fontSize: 13.3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 35.0,),
                                      // Image.asset(
                                      //   'images/ic_veg.png',
                                      //   scale: 2.5,
                                      // ),
                                      // SizedBox(
                                      //   width: 20.0,
                                      // ),
                                      Text(
                                        "CategoryName", overflow: TextOverflow.ellipsis,   softWrap: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(fontSize: 13.3),
                                      ),
                                      Spacer(),
                                      Text(
                                        "1", overflow: TextOverflow.ellipsis,   softWrap: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(fontSize: 13.3),
                                      ),
                                      Spacer(),

                                      Text(
                                        "0.0", overflow: TextOverflow.ellipsis,   softWrap: false,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(fontSize: 13.3),
                                      ),

                                    ],
                                  ),
                                ),
                              ),



                            ],
                          ),
                        );
                      }
                  ),

                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Payment Status",
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Colors.grey, fontWeight: FontWeight.bold)),
                          // Text(widget.paymentstatus.toUpperCase(),
                          //     style: Theme.of(context).textTheme.headline6!.copyWith(
                          //         color: (widget.paymentstatus=="Completed"||widget.paymentstatus=="COMPLETED")?Colors.green:(widget.paymentstatus=="Accepted")?Color(0xffffa025):(widget.paymentstatus=="Pending")?Colors.red:Colors.red,
                          //         fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Subtotal",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            '\$ Subtotal',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                  ),
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 1.0,
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Service",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            '\$ Tax',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                  ),
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 1.0,
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$ 0.0',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                  ),
                  // SizedBox(
                  //   height: 7.0,
                  // ),
                  // Container(
                  //   height: 180.0,
                  //   color: Theme.of(context).cardColor,
                  // ),
                ],
              ),
            ),
          ),
        ),


    );
  }
}
