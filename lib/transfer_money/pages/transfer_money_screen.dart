import 'package:flutter/material.dart';
import 'package:for_error/common/is_loading_screen.dart';
import 'package:for_error/common/provider/is_loading_provider.dart';
import 'package:for_error/home_screen/state_management/user_provider.dart';
import 'package:for_error/home_screen/user_model.dart';
import 'package:for_error/transfer_money/state_management/transfer_money_provider.dart';
import 'package:provider/provider.dart';

class TransferMoneyScreen extends StatefulWidget {
  const TransferMoneyScreen({super.key});

  @override
  State<TransferMoneyScreen> createState() => TransferMoneyScreenState();
}

class TransferMoneyScreenState extends State<TransferMoneyScreen> {
  List<UserModel> users = [];
  // List<DropdownMenuItem<dynamic>>? _items = [];
  String selectedUserId = "yourUniqueId";
  bool isLoading = true;
  String senderId = "yourUniqueId";
  TextEditingController amountTextField = TextEditingController();
  Future<void> fetchUser() async {
    final _users = await transfer_money_provider().fetchData(context);
    users = _users;
    // users.forEach((element) {
    //   _items!.add(
    //     DropdownMenuItem(child: Text("data")),
    //   );
    // });
  }

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _loading = Provider.of<IsLoadingProvider>(context, listen: true);
    final userProvider = Provider.of<UserProvider>(context, listen: true);

    isLoading = _loading.getIsLoading();
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer Money"),
      ),
      body: isLoading
          ? IsLoadingScreen()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: 350,
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton(
                            iconSize: 1,
                            value: selectedUserId,
                            items: users.map((items) {
                              return DropdownMenuItem(
                                value: items.userId,
                                child: Text(items.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              selectedUserId = value!;
                              setState(() {});
                            },
                          ),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                TextField(
                  controller: amountTextField,
                  decoration: InputDecoration(hintText: "Enter Amount"),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                      ),
                      onPressed: () async {
                        _loading.tongalIsLoading(true);
                        final responce = await userProvider.transferAmount(
                            senderId,
                            selectedUserId,
                            double.parse(amountTextField.text));
                        _loading.tongalIsLoading(false);
                        responce['status'] == true
                            ? {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(responce["message"].toString()),
                                )),
                                amountTextField.clear(),
                                selectedUserId = "yourUniqueId",
                              }
                            : {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(responce["message"].toString()),
                                )),
                                amountTextField.clear(),
                                selectedUserId = "yourUniqueId",
                              };
                      },
                      child: Text("Send Money")),
                ),
              ]),
            ),
    );
  }
}
