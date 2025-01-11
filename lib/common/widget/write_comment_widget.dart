import 'package:flutter/material.dart';
import 'package:easy_course/common/widget/custom_image.dart';
import 'package:easy_course/util/dimensions.dart';
import 'package:easy_course/util/images.dart';
import 'package:easy_course/util/styles.dart';


class WriteCommentWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController searchController;
  final Function()? onSearch;
  final Function()? reset;
  final double? horizontalPadding;
  const WriteCommentWidget({super.key, required this.hintText, required this.searchController, this.onSearch, this.reset, this.horizontalPadding});

  @override
  State<WriteCommentWidget> createState() => _WriteCommentWidgetState();
}

class _WriteCommentWidgetState extends State<WriteCommentWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding?? Dimensions.paddingSizeDefault, vertical: 10),
      child: Stack(children: [
        ClipRRect(borderRadius: BorderRadius.circular(234),
            child: SizedBox(height: 60 , width: MediaQuery.of(context).size.width)),

        Container(width : MediaQuery.of(context).size.width, height:  60 ,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(234),
              border: Border.all(color: Theme.of(context).hintColor.withValues(alpha:.15))),
          child: Row(children: [
            Expanded(child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all( Radius.circular(Dimensions.paddingSizeDefault))),

              child: Padding(padding:  const EdgeInsets.symmetric(
                  vertical: Dimensions.paddingSizeExtraSmall,
                  horizontal: Dimensions.paddingSizeSmall),

                child: TextFormField(controller: widget.searchController,
                  textInputAction: TextInputAction.search,
                  maxLines: 1,
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
                  textAlignVertical: TextAlignVertical.center,
                  onFieldSubmitted: (val){

                  },
                  onChanged: (val){
                    setState(() {

                    });
                  },
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    isDense: true,

                    contentPadding: EdgeInsets.zero,
                    suffixIconConstraints: const BoxConstraints(maxHeight: 25),
                    hintStyle: textRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeDefault),
                    border: InputBorder.none,
                    prefixIconConstraints:  const BoxConstraints(maxHeight: 30),
                    prefixIcon: const CustomImage(image: Images.profile, height: 40,localAsset: true),

                  ),
                ),
              ),

            ),
            ),

            InkWell(onTap: widget.onSearch,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 50,height: 70 ,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.horizontal(right : Radius.circular(345))),
                  child:  const Center(child: CustomImage(image: Images.commentSend,width: 30, localAsset: true,)),
                ),
              ),
            )


          ]),
        ),
      ]),
    );
  }
}
