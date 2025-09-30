import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:emt7any/feature/exam/presentation/widgets/side_bar_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamSideBarSections extends StatefulWidget {
  const ExamSideBarSections({super.key});

  @override
  State<ExamSideBarSections> createState() => _ExamSideBarSectionsState();
}

class _ExamSideBarSectionsState extends State<ExamSideBarSections> {
  int? expandedIndex; // only one open at a time

  @override
  Widget build(BuildContext context) => BlocBuilder<ExamCubit, ExamState>(
    builder: (context, state) => ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: state.sections.length,
      itemBuilder: (context, index) {
        final section = state.sections[index];
        final isExpanded = expandedIndex == index;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
          elevation: 2,
          child: ExpansionTile(
            key: PageStorageKey(index),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              section.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onExpansionChanged: (expanded) {
              setState(() => expandedIndex = expanded ? index : null);
            },

            children: isExpanded
                ? section.questions.asMap().entries.map((entry) {
                    final qIndex = entry.key;
                    final question = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SideBarQuestion(
                        sectionId: section.id,
                        question: question,
                        sectionIndex: index,
                        questionIndex: qIndex,
                      ),
                    );
                  }).toList()
                : [],
          ),
        );
      },
    ),
  );
}
