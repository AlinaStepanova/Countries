import 'package:countries/providers/get_country_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/language.dart';
import '../utils/utils.dart';
import 'widgets/custom_subtitle.dart';
import 'widgets/error_message_text.dart';
import 'widgets/list_title.dart';
import '../models/state.dart' as country_state;

class CountryDetailPage extends StatefulWidget {
  const CountryDetailPage({Key? key, required this.code, required this.name})
      : super(key: key);

  final String code;
  final String name;

  @override
  State<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetCounryDetailsProvider>().getCountryDetails(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Consumer<GetCounryDetailsProvider>(
        builder: (context, provider, child) {
          final country = provider.getCountry();
          return provider.getErrorMessage.isEmpty
              ? ListView(
                  children: <Widget>[
                    ListTile(
                        leading: Text(country.emoji,
                            style: const TextStyle(fontSize: 36)),
                        title: const ListTitle(title: capitalText),
                        subtitle: Text(country.capital ?? "-")),
                    ListTile(
                      title: const ListTitle(title: currencyText),
                      subtitle: Text(country.currency ?? "-"),
                    ),
                    ListTile(
                      title: const ListTitle(title: continentText),
                      subtitle: Text(country.continent.name),
                    ),
                    ...buildListOfSubtitles(lantuagesText,
                        provider.showMore ? [] : country.languages),
                    ...buildListOfSubtitles(
                        statesText, provider.showMore ? [] : country.states),
                    if (country.states.isNotEmpty ||
                        country.languages.isNotEmpty)
                      TextButton(
                        onPressed: () => provider.updateShowButtonState(),
                        child: Text(
                            provider.showMore ? showMoreText : showLessText),
                      )
                  ],
                )
              : ErrowMessageText(provider.getErrorMessage);
        },
      ),
    );
  }

  List<Widget> buildListOfSubtitles(String title, List<Object> elements) {
    List<Widget> widgets = [];

    if (elements.isNotEmpty) {
      widgets.add(ListTile(title: ListTitle(title: title)));

      for (var element in elements) {
        if (element is Language) {
          widgets.add(CustomSubtitle(text: element.name));
        } else if (element is country_state.State) {
          widgets.add(CustomSubtitle(text: element.name));
        }
      }
    }
    return widgets;
  }
}
