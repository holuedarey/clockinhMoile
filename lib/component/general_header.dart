import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Util/constant.dart';
import '../Data/models/user.dart';
import '../Helper/storage_keys.dart';
import '../Util/storage.dart';

class GeneralHeader extends StatelessWidget {
  GeneralHeader({Key? key,}) : super(key: key);

  String? name;

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  void initState() {
    Future.delayed(Duration.zero, () async {
      // final user = await LocalStorageUtils.readObject<UserModel>(
      //     StorageKeys.userObject);
      // UserModel userModel = UserModel.fromJson(user);
      // name = userModel.data?.user?.firstname ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    child: SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: Image.asset(
                            color: kSecondaryTextColor,
                            "assets/user_check.png",
                          ),
                        ))),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       name == null ? const CircularProgressIndicator() :  Text("Hello, $name",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: kColorBlack,
                                    )),
                    Text("Good ${greeting()} !",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: kColorGreyII,
                            )),
                  ],
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        // InkWell(
        //   onTap: (){
        //     // Navigator.push(
        //     //     context,
        //     //     MaterialPageRoute(builder: (context) => const NotificationsPage()));
        //   },
        //   child: Image.asset(
        //     "assets/notification.png",
        //   ),
        // )
      ],
    );
  }
}
