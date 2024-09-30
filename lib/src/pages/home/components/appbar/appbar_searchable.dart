import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../home_controller.dart';

class AppbarSearchable extends StatefulWidget {
  final HomeController controller;
  final double appSize;
  final GestureTapCallback? backButton;
  final ValueChanged<String>? searchSubmitted;
  final TextEditingController textController;
  const AppbarSearchable(
    this.controller,
    this.appSize, {
    required this.backButton,
    this.searchSubmitted,
    required this.textController,
    super.key,
  });

  @override
  State<AppbarSearchable> createState() => _AppbarSearchableState();
}

class _AppbarSearchableState extends State<AppbarSearchable> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          children: [
            IconButton(
                onPressed: widget.backButton,
                icon: const Icon(Icons.arrow_back)),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: widget.textController,
                  autofocus: true,
                  // onChanged: widget.searchChange,
                  onFieldSubmitted: widget.searchSubmitted,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    suffixIcon: widget.controller.filterQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              widget.textController.text = '';
                              widget.controller
                                  .filter('', [false, false, false, false]);
                            },
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
