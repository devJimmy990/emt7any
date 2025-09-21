class InputValidator {
  static String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "مطلوب";
    }
    return null;
  }

  static String? validateId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "مطلوب";
    } else if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
      return "الرقم القومي يجب أن يحتوي على أرقام فقط";
    } else if (value.trim().length != 14) {
      return "الرقم القومي يجب أن يكون 14 رقمًا";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "مطلوب";
    } else if (value.trim().length < 8) {
      return "يجب ان يكون كلمة المرور على الاقل 8 حروف";
    }
    return null;
  }

  static String? validateVersion(String? value) {
    if (value == null || value.isEmpty) {
      return "مطلوب";
    } else if (!RegExp(r"^\d{4}\.\d{1,2}\.\d{1,2}$").hasMatch(value)) {
      return "رقم الإصدار غير صالح";
    }
    return null;
  }

  static String? validateWalletBalance(String? value) {
    if (value == null || value.isEmpty) {
      return "مطلوب";
    }
    final amount = double.tryParse(value);
    if (amount == null) {
      return "يجب إدخال رقم صالح";
    } else if (amount < 0) {
      return "يجب أن يكون المبلغ أكبر من صفر";
    } else if (amount > 25000) {
      return "يجب أن يكون المبلغ أقل من 25000";
    }

    return null;
  }

  static String? validateCreditBalance(String? value) {
    if (value == null || value.isEmpty) {
      return "مطلوب";
    }
    final amount = double.tryParse(value);
    if (amount == null) {
      return "يجب إدخال رقم صالح";
    } else if (amount < 0) {
      return "يجب أن يكون المبلغ أكبر من صفر";
    } else if (amount > 100) {
      return "يجب ان يكون الرصيد اقل من 100";
    }

    return null;
  }
}
