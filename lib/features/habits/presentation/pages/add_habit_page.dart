import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../cubits/add_habit_cubit.dart';
import '../cubits/add_habit_state.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  static const _pointPresets = [5, 10, 15, 20, 50];

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
    FocusScope.of(context).unfocus();
    context.read<AddHabitCubit>().submit(
      name: _name.text,
      description: _description.text,
      points: int.parse(_points.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          appBar: AppBar(title: const Text('New habit')),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                Text(
                  'Small daily actions add up. Give it a name and decide how '
                  'many points it is worth.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 24),
                const _FieldLabel('Name'),
                TextFormField(
                  controller: _name,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'e.g. Drink 2L water',
                    prefixIcon: Icon(Icons.edit_outlined),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Name is required'
                      : null,
                ),
                const SizedBox(height: 20),
                const _FieldLabel('Description (optional)'),
                TextFormField(
                  controller: _description,
                  maxLines: 3,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    hintText: 'Why does this matter to you?',
                  ),
                ),
                const SizedBox(height: 20),
                const _FieldLabel('Points'),
                TextFormField(
                  controller: _points,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.star_rounded,
                      color: AppColors.accent,
                    ),
                  ),
                  validator: (v) {
                    final n = int.tryParse(v ?? '');
                    return (n == null || n <= 0)
                        ? 'Enter a number above 0'
                        : null;
                  },
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder(
                  valueListenable: _points,
                  builder: (_, value, _) => Wrap(
                    spacing: 8,
                    children: [
                      for (final p in _pointPresets)
                        ChoiceChip(
                          label: Text('$p'),
                          selected: value.text == '$p',
                          onSelected: (_) => _points.text = '$p',
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: submitting ? null : _submit,
                  icon: submitting
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.check_rounded),
                  label: const Text('Save habit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 2),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
