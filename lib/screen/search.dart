import 'package:flutter/material.dart';
import 'package:hive_sample/db/functions/db_functions.dart';
import 'package:hive_sample/screen/screen_details.dart';
import 'package:hive_sample/screen/screen_update.dart';

class SearchProfile extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

 @override 
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentdataNotifier,
      builder: (context, value, child) => ListView.separated(
        itemBuilder: (ctx, index) {
          final data = studentdataNotifier.value[index];
         if (query == data.name.toLowerCase() ||
              query == data.name.toUpperCase()) {
            return ListTile(
                leading: const Icon(Icons.delete),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      (MaterialPageRoute(
                        builder: (ctx) => ScreenUpdate(data:data, index: index)
                        
                      )
                      ),
                      (route) => false);
                },
                title: Text(data.name.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    )));
          } else {
            return const SizedBox();
          }
        },
        separatorBuilder: (context, value) {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        },
        itemCount: studentdataNotifier.value.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentdataNotifier,
      builder: (context, value, child) => ListView.separated(
        itemBuilder: (ctx, index) {
          final data = studentdataNotifier.value[index];
          if (data.name.toLowerCase().contains(query) ||
              data.name.toUpperCase().contains(query)) {
            return ListTile(
                leading: const Icon(Icons.person),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    (MaterialPageRoute(builder: (ctx) {
                      return ScreenDetails(
                        data: data,
                        index: index,
                      );
                    })),
                  );
                },
                title: Text(data.id.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    )));
          } else {
            return Container();
          }
        },
        separatorBuilder: (context, value) {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        },
        itemCount: studentdataNotifier.value.length,
      ),
    );
  }
}
