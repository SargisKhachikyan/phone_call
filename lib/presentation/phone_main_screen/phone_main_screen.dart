import 'package:flutter/material.dart';
import 'package:ios_phone_call/commons/widgets/custom_app_bar.dart';
import 'package:ios_phone_call/presentation/phone_main_screen/models/tab_enum.dart';
import 'package:ios_phone_call/presentation/phone_main_screen/widgets/bottom_navigation_bar.dart';

class PhoneMainScreen extends StatefulWidget {
  const PhoneMainScreen({super.key});

  @override
  State<PhoneMainScreen> createState() => _PhoneMainScreenState();
}

class _PhoneMainScreenState extends State<PhoneMainScreen> {
  late final ValueNotifier<BottomNavTabEnum> _tabNotifier;
  late final ValueNotifier<int> _numNotfier;

  final List<int> numbers = [1, 5, 10, 15, 20, 30, 40, 50];
  final List<String> digits = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#'
  ];

  @override
  void initState() {
    super.initState();
    _tabNotifier = ValueNotifier<BottomNavTabEnum>(BottomNavTabEnum.calls);
    _numNotfier = ValueNotifier<int>(numbers.first);

    _tabNotifier.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BottomNavTabEnum>(
      valueListenable: _tabNotifier,
      builder: (context, tab, child) {
        return Scaffold(
          appBar: CustomAppBar(tab: tab),
          body: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GridView.count(
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  crossAxisCount: 3,
                  children: [
                    for (final dig in digits)
                      InkWell(
                        focusColor: Colors.amber,
                        highlightColor: Colors.blue,
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(child: Text(dig)),
                            )),
                      )
                  ]),
            );
            // switch (tab) {
            //   case BottomNavTabEnum.calls:

            //   case BottomNavTabEnum.contacts:
            //   case BottomNavTabEnum.keypad:
            // }

            return Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      for (final num in numbers)
                        GestureDetector(
                          onTap: () {
                            _numNotfier.value = num;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                num.toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ValueListenableBuilder<int>(
                            valueListenable: _numNotfier,
                            builder: (context, value, child) {
                              return Text(value.toString());
                            }),
                      ))
                ],
              ),
            );
          }),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavnBar(
              tabNotifier: _tabNotifier,
            ),
          ),
        );
      },
    );
  }
}
