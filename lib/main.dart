import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/add_cart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          /* light theme settings */

          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
        home: AddCart());
  }
}

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
        leading: IconButton(
          icon: Icon(Icons.switch_right_outlined),
          onPressed: () {},
        ),
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
                child: Text("Pick Color")),
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
