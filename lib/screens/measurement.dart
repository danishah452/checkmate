// import 'dart:html';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/home_controller.dart';
import 'package:flutter_app/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../helper/textfield.dart';
import '../helper/custom_button.dart';

class Measurements extends StatefulWidget {
  const Measurements(this.categoryName,this.pickedAllFiles, this.pickedFiles, this.customerfabric,  this.fabriccode, this.productcode, this.productlink, {Key? key}) : super(key: key);
 final String? categoryName;
 final List<File> pickedAllFiles;
  final List<File> pickedFiles;
  final String? customerfabric;
  final String? fabriccode;
  final String? productcode;
  final String? productlink;

 // final String? user_id;
  @override
  _MeasurementsState createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {


  // final TextEditingController _nameController = TextEditingController();




  final TextEditingController _NeckController = TextEditingController();
  final TextEditingController _BicepsController = TextEditingController();
  final TextEditingController _crossbackController = TextEditingController();
  final TextEditingController _halfbackController = TextEditingController();
  final TextEditingController _shoulderController = TextEditingController();
  final TextEditingController _sleevesController = TextEditingController();
  final TextEditingController _chestController = TextEditingController();
  final TextEditingController _waistController = TextEditingController();
  final TextEditingController _hipController = TextEditingController();
  final TextEditingController _coatlengthController = TextEditingController();
  final TextEditingController _trouserlengthController = TextEditingController();
  final TextEditingController _thighController = TextEditingController();
  final TextEditingController _kurtalengthController = TextEditingController();
  final TextEditingController _shalwarlengthController = TextEditingController();
  final TextEditingController _bellyController = TextEditingController();
  final TextEditingController _shirtlengthController = TextEditingController();

  List<String> fieldItems = [];

  var pref;
  var user_id;
  @override
  void initState() {
    configure();


    // TODO: implement initState
    super.initState();
  }


  configure() async {
    pref = await SharedPreferences.getInstance();
    user_id= pref.getString("id");
    print("userrid${user_id}");

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
backgroundColor: primaryColor,
        title: const Text('Measurements   پیمائش'),
      ),
      body:  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: Text("Measurements  پیمائش ", style: context.textTheme.headline6!
            //       .copyWith(fontWeight: FontWeight.bold),),
            // ),



            widget.categoryName=="Prince Coat"?
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Prince Coat  پرنس کوٹ ", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController,image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController, image:'assets/icons/Shoulder.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Biceps  بائسپس', controller: _BicepsController, image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Cross back  واپس کراس', controller: _crossbackController, image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Half back  واپس آدھا', controller: _halfbackController, image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Sleeves  آستین', controller: _sleevesController, image:'assets/icons/Sleeves.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController,image:'assets/icons/chest.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController, image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Coat length  کوٹ کی لمبائی', controller: _coatlengthController, image:'assets/icons/coat-length.png'),


                  ),
                ),
              ],
            ):










            widget.categoryName=="Pant"?   Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Pant Size  پینٹ کا سائز", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController, image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Thigh  ران', controller: _thighController, image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController, image:'assets/icons/Hip.png'),


                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Trouser length  پتلون کی لمبائی', controller: _trouserlengthController, image:'assets/icons/Trouser-length.png'),


                  ),
                ),
              ],
            ):







            widget.categoryName=="Kameez Shalwar"?
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Shalwar Kameez  شلوار قمیض", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController, image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController, image:'assets/icons/Shoulder.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Sleeves  آستین', controller: _sleevesController, image:'assets/icons/Sleeves.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController, image:'assets/icons/chest.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController, image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Kurta length  کرتہ کی لمبائی', controller: _kurtalengthController, image:'assets/icons/kurta-length.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shalwar length  شلوار کی لمبائی', controller: _shalwarlengthController, image:'assets/icons/Shalwar-length.png'),


                  ),
                ),

              ],
            ):





            widget.categoryName=="Sherwani"?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Sherwani  شیروانی", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController, image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Biceps  بائسپس', controller: _BicepsController, image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Cross back  واپس کراس', controller: _crossbackController, image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Half back  واپس آدھا', controller: _halfbackController,image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController,image:'assets/icons/Shoulder.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Sleeves  آستین', controller: _sleevesController,image:'assets/icons/Sleeves.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController,image:'assets/icons/chest.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController,image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Coat length  کوٹ کی لمبائی', controller: _coatlengthController,image:'assets/icons/coat-length.png'),


                  ),
                ),

              ],
            ):






            widget.categoryName=="Waistcoat" || widget.categoryName=="Awami Waistcoat" ?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Waist Coat  کمر کوٹ", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController,image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController,image:'assets/icons/Shoulder.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController,image:'assets/icons/chest.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Belly  پیٹ', controller: _bellyController,image:'assets/icons/Belly.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Coat length  کوٹ کی لمبائی', controller: _coatlengthController,image:'assets/icons/coat-length.png'),


                  ),
                ),

              ],
            ):



            widget.categoryName=="Kurta Trouser" || widget.categoryName=="Event Kurta Trouser"?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Kurta and Trouser  کرتہ اور پتلون", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController,image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController,image:'assets/icons/Shoulder.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Sleeves  آستین', controller: _sleevesController,image:'assets/icons/Sleeves.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController,image:'assets/icons/chest.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController,image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Kurta length  کرتہ کی لمبائی', controller: _kurtalengthController,image:'assets/icons/kurta-length.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Trouser length  پتلون کی لمبائی', controller: _trouserlengthController,image:'assets/icons/Trouser-length.png'),


                  ),
                ),
              ],
            ):




            widget.categoryName=="Shirt"?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Shirt  قمیض", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController,image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController,image:'assets/icons/Shoulder.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Sleeves  آستین', controller: _sleevesController,image:'assets/icons/Sleeves.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController,image:'assets/icons/chest.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController,image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shirt length  قمیض کی لمبائی', controller: _shirtlengthController,image:'assets/icons/kurta-length.png'),


                  ),
                ),

              ],
            ):




            widget.categoryName=="Kurta"?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Kurta  کرتہ", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController,image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController,image:'assets/icons/Shoulder.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Sleeves  آستین', controller: _sleevesController,image:'assets/icons/Sleeves.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController,image:'assets/icons/chest.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController,image:'assets/icons/Waiste.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Kurta length  کرتہ کی لمبائی', controller: _kurtalengthController,image:'assets/icons/kurta-length.png'),


                  ),
                ),
              ],
            ):


            widget.categoryName=="Shalwar"?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Shalwar  شلوار", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController,image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shalwar length  شلوار کی لمبائی', controller: _shalwarlengthController,image:'assets/icons/Shalwar-length.png'),


                  ),
                ),
              ],
            ):



            widget.categoryName=="Trouser"?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Trouser  پتلون", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController,image:'assets/icons/Waist.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Trouser length  پتلون کی لمبائی', controller: _trouserlengthController,image:'assets/icons/Trouser-length.png'),


                  ),
                ),
              ],
            ):







            widget.categoryName=="Pant Coat" || widget.categoryName=="Pant Coat and Waistcoat"?

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Coat Size  کوٹ پینٹ سائز ", style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Biceps  بائسپس', controller: _BicepsController,image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Cross back  واپس کراس', controller: _crossbackController,image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Half back  واپس آدھا', controller: _halfbackController,image:'assets/icons/neck.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Neck  گردن', controller: _NeckController,image:'assets/icons/neck.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Shoulder  کندھا', controller: _shoulderController,image:'assets/icons/Shoulder.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Sleeves  آستین', controller: _sleevesController,image:'assets/icons/Sleeves.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Chest  سینہ', controller: _chestController,image:'assets/icons/chest.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Coat length  کوٹ کی لمبائی', controller: _coatlengthController,image:'assets/icons/coat-length.png'),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                  child: Container(
                    child: CustomTextField(  name: 'Hip  کولہا', controller: _hipController,image:'assets/icons/Hip.png'),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Waist  کمر', controller: _waistController,image:'assets/icons/Waist.png'),


                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                  child: Container(
                    child: CustomTextField(  name: 'Trouser length  پتلون کی لمبائی', controller: _trouserlengthController,image:'assets/icons/Trouser-length.png'),


                  ),
                ),

              ],
            )







