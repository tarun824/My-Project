import 'package:flutter/material.dart';
import 'package:for_error/home_screen/state_management/user_provider.dart';
import 'package:for_error/transfer_money/pages/transfer_money_screen.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({
    super.key,
    required this.userId,
    required this.name,
    required this.emailId,
    required this.balance,
  });
  final String userId;
  final String name;
  final String emailId;

  double balance;

  @override
  Widget build(BuildContext context) {
    // final _users = Provider.of<UserProvider>(context);
    // _users.getUsersData();
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          right: 18.0,
          left: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Name : " + name,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "UserId : " + userId,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Email Id : " + emailId,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Total Balance  : " + balance.toString() + " Rs",
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferMoneyScreen(),
                          ));
                    },
                    child: Text("Transfer Money")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
