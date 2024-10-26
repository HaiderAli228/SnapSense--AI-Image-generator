// models/prompt_request.dart

class PromptRequest {
  final String prompt;
  final String ref;
  final String webhookOverride;

  PromptRequest({
    required this.prompt,
    this.ref = '',
    this.webhookOverride = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'prompt': prompt,
      'ref': ref,
      'webhookOverride': webhookOverride,
    };
  }
}
