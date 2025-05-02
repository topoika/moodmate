// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../components.dart";

class CustomTextInput extends StatefulWidget {
  final String hint;
  final String type;
  final String? value;
  final Function? onSaved;
  final String? title;

  const CustomTextInput({
    super.key,
    required this.hint,
    required this.type,
    this.value,
    this.onSaved,
    this.title,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  TextEditingController? controller;
  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      controller = TextEditingController(text: widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.noScaling),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: widget.title != null,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.title ?? "",
                  textScaler: TextScaler.noScaling,
                  style: const TextStyle(
                    fontSize: 14.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            TextFormField(
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              cursorColor: Colors.black,
              onSaved:
                  widget.onSaved != null
                      ? (value) => widget.onSaved!(value)
                      : null,
              validator: (value) => validateInput(value, widget.type),
              keyboardType: getInputType(widget.type),
              controller: controller,
              maxLines: widget.type == "feedback" ? 6 : 1,
              decoration: InputDecoration(
                fillColor: Color(0xfff3f4f9),
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                hintText: widget.hint,
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: inputBorder,
                disabledBorder: inputBorder,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                errorStyle: errorStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCheckBoxInput extends StatelessWidget {
  final String hint;
  final bool? value;
  final Function? onChange;
  const CustomCheckBoxInput({
    super.key,
    required this.hint,
    this.value = false,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChange != null) onChange!(!value!);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xfff3f4f9),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromARGB(255, 203, 203, 203),
            width: 0.3,
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: value! ? context.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: value! ? context.primaryColor : Colors.black54,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.check_outlined,
                size: 22,
                color: value! ? Colors.white : Colors.transparent,
              ),
            ),
            SizedBox(width: 15),
            Text(
              hint,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const InputTitle({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        fontSize: 13.5,
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

TextStyle errorStyle = TextStyle(
  color: Colors.red,
  fontWeight: FontWeight.w500,
  fontSize: 9,
);

getInputType(String type) {
  switch (type) {
    case 'email':
      return TextInputType.emailAddress;
    case 'password':
      return TextInputType.visiblePassword;
    default:
      return TextInputType.text;
  }
}

class CustomDropDownInput extends StatelessWidget {
  final String hint;
  final String type;
  final String? value;
  final Function? onClick;
  const CustomDropDownInput({
    super.key,
    required this.hint,
    required this.type,
    this.value,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: value ?? "");
    return MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.noScaling),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          readOnly: true,
          controller: controller,
          onTap: () {
            if (onClick != null) onClick!();
          },
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          cursorColor: Colors.black,
          validator: (value) => validateInput(value, type),
          decoration: InputDecoration(
            fillColor: Color(0xfff3f4f9),
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            hintText: hint,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: inputBorder,
            disabledBorder: inputBorder,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: value != null ? Colors.black : Colors.black87,
            ),
            hintStyle: TextStyle(
              color: const Color.fromARGB(137, 56, 45, 45),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            errorStyle: errorStyle,
          ),
        ),
      ),
    );
  }
}

class CustomDropDownWidget extends StatelessWidget {
  final String hint;
  final String type;
  final String? value;
  final List<String> items;
  final Function(String?) onSaved;
  final Function? onchanged;

  const CustomDropDownWidget({
    super.key,
    required this.hint,
    required this.type,
    required this.items,
    this.value,
    required this.onSaved,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.noScaling),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,

          decoration: InputDecoration(
            fillColor: const Color(0xfff3f4f9),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 15,
            ),
            hintText: hint,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: inputBorder,
            disabledBorder: inputBorder,
            hintStyle: const TextStyle(
              color: Color.fromARGB(137, 56, 45, 45),
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Poppins",
            ),
            errorStyle: errorStyle,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: "Poppins",
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black87),
          validator: (value) => validateInput(value, type),
          onSaved: (val) => onSaved(val),
          onChanged: (val) {
            if (onchanged != null) {
              onchanged!(val);
            } else {
              onSaved(val);
            }
          },
          items:
              items
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String hint;
  final bool? forLogin;
  final bool? isConfirm;
  final Function? onSaved;
  final String? title;
  const PasswordField({
    super.key,
    required this.hint,
    this.forLogin = false,
    this.onSaved,
    this.title,
    this.isConfirm = false,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String _pin = '';
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    Color color = getColorandText(_pin.length)[0];
    String text = getColorandText(_pin.length)[1];
    int strength = getColorandText(_pin.length)[2];
    return MediaQuery(
      data: const MediaQueryData(textScaler: TextScaler.noScaling),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: widget.title != null,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.title ?? "",
                  textScaler: TextScaler.noScaling,
                  style: const TextStyle(
                    fontSize: 14.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _pin = value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) return "Password is required";
                if (value.length < 4) return "Password must be 4+ char";
                if (widget.isConfirm! && value != currentUser.value.password) {
                  return "Password does not match";
                }
                return null;
              },
              obscureText: isObscure,
              onSaved:
                  widget.onSaved != null
                      ? (value) => widget.onSaved!(value)
                      : null,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: const Color(0xfff3f4f9),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                hintText: widget.hint,
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: inputBorder,
                disabledBorder: inputBorder,
                suffixIcon: GestureDetector(
                  onTap: () => setState(() => isObscure = !isObscure),
                  child: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                errorStyle: errorStyle,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(137, 56, 45, 45),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
            Visibility(
              visible: !widget.forLogin!,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return Expanded(
                        child: Container(
                          height: 3,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color:
                                index <= strength
                                    ? color
                                    : const Color(0xfff3f4f9),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        text,
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 10,
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

getColorandText(int strength) {
  if (strength < 2) return [Colors.red, 'Very Weak', 0];
  if (strength < 4) return [Colors.red, 'Weak', 1];
  if (strength < 6) return [Colors.orange, 'Normal', 2];
  if (strength < 8) return [Colors.blue, 'Strong', 3];
  return [Colors.green, 'Very Strong', 4];
}

InputBorder inputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black, width: 0.3),
  borderRadius: BorderRadius.circular(5),
);

InputBorder errorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.red, width: 0.3),
  borderRadius: BorderRadius.circular(5),
);
