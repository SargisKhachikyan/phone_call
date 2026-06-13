import 'package:flutter/material.dart';
import 'package:ios_phone_call/presentation/phone_calls_screen/models/single_phone_card.dart';

class SingleCallCard extends StatefulWidget {
  final SinglePhoneCard call;

  const SingleCallCard({
    super.key,
    required this.call,
  });

  @override
  State<SingleCallCard> createState() => _SingleCallCardState();
}

class _SingleCallCardState extends State<SingleCallCard> {
  @override
  Widget build(BuildContext context) {
    final call = widget.call;
    final fullName = '${call.name} ${call.lastName}';
    final isGoingOrIncoming = call.isoutgoing ? 'Outgoing' : 'Incoming';
    final isGoingOrIncomingIcon =
        call.isoutgoing ? Icons.call_made_rounded : Icons.call_received_rounded;
    final isGoingOrIncomingColor =
        call.isoutgoing ? const Color(0xFF34C759) : const Color(0xFFFF453A);

    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fullName,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(isGoingOrIncomingIcon,
                        size: 15, color: isGoingOrIncomingColor),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        isGoingOrIncoming,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xFFAEAEB2),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            call.time,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.info_outline_rounded,
            color: Color(0xFF0A84FF),
            size: 22,
          ),
        ],
      ),
    );
  }
}
