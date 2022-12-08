import 'package:flutter/material.dart';
import 'package:w_vaccine/features/home/model/news_model.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key, required this.data});

  final NewsModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Kesehatan'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 250),
              // constraints: const BoxConstraints(maxHeight: 150),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(data.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                data.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('${data.author} - ${data.date}'),
                  const Spacer(),
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    '${data.views} Views',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(data.description),
            ),
          ],
        ),
      )),
    );
  }
}
