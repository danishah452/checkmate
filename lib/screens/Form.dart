// import 'dart:convert';


import 'dart:convert';
// import 'dart:html';
import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/home_controller.dart';
import '../helper/toast.dart';
import '../styles/app_images.dart';
import '../styles/app_theme.dart';
import 'categoryScreen.dart';
import '../styles/colors.dart';
import '../styles/colors.dart';
import '../helper/custom_button.dart';
import 'measurement.dart';
// import 'loading_widget.dart';


class PostTaskScreen extends StatefulWidget {
  // final String? barterType;
  // final bool isFinal;
  const PostTaskScreen({
    Key? key,
    // this.barterType, required this.isFinal,
  }) : super(key: key);
  @override
  _PostTaskScreenState createState() => _PostTaskScreenState();
}

class _PostTaskScreenState extends State<PostTaskScreen> {

  final _formKey = GlobalKey<FormState>();
  DateTime pickUpDate = DateTime.now();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _deliverydateController = TextEditingController();
  final TextEditingController _cashController = TextEditingController();
  final TextEditingController _advanceController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _fabriccodecontroller = TextEditingController();
  TextEditingController _productcodeController = TextEditingController();
  TextEditingController _productlinkController = TextEditingController();
  TextEditingController _customerfabricController = TextEditingController();
  int selected = 0;
  String?  SelectedSize='';
  List<String>?  Selectedmeasurement=[];
  String?  SelectedFabric='';
  String?  Selectedpayment='';
  String?  SelectedProduct='';
  bool code=false;
  bool isExpanded = true;
  bool _isExpanded = true;
  bool expanding=true;
  String? user_id;
  // final List<String> sizes = <String>[ 'Ex-Small','Small', 'Medium', 'Large','Ex-Large','Generate Code', 'Customize'];
  final List<String> sizes = <String>[ 'Generate Code', 'Customize'];

  final List<String> Fabrics = <String>[  'Fabric Image','Fabric Code', 'Customer Fabric'];
  final List<String> Products = <String>[  'Product Code','Product Image', 'Product Link'];
  final List<String> payment = <String>[  'Cash','Card', 'Bank Transfer'];
  int min = 100000; //min and max values act as your 6 digit range
  int max = 999999;
  var randomizer = new Random();
  var rNum;

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


  final List<File> _pickedAllFiles = [];
  final List<File> _pickedFiles = [];

