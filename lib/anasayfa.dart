import 'package:ehaberuygulamasi/data/news_service.dart';
import 'package:ehaberuygulamasi/models/article.dart';

import 'package:flutter/material.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  List<Articles> articles = [];

  @override
  void initState() {
    NewsService.getNews().then((value) => {
          setState(() {
            articles = value!;
          })
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("eHaber Uygulaması"),
          centerTitle: true,
        ),
        body: Center(
            child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(children: [
                      Image.network(articles[index].urlToImage ??
                          'https://i0.wp.com/designermenus.com.au/wp-content/uploads/2016/02/icon-None.png?w=300&ssl=1'),
                      const ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text('Haber Başlığı'),
                        subtitle: Text("Yazar"),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                            "AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama"),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Habere Git"),
                          )
                        ],
                      ),
                    ]),
                  );
                })));
  }
}
