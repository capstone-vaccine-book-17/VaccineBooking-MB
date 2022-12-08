import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/home/page/detail_news_page.dart';
import 'package:w_vaccine/features/home/page/notification_page.dart';
import 'package:w_vaccine/features/home/page/vaccine_varieties_page.dart';
import 'package:w_vaccine/features/home/view_model/news_view_model.dart';
import 'package:w_vaccine/styles/custom_color.dart';
import 'package:w_vaccine/styles/wvaccine_icons.dart';

class IndexHome extends StatelessWidget {
  const IndexHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          _body(context),
        ],
      ),
    );
  }

  Widget _stack(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: hometopbarclr,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        _customAppBar(context),
      ],
    );
  }

  /// Body Safe Area
  Widget _body(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _stack(context),

            /// Menu
            _menu(context),

            /// List of Health Workers / Daftar Tenaga Kesehatan
            _listOfHealthWorkers(),

            /// Health News / Berita Kesehatan
            _healthNews(context)
          ],
        ),
      ),
    );
  }

  /// Custom App bar
  Widget _customAppBar(BuildContext context) {
    String temp1 = 'Namamu';
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  WvaccineIcons.people_outlined,
                  color: Colors.white,
                ),
              ),
              Text(
                'Hai, ${temp1}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()));
                },
                icon: const Icon(WvaccineIcons.notif_false),
                color: Colors.white,
              )
            ],
          ),
          _cardHeader(),
        ],
      ),
    );
  }

  /// Card Header
  Widget _cardHeader() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Image.asset('assets/images/ayovaksin.png'),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ayo Lakukan Vaksinasi !',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Pastikan lengkapi data diri kamu sebelum melakukan pemesanan'),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Daftar Antrian'),
            ),
          ],
        ),
      ),
    );
  }

  /// Menu
  Widget _menu(BuildContext context) {
    /// Later will be replaced with model within this view model
    List<Map> datas = [
      {
        'label': 'Varietas Vaksin',
        'image': '',
      },
      {
        'label': 'Toko Kesehatan',
        'image': '',
      },
      {
        'label': 'Chat Rumah Sakit',
        'image': '',
      },
      {
        'label': 'Lihat\n Semua',
        'image': '',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var data in datas)
            SizedBox(
              width: 80,
              height: 100,
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          WvaccineIcons.vaccine_color,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const VaccineVarietiesPage()));
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data['label']!,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// List of Health Workers / Daftar Tenaga Kesehatan
  Widget _listOfHealthWorkers() {
    /// Later will be replaced with model within this view model
    List<Map<String, String>> datas = [
      {
        'name': 'Dr.Abdul Syukur,S.Pd-KHOM',
        'specialist': 'Spesialis kancker',
        'desc': 'Prod Abdul adalah dokter yang mantapu jiwa GG gaming pokoknya',
        'image': 'assets/images/doctor.jpg'
      },
      {
        'name': 'Prof.Hiru Hulukk,S.Pd-KHOM',
        'specialist': 'Spesialis katarakk',
        'desc': 'Dokter Huluk gemar menyuntik orang dengan suntikan cinta',
        'image': 'assets/images/doctor.jpg'
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Daftar Tenaga Kesehatan',
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat Semua'),
              )
            ],
          ),
          for (var data in datas)
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          data['image']!,
                          scale: 10,
                          width: 70,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data['specialist']!,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${data['desc']!.substring(0, 30)}...',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Selengkapnya'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Health News / Berita Kesehatan
  Widget _healthNews(BuildContext context) {
    final vm = Provider.of<NewsViewModel>(context, listen: false);

    /// Later will be replaced with model within this view model
    // List<Map<String, String>> datas = [
    //   {
    //     'title': 'Ini hal penting yang wajib kamu ketahui',
    //     'author': 'Kobo Kanaeru',
    //     'date': '12/09/2022 09:31',
    //     'views': '23',
    //   },
    //   {
    //     'title': 'Ini hal penting yang wajib kamu ketahui',
    //     'author': 'Kobo Kanaeru',
    //     'date': '12/09/2022 09:31',
    //     'views': '23',
    //   }
    // ];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Berita Kesehatan',
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat Semua'),
              ),
            ],
          ),
          for (var data in vm.news)
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNewsPage(data: data)));
              },
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // image: DecorationImage(image: )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              data.image,
                              width: 90,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${data.author} - ${data.date}',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${data.views} views',
                                  style: const TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
