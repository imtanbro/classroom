import 'package:classroom/models/questionModel.dart';
import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, desc, correctAnswer, optionSelected;

  OptionTile({this.option, this.correctAnswer, this.desc, this.optionSelected});
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.desc == widget.optionSelected
                        ? widget.optionSelected == widget.correctAnswer
                            ? Colors.green.withOpacity(0.7)
                            : Colors.red.withOpacity(0.7)
                        : Colors.grey)),
            child: Text(
              "${widget.option}",
              style: TextStyle(
                color: widget.optionSelected == widget.desc
                    ? widget.correctAnswer == widget.optionSelected
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.blue,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.desc,
            style: TextStyle(
              fontSize: 17,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

