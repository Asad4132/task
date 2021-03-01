import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:task/test2/Brand.dart';

class SearchBandPage extends StatefulWidget {
  @override
  _SearchBandPageState createState() => _SearchBandPageState();
  final Function callBack;
  SearchBandPage({this.callBack});
}

class _SearchBandPageState extends State<SearchBandPage> {
  Color color = Color(0xff2E3192);
  List<Brand> brands = [];
  bool viewAll = false;
  final ItemScrollController itemScrollController = ItemScrollController();

  selectBrands(List<Brand> selectedBrands) {
    setState(() {
      brands = selectedBrands;
    });
  }

  @override
  void initState() {
    super.initState();
    brands.add(Brand(
        brand: "Hello",
        date: [DateTime.now(), DateTime.now()],
        time: [TimeOfDay.now()]));
    brands.add(Brand(
        brand: "Hi",
        date: [DateTime.now(), DateTime.now()],
        time: [TimeOfDay.now()]));
    brands.add(Brand(
        brand: "Bye",
        date: [DateTime.now(), DateTime.now()],
        time: [TimeOfDay.now()]));
    brands.add(Brand(
        brand: "Hello",
        date: [DateTime.now(), DateTime.now()],
        time: [TimeOfDay.now()]));
    brands.add(Brand(
        brand: "Hi",
        date: [DateTime.now(), DateTime.now()],
        time: [TimeOfDay.now()]));
    brands.add(Brand(
        brand: "Bye",
        date: [DateTime.now(), DateTime.now()],
        time: [TimeOfDay.now()]));
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) selectedTime = picked;
  }

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    selectedDate = picked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: color.withOpacity(0.5),
        title: Text('Search Band'),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: color,
                  ),
                  hintText: 'Band Name',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  final brandData = brands[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xffF3EEEE),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ImageIcon(
                                  AssetImage('assets/images/mic_dark.png'),
                                  color: color,
                                  size: 20),
                            ),
                            Expanded(
                              child: Text(
                                brandData.brand,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  brandData.isChecked = !brandData.isChecked;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CustomSwitchButton(
                                  backgroundColor: brandData.isChecked
                                      ? Colors.lightGreen
                                      : Colors.grey.shade400,
                                  unCheckedColor: Colors.white,
                                  animationDuration:
                                      Duration(milliseconds: 200),
                                  checkedColor: Colors.white,
                                  checked: brandData.isChecked,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: brandData.isChecked,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  brandData.itemScrollController
                                      .jumpTo(index: 5);
                                },
                              ),
                              Expanded(
                                child: Container(
                                  height: 48,
                                  child: ScrollablePositionedList.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            brandData.clickedDateIndex = index;
                                          });
                                        },
                                        child: Card(
                                            color: brandData.clickedDateIndex ==
                                                    index
                                                ? Colors.white
                                                : Color(0xff5E5E5E),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 8.0),
                                              child: Column(
                                                children: [
                                                  Text('20 Mar',
                                                      style: TextStyle(
                                                          color: brandData
                                                                      .clickedDateIndex ==
                                                                  index
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontSize: 13)),
                                                  Text(
                                                    'SUN',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                    itemScrollController:
                                        brandData.itemScrollController,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  brandData.itemScrollController
                                      .jumpTo(index: 5);
                                },
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: brandData.isChecked &&
                              (brandData.clickedDateIndex ?? 0) >= 0,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  'SUN 20 MAR, 2020',
                                  style: TextStyle(color: color),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    readOnly: true,
                                    onTap: () {
                                      _selectTime(context);
                                    },
                                    controller: TextEditingController(),
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      prefixIconConstraints:
                                          BoxConstraints.tight(Size(28, 28)),
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.av_timer_sharp,
                                          color: color,
                                          size: 16,
                                        ),
                                      ),
                                      hintText: 'From Time',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    readOnly: true,
                                    onTap: () {
                                      _selectTime(context);
                                    },
                                    controller: TextEditingController(),
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      prefixIconConstraints:
                                          BoxConstraints.tight(Size(28, 28)),
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.av_timer_sharp,
                                          color: color,
                                          size: 16,
                                        ),
                                      ),
                                      hintText: 'To Time',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border(
                      left: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      top: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: 120,
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              color.withOpacity(0.5),
                              color,
                            ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500],
                            offset: Offset(0.2, 1.5),
                            blurRadius: 1.5,
                          ),
                        ]),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            widget.callBack(brands);
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              'SELECT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
