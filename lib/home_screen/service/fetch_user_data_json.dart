import 'package:flutter/material.dart';
import 'package:for_error/common/provider/is_loading_provider.dart';
import 'package:for_error/home_screen/state_management/user_provider.dart';
import 'package:for_error/home_screen/user_model.dart';
import 'package:provider/provider.dart';

class fetchUserDataJson {
  final jsonData = [
    {
      "name": "You",
      "emailId": "yourEmail@example.com",
      "balance": 6000.10,
      "user_id": "yourUniqueId"
    },
    {
      "name": "John Doe",
      "emailId": "john.doe@example.com",
      "balance": 500.75,
      "user_id": "123456789"
    },
    {
      "name": "Alice Smith",
      "emailId": "alice.smith@example.com",
      "balance": 750.50,
      "user_id": "987654321"
    },
    {
      "name": "Bob Johnson",
      "emailId": "bob.johnson@example.com",
      "balance": 320.30,
      "user_id": "246813579"
    },
    {
      "name": "Emily Brown",
      "emailId": "emily.brown@example.com",
      "balance": 1000.00,
      "user_id": "555555555"
    },
    {
      "name": "David Wilson",
      "emailId": "david.wilson@example.com",
      "balance": 350.20,
      "user_id": "999999999"
    },
    {
      "name": "Sarah Lee",
      "emailId": "sarah.lee@example.com",
      "balance": 600.10,
      "user_id": "111122223"
    },
    {
      "name": "Michael White",
      "emailId": "michael.white@example.com",
      "balance": 200.75,
      "user_id": "777777777"
    },
    {
      "name": "Olivia Davis",
      "emailId": "olivia.davis@example.com",
      "balance": 850.00,
      "user_id": "888888888"
    },
    {
      "name": "Daniel Clark",
      "emailId": "daniel.clark@example.com",
      "balance": 420.90,
      "user_id": "555544466"
    },
    {
      "name": "Ava Wilson",
      "emailId": "ava.wilson@example.com",
      "balance": 300.60,
      "user_id": "123123123"
    }
  ];
  Future<List<dynamic>> callApi() async {
    return jsonData;
  }

  Future<List<UserModel>> fetchData(BuildContext context) async {
    final loading =
        await Provider.of<IsLoadingProvider>(context, listen: false);
    loading.tongalIsLoading(true);

    final user = Provider.of<UserProvider>(context, listen: false);
    await user.fetchUserData();

    final _users = await user.getUsersData();
    loading.tongalIsLoading(false);
    return _users;
  }
}
