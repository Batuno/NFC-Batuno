import 'package:app/model/record.dart';
import 'package:app/model/write_record.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUriModel with ChangeNotifier {
  EditUriModel(this._repo, this.old) {
    if (old == null) return;
    final record = WellknownUriRecord.fromNdef(old!.record);
    uriController.text = record.uri.toString();
  }

  final Repository _repo;
  final WriteRecord? old;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController uriController = TextEditingController();

  Future<Object> save() async {
    if (!formKey.currentState!.validate()) throw ('Form is invalid.');

    final record = WellknownUriRecord(
      uri: Uri.parse(uriController.text),
    );

    return _repo.createOrUpdateWriteRecord(WriteRecord(
      id: old?.id,
      record: record.toNdef(),
    ));
  }
}

class EditUriPage extends StatelessWidget {
  static Widget withDependency([WriteRecord? record]) =>
      ChangeNotifierProvider<EditUriModel>(
        create: (context) =>
            EditUriModel(Provider.of(context, listen: false), record),
        child: EditUriPage(),
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
          'Edit Uri',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: Provider.of<EditUriModel>(context, listen: false).formKey,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            TextFormField(
              cursorColor: Color(0xFF009180),
              controller: Provider.of<EditUriModel>(context, listen: false)
                  .uriController,
              decoration: InputDecoration(
                labelText: 'Uri',
                labelStyle: TextStyle(
                  color: Color(0xFF009180),
                ),
                hintText: 'http://example.com',
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
              keyboardType: TextInputType.url,
              validator: (value) => value?.isNotEmpty != true
                  ? 'Required'
                  : Uri.tryParse(value!) == null
                      ? 'Invalid'
                      : null,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF009180)),
              child: Text('Save'),
              onPressed: () => Provider.of<EditUriModel>(context, listen: false)
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