:Container(),




            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
            //   child: Container(
            //     height: 50,
            //     // width: 90,
            //     // color:  Colors.grey.shade200,
            //     child: Center(child:TextField(
            //       // controller:_advanceController ,
            //       keyboardType: TextInputType.number,
            //
            //       decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //           borderSide:
            //           BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            //           borderRadius: BorderRadius.circular(15.0),
            //
            //         ),
            //       ),
            //     )
            //     ),),
            // ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
              child: CustomButton(
                  buttonText:"Next   اگلے",
                  onTap: () async {

                        var neck=_NeckController.text;
                        var biceps=_BicepsController.text;
                        var crossback=_crossbackController.text;
                        var halfback=_halfbackController.text;
                        var shoulder=_shoulderController.text;
                        var sleeves=_sleevesController.text;
                        var chest=_chestController.text;
                        var waist=_waistController.text;
                        var hip=_hipController.text;
                        var coatlength=_coatlengthController.text;
                        var trouserlength=_trouserlengthController.text;
                        var thigh=_thighController.text;
                        var kurtalength=_kurtalengthController.text;
                        var shalwarlength=_shalwarlengthController.text;
                        var belly=_bellyController.text;
                        var shirtlength=_shirtlengthController.text;




                        // fieldItems.add(neck,biceps,crossback,halfback,shoulder,sleeves,chest,waist,hip,coatlength);
                     await   homeProvider.AddMeasurement(user_id,widget.categoryName, widget.pickedAllFiles,widget.pickedFiles,
                            neck,biceps,crossback
                           , halfback, shoulder,sleeves,chest,waist,hip,coatlength,trouserlength,thigh,kurtalength,shalwarlength,belly,shirtlength,
                          widget.customerfabric,widget.fabriccode,widget.productcode,widget.productlink,

                        );
                        print(widget.customerfabric);
                        print(widget.fabriccode);
                        print(widget.productcode);
                        print(widget.productlink);
                        print("qwertyu");
    Navigator.pop(context);
    }

                    // if(selectedCategory.isNotEmpty){
                    // tabIndex = 1;
    ))]))));}}