import 'dart:async';
import 'package:flutter/material.dart';



class CustomSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const CustomSearchBar({super.key, required this.onSearch});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onTextChanged() {
    _controller.text = _controller.text.trimLeft();

    if (_controller.text.isEmpty) {
      widget.onSearch('');
      _debounce?.cancel();
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_controller.text.length >= 3) {
        widget.onSearch(_controller.text);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (text) => _onTextChanged(),
      decoration: InputDecoration(
        labelText: 'Search movies...',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
