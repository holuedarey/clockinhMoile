import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Util/constant.dart';

class PhFlashMessage extends StatelessWidget {
  const PhFlashMessage({Key? key, required this.title, required this.message,  required this.statusColor})
      : super(key: key);

  final String title;
  final String message;
  final bool statusColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        height: 100,
        decoration: BoxDecoration(
          color: statusColor ?  const Color(0xFFC72C41) :  kPrimaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: kFullPaddingSpacer,
            ),
            Expanded(
              child:Row(
                children: [
                  SizedBox(
                    width: kFullPaddingSpacer,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          message,
                          maxLines: 9,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
