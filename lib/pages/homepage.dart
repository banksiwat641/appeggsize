import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appeggsize/pages/api.dart';
import 'package:appeggsize/pages/datasize.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File _image;
  File? imageFile;
  final picker = ImagePicker();
  var id;
  String detail = "";
  int sumpix = 0;
  var size;
  String pre="";

  /*void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {
      });
    });
  }*/

  // Model
  /*loadModel() async {
    await Tflite.loadModel(
        model: "assets/model/modelver3.tflite",
        labels: "assets/model/labels.txt");
  }*/

  _getFromCamera() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    //cropImage(image.path);
  }

  _getFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    //cropImage(image.path);
  }

  Future<void> uploadFile() async {
    var docFile = _image;
    var stream = http.ByteStream(_image.openRead());
    stream.cast();
    var length = await docFile.length(); // file length
    var mimeType = lookupMimeType(docFile.path); // mime type

    var uri =
    Uri.parse('http://34.125.105.79/eg'); // xxx = API endpoint's URL

    // create multipart request
    var request = http.MultipartRequest('POST', uri);

    // multipart that takes file
    var multipartFileSign = http.MultipartFile(
      'file', // ตั้งชื่อว่า 'file', ฝั่ง API ต้องระบุถึงชื่อนี้
      stream,
      length,
      filename: p.basename(docFile.path),
    );

    request.files.add(multipartFileSign);


    // send
    var response = await request.send();
    _handleResponse(response);
  }

  dynamic _handleResponse(http.StreamedResponse response) async {
    switch (response.statusCode) {
      case 200:
        var responseData = await response.stream.toBytes();

        String result = String.fromCharCodes(responseData);
        var re = Api.fromJson(jsonDecode(result));

        setState(() {
          pre=re.pre;
          sumpix = re.sumpix;
        });
        print(re.sumpix);
        break;
      default:
        throw Exception(
            'เกิดข้อผิดพลาดในการอัพโหลดไฟล์ (status code: ${response.statusCode})');
    }
  }

  // database type betta

  /*getMethod() async {
    String theUrl = 'http://34.125.105.79/test';
    var res = await http.get(Uri.parse(theUrl));
    var responseBody = json.decode(res.body);

    print(responseBody);

    return responseBody;
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
        Expanded(

          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                        top: 50,
                        left: 20,
                        child: FloatingActionButton(
                          child: Image.asset('assets/images/ii.png'),
                          backgroundColor: Color(0xFFBF360C),
                          heroTag: 1,
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('คำแนะนำ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                                    content:
                                    Text('ควรตั้งกล้องให้ห่างจากตัวไข่ไก่ประมาณ 17.5 ซม.\nควรมีพื้นหลังเป็นสีเรียบ(แนะนำให้เป็นสีดำ)',style: TextStyle(fontSize: 20),),

                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                          child: Text('OK')),

                                    ],
                                  );
                                });
                          },
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/2.png',width: 180,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('จำแนกเบอร์',style: TextStyle(color: Colors.white,fontSize: 35),),
                          Text('ไข่ไก่',style: TextStyle(fontSize: 60,color: Colors.white),),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        label: Text('จำแนกด้วยรูปภาพ',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black),),
                        onPressed: () async {
                          await _getFromGallery();
                          await uploadFile();
                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowResultsPage(
                                  images: _image,
                                  sumpixs: sumpix,
                                  pres:pre,
                                )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFBF360C),
                          fixedSize: const Size(308, 50),
                        ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.photo_camera,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        label: Text('จำแนกด้วยการถ่ายภาพ',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black),),
                        onPressed: () async {
                          await _getFromCamera();
                          await uploadFile();
                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowResultsPage(
                                  images: _image,
                                  sumpixs: sumpix,
                                  pres:pre,
                                )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFBF360C),
                          fixedSize: const Size(308, 50),
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.description,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        label: Text('ข้อมูลไข่ไก่แต่ละเบอร์',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black),),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataSizePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFBF360C),
                          fixedSize: const Size(308, 50),
                        ),),
                    ),

                  ],
                ),


              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}

class ShowResultsPage extends StatefulWidget {
  const ShowResultsPage({Key? key, required this.images, required this.sumpixs, required this.pres})
      : super(key: key);

  final File images;
  final int sumpixs;
  final String pres;


  @override
  State<ShowResultsPage> createState() => _ShowResultsPageState();
}

class _ShowResultsPageState extends State<ShowResultsPage> {
  String? grade;
  final picker = ImagePicker();
  late File _image;
  int sumpix = 0;
  String pres="";
  String data='';

  _getFromCamera() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    //cropImage(image.path);
  }

  _getFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    //cropImage(image.path);
  }

  Future<void> uploadFile() async {
    var docFile = _image;
    var stream = http.ByteStream(_image.openRead());
    stream.cast();
    var length = await docFile.length(); // file length
    var mimeType = lookupMimeType(docFile.path); // mime type
    var uri =
    Uri.parse('http://34.125.105.79/eg'); // xxx = API endpoint's URL

    // create multipart request
    var request = http.MultipartRequest('POST', uri);

    // multipart that takes file
    var multipartFileSign = http.MultipartFile(
      'file', // ตั้งชื่อว่า 'file', ฝั่ง API ต้องระบุถึงชื่อนี้
      stream,
      length,
      filename: p.basename(docFile.path),
    );

    request.files.add(multipartFileSign);

    var response = await request.send();
    _handleResponse(response);
  }

  dynamic _handleResponse(http.StreamedResponse response) async {
    switch (response.statusCode) {
      case 200:
        var responseData = await response.stream.toBytes();

        String result = String.fromCharCodes(responseData);
        var re = Api.fromJson(jsonDecode(result));

        setState(() {
          pres=re.pre;
          sumpix = re.sumpix;
          print(sumpix);
        });
        print(re.sumpix);
        break;
      default:
        throw Exception(
            'เกิดข้อผิดพลาดในการอัพโหลดไฟล์ (status code: ${response.statusCode})');
    }
  }

  // ค้นหาเกรด
  /*String findGrade(int sumpixs) {
    if(sumpixs >= 17000){
      data='ไข่เบอร์ศูนย์เป็นไข่ขนาดใหญ่มาก\nที่มีขนาด80*80';
      return "ศูนย์";
    }else if (sumpixs >=16200 && sumpixs<17000){
      data='ไข่เบอร์หนึ่งเป็นไข่ขนาดใหญ่\nที่มีขนาด70*70';
      return "หนึ่ง";

    }else if (sumpixs >=15300 && sumpixs<16200){
      data='ไข่เบอร์สองเป็นไข่ขนาดกลาง\nที่มีขนาด60*60';
      return "สอง";

    }else if (sumpixs < 15300){
      data='ไข่เบอร์สามเป็นไข่ขนาดเล็ก\nที่มีขนาด50*50';
      return "สาม";

    }
    return "undefined";
  }*/

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
                Container(
                  width: double.infinity,
                  height: size.height * 0.45,
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.file(
                      widget.images,
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(8.0),
                  ),
                ),
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
    if (widget.sumpixs>=30000 || widget.sumpixs<=9000) {
      data='ผิดพลาด';
      return Text(
        'รูปนี้อาจไม่ใช่ไข่ไก่ หรือ ระยะผิด!',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
        ),
      );
    }
    else if (widget.pres!.contains("zero")) {
        data='ไข่เบอร์ศูนย์เป็นไข่ขนาดใหญ่มาก\nที่มีขนาด80*80';
      return Text(
        'เบอร์ : ศูนย์',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    } else if (widget.pres!.contains("one")) {
  data='ไข่เบอร์หนึ่งเป็นไข่ขนาดใหญ่\nที่มีขนาด70*70';
      return Text(
        'เบอร์ : หนึ่ง',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    } else if (widget.pres!.contains("two")) {
  data='ไข่เบอร์สองเป็นไข่ขนาดกลาง\nที่มีขนาด60*60';
      return Text(
        "เบอร์ : สอง",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown.shade700,
        ),
      );
    }else if (widget.pres!.contains("three")) {
  data='ไข่เบอร์สามเป็นไข่ขนาดเล็ก\nที่มีขนาด50*50';
      return Text(
        "เบอร์ : สาม",
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
