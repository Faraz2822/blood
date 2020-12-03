import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DateTimePicker Demo',

      home: MyHomePage(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // supportedLocales: [Locale('en', 'US'),],
    );
  }
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}
class gender {
  const gender(this.na, this.ic);

  final String na;
  final Icon ic;
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // FocusNode focusNode = new FocusNode();
  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'A+',
        Icon(
          Icons.arrow_drop_down,
          color: const Color(0xFFFFFFFF),
        )),
    const Item(
        'A-',
        Icon(
          Icons.flag,
          color: const Color(0xFFFFFFFF),
        )),
    const Item(
        'B+',
        Icon(
          Icons.format_indent_decrease,
          color: const Color(0xFFFFFFFF),
        )),
    const Item(
        'B-',
        Icon(
          Icons.mobile_screen_share,
          color: const Color(0xFFFFFFFF),
        )),
    const Item(
        'O+',
        Icon(
          Icons.arrow_drop_down,
          color: const Color(0xFFFFFFFF),
        )),
    const Item(
        'O-',
        Icon(
          Icons.flag,
          color: const Color(0xFFFFFFFF),
        )),
  ];
  gender selected;
  List<gender> us = <gender>[
    const gender(
        'MALE',
        Icon(
          Icons.arrow_drop_down,
          color: const Color(0xFFFFFFFF),
        )),
    const gender(
        'FEMALE',
        Icon(
          Icons.flag,
          color: const Color(0xFFFFFFFF),
        )),

  ];


  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  TextEditingController _controller1;
  TextEditingController _controller2;
  TextEditingController _controller3;
  TextEditingController _controller4;

   String _valueChanged2 = '';
   String _valueToValidate2 = '';
   String _valueSaved2 = '';
   String _valueChanged3 = '';
  // String _valueChanged3 = '';
  String _valueToValidate3 = '';
  String _valueSaved3 = '';


  @override
  void initState() {
    super.initState();

    _controller1 = TextEditingController(text: DateTime.now().toString());
    _controller2 = TextEditingController(text: DateTime.now().toString());
    _controller3 = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _controller4 = TextEditingController(text: '$lsHour:$lsMinute');

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = '2000-10-22 14:30';
        _controller1.text = '2000-09-20 14:30';
        _controller2.text = '2001-10-21 15:31';
        _controller3.text = '2002-11-22';
        _controller4.text = '17:01';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter DateTimePicker Demo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Form(
          key: _oFormKey,
          child: Column(
            children: <Widget>[


              SizedBox(
                height: 200.0,
                width: 300.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: IconButton(
                    icon: Icon(Icons.add_circle_outline_outlined,size: 90.0,
                    color: Colors.red,),
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
                child: TextField(
                  showCursor: true,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:   BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),

                      suffixIcon:Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Icon(Icons.brightness_low_outlined,
                        color: Colors.black54,),
                      ),

                      prefix: DropdownButtonHideUnderline(
                        child: Container(

                          margin: EdgeInsets.only(
                            left: 0.0,
                            right: 0.0,
                          ),

                          child: Row(
                            children: <Widget>[

                              DropdownButton<Item>(


                                 icon: Icon(Icons.arrow_drop_down,color: Colors.white,),

                                // icon: Icons.arrow_drop_down,
                                hint: Text("  Select Blood Group"),
                                value: selectedUser,
                                onChanged: (Item Value) {
                                  setState(() {
                                    selectedUser = Value;
                                  });
                                },
                                items: users.map((Item user) {
                                  return DropdownMenuItem<Item>(
                                    value: user,
                                    child: Row(
                                      children: <Widget>[
                                        //user.icon
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          user.name,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                ),
              ),

              SizedBox(
                height: 40.0,
                child:Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: TextField(
                  showCursor: true,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    ),
                    prefixIcon: Icon(Icons.date_range),
                    prefix:DateTimePicker( type: DateTimePickerType.date,
                    dateMask: 'yyyy/MM/dd',
                    controller: _controller3,
                    //initialValue: _initialValue,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    // icon: Icon(Icons.event),
                    // dateLabelText: 'Date',
                    locale: Locale('en', 'US'),
                    onChanged: (val) => setState(() => _valueChanged3 = val),
                    validator: (val) {
                      setState(() => _valueToValidate3 = val);
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved3 = val),
                    ),
                  ),
                ),
                ),
              ),

              SizedBox(
                height: 40.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    cursorHeight: 23.0,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Icon(Icons.line_weight_outlined),
                    ),
                  contentPadding: EdgeInsets.only(left: 15,bottom: 11,top: 11,right: 15),
                      hintText: "weight"
                    )
                  ),
                  ),
                ),


              SizedBox(
                height: 40.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    showCursor: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        )
                      ),

                      suffixIcon:Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Icon(Icons.sports_handball_sharp,
                          color: Colors.black54,),
                      ),
                      prefix:DropdownButtonHideUnderline(
                        child: Container(

                          margin: EdgeInsets.only(
                            left: 0.0,
                            right: 0.0,
                          ),

                          child: Row(
                            children: <Widget>[

                              // Padding(
                              //   padding: EdgeInsets.zero,
                              //   child: IconButton(
                              //     icon: Icon(Icons.ac_unit),
                              //   ),
                              // ),
                              DropdownButton<gender>(

                                icon: Icon(Icons.arrow_drop_down,color: Colors.white,),

                                //icon: Icons.arrow_drop_down,
                                hint: Text("    SELECT GENDER"),

                                value: selected,
                                onChanged: (gender Value) {
                                  setState(() {
                                    selected = Value;
                                  });
                                },
                                items: us.map((gender user) {
                                  return DropdownMenuItem<gender>(
                                    value: user,
                                    child: Row(
                                      children: <Widget>[
                                        //user.icon
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          user.na,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),

                                  );

                                  // return DropdownButtonHideUnderline();
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height:40.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    showCursor: true,
                    readOnly: true,
                  decoration:InputDecoration(
                    // hintText: "HELLO",
                      border: OutlineInputBorder(
                        borderRadius:   BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),

                      prefix:DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        dateMask: 'd MMMM, yyyy - hh:mm a',
                        controller: _controller2,
                        //initialValue: _initialValue,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        //icon: Icon(Icons.event),
                        //  dateLabelText: 'Date Time',
                        use24HourFormat: false,
                        // locale: Locale('en', 'US'),
                        onChanged: (val) => setState(() => _valueChanged2 = val),
                        validator: (val) {
                          setState(() => _valueToValidate2 = val);
                          return null;
                        },
                        onSaved: (val) => setState(() => _valueSaved2 = val),
                      ),
                      prefixIcon: Icon(Icons.date_range)
                  ),
                  ),
                ),
              ),

              SizedBox(
                height: 40.0,
                child:Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    showCursor: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      ),
                      prefixIcon: Icon(Icons.date_range),
                      prefix:DateTimePicker( type: DateTimePickerType.date,
                        dateMask: 'yyyy/MM/dd',
                        controller: _controller3,
                        //initialValue: _initialValue,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        // icon: Icon(Icons.event),
                        // dateLabelText: 'Date',
                        locale: Locale('en', 'US'),
                        onChanged: (val) => setState(() => _valueChanged3 = val),
                        validator: (val) {
                          setState(() => _valueToValidate3 = val);
                          return null;
                        },
                        onSaved: (val) => setState(() => _valueSaved3 = val),

                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(top: 70.0),
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: (){},
                  child: Text('SUBMIT',style: TextStyle(
                    color: Colors.white
                  ),),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}