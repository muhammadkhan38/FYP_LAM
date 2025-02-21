import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool readOnly; // ✅ readOnly کو سپورٹ کریں
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.readOnly = false, // ✅ Default false رکھیں
    required this.icon,
    this.validator,
    this.obscureText,
    this.keyboardType,
    this.onTap, required
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: readOnly, // ✅ اب یہ readOnly کو سپورٹ کرے گا
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,

        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          suffixIcon: Icon(icon, color: Colors.black),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,

          // ✅ Circular Shape برقرار رکھنے کے لیے یہ Borders ضروری ہیں:
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              color: Colors.transparent, // یا Colors.grey.shade100
            ),
            borderRadius: BorderRadius.circular(40), // یہ radius برقرار رکھے گا
          ),
        ),
        validator: validator,
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class CustomTextFormField extends StatelessWidget {
//   final keyboardType;
//   final TextEditingController controller;
//   final String hintText;
//   final IconData icon;
//   final VoidCallback? onTap;
//
//   final String? Function(String?)? validator;
//   //final ontaps;
//
//
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.icon,
//     this.validator,
//     required bool? obscureText,
//      this.keyboardType,
//     this.onTap,
//
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 5, right: 5),
//       child: TextFormField(
//         controller: controller,
//       onTap: onTap,
//       keyboardType:keyboardType,
//
//         decoration: InputDecoration(
//
//           fillColor: Colors.grey.shade100,
//           filled: true,
//           suffixIcon: Icon(icon, color: Colors.black),
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black54),
//           border: InputBorder.none,
//           enabledBorder: OutlineInputBorder(
//
//             borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
//             borderRadius: BorderRadius.circular(40),
//
//           ),
//
//         ),
//         validator: validator,
//       ),
//     );
//   }
// }











// class CustomAddressField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final EdgeInsets contentPadding;
//
//   const CustomAddressField({
//     Key? key,
//     required this.hintText,
//     required this.controller,
//     this.contentPadding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 49.0),
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           filled: false,
//           fillColor: const Color(0xffFFFFFF),
//           hintText: hintText,
//           hintStyle: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 14,
//             color: Colors.grey,
//           ),
//           border: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           contentPadding: contentPadding,
//         ),
//       ),
//     );
//   }
// }
