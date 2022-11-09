import 'dart:ui';

import 'package:flutter/material.dart';

class ScreenCoupens extends StatelessWidget {
  const ScreenCoupens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupens'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                textFieldWidget(400, 50, 'Code'),
                textFieldWidget(400, 50, 'Amount'),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text('Upload Coupen'),
                ),
              ],
            ),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.amber.shade300,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Code',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "\$Amount",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  SizedBox textFieldWidget(double width, double height, String label,
      {int? lines}) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        child: TextFormField(
          maxLines: lines ?? 1,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
              border: const OutlineInputBorder(borderSide: BorderSide()),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.only(
                left: 5,
                top: 10,
              ),
              labelText: label,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black,
              )),
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 15,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