  Future<File?> getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);

    if (_image != null) {
      final _imageInBase64 = File(_image.path);
      return _imageInBase64;
    } else {
      return null;
    }
  }
  Future<File?> getImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();

    final pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 75,
      maxWidth: 720,
      maxHeight: 557.42,
    );

    if (pickedFile != null) {
      final _imageInBase64 = File(pickedFile.path);
      // final _imageInBase64 = File(pickedFile.path);

      return _imageInBase64;
    } else {
      return null;
    }
  }


  void _pickDate() async {
    DateTime? _ = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
      useRootNavigator: true,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (_ != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(_);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }


  void _pickDeliveryDate() async {
    DateTime? _ = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
      useRootNavigator: true,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (_ != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(_);
      setState(() {
        _deliverydateController.text = formattedDate;
      });
    }
  }



  // @override
  // void didUpdateWidget(ExpansionTile oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.initiallyExpanded != widget.initiallyExpanded) {
  //     _handleTap();
  //   }
  // }


  int activeStep=0;
  String? indexx;
  String? categoryName;
  String selectedCategory = '';
  int tabIndex = 0;
  // final List<String> _pickedAllFiles = [];
  bool isOnline = false;

  @override
  void initState() {
    // configure();
    _cashController.text="0.0";
    _advanceController.text="0.0";
    _totalController.text="0.0";

    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    // ServicesProvider servicesProvider = myProvider.Provider.of<ServicesProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("Order    ترتیب    "),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {

            if(activeStep == 0){
              Navigator.pop(context);
            }else if(activeStep == 1){
              activeStep = 0;
              setState(() {

              });
            }else if(activeStep == 2){
              activeStep = 1;
              setState(() {

              });
            }
            else {
              activeStep =2 ;
              setState(() {

              });
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: context.screenHeight,
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              NumberStepper(
                stepColor: primaryColor,
                activeStepBorderColor: kPrimaryColor,
                activeStepColor: kPrimaryFadeTextColor,
                lineColor: kPrimaryColor,
                stepPadding: 15.0,
                numberStyle: TextStyle(color: Colors.white),
                enableNextPreviousButtons: false,
                numbers:[
                  1,
                  2,
                  3,
                ],
                activeStep: activeStep,
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),


              activeStep == 0?Container(
                // height: context.screenHeight *0.72,
                width: context.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("Customer Details   گاہک کی تفصیلات", style: context.textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      // height: context.screenHeight *0.62,
                      width: context.screenWidth,
                      padding: const EdgeInsets.all(12.0),

                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          nameTextField(size),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          phoneTextField(size),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          emailTextField(size),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          // addressTextField(size),


                          SizedBox(
                            height: size.height * 0.05,
                          ),

                          CustomButton(
                            buttonText:"Next   اگلے",
                            onTap: () async {
                              var email=_emailController.text;
                              var phone=_phoneController.text;
                              var name=_nameController.text;

                              if(_nameController.text.isNotEmpty||_emailController.text.isNotEmpty||_phoneController.text.isNotEmpty){
                                await homeProvider.Adduser(email,phone, name);

                                // var  user_id =homeProvider.adduser?.data?.id.toString();
                                print("UserId ${user_id}");

                                activeStep = 1;

                                homeProvider.GetMeasurement(_phoneController.text);
                                setState(() {
                                });
                              }
                              else{
                                Utils.show("Fill all fields first");

                              }
                            },
                          ),
                        ],
                      ),

                    )],
                ),
              ):activeStep == 1?Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Product and Measurement    پروڈکٹ اور پیمائش", style: context.textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.bold),),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            print("hjkasjkjkas");
                            if (categoriesName != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryScreen()))
                                  .then((value) {
                                categoryName = value;
                                print("jkasjkjkas${categoryName}");
                                setState(() {});
                              });
                            } else {
                              // await homeProvider.loadCategories();
                              if (categoriesName != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryScreen())).then((value) {
                                  categoryName = value;
                                  print("jkasjkjkas${categoryName}");
                                  setState(() {});
                                });
                              } else {

                              }
                            }
                          },
                          child: Center(
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.85,
                              padding: EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                // border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  hint: Text(
                                    categoryName != null
                                        ? "${categoryName}"
                                        : ' Select Category   زمرہ منتخب کریں۔',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  buttonHeight: 40,
                                  buttonWidth: 190,
                                  itemHeight: 40,
                                  items: [],
                                ),
                              ),
                            ),
                          ),
                        ),




                        categoryName == null?Container()
                            :
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                              child: Container(
                                // height: context.screenHeight *0.62,
                                width: context.screenWidth,
                                // color: Colors.red,
                                child: Text("Select Fabric   فیبرک منتخب کریں"),


                              ),
                            ),


                            Container(
                              height: 40,

                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(0.0),
                                  itemCount:
                                  Fabrics.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (){
                                        SelectedFabric=Fabrics[index];
                                        SelectedFabric=="Customer Fabric"?
                                        rNum = min + randomizer.nextInt(max - min):0;
                                        _customerfabricController.text=rNum.toString();

                                        setState(() {

                                        });
                                      },
                                      child: Card(
                                        child: Container(
                                          color: SelectedFabric == Fabrics[index].toString()?
                                          Colors.grey.shade400:
                                          Colors.grey.shade200,
                                          child: Center(child: Text("${Fabrics[index]}")),
                                        ),
                                      ),
                                    );}),
                            ),


                            SizedBox(height: 17,),

                            SelectedFabric=="Fabric Image"?



                            SizedBox(
                              height: 80,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  _pickedAllFiles != null?Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    height: 50,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:_pickedAllFiles.length,
                                        itemBuilder: (context,index)
                                        {
                                          return  Row(
                                            children: [
                                              Stack(

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        // border: Border.all(
                                                        //   color: Theme.of(context).primaryColor,
                                                        // ),
                                                        borderRadius:
                                                        BorderRadius.all(Radius.circular(4)),
                                                      ),
                                                      child:
                                                      Image.file(

                                                        _pickedAllFiles[index],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),

                                                  Positioned(
                                                      right: 0,
                                                      top: 0,
                                                      child:
                                                      InkWell(
                                                          onTap:(){
                                                            print(_pickedAllFiles);

                                                            Future.delayed(Duration.zero, (){

                                                              setState(() {
                                                                _pickedAllFiles.remove(_pickedAllFiles[index]);
                                                              });
                                                            });

                                                          },
                                                          child: Icon(Icons.clear))),
                                                ],
                                              ),
                                            ],
                                          );

                                        }),
                                  ): Container(),

                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: InkWell(
                                      onTap: () async{
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            // backgroundColor:
                                            // homeProvider.isDarkTheme ? Colors.white : Color(0xff424242),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                    title: Text(
                                                      "Select From Gallery",
                                                      style: TextStyle(
                                                        // color:  AppTheme.nearlyBlack
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      await getImageFromGallery().then((
                                                          value) {
                                                        if (value != null) {
                                                          Future.delayed(
                                                              Duration.zero, () {
                                                            setState(() {
                                                              _pickedAllFiles.add(
                                                                  value);
                                                            });
                                                          });
                                                        }
                                                      },
                                                      );
                                                    }),
                                                ListTile(
                                                    title: Text(
                                                      "Open Camera",
                                                      style: TextStyle(
                                                        // color: AppTheme.nearlyBlack
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      await getImageFromCamera().then((
                                                          value) {
                                                        if (value != null) {
                                                          Future.delayed(
                                                              Duration.zero, () {
                                                            setState(() {
                                                              _pickedAllFiles.add(
                                                                  value);
                                                            });
                                                          });
                                                        }
                                                      },
                                                      );
                                                    })],
                                            ),
                                          ),
                                        );

                                      },
                                      child: Container(
                                        // width: ,
                                        decoration: const BoxDecoration(
                                          // color: Colors.white,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                        ),
                                        child:
                                        const Center(
                                          child: Icon(Icons.add_photo_alternate),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )


                                :SelectedFabric=="Fabric Code"?
                            GestureDetector(

                                onTap: (){

                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Container(
                                    // height: 30,
                                    // width: 90,
                                    color:  Colors.grey.shade200,
                                    child: Center(child: TextField(
                                      controller: _fabriccodecontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Fabric Code 82304',
                                      ),

                                    )),),
                                )):
                            SelectedFabric=="Customer Fabric"?
                            GestureDetector(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                // height: 30,
                                // width: 90,
                                color:  Colors.grey.shade200,
                                child: Center(child: TextField(
                                  enabled: false,
                                  controller:_customerfabricController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '${rNum}',
                                  ),

                                )),),
                            )):Container(),



                            SizedBox(height: 17,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                              child: Container(
                                // height: context.screenHeight *0.62,
                                width: context.screenWidth,
                                // color: Colors.red,
                                child: Text("Select Product   پروڈکٹ کا انتخاب کریں"),


                              ),
                            ),


                            Container(
                              height: 40,

                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(0.0),
                                  itemCount:
                                  Products.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (){
                                        SelectedProduct=Products[index];
                                        setState(() {

                                        });
                                      },
                                      child: Card(
                                        child: Container(
                                          color: SelectedProduct == Products[index].toString()?
                                          Colors.grey.shade400:
                                          Colors.grey.shade200,
                                          child: Center(child: Text("${Products[index]}")),
                                        ),
                                      ),
                                    );}),
                            ),
                            SizedBox(height: 17,),

                            SelectedProduct=="Product Image"?
                            SizedBox(
                              height: 80,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  _pickedFiles != null?Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    height: 50,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:_pickedFiles.length,
                                        itemBuilder: (context,index)
                                        {
                                          return  Row(
                                            children: [
                                              Stack(

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        // border: Border.all(
                                                        //   color: Theme.of(context).primaryColor,
                                                        // ),
                                                        borderRadius:
                                                        BorderRadius.all(Radius.circular(4)),
                                                      ),
                                                      child:
                                                      Image.file(

                                                        _pickedFiles[index],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),

                                                  Positioned(
                                                      right: 0,
                                                      top: 0,
                                                      child:
                                                      InkWell(
                                                          onTap:(){
                                                            print(_pickedFiles);

                                                            Future.delayed(Duration.zero, (){

                                                              setState(() {
                                                                _pickedFiles.remove(_pickedFiles[index]);
                                                              });
                                                            });

                                                          },
                                                          child: Icon(Icons.clear))),
                                                ],
                                              ),
                                            ],
                                          );

                                        }),
                                  ): Container(),

                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: InkWell(
                                      onTap: () async{

                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            // backgroundColor:
                                            // homeProvider.isDarkTheme ? Colors.white : Color(0xff424242),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                    title: Text(
                                                      "Select From Gallery",
                                                      style: TextStyle(
                                                        // color:  AppTheme.nearlyBlack
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      await getImageFromGallery().then((
                                                          value) {
                                                        if (value != null) {
                                                          Future.delayed(
                                                              Duration.zero, () {
                                                            setState(() {
                                                              _pickedFiles.add(
                                                                  value);
                                                            });
                                                          });
                                                        }
                                                      },
                                                      );
                                                    }),
                                                ListTile(
                                                    title: Text(
                                                      "Open Camera",
                                                      style: TextStyle(
                                                        // color: AppTheme.nearlyBlack
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      await getImageFromCamera().then((
                                                          value) {
                                                        if (value != null) {
                                                          Future.delayed(
                                                              Duration.zero, () {
                                                            setState(() {
                                                              _pickedFiles.add(
                                                                  value);
                                                            });
                                                          });
                                                        }
                                                      },
                                                      );
                                                    })],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        // width: ,
                                        decoration: const BoxDecoration(
                                          // color: Colors.white,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                        ),
                                        child:
                                        const Center(
                                          child: Icon(Icons.add_photo_alternate),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )


                                :SelectedProduct=="Product Code"?
                            GestureDetector(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                // height: 30,
                                // width: 90,
                                color:  Colors.grey.shade200,
                                child: Center(child: TextField(
                                  controller:_productcodeController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Product Code 82304',
                                  ),

                                )),),
                            )):
                            SelectedProduct=="Product Link"?
                            GestureDetector(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                // height: 30,
                                // width: 90,
                                color:  Colors.grey.shade200,
                                child: Center(child: TextField(
                                  controller:_productlinkController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: ' Product Link',
                                  ),

                                )),),
                            )):Container(),


                            categoryName == null?Container()
                                :Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 4,
                                      crossAxisSpacing: 30,
                                      mainAxisSpacing: 20),
                                  itemCount: sizes.length,
                                  shrinkWrap: true,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: (){
                                        SelectedSize= sizes[index];
                                        setState(() {
                                          SelectedSize=="Generate Code"?
                                          rNum = min + randomizer.nextInt(max - min):0;
                                          // push(context, Invite(randomNum: rNum));
                                        });

                                      },
                                      child: Container(

                                        decoration: BoxDecoration(
                                          // color: isSelected == 0? kPrimaryColor: getColorBasedOnTheme(
                                          //     context, kLightColor, kDarkCardBgColor),
                                            borderRadius: BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: SelectedSize == sizes[index].toString()?
                                                Colors.grey.shade200:
                                                Colors.grey.shade200,
                                                blurRadius: 6,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 0,
                                              ),
                                            ]),
                                        child: Card(
                                          child: Container(
                                            color: SelectedSize == sizes[index].toString()?
                                            Colors.grey.shade400:
                                            Colors.grey.shade200,
                                            // height: 20,
                                            child: Center(child: Text(sizes[index], style: context.textTheme.subtitle2,overflow: TextOverflow.ellipsis,)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                            SizedBox(height: 10,),
                            SelectedSize=="Generate Code"?
                            GestureDetector(

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Container(
                                    // height: 30,
                                    // width: 90,
                                    color:  Colors.grey.shade200,
                                    child: Center(child: TextField(
                                      enabled: false,

                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '$rNum',
                                      ),

                                    )),),
                                ))
                                :SelectedSize=="Customize"?
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: GestureDetector(
                                onTap: (){
                                  if (categoryName != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Measurements(categoryName, _pickedAllFiles, _pickedFiles,rNum.toString(),_fabriccodecontroller.text.toString(),
                                                    _productcodeController.text.toString(),_productlinkController.text.toString())));
                                    // tabIndex = 2;
                                    // setState(() {
                                    //
                                    // });


                                  } else {

                                  }
                                },
                                child: Column(
                                  children: [
                                    GridView.builder
                                      (
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 4,
                                            crossAxisSpacing: 30,
                                            mainAxisSpacing: 20),
                                        itemCount: homeProvider.getmeasurement?.data?.length,
                                        shrinkWrap: true,
                                        // physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext ctx, index) {
                                          return InkWell(
                                            onTap: (){
                                              // SelectedSize= sizes[index];
                                              // setState(() {
                                              //   SelectedSize=="Generate Code"?
                                              //   rNum = min + randomizer.nextInt(max - min):0;
                                              //   // push(context, Invite(randomNum: rNum));
                                              // });

                                            },
                                            child: Container(

                                              decoration: BoxDecoration(
                                                // color: isSelected == 0? kPrimaryColor: getColorBasedOnTheme(
                                                //     context, kLightColor, kDarkCardBgColor),
                                                  borderRadius: BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                       color: Selectedmeasurement == homeProvider.getmeasurement?.data![index].toString()?
                                                      Colors.grey.shade200:
                                                      Colors.grey.shade200,
                                                      blurRadius: 6,
                                                      offset: const Offset(0, 0),
                                                      spreadRadius: 0,
                                                    ),
                                                  ]),
                                              child: Card(
                                                child: Container(
                                                  color: Selectedmeasurement == homeProvider.getmeasurement?.data![index].toString()?
                                                  Colors.grey.shade400:
                                                  Colors.grey.shade200,
                                                  // height: 20,
                                                  child: Center(child: Text("${homeProvider.getmeasurement?.data![index].id.toString()}", style: context.textTheme.subtitle2,overflow: TextOverflow.ellipsis,)),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                    ),
                                    Card(
                                        child: Container(
                                          height: 40,
                                          color:  Colors.grey.shade200,
                                          child: Center(child: Text("Add Measurements")),)),
                                  ],
                                ),
                              ),
                            )
                                :Container(),


