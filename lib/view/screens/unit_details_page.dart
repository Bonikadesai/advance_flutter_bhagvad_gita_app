import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/json_decode_modal.dart';
import '../../Provider/jason_decode_provider.dart';

class UnitDetailsPage extends StatefulWidget {
  const UnitDetailsPage({Key? key}) : super(key: key);

  @override
  State<UnitDetailsPage> createState() => _UnitDetailsPageState();
}

class _UnitDetailsPageState extends State<UnitDetailsPage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ShlokJsonDecodeProvider>(context, listen: false).loadJSON(
        Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
            .unitJsonDecodeModel
            .allUnit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
              .unitJsonDecodeModel
              .allUnit[unitIndex]
              .nameTranslationEnglish,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).unitJsonDecodeModel.allUnit[unitIndex].imageName}.jpg',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Name Meaning",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
                    .unitJsonDecodeModel
                    .allUnit[unitIndex]
                    .nameMeaning,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
                    .unitJsonDecodeModel
                    .allUnit[unitIndex]
                    .chapterSummaryEnglish,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('all_verses_page');
                  },
                  child: const Text("All Verses"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
