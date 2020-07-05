import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';

class OrderStatusScreen extends StatefulWidget {
  OrderStatusScreen({Key key}) : super(key: key);

  @override
  _OrderStatusScreenState createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          ScreenRoutes.HOME_SCREEN, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              Icons.done,
              color: Theme.of(context).accentColor,
              size: 100,
            ),
          ),
          Text(
            'Order has been placed successfully',
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