// SizedBox(height: 20,),
                            SelectedSize.toString().isNotEmpty && categoryName.toString().isNotEmpty ?
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomButton(
                                buttonText:"Next   اگلے",
                                onTap: () async {

                                  // if(selectedCategory.isNotEmpty){
                                  activeStep = 2;
                                  setState(() {

                                  });
                                  // }
                                },
                              ),
                            ):Container(),


                          ],
                        ),



                      ],
                    ),
                  ]):

              activeStep == 2?
              Container(
                // height: context.screenHeight *0.72,
                width: context.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                      child: Text("Finish Order    آرڈر ختم کریں", style: context.textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.bold),),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(

                            decoration: InputDecoration(
                              labelText: "Try Date",
                              labelStyle: context.textTheme.subtitle2!.copyWith(
                                fontWeight: FontWeight.bold,
                                color:  kDarkColor.withOpacity(0.8),

                              ),
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 2,
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kLightColor.withOpacity(0.8),
                                    width: 2),
                              ),
                              // prefixIcon: widget.prefixIcon,
                              // prefix: widget.prefixIcon,
                            ),
                            controller: _dateController,
                            readOnly: true,
                            onTap: _pickDate,
                            // callback: _pickDate(),
                            // prefixIcon: Icon(Icons.calendar_today, size: 20,),

                            // validator: (text) {
                            //   // if (_dateController.text.isEmpty) {
                            //   //   if (text == null || text.isEmpty) {
                            //   //     return LocaleKeys.field_required.tr();
                            //   //   }
                            //   // }
                            //   // return null;
                            // },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(

                            decoration: InputDecoration(
                              labelText: "Delivery Date",
                              labelStyle: context.textTheme.subtitle2!.copyWith(
                                fontWeight: FontWeight.bold,
                                color:  kDarkColor.withOpacity(0.8),

                              ),
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 2,
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kLightColor.withOpacity(0.8),
                                    width: 2),
                              ),
                              // prefixIcon: widget.prefixIcon,
                              // prefix: widget.prefixIcon,
                            ),
                            controller: _deliverydateController,
                            readOnly: true,
                            onTap: _pickDeliveryDate,
                            // callback: _pickDate(),
                            // prefixIcon: Icon(Icons.calendar_today, size: 20,),

                            // validator: (text) {
                            //   // if (_dateController.text.isEmpty) {
                            //   //   if (text == null || text.isEmpty) {
                            //   //     return LocaleKeys.field_required.tr();
                            //   //   }
                            //   // }
                            //   // return null;
                            // },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                          child: Container(
                            // height: context.screenHeight *0.62,
                            width: context.screenWidth,
                            // color: Colors.red,
                            child: Text("Select Payment Method   ادائیگی کا طریقہ منتخب کریں"),


                          ),
                        ),

                        Container(
                          height: 40,
// width: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(0.0),
                              itemCount:
                              payment.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: (){
                                    Selectedpayment=payment[index];
                                    setState(() {

                                    });
                                  },
                                  child: Card(
                                    child: Container(
                                      width: 90,
                                      color: Selectedpayment == payment[index].toString()?
                                      Colors.grey.shade400:
                                      Colors.grey.shade200,
                                      child: Center(child: Text("${payment[index]}")),
                                    ),
                                  ),
                                );}),
                        ),



                        Selectedpayment=="Cash"?
                        Container():
                        Selectedpayment=="Card"?
                        Container()
                            :Selectedpayment=="Bank Transfer"?  Container():Container(),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                          child: Container(
                            // height: context.screenHeight *0.62,
                            width: context.screenWidth,
                            // color: Colors.red,
                            child: Text("Advance Paid   ایڈوانس ادا کیا گیا"),


                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
                          child: Container(
                            height: 50,
                            // width: 90,
                            // color:  Colors.grey.shade200,
                            child: Center(child:TextField(
                              controller:_advanceController ,
                              keyboardType: TextInputType.number,

                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(15.0),

                                ),
                              ),
                            )
                            ),),
                        ),



                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                          child: Container(
                            // height: context.screenHeight *0.62,
                            width: context.screenWidth,
                            // color: Colors.red,
                            child: Text("Decided Total Amount   کل رقم کا فیصلہ کیا"),


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
                          child: Container(
                            height: 50,
                            // width: 90,
                            // color:  Colors.grey.shade200,
                            child: Center(child:TextField(
                              controller:_totalController ,
                              keyboardType: TextInputType.number,

                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(15.0),

                                ),
                              ),
                            )
                            ),),
                        ),


                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                      child: CustomButton(
                        buttonText:"Done",
                        onTap: () async {
                          var pref;
                          var user_id;
                          pref = await SharedPreferences.getInstance();
                          user_id= pref.getString("id");
                          print("userrrid${user_id}");
                          print("measurementid${Selectedmeasurement}");
                          // var paymentMethod;
                          // var advancePaid;
                          // var decidedTotal;
                          var address;

                          homeProvider.Storeorder(user_id, _dateController.text, _deliverydateController.text, Selectedpayment.toString(), _advanceController.text.toString(), _totalController.text.toString(),   Selectedmeasurement!, );
                          Navigator.pop(context);
                          setState(() {

                          });
                          // }
                        },
                      ),
                    ),

                  ],
                ),
              ):Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                ],
              )


            ],
          ),





        ),

        // :Container(),
      ),
    );
    // );
    // );
  }


  Widget nameTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(80.0),
      //   color: AppTheme.primaryColor.withOpacity(0.1),
      //   border: Border.all(
      //     width: 1.0,
      //     color: AppTheme.primaryColor.withOpacity(0.2),
      //   ),
      // ),
      child: TextField(
        // style: GoogleFonts.inter(
        //   fontSize: 16.0,
        //   color: const Color(0xFF15224F),
        // ),
        controller: _nameController,
        scrollPadding: EdgeInsets.only(
            bottom: 1000000),
        keyboardType: TextInputType.emailAddress,

        maxLines: 1,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            labelText: 'Name  نام ',
            prefixIcon: Icon(Icons.person, color: primaryColor,),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.2,
              color: AppTheme.spacer,
            ),
            border: UnderlineInputBorder()),
      ),
    );
  }
  Widget emailTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(80.0),
      //   color: AppTheme.primaryColor.withOpacity(0.1),
      //   border: Border.all(
      //     width: 1.0,
      //     color: AppTheme.primaryColor.withOpacity(0.2),
      //   ),
      // ),
      child: TextField(
        // style: GoogleFonts.inter(
        //   fontSize: 16.0,
        //   color: const Color(0xFF15224F),
        // ),
        controller: _emailController,
        scrollPadding: EdgeInsets.only(
            bottom: 1000000),
        keyboardType: TextInputType.emailAddress,

        maxLines: 1,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            labelText: 'Email   ای میل',
            prefixIcon: Icon(Icons.email, color: primaryColor,),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.2,
              color: AppTheme.spacer,
            ),
            border: UnderlineInputBorder()),
      ),
    );
  }
  // Widget addressTextField(Size size) {
  //   return Container(
  //     alignment: Alignment.center,
  //     height: size.height / 11,
  //     // padding: const EdgeInsets.symmetric(horizontal: 40),
  //     // decoration: BoxDecoration(
  //     //   borderRadius: BorderRadius.circular(80.0),
  //     //   color: AppTheme.primaryColor.withOpacity(0.1),
  //     //   border: Border.all(
  //     //     width: 1.0,
  //     //     color: AppTheme.primaryColor.withOpacity(0.2),
  //     //   ),
  //     // ),
  //     child: TextField(
  //       // style: GoogleFonts.inter(
  //       //   fontSize: 16.0,
  //       //   color: const Color(0xFF15224F),
  //       // ),
  //       controller: _addressController,
  //       scrollPadding: EdgeInsets.only(
  //           bottom: 1000000),
  //       keyboardType: TextInputType.emailAddress,
  //
  //       maxLines: 1,
  //       cursorColor: primaryColor,
  //       decoration: InputDecoration(
  //           labelText: 'Address   پتہ',
  //           prefixIcon: Icon(Icons.location_on, color: primaryColor,),
  //           labelStyle: TextStyle(
  //             fontWeight: FontWeight.w400,
  //             fontSize: 14,
  //             letterSpacing: 0.2,
  //             color: AppTheme.spacer,
  //           ),
  //           border: UnderlineInputBorder()),
  //     ),
  //   );
  // }

  Widget phoneTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      // decoration: BoxDecoration(
      //   // borderRadius: BorderRadius.circular(80.0),
      //   // color: AppTheme.primaryColor.withOpacity(0.1),
      //   border: Border.all(
      //     width: 1.0,
      //     color: AppTheme.primaryColor.withOpacity(0.2),
      //   ),
      // ),
      child: TextField(
        // style: GoogleFonts.inter(
        //   fontSize: 16.0,
        //   color: const Color(0xFF15224F),
        // ),

        controller: _phoneController,
        maxLines: 1,
        // obscureText: !isSelected?true:false,
        keyboardType: TextInputType.phone,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone, color: primaryColor,),
            // suffixIconColor: AppTheme.primaryColor,

            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.2,
              color: AppTheme.spacer,
            ),
            labelText: 'Phone   فون',
            // filled: true,
            // labelStyle: GoogleFonts.inter(
            //   fontSize: 12.0,
            //   color: const Color(0xFF969AA8),
            // ),
            border: UnderlineInputBorder()),
      ),
    );
  }
}
