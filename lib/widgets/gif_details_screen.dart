import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GifDetailsScreen extends StatelessWidget {

  final Map _gifData;


  GifDetailsScreen(this._gifData);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              //TODO
              // share action
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
            height: ScreenUtil.screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network( _gifData["images"]["fixed_height"]["url"]),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Usuário: ' + _gifData["username"] ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            )),
      ),
    );
  }
}
