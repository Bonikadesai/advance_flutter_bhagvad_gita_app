import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/json_decode_modal.dart';
import '../../Provider/jason_decode_provider.dart';

class AllVersesPage extends StatefulWidget {
  const AllVersesPage({Key? key}) : super(key: key);

  @override
  State<AllVersesPage> createState() => _AllVersesPageState();
}

class _AllVersesPageState extends State<AllVersesPage> {
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
      body: ListView.builder(
        itemCount: Provider.of<ShlokJsonDecodeProvider>(context)
            .shlokJsonDecodeModel
            .allShloks
            .length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            shlokIndex = index;
            Navigator.of(context).pushNamed("shlok_detail_page");
          },
          leading: Text(
            Provider.of<ShlokJsonDecodeProvider>(context)
                .shlokJsonDecodeModel
                .allShloks[index]
                .verse,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          title: Text(Provider.of<ShlokJsonDecodeProvider>(context)
              .shlokJsonDecodeModel
              .allShloks[index]
              .sanskrit),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
