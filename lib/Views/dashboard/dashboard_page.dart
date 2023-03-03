import 'package:clockingapp/Helper/sting_helper.dart';
import 'package:clockingapp/Services/auth_services.dart';
import 'package:clockingapp/Views/clocking/new_clocking.dart';
import 'package:flutter/material.dart';
import '../../Data/models/user.dart';
import '../../Helper/storage_keys.dart';
import '../../Util/constant.dart';
import '../../Util/storage.dart';
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
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


  Future<Null> getSharedPrefs() async {
    final userData  = await LocalStorageUtils.readObject<UserModel>(StorageKeys.userObject);
    setState(() {
      name = (userData['data']['user']['firstname'].toString() ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
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
                                  clipBehavior: Clip.none,
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
                            name == null
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                    ))
                                : Text("Hello, ${name?.capitalize()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: kColorBlack,
                                        )),
                            Text("Good ${greeting()} !",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
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
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClockingPage()))
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryLightColor,
                      boxShadow: const [
                        BoxShadow(color: kColorGreyLight, spreadRadius: 3),
                      ],
                      // shape: BoxShape.circle()
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/round_check.png",
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // SizedBox(height: 10,),
                                  Text("Check in & Out",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: kScaffoldBackgroundColor)),
                                  Text("Create new Check in or out",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: kScaffoldBackgroundColor)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    AuthService.profile(context);
                  },
                  child: Container(
                    width: 168,
                    height: 145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kColorGrey,
                      boxShadow: const [
                        BoxShadow(color: kColorGreyLight, spreadRadius: 3),
                      ],

                      // shape: BoxShape.circle()
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/user_check.png",
                          ),
                          SizedBox(
                            height: kSmallPadding,
                          ),
                          Text("Account Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor)),
                          Text("View Account Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    AuthService.logout(context);
                  },
                  child: Container(
                    width: 168,
                    height: 145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kColorGrey,
                      boxShadow: const [
                        BoxShadow(color: kColorGrey, spreadRadius: 3),
                      ],

                      // shape: BoxShape.circle()
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/log_out.png",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text("Log Out",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor)),
                          Text("Exit the App",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: kColorBlack)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
