import 'package:app/model/record.dart';
import 'package:app/model/write_record.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTextModel with ChangeNotifier {
  EditTextModel(this._repo, this.old) {
    if (old == null) return;
    final record = WellknownTextRecord.fromNdef(old!.record);
    textController.text = record.text;
  }

  final Repository _repo;
  final WriteRecord? old;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController textController = TextEditingController();

  Future<Object> save() async {
    if (!formKey.currentState!.validate()) throw ('Form is invalid.');

    final record = WellknownTextRecord(
      languageCode: 'en', // todo:
      text: textController.text,
    );

    return _repo.createOrUpdateWriteRecord(WriteRecord(
      id: old?.id,
      record: record.toNdef(),
    ));
  }
}

class EditTextPage extends StatelessWidget {
  static Widget withDependency([WriteRecord? record]) =>
      ChangeNotifierProvider<EditTextModel>(
        create: (context) =>
            EditTextModel(Provider.of(context, listen: false), record),
        child: EditTextPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Text',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: Provider.of<EditTextModel>(context, listen: false).formKey,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            TextFormField(
              cursorColor: Color(0xFF009180),
              controller: Provider.of<EditTextModel>(context, listen: false)
                  .textController,
              decoration: InputDecoration(
                labelText: 'Text',
                labelStyle: TextStyle(
                  color: Color(0xFF009180),
                ),
                helperText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF009180),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF009180),
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) =>
                  value?.isNotEmpty != true ? 'Required' : null,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF009180)),
              child: Text('Save'),
              onPressed: () =>
                  Provider.of<EditTextModel>(context, listen: false)
                      .save()
                      .then((_) => Navigator.pop(context))
                      .catchError((e) => print('=== $e ===')),
            ),
          ],
        ),
      ),
    );
  }
}
