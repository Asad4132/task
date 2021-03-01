import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:task/test2/Brand.dart';
import 'package:task/test2/SearchBandPage.dart';

class NewEventPage extends StatefulWidget {
  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  Color color = Color(0xff2E3192);
  List<Brand> brands = [];
  bool viewAll = false;

  selectBrands(List<Brand> selectedBrands) {
    setState(() {
      brands = selectedBrands;
    });
  }

  @override
  void initState() {
    super.initState();
    // brands.add(Brand(
    //     brand: "Hello",
    //     date: [DateTime.now(), DateTime.now()],
    //     time: [TimeOfDay.now()]));
    // brands.add(Brand(
    //     brand: "Hi",
    //     date: [DateTime.now(), DateTime.now()],
    //     time: [TimeOfDay.now()]));
    // brands.add(Brand(
    //     brand: "Bye",
    //     date: [DateTime.now(), DateTime.now()],
    //     time: [TimeOfDay.now()]));
    // brands.add(Brand(
    //     brand: "Hello",
    //     date: [DateTime.now(), DateTime.now()],
    //     time: [TimeOfDay.now()]));
    // brands.add(Brand(
    //     brand: "Hi",
    //     date: [DateTime.now(), DateTime.now()],
    //     time: [TimeOfDay.now()]));
    // brands.add(Brand(
    //     brand: "Bye",
    //     date: [DateTime.now(), DateTime.now()],
    //     time: [TimeOfDay.now()]));
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
        title: Text('New Event'),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Color(0xffB8B8B8),
                      height: 180,
                      child: TabBarView(
                        children: <Widget>[
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Upload 3 cover size pictures for the event',
                                  style: TextStyle(color: Colors.white),
                                ),
                                OutlineButton(
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(0.0)),
                                  borderSide:
                                      BorderSide(color: color, width: 2),
                                )
                              ],
                            ),
                          ),
                          SizedBox(),
                          SizedBox(),
                        ],
                      ),
                    ),
                    TabPageSelector(
                      indicatorSize: 10,
                      selectedColor: color,
                      color: Color(0xffB8B8B8),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            BoxConstraints.tight(Size(28, 28)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.widgets,
                            color: color,
                          ),
                        ),

                        hintText: 'Event Name',
                        // hintStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            BoxConstraints.tight(Size(28, 28)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.article,
                            color: color,
                          ),
                        ),

                        hintText: 'Event Description',
                        // hintStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            BoxConstraints.tight(Size(28, 28)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.location_on,
                            color: color,
                          ),
                        ),

                        hintText: 'Venue',
                        // hintStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.my_location,
                          color: color,
                        ),
                        hintText: 'Select a location',
                        // hintStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            },
                            controller: TextEditingController(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 12, height: 2),
                            decoration: InputDecoration(
                              prefixIconConstraints:
                                  BoxConstraints.tight(Size(28, 28)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  FontAwesomeIcons.calendarAlt,
                                  color: color,
                                ),
                              ),
                              suffixIconConstraints:
                                  BoxConstraints.tight(Size(28, 28)),
                              suffixIcon: Icon(
                                FontAwesomeIcons.solidCaretSquareDown,
                                color: color,
                              ),
                              hintText: 'Event Start Date',
                              // hintStyle: TextStyle(
                              //   color: Colors.white,
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            },
                            controller: TextEditingController(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 12, height: 2),
                            decoration: InputDecoration(
                              prefixIconConstraints:
                                  BoxConstraints.tight(Size(28, 28)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  FontAwesomeIcons.calendarAlt,
                                  color: color,
                                ),
                              ),
                              suffixIconConstraints:
                                  BoxConstraints.tight(Size(28, 28)),
                              suffixIcon: Icon(
                                FontAwesomeIcons.solidCaretSquareDown,
                                color: color,
                              ),
                              hintText: 'Event End Date',
                              // hintStyle: TextStyle(
                              //   color: Colors.white,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                              prefixIconConstraints:
                                  BoxConstraints.tight(Size(28, 28)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.av_timer_sharp,
                                  color: color,
                                ),
                              ),

                              hintText: 'From Time',
                              // hintStyle: TextStyle(
                              //   color: Colors.white,
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
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
                              prefixIconConstraints:
                                  BoxConstraints.tight(Size(28, 28)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.av_timer_sharp,
                                  color: color,
                                ),
                              ),
                              hintText: 'To Time',
                              // hintStyle: TextStyle(
                              //   color: Colors.white,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: brands.length == 0,
                      child: TextFormField(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchBandPage(
                                        callBack: selectBrands,
                                      )));
                        },
                        keyboardType: TextInputType.text,
                        readOnly: true,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          prefixIconConstraints:
                              BoxConstraints.tight(Size(28, 28)),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ImageIcon(
                                AssetImage('assets/images/mic_dark.png'),
                                color: color,
                                size: 16),
                          ),
                          hintText: 'Bands',
                          hintStyle: TextStyle(
                              color: color, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: brands.length > 0,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, right: 8),
                            child: ImageIcon(
                              AssetImage('assets/images/mic.png'),
                              color: color,
                            ),
                          ),
                          Text(
                            'Your Selected Brands',
                            style: TextStyle(color: color.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(0.0),
                      itemCount: brands.length > 3 && viewAll
                          ? brands.length
                          : brands.length > 3
                              ? brands.sublist(0, 3).length
                              : brands.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final brandData = brands[index];

                        return Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, right: 8),
                                  child: ImageIcon(
                                      AssetImage('assets/images/mic_dark.png'),
                                      color: color,
                                      size: 16),
                                ),
                                Expanded(
                                  child: Text(
                                    brandData.brand,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        height: 2),
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMMEEEEd()
                                          .format(brandData.date[0]) +
                                      (brandData.date.length > 1 ? '...' : ''),
                                  style: TextStyle(
                                      color: color, fontSize: 12, height: 2),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 4),
                                  child: Icon(Icons.remove_red_eye_outlined,
                                      color: color, size: 16),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  final boxWidth = constraints.constrainWidth();
                                  final dashWidth = 10.0;
                                  final dashCount =
                                      (boxWidth / (2 * dashWidth)).floor();
                                  return Flex(
                                    children: List.generate(dashCount, (_) {
                                      return SizedBox(
                                        width: dashWidth,
                                        height: 2,
                                        child: DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        ),
                                      );
                                    }),
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    direction: Axis.horizontal,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Visibility(
                      visible: brands.length > 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                viewAll = !viewAll;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                viewAll ? '...View less' : '...View all',
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            BoxConstraints.tight(Size(28, 28)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            FontAwesomeIcons.ticketAlt,
                            color: color,
                            size: 16,
                          ),
                        ),
                        hintText: 'Ticket URL',
                        // hintStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
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
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'SUBMIT',
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
            ],
          ),
        ),
      ),
    );
  }
}
