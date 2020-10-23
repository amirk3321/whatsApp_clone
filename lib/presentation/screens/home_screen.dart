import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whatsapp_clone/domain/entities/user_entity.dart';
import 'package:flutter_whatsapp_clone/presentation/bloc/auth/auth_cubit.dart';
import 'package:flutter_whatsapp_clone/presentation/pages/calls_page.dart';
import 'package:flutter_whatsapp_clone/presentation/pages/camera_page.dart';
import 'package:flutter_whatsapp_clone/presentation/pages/chat_page.dart';
import 'package:flutter_whatsapp_clone/presentation/pages/status_page.dart';
import 'package:flutter_whatsapp_clone/presentation/widgets/custom_tab_bar.dart';
import 'package:flutter_whatsapp_clone/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  final UserEntity userInfo;

  const HomeScreen({Key key, this.userInfo}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  int _currentPageIndex = 1;
  PageController _pageViewController = PageController(initialPage: 1);
  List<Widget> get _pages => [
    CameraPage(),
    ChatPage(userInfo: widget.userInfo,),
    StatusPage(),
    CallsPage(),
  ];

  _buildSearch() {
    return Container(
      height: 45,
      margin: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.3),
            spreadRadius: 1,
            offset: Offset(0.0, 0.50))
      ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: InkWell(
            onTap: () {
              //TODO:
              setState(() {
                _isSearch = false;
              });
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex !=0?AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: _isSearch == false ? primaryColor : Colors.transparent,
        title: _isSearch == false
            ? Text("WhatsApp Clone")
            : Container(
                height: 0.0,
                width: 0.0,
              ),
        flexibleSpace: _isSearch == false
            ? Container(
                height: 0.0,
                width: 0.0,
              )
            : _buildSearch(),
        actions: <Widget>[
          InkWell(
              onTap: () {
                setState(() {
                  _isSearch = true;
                });
              },
              child: Icon(Icons.search)),
          SizedBox(
            width: 5,
          ),
          InkWell(onTap: (){
            BlocProvider.of<AuthCubit>(context).loggedOut();
          },child: Icon(Icons.more_vert))
        ],
      ):null,
      body: Column(
        children: <Widget>[
          //TODO:CustomTabBar
          _isSearch == false
              ? _currentPageIndex != 0
                  ? CustomTabBar(index: _currentPageIndex)
                  : Container(height: 0.0, width: 0.0,)
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(Icons.more_vert),
              isDense: true,
              onChanged: (value){},
              isExpanded: false,
              items: [

              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return _pages[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
