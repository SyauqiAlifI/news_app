import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/utills/utills.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget {
  final Article article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.article.urlToImage,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 330,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Text(widget.article.title,
                            style: titleArticle.copyWith(fontSize: 18)),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.account_circle),
                                const SizedBox(width: 10),
                                Text(
                                  widget.article.author,
                                  style:
                                      authorDateArticle.copyWith(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            Text('|', style: authorDateArticle.copyWith(fontSize: 14)),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined),
                                const SizedBox(width: 10),
                                Text(time(DateTime.parse(widget.article.publishedAt)),
                                style: authorDateArticle.copyWith(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(widget.article.content, style: detailArticle.copyWith(fontSize: 16))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 10),
                        blurRadius: 50
                        )
                      ]
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 50
                        ),
                      ],
                    ),
                    child: IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.bookmark_border_rounded),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  String time(DateTime parse) {
    return timeago.format(parse, allowFromNow: true, locale: 'id');
  }
}
