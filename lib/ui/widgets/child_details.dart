import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:babyguru/ui/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildDetails extends StatefulWidget {
  final int counter;

  ChildDetails(this.counter);

  @override
  _ChildDetailsState createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {

  FocusNode _nodeName, _nodeRelation,_nodeDOB;

  TextEditingController _controllerName, _controllerRelation;

  @override
  void initState() {
    _nodeName = FocusNode();
    _nodeRelation = FocusNode();
    _nodeDOB= FocusNode();

    _controllerName = TextEditingController();
    _controllerRelation = TextEditingController();

    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  String year=" ";
  String month=" ";
  String day=" ";


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        year= picked.toString().substring(0,4);
        month = picked.toString().substring(5,7);
        day =picked.toString().substring(8,10);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: vDimen(200),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(
          vDimen(15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: hDimen(10),
          top: vDimen(20),
          bottom: vDimen(20),
          right: hDimen(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.counter == 1
                    ? Text("First Child Details")
                    : widget.counter == 2
                        ? Text("Second Child Detals")
                        : Text("Illegal Details"),
                Spacer(
                  flex: 2,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: vDimen(15),
                ),
              ],
            ),
            vSpacing(vDimen(20)),
            CustomTextField(
              icon: Icons.check,
              labelText: "Name of the child",
              image: " ",
              maxLength: 50,
              focusNode: _nodeName,
              backgroundColor: AppColor.colorChildDetailsFields,
              inputAction: TextInputAction.next,
              obSecure: false,
              textEditingController: _controllerName,
              textStyle: TextStyle(
                fontSize: vDimen(16),
                color: Colors.white70,
              ),
              onSubmit: (value) {
                _nodeName.unfocus();
                _nodeRelation.requestFocus();
              },
            ),
            vSpacing(10),
            CustomTextField(
              selectedDate:day==" " ? " ":day+"/"+month+"/"+year,
              isDateField: true,
              onTab: ()
              {
                print("Date Tab..");
                _selectDate(context);
              },
              labelText: "DOB",
              image: " ",
              maxLength: 50,
              focusNode: _nodeDOB,
              backgroundColor: AppColor.colorChildDetailsFields,
              hintText: "DOB",
              inputAction: TextInputAction.next,
              obSecure: false,
              textStyle: TextStyle(
                fontSize: vDimen(16),
                color: Colors.white70,
              ),
              onSubmit: (value) {
                _nodeDOB.unfocus();
                _nodeRelation.requestFocus();
              },
            ),
            vSpacing(10),
            CustomTextField(
              labelText: "Relationship to child",
              image: " ",
              maxLength: 50,
              focusNode: _nodeRelation,
              backgroundColor: AppColor.colorChildDetailsFields,
              inputAction: TextInputAction.next,
              obSecure: false,
              textEditingController: _controllerRelation,
              textStyle: TextStyle(
                fontSize: vDimen(16),
                color: Colors.white70,
              ),
              onSubmit: (value) {
                _nodeRelation.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}
