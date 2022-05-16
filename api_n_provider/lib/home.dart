import 'package:api_n_provider/post_model.dart';
import 'package:api_n_provider/post_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Data> userModel = [];
bool loading = true;
Future<Pages> getData() async {
  Dio dio = Dio();
  final response = await dio.get("https://reqres.in/api/unknown");
  if (response.statusCode == 200) {
    var userD = Pages.fromJson(response.data);
    userModel = userD.users;
    return userD;
  } else {
    throw Exception("Unable to load data");
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() {
      final users = Provider.of<UserPage>(context, listen: false);
      users.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("A-P-I"),
        ),
        body: Consumer<UserPage>(builder: (BuildContext context, value, child) {
          return loading == true
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: userModel.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Text(userModel[index].id.toString()),
                        Text(userModel[index].name.toString()),
                        Text(userModel[index].year.toString()),
                        Text(userModel[index].color.toString()),
                        Text(userModel[index].pantoneValue.toString()),
                      ],
                    );
                  },
                );
        }));
  }
}
