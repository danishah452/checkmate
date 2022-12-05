
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:clearspirit/models/PostModel.dart'as ctmodel;

import '../styles/app_theme.dart';
import '../styles/colors.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List categoriesName = [
    {
      'name': 'Eastern Wear',
      'options': [
        {
          'name': 'Kameez Shalwar',
        },
        {
          'name': 'Kurta Trouser',
        },
        {
          'name': 'Kurta',
        }, {
          'name': 'Awami Waistcoat',
        },
        {
          'name': 'Trouser',
        },  {
          'name': 'Shalwar',
        },
      ]
    },
    {
      'name': 'Western Wear',
      'options': [
        {
          'name': 'Pant Coat',
        },
        {
          'name': 'Shirt',
        },
        {
          'name': 'Pant',
        }, {
          'name': 'Pant Coat and Waistcoat',
        },
      ]
    },
    {
      'name': 'Couture',
      'options': [
        {
          'name': 'Sherwani',
        },
        {
          'name': 'Prince Coat',
        },
        {
          'name': 'Turban',
        },{
          'name': 'Waistcoat',
        },{
          'name': 'Event Kurta Trouser',
        },
      ]
    },
    {
      'name': 'Accessories',
      'options': [
        {
          'name': 'Cufflinks',
        },

      ]
    },
  ];


  bool IsSelected = true;
  bool isExpanded = true;
  @override
  void initState() {

    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Select Category   زمرہ منتخب کریں'),
        ),
      body:
      SingleChildScrollView(
        child: Container(
          color: nearlyWhite,
          // height: MediaQuery.of(context).size.height ,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Container(
                      // height: 80,
                      width: MediaQuery.of(context).size.width - 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context)
                                  .hintColor
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5)
                        ],
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Select Category   زمرہ منتخب کریں",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: isExpanded
                                  ? primaryColor
                                  : primaryColor1,
                              fontWeight: FontWeight.w700),
                        ),
                        onExpansionChanged: (bool expanding) =>
                            setState(() => this.isExpanded = expanding),
                        // leading: Icon(Icons.person),
                        children: <Widget>[
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(0.0),
                              itemCount:
                              categoriesName.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    ExpansionTile(
                                        title: Text(
                                          "${categoriesName[index]['name']}",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        // leading: Icon(Icons.person),
                                        children: <Widget>[
                                          Column(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                  const BouncingScrollPhysics(),
                                                  padding:
                                                  const EdgeInsets.all(
                                                      0.0),
                                                  itemCount: categoriesName[index]['options'].length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                      int idx) {
                                                    return GestureDetector(
                                                      onTap: () {

                                                          Navigator.pop(
                                                              context,
                                                              categoriesName[index]['options'][idx]['name']);

                                                      },
                                                      child: ListTile(
                                                        title: Text(
                                                            '${categoriesName[index]['options'][idx]['name']}'),
                                                        // trailing:
                                                        // Container(
                                                        //     height:15,
                                                        //     width:15,
                                                        //     child: Image.asset('assets/icons/Tick.png',)),
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ]),
                                  ],
                                );
                              })

                          // ListTile(
                          //   title: Text('Show Profile'),
                          // ),
                          // ListTile(
                          //   title: Text('Add Friend'),
                          // ),
                        ],
                      ),
                    ),

                    // Text(
                    //   "Select Category",  style: TextStyle(fontSize: 16.0,color: Colors.grey,fontWeight: FontWeight.w700),
                    // )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}