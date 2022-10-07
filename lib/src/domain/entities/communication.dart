 class Communication<T> {
  final bool success;
  final T? data;
  final String? message;

  Communication({
    required this.success,
     this.data,
    this.message,
  });
}
