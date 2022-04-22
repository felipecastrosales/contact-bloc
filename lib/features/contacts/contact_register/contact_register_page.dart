import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contact_register_bloc.dart';

class ContactRegisterPage extends StatefulWidget {
  const ContactRegisterPage({Key? key}) : super(key: key);

  @override
  State<ContactRegisterPage> createState() => _ContactRegisterPageState();
}

class _ContactRegisterPageState extends State<ContactRegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();

  final _emailEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameEC,
              decoration: const InputDecoration(
                label: Text('name'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'name is mandatory';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailEC,
              decoration: const InputDecoration(
                label: Text('email'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'email is mandatory';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                final isFormValid = _formkey.currentState?.validate() ?? false;
                if (isFormValid) {
                  context.read<ContactRegisterBloc>().add(
                        ContactRegisterEvent.save(
                          name: _nameEC.text,
                          email: _emailEC.text,
                        ),
                      );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}