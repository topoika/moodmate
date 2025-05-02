part of "../components.dart";

String? validateInput(String? value, String type) {
  String? error;
  switch (type) {
    case "phone_number":
      error = validatePhoneNumber(value);
      break;
    case "email":
      error = validateEmail(value);
      break;
    case "name":
      error = validName(value);
      break;
    case "church":
      error = value == null || value.isEmpty ? "Church is required" : null;
      break;
    case "gender":
      error = value == null || value.isEmpty ? "Gender is required" : null;
      break;
    case "child":
      error = value == null || value.isEmpty ? "Select a child" : null;
      break;
    case "amount":
      error = value == null || value.isEmpty ? "Amount is required" : null;
      break;
    case "id_number":
      error = value == null || value.isEmpty ? "ID Number is required" : null;
      break;
    case "account":
      error = value == null || value.isEmpty ? "Account is required" : null;
      break;
    case "frequency":
      error = value == null || value.isEmpty ? "Frequency is required" : null;
      break;
    case "frequency_time_value":
      error =
          value == null || value.isEmpty ? "Frequency Time is required" : null;
      break;
    case "service_code":
      error =
          value == null || value.isEmpty ? "Service Code is required" : null;
      break;
    case "event_code":
      error = value == null || value.isEmpty ? "Event Code is required" : null;
      break;
    // ministry
    case "ministry":
      error = value == null || value.isEmpty ? "Ministry is required" : null;
      break;
    case 'department':
      error = value == null || value.isEmpty ? "Department is required" : null;
      break;
    case 'cell_group':
      error = value == null || value.isEmpty ? "Cell group is required" : null;
      break;
    case 'number_plate':
      error =
          value == null || value.isEmpty ? "Number plate is required" : null;
      break;
    case 'dob':
      error =
          value == null || value.isEmpty ? "Date of birth is required" : null;
      break;
    case "person":
      error = value == null || value.isEmpty ? "Select contact Personnn" : null;
      break;
    case 'service':
      error = value == null || value.isEmpty ? "Service is required" : null;
      break;
    case 'date':
      error = value == null || value.isEmpty ? "Date is required" : null;
      break;
    case 'time':
      error = value == null || value.isEmpty ? "Time is required" : null;
      break;
    case 'purpose':
      error = value == null || value.isEmpty ? "Purpose is required" : null;
      break;
    // feedbac & prayer
    case 'category':
      error = value == null || value.isEmpty ? "Category is required" : null;
      break;
    case 'sub_category':
      error =
          value == null || value.isEmpty ? "Sub-category is required" : null;
      break;
    case "feedback_type":
      error =
          value == null || value.isEmpty ? "Feedback type is required" : null;
      break;
    case "message":
      error = value == null || value.isEmpty ? "Message is required" : null;
      break;
    default:
      error = null;
  }
  return error;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number is required";
  } else if (value.length < 10) {
    return "Phone number must be 10 digits";
  } else if (!value.startsWith("0")) {
    return "Phone number must start with 0";
  } else if (!RegExp(r"^[0-9]*$").hasMatch(value)) {
    return "Phone number must be a number";
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email is required";
  } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
    return "Invalid email address";
  }
  return null;
}

String? validName(String? value) {
  if (value == null || value.isEmpty) {
    return "Name is required";
  } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
    return "Enter a valid name";
  }
  return null;
}
