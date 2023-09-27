import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20http/model/product_model.dart';

class Producttile extends StatelessWidget {
  final Productmodel product;
  const Producttile(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            product.title!,
            maxLines: 2,
            style:
                GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${product.price!}",
            style: GoogleFonts.nunito(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
