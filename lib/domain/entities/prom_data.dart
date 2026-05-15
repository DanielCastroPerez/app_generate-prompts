class PromptDataEntity {
  final String role;
  final String task;
  final String context;
  final List<String> constraints;
  final bool questionsForAi;

  PromptDataEntity({
    required this.role,
    required this.task,
    required this.context,
    required this.constraints,
    required this.questionsForAi,
  });
}
