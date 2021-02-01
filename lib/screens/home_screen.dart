import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_app_example/blocs/giphy_bloc.dart';
import 'package:gif_app_example/screens/new_gif_screen.dart';
import 'package:gif_app_example/widgets/gif_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var giphyBloc = BlocProvider.getBloc<GiphyBloc>();

  int _getCount(List data) {
    if (giphyBloc.search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  @override
  void initState() {
    giphyBloc.getGifs().then((map) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.black,
            height: ScreenUtil.screenHeight,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          giphyBloc.search = text;
                          giphyBloc.offset;
                        });
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Pesquise seu Giphy',
                          isDense: false,
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: ScreenUtil.screenHeight,
                    width: ScreenUtil.screenWidth,
                    child: FutureBuilder(
                      future: giphyBloc.getGifs(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return Container(
                              width: 200,
                              height: 200,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 5.0,
                              ),
                            );
                          default:
                            if (snapshot.hasError) {
                              return Container();
                            } else {
                              return _createGifTable(context, snapshot);
                            }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black)
          ),
          color: Colors.white,
          child: Icon(
            Icons.add
          ),
          onPressed: (){
            Get.to(NewGifScreen());
          },
        ),
      ),
    );
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index) {
          if (giphyBloc.search == null || index < snapshot.data["data"].length) {
            return GestureDetector(
              child: Image.network(
                snapshot.data["data"][index]["images"]["fixed_height"]
                    ["url"],
                height: 300,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Get.to(GifDetailsScreen(snapshot.data["data"][index]));
              },
              onLongPress: () {
                //TODO
                // share action
              },
            );
          } else {
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 60,
                    ),
                    Text(
                      "Carregar mais...",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    giphyBloc.offset += 19;
                  });
                },
              ),
            );
          }
        });
  }
}
