import 'package:elektronik_disposisi_management/providers/general_provider.dart';
import 'package:elektronik_disposisi_management/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormAssesment extends StatelessWidget {
  const FormAssesment({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(
        builder: (context, consume, child) {
          String? petugas;
          return consume.watch(petugasProvider).when(data: (data) {
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
                  items: data.map((e) => DropdownMenuItem(value: e.name, child: Text(e.name))).toList(),
                  onChanged: (newvalue) {
                    petugas = newvalue.toString();
                  },
                  hint: const Text('Pilih Petugas'),
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
          }, error: (error, stackTrace) {
            return Text(error.toString());
          }, loading: () {
            return const CircularProgressIndicator();
          });
        },
      ),
    );
  }
}

_decorationForInput(label) {
  return InputDecoration(label: Text(label));
}
