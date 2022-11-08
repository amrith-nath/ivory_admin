import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/user_controller.dart';

class ScreenUser extends StatelessWidget {
  ScreenUser({super.key});
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey.shade300,
                    elevation: 6,
                    child: ListTile(
                      leading: Container(
                        width: 80,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image(
                          image:
                              NetworkImage(userController.users[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        userController.users[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        userController.users[index].email,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
