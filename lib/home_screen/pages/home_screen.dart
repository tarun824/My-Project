import 'package:flutter/material.dart';
import 'package:for_error/common/is_loading_screen.dart';
import 'package:for_error/common/provider/is_loading_provider.dart';
import 'package:for_error/common/widgets/app_bar_widget.dart';
import 'package:for_error/home_screen/service/fetch_user_data_json.dart';
import 'package:for_error/home_screen/state_management/user_provider.dart';
import 'package:for_error/home_screen/user_model.dart';
import 'package:for_error/user_profile_screen.dart/pages/user_profile_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    // required this.p
  });
  // IsLoadingProvider p;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> _users = [];
  bool isLoading = false;

  Future<void> fetch() async {
    final _data = await fetchUserDataJson().fetchData(context);
    // _users = _data;
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<IsLoadingProvider>(context, listen: true);
    isLoading = loading.getIsLoading();

    final user = Provider.of<UserProvider>(context, listen: true);

    _users = user.getUsersData();

    return Scaffold(
      appBar: AppBar(
        title: Text("YourBank"),
        centerTitle: true,
      ),
      body: isLoading
          ? IsLoadingScreen()
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            // showModalBottomSheet(
                            //   context: context,
                            //   builder: (context) {
                            //     return Column(
                            //       children: [
                            //         ElevatedButton(
                            //             onPressed: () {
                            //               _users[index].balance =
                            //                   _users[index].balance - 100;

                            //               setState(() {});
                            //             },
                            //             child: Text("data")),
                            //         IconButton(
                            //             onPressed: () {
                            //               Navigator.pop(context);
                            //               setState(() {});
                            //             },
                            //             icon: Icon(Icons.abc))
                            //       ],
                            //     );
                            //   },
                            // );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserProfileScreen(
                                      userId: _users[index].userId,
                                      name: _users[index].name,
                                      emailId: _users[index].emailId,
                                      balance: _users[index].balance),
                                ));
                          },
                          child: Card(
                            elevation: 4,
                            child: ListTile(
                              title: Text(_users[index].name),
                              subtitle: Text(_users[index].emailId),
                              trailing: Text(_users[index].balance.toString()),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}
