import 'package:flutter/material.dart';

Widget selectionsTextButon(String name, bool isActive, Function tapHandle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: tapHandle(),
          child: Text(
            name,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                 fontSize: 14,
                  fontFamily: "Orbitron"),
          )),
      Visibility(
        visible: isActive,
        child: const Text(
          "●",
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontFamily: "Orbitron"),
        ),
      ),
    ],
  );
}
