
import 'package:flutter/material.dart';

import 'homepage.dart';

class DataSizePage extends StatefulWidget {
  const DataSizePage({Key? key}) : super(key: key);

  @override
  State<DataSizePage> createState() => _DataSizePageState();
}

class _DataSizePageState extends State<DataSizePage> {
  int sizes=0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
      child: Container(
      width: double.infinity,
      height: double.infinity,

        child: Container(
          color: Colors.amberAccent,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color:Color(0xFFBF360C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18.0),
                        bottomRight: Radius.circular(18.0),
                      ),),),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(40.0),
                        child: Row(
                         // mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Image.asset('assets/images/000.png',scale: 9.5,),
                            Text(
                              'เมนู',
                              style: TextStyle(
                                fontSize: 69.999,color: Colors.white,
                              ),
                            ),
                            Text('ข้อมูลไข่ไก่\nแต่ละเบอร์',style: TextStyle(fontSize: 25,color: Colors.white),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.egg,
                              color: Colors.white,
                              size: 60.0,
                            ),
                            label: Text('ข้อมูลไข่ไก่เบอร์ 0',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),),
                            onPressed: () async {
                              sizes=0;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Showdata(size: sizes)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFEFA58B),
                              fixedSize: const Size(350, 80),
                            ),),
                        ),
                        //--------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.egg,
                              color: Colors.white,
                              size: 60.0,
                            ),
                            label: Text('ข้อมูลไข่ไก่เบอร์ 1',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),),
                            onPressed: () async {
                              sizes=1;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Showdata(size: sizes)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFEFA58B),
                              fixedSize: const Size(350, 80),
                            ),),
                        ),
                        //--------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.egg,
                              color: Colors.white,
                              size: 60.0,
                            ),
                            label: Text('ข้อมูลไข่ไก่เบอร์ 2',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),),
                            onPressed: () async {
                              sizes=2;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Showdata(size: sizes)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFEFA58B),
                              fixedSize: const Size(350, 80),
                            ),),
                        ),
                        //--------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.egg,
                              color: Colors.white,
                              size: 60.0,
                            ),
                            label: Text('ข้อมูลไข่ไก่เบอร์ 3',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),),
                            onPressed: () async {
                              sizes=3;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Showdata(size: sizes)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFEFA58B),
                              fixedSize: const Size(350, 80),
                            ),),
                        ),
                        //--------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.egg,
                              color: Colors.white,
                              size: 60.0,
                            ),
                            label: Text('ข้อมูลไข่ไก่เบอร์ 4',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),),
                            onPressed: () async {
                              sizes=4;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Showdata(size: sizes)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFEFA58B),
                              fixedSize: const Size(350, 80),
                            ),),
                        ),
                        //--------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.egg,
                              color: Colors.white,
                              size: 60.0,
                            ),
                            label: Text('ข้อมูลไข่ไก่เบอร์ 5',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),),
                            onPressed: () async {
                              sizes=5;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Showdata(size: sizes)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFEFA58B),
                              fixedSize: const Size(350, 80),
                            ),),
                        ),
                        //--------------------------------------------------------------
                      ],
                    ),
                  ),
                ),


              ],

            ),

          ),
        ),
    ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        },
        child: Icon(Icons.home),
        backgroundColor: Color(0xFFBF360C),
      ),
    );
  }
}
//--------------------------------------------------------------------
class Showdata extends StatefulWidget {
  const Showdata({Key? key,  required this.size})
      : super(key: key);

  final int size;


  @override
  State<Showdata> createState() => _Showdata();
}

class _Showdata extends State<Showdata> {
  String? grade;
  //int size = 0;
  String pres="";
  String data='';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // grade = findGrade(widget.sumpixs);

    return Scaffold(
      appBar: new AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ผลการทำนาย',style: TextStyle(fontSize: 25.0,color: Colors.black,),),
          ],
        ),),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFF5C798),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),

              SizedBox(height: size.height * 0.001),

              SizedBox(height: size.height * 0.0001),
              Column(
                children: [
                  Center(
                    child: findAnswer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 350.0,
                      height: 230.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color(0xaaa0654d),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$data',style: TextStyle(fontSize: 20,color: Colors.black54),),
                        ],
                      ),
                    ),),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        },
        child: Icon(Icons.home),
        backgroundColor: Color(0xFFBF360C),
      ),
    );
  }

  Widget findAnswer() {
    if (widget.size==0) {
      data='ไข่เบอร์ศูนย์เป็นไข่ขนาดใหญ่มาก\nที่มีขนาด90*90';
      return Text(
        'ศูนย์',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
        ),
      );
    }
    else if (widget.size==1) {
      data='ไข่เบอร์ศูนย์เป็นไข่ขนาดใหญ่มาก\nที่มีขนาด80*80';
      return Text(
        'เบอร์ : หนึ่ง',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    } else if (widget.size==2) {
      data='ไข่เบอร์หนึ่งเป็นไข่ขนาดใหญ่\nที่มีขนาด70*70';
      return Text(
        'เบอร์ : สอง',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    } else if (widget.size==3) {
      data='ไข่เบอร์สองเป็นไข่ขนาดกลาง\nที่มีขนาด60*60';
      return Text(
        "เบอร์ : สาม",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    }else if (widget.size==4) {
      data='ไข่เบอร์สามเป็นไข่ขนาดเล็ก\nที่มีขนาด50*50';
      return Text(
        "เบอร์ : สี่",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    }
    else if (widget.size==5) {
      data='ไข่เบอร์สามเป็นไข่ขนาดเล็ก\nที่มีขนาด50*50';
      return Text(
        "เบอร์ : ห้า",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    }
    return Text(
      'ไม่ใช่ไข่ไก่',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.black87,
      ),
    );
  }
}
