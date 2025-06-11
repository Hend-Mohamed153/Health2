import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Document(),
    );
  }
}

class Document extends StatefulWidget {
  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  String? selectedType;
  List<String> options = ["Prescription", "LabTest", "Medical Image"];
  File? _selectedFile;
  final ImagePicker _picker = ImagePicker();
  double imageSize = 200;
  File? _image;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Only JPG, PNG, PDF, or JPEG files are allowed!")));
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF028887),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF028887),
                      size: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  color: Color(0xFF000000),
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 10),

              CustomPaint(
                painter: DashedBorderPainter(),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "e.g. Thyroid test analysis",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text(
                'Type',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  color: Color(0xFF000000),
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 10),
              CustomPaint(
                painter: DashedBorderPainter(),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      value: selectedType,
                      hint: Text(
                        "Select Document Type",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedType = newValue;
                        });
                      },
                      items: options.map((String value) {
                        bool isSelected = selectedType == value;
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? Color(0x4D036666) : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  value,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                if (isSelected)
                                  Icon(Icons.check, color: Color(0xFF036666)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),

                      selectedItemBuilder: (BuildContext context) {
                        return options.map((String value) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        }).toList();
                      },

                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        offset: Offset(0, 5),
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              if (selectedType == "Medical Image") ...[
                Text(
                  'Interpertation',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Color(0xFF000000),
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10),
                CustomPaint(
                  painter: DashedBorderPainter(),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter interpertation",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
              Positioned(
                top: 270,
                left: 90,
                child: Text(
                  'Attach Document',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'images/Rectangle 4252.png',
                      width: 350,
                      height: 350,
                    ),
                    Positioned(
                      top: 5,
                      left: 25,
                      child: Image.asset(
                        'images/Upload-raffia 1.png',
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Positioned(
                      top: 270,
                      left: 90,
                      child: Text(
                        'Add Documents',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 300,
                      left: 50,
                      child: Text(
                        'Files supported: JPG, PNG, PDF, JPEG',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              fileUploadRow("Files", _selectedFile != null, _pickFile, _removeFile),
              SizedBox(height: 10),
              if (_selectedFile != null)
                Center(
                  child: path.extension(_selectedFile!.path).toLowerCase() == '.pdf'
                      ? Text(
                    path.basename(_selectedFile!.path),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      _selectedFile!,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF036666),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check, color: Colors.white, size: 50),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Submitted Successfully',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF036666),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF036666),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fileUploadRow(String label, bool isUploaded, Function onUpload, Function onDelete) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF036666), width: 2),
            color: Colors.white,
          ),
          child: isUploaded ? Icon(Icons.check, color: Color(0xFF036666), size: 20) : null,
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => onUpload(),
          child: Container(
            width: 140,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Spacer(),
        if (isUploaded)
          GestureDetector(
            onTap: () => onDelete(),
            child: Icon(Icons.delete, color: Color(0xFF036666), size: 25),
          ),
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path = Path()
      ..addRect(Offset.zero & size);

    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double distance = 0.0;

    PathMetrics pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      double length = pathMetric.length;
      while (distance < length) {
        final nextDistance = distance + dashWidth;
        final tangent = pathMetric.getTangentForOffset(distance);

        if (tangent != null) {
          canvas.drawLine(
            tangent.position,
            tangent.position.translate(dashWidth, 0),
            paint,
          );
        }
        distance = nextDistance + dashSpace;
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
