

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/models/color.dart';

class CustomReminder extends StatefulWidget {
  int j;
  @override
  _CustomReminderState createState() => _CustomReminderState();
}

class _CustomReminderState extends State<CustomReminder> {
  int selectedHour = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
            children: [
            GestureDetector(
            onTap: (){
                     Get.back();
                 },
              child: Image.asset(
            'images/back.png',
             scale: 10,

            ),
         ),
        SizedBox(width: 50,),
        Text('CUSTOM REMINDER'),
      ]
        )
      ),backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text('Select In Hours', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue, width: 1.5)
                ),

                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListWheelScrollView(
                  itemExtent: 100,
                  useMagnifier: true,
                  diameterRatio: 2,

                  magnification: 1.4,
                  onSelectedItemChanged: (i){
                    print('THIS IS THE INDEX ${i+1}');
                    selectedHour = i+1;
                    for(int j=0; j<2; j++){
                      i = i + j;


                    }
                    print(i);

                  },

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('1', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('2', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('3', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('4', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('5', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('6', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('7', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('8', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('9', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('10', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('11', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('12', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('13', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('14', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('15', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('16', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('17', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('18', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('19', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('20', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('21', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('22', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('23', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Text('24', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ),)),
                      ),
                    ),

                  ],
                )
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 250,
                child: RaisedButton(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10)
                   ),
                  color: Colors.blue,  // Navigator.pop(context, on);
                  child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20.0,), ),
                  onPressed: (){
                     Navigator.pop(context, selectedHour );
                     },
                ),
              )

            ],
          ),
        ),
      ),

    );

  }
}
