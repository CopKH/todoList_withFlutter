import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this.addTx, {super.key});
  final Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // DateTime _selectedDate = DateTime.now();
  // var _selectedDate = DateTime.now();
  DateTime? _selectedDate;

  submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0|| _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      _selectedDate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(_selectedDate);
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'หัวข้อ'),
              controller: _titleController,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'จำนวนเงิน'),

              controller: _amountController,
              // onSubmitted: (_) => SubmitData(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    // Expanded(
                    //     child: Text(
                    //         'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',)),
                    ElevatedButton(
                      onPressed: _presentDatePicker,
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.all(15),
                        foregroundColor: Colors.purple,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 15.0,
                      ),
                      child: Text(
                        'เลือกวัน',
                        style: GoogleFonts.prompt(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
                padding: const EdgeInsets.all(15),
                foregroundColor: Colors.purple,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 15.0,
              ),
              onPressed: submitData,
              child: Text(
                'เพิ่มหัวข้อ',
                style: GoogleFonts.prompt(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
