import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/add_habit_cubit.dart';
import '../cubits/add_habit_state.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _points = TextEditingController(text: '10');

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _points.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AddHabitCubit>().submit(
      name: _name.text,
      description: _description.text,
      points: int.parse(_points.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddHabitCubit, AddHabitState>(
      listener: (context, state) {
        switch (state) {
          case AddHabitSuccess():
            context.pop();
          case AddHabitError(:final message):
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message)));
          default:
        }
      },
      builder: (context, state) {
        final submitting = state is AddHabitSubmitting;
        return Scaffold(
          appBar: AppBar(title: const Text('Add Habit')),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'e.g. Drink 2L water',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Name is required'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _description,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _points,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Points',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) {
                    final n = int.tryParse(v ?? '');
                    return (n == null || n <= 0)
                        ? 'Enter a number above 0'
                        : null;
                  },
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: submitting ? null : _submit,
                  child: submitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save habit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
