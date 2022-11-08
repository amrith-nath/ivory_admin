import 'package:flutter/material.dart';

class ScreenBanners extends StatelessWidget {
  const ScreenBanners({super.key});

  @override
  Widget build(BuildContext context) {
    var image =
        'https://images.unsplash.com/photo-1627216261256-2654280f184c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banners'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            )),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(),
                            child: Row(children: [
                              Text(
                                'tag here',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
