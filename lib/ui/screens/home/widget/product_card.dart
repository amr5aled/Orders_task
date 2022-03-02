import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_task/ui/resource/size_extension.dart';
import 'package:challenge_task/ui/widgets/app_padding.dart';
import 'package:challenge_task/ui/widgets/app_size_boxes.dart';
import 'package:challenge_task/ui/widgets/app_text_display.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/model.dart';

class ProductCardWidget extends StatelessWidget {
  ProductCardWidget({Key? key, required this.index, required this.tags})
      : super(key: key);
  int index;
  List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5.h,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: AppPadding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FractionallySizedBox(
                  child: buildCardImage(image: json[index]["picture"]),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Company: ${json[index]["company"]}",
                      ),
                      AppText(
                        text: "Buyer:${json[index]["buyer"]}",
                      ),
                      10.heightBox,
                      AppText(
                        text: "Price:${json[index]["price"]}",
                      ),
                      10.heightBox,
                      const AppText(
                        text: "Tags:",
                      ),
                      10.heightBox,
                      Wrap(
                          children: tags
                              .map(
                                (e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      e,
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              )
                              .toList())
                    ],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: json[index]["isActive"]
                          ? Colors.tealAccent
                          : Colors.red,
                    ),
                    Text(json[index]["isActive"] ? "Active" : "Inactive",
                        overflow: TextOverflow.ellipsis)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildPlaceHolder() {
  return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: const Center(
        child: Text("loading"),
      ));
}

Widget buildCardImage({required String image}) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    height: 250.w,
    width: 100.h,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => buildPlaceHolder(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
    ),
  );
}
