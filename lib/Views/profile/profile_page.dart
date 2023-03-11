import 'package:sng/provider/user_clocking_provider.dart';
import 'package:flutter/material.dart';
import '../../Components/page_state_widget.dart';
import '../../Data/models/user.dart';
import '../../Helper/storage_keys.dart';
import '../../Util/constant.dart';
import '../../Util/storage.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    implements UserClockingState {
  dynamic data;
  dynamic attendance;

  Future<Null> getSharedPrefs() async {
    final dataProvider =
        Provider.of<UserClockingProvider>(context, listen: false);
    dataProvider.viewClocking(this);
    final userData =
        await LocalStorageUtils.readObject<UserModel>(StorageKeys.userObject);
    setState(() {
      data = (userData['data']['user'] ?? "");
      Future.delayed(Duration.zero, () async {
        attendance = dataProvider;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryTextColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: data == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                    width: 50, height: 50, child: CircularProgressIndicator()),
              ],
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1569173112611-52a7cd38bea9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data['firstname']} ${data['lastname']}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kSecondaryTextColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 2,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['email'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Attendance",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kPrimaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Consumer<UserClockingProvider>(
                        builder: (context, state, _) {
                      return Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: MediaQuery.of(context).size.width -30,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 36.0, vertical: 10.0),
                          child: state.pageState == PageState.loading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: state.response!.length,
                                  // itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1.0, color: Colors.grey),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  state
                                                      .response[index].siteName,
                                                  style:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black87)),
                                              Spacer(),
                                              Text(
                                                  state.response[index]
                                                      .clockingDateTime
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              kPrimaryColor)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: kPaddingSmall,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  state.response[index]
                                                      .clockingPurpose,
                                                  textAlign: TextAlign.left,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              kSubtextColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }));
                    }),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void clcokingError(String error) {
    // TODO: implement clcokingError
  }

  @override
  void clockingSuccess(String msg) {
    // TODO: implement clockingSuccess
  }
}
