import 'package:flutter/material.dart';

class IndexHome extends StatelessWidget {
  const IndexHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          _body(),
        ],
      ),
    );
  }

  Widget _stack() {
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
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        _customAppBar(),
      ],
    );
  }

  /// Body Safe Area
  Widget _body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _stack(),

            /// Menu
            _menu(),

            /// List of Health Workers / Daftar Tenaga Kesehatan
            _listOfHealthWorkers(),

            /// Health News / Berita Kesehatan
            _healthNews()
          ],
        ),
      ),
    );
  }

  /// Custom App bar
  Widget _customAppBar() {
    String temp1 = 'Hai Namamu';
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.white),
              ),
              Text(
                temp1,
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.ring_volume),
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
                const FlutterLogo(size: 46),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ayo Lakukan Vaksinasi !',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
  Widget _menu() {
    /// Later will be replaced with model within this view model
    List<Map<String, String>> datas = [
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const FlutterLogo(size: 48),
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
        'desc': 'Prod Abdul adalah dokter yang mantapu jiwa GG gaming pokoknya'
      },
      {
        'name': 'Prof.Hiru Hulukk,S.Pd-KHOM',
        'specialist': 'Spesialis katarakk',
        'desc': 'Dokter Huluk gemar menyuntik orang dengan suntikan cinta'
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
                      child: const FlutterLogo(size: 56),
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
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data['specialist']!,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${data['desc']!.substring(0, 45 - 3)}...',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
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
  Widget _healthNews() {
    /// Later will be replaced with model within this view model
    List<Map<String, String>> datas = [
      {
        'title': 'Ini hal penting yang wajib kamu ketahui',
        'author': 'Kobo Kanaeru',
        'date': '12/09/2022 09:31',
        'views': '23',
      },
      {
        'title': 'Ini hal penting yang wajib kamu ketahui',
        'author': 'Kobo Kanaeru',
        'date': '12/09/2022 09:31',
        'views': '23',
      }
    ];
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
          for (var data in datas)
            Card(
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
                      child: const FlutterLogo(
                        size: 76,
                        style: FlutterLogoStyle.stacked,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title']!,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${data['author']!} - ${data['date']!}',
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
                                '${data['views']!} views',
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
        ],
      ),
    );
  }
}
