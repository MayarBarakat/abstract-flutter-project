import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/constants.dart';
import '../shared/components/size_config.dart';




class ShopLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var  items = <Widget>[
      Container(
        height: 56,
        child: Column(
          children: [
            Icon(
              Icons.home,
              size: 30.0,
            ),
            Text(
              'الرئيسية',
              style: TextStyle(
                  color: kPrimaryColor
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 56,
        child: Column(
          children: [
            Icon(
              Icons.favorite_outline,
              size: 30.0,
            ),
            Text(
              'المفضلة',
              style: TextStyle(
                  color: kPrimaryColor
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 56,
        child: Column(
          children: [

            Icon(
              Icons.shopping_cart_outlined,
              size: 30.0,
            ),
            Text(
              'السلة',
              style: TextStyle(
                  color: kPrimaryColor
              ),
            ),

          ],
        ),
      ),
      Container(
        height: 56,
        child: Column(
          children: [
            Icon(
              Icons.category_outlined,
              size: 25.0,
            ),

            Text(
              'الأصناف',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 56,
        child: Column(
          children: [
            Icon(
              Icons.settings,
              size: 30.0,
            ),
            Text(
              'الإعدادات',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12
              ),
            ),
          ],
        ),
      ),
    ];
    var cubit = ShopCubit.get(context);

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => showExitPopup(context),
          child: SafeArea(
            top: false,
            child: Scaffold(
              extendBody: true,
              backgroundColor: Colors.white,
              body:IndexedStack(
                index: cubit.currentIndex,
                children: cubit.bottomScreen,
              ) ,
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(
                      color: kPrimaryColor),
                ),
                child: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  height: 60.0,

                  color: Colors.grey[100]!,
                  buttonBackgroundColor: Colors.white,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 300),
                  items: items,
                  index: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottom(index);
                  },
                ),
              ),
            ),
          ),
        );
      },

    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("هل تريد الخروج من التطبيق", textAlign: TextAlign
                      .center, style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text("نعم"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade800),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("لا", style: TextStyle(color: Colors
                                .black)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

}