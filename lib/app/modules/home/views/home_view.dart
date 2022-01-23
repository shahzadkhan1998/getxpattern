// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:localdata/app/modules/home/controllers/home_controller.dart';

class HomePage extends GetView<MyController> {
  const HomePage({Key? key}) : super(key: key);

//repository and controller  injection bindings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'),centerTitle: true,),
      body: Container(
        child: GetX<MyController>(initState: (state) {
          Get.find<MyController>().getAll();
        }, builder: (_) {
          return _.postList.toString().isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        
                        title: Text(_.postList[index].title),
                        subtitle: Text(_.postList[index].body,style: TextStyle(fontSize: 10),),
                        leading: Text(_.postList[index].id.toString()),
                      ),
                    );
                  },
                  itemCount: _.postList.length,
                );
        }),
      ),
    );
  }
}
