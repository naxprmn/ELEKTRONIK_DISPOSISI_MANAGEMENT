import 'package:elektronik_disposisi_management/provider/auth_provider.dart';
import 'package:elektronik_disposisi_management/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAssesment extends StatelessWidget {
  FormAssesment({Key? key}) : super(key: key);
  String? petugas;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<AuthProvider>(
        builder: (context, consume, child) {
          return Form(
              child: Column(
            children: [
              TextFormField(
                decoration: _decorationForInput('Kolom 1'),
              ),
              TextFormField(
                decoration: _decorationForInput('Kolom 2'),
              ),
              TextFormField(
                decoration: _decorationForInput('Kolom 3'),
              ),
              DropdownButtonFormField(
                items: consume.listAnggota
                    .map((e) =>
                        DropdownMenuItem(value: e.name, child: Text(e.name)))
                    .toList(),
                onChanged: (newvalue) {
                  petugas = newvalue.toString();
                },
                hint: Text('Pilih Petugas'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    ShowInSnacbar.build("Ceritanya Terkirim", Colors.blue);
                  },
                  child: const Text('Kirim Tugas'))
            ],
          ));
        },
      ),
    );
  }
}

_decorationForInput(label) {
  return InputDecoration(label: Text(label));
}
