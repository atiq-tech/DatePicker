import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mypos/common_widget/custom_appbar.dart';

class CustomerEntryPage extends StatefulWidget {
  const CustomerEntryPage({super.key});

  @override
  State<CustomerEntryPage> createState() => _CustomerEntryPageState();
}

class _CustomerEntryPageState extends State<CustomerEntryPage> {
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _officePhoneController = TextEditingController();
  final TextEditingController _previousDueController = TextEditingController();
  final TextEditingController _creditLimitController = TextEditingController();
  String lavel = "Retails";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Customer Entry"),
      body: Container(
        padding: EdgeInsets.only(top: 3.0, left: 4.0, right: 4.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Customer Name",
                    style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _customerNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Owner Name",
                    style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _ownerNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Address",
                    style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Mobile",
                    style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Office Phone",
                    style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _officePhoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Previous Due",
                    style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _previousDueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 4, 100, 145),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Credit Limit",
                    style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _creditLimitController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 7, 125, 180),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 7, 125, 180),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0, right: 15.0),
              child: Container(
                height: 25.0,
                width: double.infinity,
                color: Color.fromARGB(255, 5, 114, 165),
                child: Center(
                    child: Text(
                  "Customer Type",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.15,
                      child: Radio(
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 5, 114, 165),
                          ),
                          value: "Retails",
                          groupValue: lavel,
                          onChanged: (value) {
                            setState(() {
                              lavel = value.toString();
                            });
                          }),
                    ),
                    Text("Retails"),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.15,
                      child: Radio(
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 5, 114, 165),
                          ),
                          value: "Wholesale",
                          groupValue: lavel,
                          onChanged: (value) {
                            setState(() {
                              lavel = value.toString();
                            });
                          }),
                    ),
                    Text("Wholesale"),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: 35.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 5, 114, 165),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                    child: Text(
                  "SAVE",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
