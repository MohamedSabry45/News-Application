import 'dart:ffi';

import 'package:flutter/material.dart';

typedef OnMenuItemClick = void Function(MenuItem clickItemPos);

class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;

  HomeDrawer(this.onMenuItemClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 48,
              ),
              alignment: Alignment.center,
              color: Colors.green,
              child: Text(
                'New App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.categories);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 32,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.settings);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 32,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
enum MenuItem{
  categories,
  settings
}

