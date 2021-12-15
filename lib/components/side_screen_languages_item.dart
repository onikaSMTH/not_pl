import 'package:flutter/material.dart';
import 'package:mini_project/providers/local_language_provider.dart';
import '../providers/local_language_provider.dart';
import 'package:provider/provider.dart';

class SideScLanguagesItem extends StatefulWidget {
  const SideScLanguagesItem({Key? key}) : super(key: key);

  @override
  State<SideScLanguagesItem> createState() => _SideScLanguagesItemState();
}

class _SideScLanguagesItemState extends State<SideScLanguagesItem> {
  String currentValue = 'English';
  List items = ['English', 'العربية'];

  @override
  Widget build(BuildContext context) {
    LocalLanguageProvider languageProvider =
        Provider.of<LocalLanguageProvider>(context);
    return ListTile(
      leading: Icon(
        Icons.language,
        color: Theme.of(context).primaryColor,
      ),
      title: DropdownButton<String>(
        //hiding underline
        underline: const SizedBox(),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).primaryColor,
        ),
        value: currentValue,
        onChanged: (newValue) {
          setState(() {
            languageProvider
                .setLocale(newValue == 'العربية' ? const Locale('ar') : const Locale('en'));
            currentValue = newValue.toString();
          });
        },
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          );
        }).toList(),
      ),
    );
  }
}
