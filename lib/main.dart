import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/add_cart.dart';
import 'package:learning_riverpod/setting_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        fallbackLocale: Locale('en'),
     startLocale: Locale('en'),
          path: 'assets/locale',
          supportedLocales: [ Locale('en'),Locale('es'),],
          child: MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {

  ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.green : Colors.white,
      textTheme: Theme.of(context)
          .textTheme
          .copyWith(
            titleSmall:
                Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 17),
          )
          .apply(
            bodyColor: isDarkTheme ? Colors.white : Colors.black,
            displayColor: Colors.grey,
          ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
            isDarkTheme ? Colors.white : Colors.black),
      ),
      listTileTheme: ListTileThemeData(
          iconColor: isDarkTheme ? Colors.orange : Colors.purple),
      appBarTheme: AppBarTheme(
          backgroundColor: isDarkTheme ? Colors.green : Colors.white,
          titleTextStyle:
              TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
          iconTheme: IconThemeData(
              color: isDarkTheme ? Colors.white : Colors.black54)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    var darkMode = ref.watch(darkModeProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: getAppTheme(context, darkMode),
//         theme: ThemeData(
// brightness: Brightness.values[1],
//
//           /* light theme settings */
//
//           useMaterial3: true,
//         ),
//         darkTheme: ThemeData.dark(),
//         themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
        home: Home());
  }
}

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr()),

        leading: IconButton(icon: Icon(Icons.settings), onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingScreen()));
        },),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ColorPicker(
                            pickerColor: ref.watch(colorHandlerProvider),
                            onColorChanged: (va) {
                              ref
                                  .read(colorHandlerProvider.notifier)
                                  .changeColor(va);
                            });
                      });
                },
                child: const Text("Pick Color")),
            Switch(
                value: ref.read(darkModeProvider),
                onChanged: (value) {
                  ref.read(darkModeProvider.notifier).changeColor();
                }),
            Slider(
              value: ref.watch(fontSizeHandlerProvider),
              max: 100,
              divisions: 100,
              label: ref.watch(fontSizeHandlerProvider).round().toString(),
              onChanged: (double value) {
                ref.read(fontSizeHandlerProvider.notifier).changeSize(value);
              },
            ),
            Text(
              '${ref.watch(darkModeProvider)}',
              style: TextStyle(
                  fontSize: ref.watch(fontSizeHandlerProvider),
                  color: ref.watch(colorHandlerProvider)),
            ),
          ],
        ),
      ),
    );
  }
}

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() => state++;
}

@riverpod
@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void changeColor() {
    state = !state;
  }
}

@riverpod
class FontSizeHandler extends _$FontSizeHandler {
  @override
  double build() => 20;
  void changeSize(double size) {
    state = size;
  }
}

@riverpod
class ColorHandler extends _$ColorHandler {
  @override
  Color build() => Colors.black;
  void changeColor(Color color) {
    state = color;

  }
}

@riverpod
class LocaleHandler extends _$LocaleHandler {
  @override
  String build() => '';

 void  changeLocale(String value) {
state=value;
  }
}
