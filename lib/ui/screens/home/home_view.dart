import 'package:challenge_task/ui/resource/app_colors.dart';
import 'package:challenge_task/ui/resource/app_strings.dart';
import 'package:challenge_task/ui/screens/home/widget/graph_order.dart';
import 'package:challenge_task/ui/screens/home/widget/order_list_screen.dart';
import 'package:challenge_task/ui/widgets/app_text_display.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const AppText(text: AppStrings.order),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppPalette.textLightColor,
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.production_quantity_limits,
                color: Colors.teal,
              )),
              Tab(
                  icon: Icon(
                Icons.auto_graph,
                color: Colors.teal,
              )),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrdersScreen(),
            GraphScreen(),
            // Container(),
          ],
        ),
      ),
    );
  }
}
