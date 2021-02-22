import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/utils/util.dart';

/// [Item]
class Item extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool useEmoji;
  final TextStyle textStyle;
  final bool withCountryNames;
  final double width;

  const Item({
    Key key,
    this.country,
    this.showFlag,
    this.useEmoji,
    this.textStyle,
    this.width,
    this.withCountryNames = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 12.0),
          _Flag(
            country: country,
            showFlag: showFlag,
            useEmoji: useEmoji,
          ),
          SizedBox(width: 12.0),
          Text(
            '${(country?.dialCode ?? '')}',
            textDirection: TextDirection.ltr,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class _Flag extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool useEmoji;

  const _Flag({Key key, this.country, this.showFlag, this.useEmoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return country != null && showFlag
        ? Container(
            child: useEmoji
                ? Text(
                    Utils.generateFlagEmojiUnicode(country?.alpha2Code ?? ''),
                    style: Theme.of(context).textTheme.headline5,
                  )
                : country?.flagUri != null
                    ? Image.asset(
                        country?.flagUri,
                        width: 32.0,
                        package: 'intl_phone_number_input',
                      )
                    : SizedBox.shrink(),
          )
        : SizedBox.shrink();
  }
}
