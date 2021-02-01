import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewGifScreen extends StatefulWidget {
  @override
  _NewGifScreenState createState() => _NewGifScreenState();
}

class _NewGifScreenState extends State<NewGifScreen> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  File imageGlobal;
  String selected;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text('Crie seu Gif'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: ScreenUtil.screenHeight,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                FormBuilder(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            initialValue: null,
                            attribute: "title",
                            validators: [
                              FormBuilderValidators.required(),
                            ],
                            maxLength: 45,
                            decoration: InputDecoration(
                              hintText: 'title',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            initialValue: null,
                            attribute: "url",
                            validators: [
                              FormBuilderValidators.required(),
                            ],
                            maxLength: 45,
                            decoration: InputDecoration(
                              hintText: 'url',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            initialValue: null,
                            attribute: "embedUrl",
                            validators: [
                              FormBuilderValidators.required(),
                            ],
                            maxLength: 45,
                            decoration: InputDecoration(
                              hintText: 'embedUrl',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            initialValue: null,
                            attribute: "type",
                            validators: [
                              FormBuilderValidators.required(),
                            ],
                            maxLength: 45,
                            decoration: InputDecoration(
                              hintText: 'type',

                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ButtonTheme(
                            minWidth: ScreenUtil.screenWidth,
                            height: 50,
                            child: RaisedButton(
                              elevation: 1,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)),
                              color: Colors.black,
                              child: Text(
                                'salvar',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                //TODO
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (builder) {
          return new Container(
            height: 260.0,
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SizedBox(
                          height: 40,
                          child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Text('camera',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                            color: Colors.transparent,
                            onPressed: () async {
                              // File image = await ImagePicker.pickImage(
                              //     source: ImageSource.camera, imageQuality: 70);
                              //
                              // if (image == null) return;
                              //
                              // File newImage =
                              // await petsBloc.imageSelected(image);
                              //
                              // Get.back();
                              //
                              // setState(() {
                              //   imageGlobal = newImage;
                              // });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SizedBox(
                          height: 50,
                          child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Text('galeria',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                            color: Colors.transparent,
                            onPressed: () async {
                              // File image = await ImagePicker.pickImage(
                              //     source: ImageSource.gallery,
                              //     imageQuality: 70);
                              //
                              // if (image == null) return;
                              //
                              // File newImage =
                              // await petsBloc.imageSelected(image);
                              //
                              // Get.back();
                              //
                              // setState(() {
                              //   imageGlobal = newImage;
                              // });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SizedBox(
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Text('cancelar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            color: Colors.black,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
          );
        });
  }

}
