import 'package:challenge_task/ui/resource/app_colors.dart';
import 'package:challenge_task/ui/resource/app_strings.dart';
import 'package:challenge_task/ui/resource/app_text_style.dart';
import 'package:challenge_task/ui/screens/home/widget/product_card.dart';
import 'package:challenge_task/ui/widgets/app_size_boxes.dart';
import 'package:challenge_task/ui/widgets/app_text_display.dart';

import 'package:flutter/material.dart';

import '../../../../core/model/model.dart';
import '../../../resource/constants.dart';
import '../../../widgets/card_app.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<OrdersScreen> {
  double avg = 0;

  @override
  void initState() {
    super.initState();
    avg = getAveragePrice();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardWidget(
                  child: Column(
                    children: [
                      AppText(
                        text: AppStrings.numberOfItems,
                        style: AppTextStyles.h2_20
                            .copyWith(color: AppPalette.textWhiteColor),
                      ),
                      10.heightBox,
                      AppText(
                        text: "${json.length.toString()} items",
                        style: AppTextStyles.h2_20
                            .copyWith(color: AppPalette.textWhiteColor),
                      ),
                    ],
                  ),
                ),
                CardWidget(
                  child: Column(
                    children: [
                      AppText(
                        text: AppStrings.averagePrice,
                        style: AppTextStyles.h2_20
                            .copyWith(color: AppPalette.textWhiteColor),
                      ),
                      10.heightBox,
                      AppText(
                        text: "\$${avg.toString().split(".")[0]}",
                        style: AppTextStyles.h2_20
                            .copyWith(color: AppPalette.textWhiteColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  List<String> tags = json[index]["tags"];
                  return ProductCardWidget(index: index, tags: tags);
                },
                separatorBuilder: (context, index) => 15.heightBox,
                itemCount: json.length),
          ],
        ),
      ),
    );
  }
}
