import 'package:ehaberuygulamasi/pages/news_page.dart';
import 'package:ehaberuygulamasi/viewmodel/article_list_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
        child: const NewsPage(),
      ),
    );
  }
}
