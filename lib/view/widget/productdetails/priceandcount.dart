
import 'package:flutter/material.dart';
import 'package:newflutter/core/constant/color.dart';
import 'package:newflutter/core/constant/imgaeasset.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCountItems(
      {Key? key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
             Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                // height: 30,
                decoration:
                    BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 255, 0, 0))),
                child: Text(
                  "2",
                  style: const TextStyle(fontSize: 20, height: 1.1,color:Colors.black),
                )),
            IconButton(onPressed: (){}, icon: const Icon(Icons.hotel),color: Colors.orangeAccent ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                // height: 30,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  count,
                  style: const TextStyle(fontSize: 20, height: 1.1),
                )),
            IconButton(onPressed: (){}, icon: const Icon(Icons.wc_rounded),color: Colors.orangeAccent,),
          ],
        ),
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontSize: 22, height: 1.1),
        )
      ],
    );
  }
}