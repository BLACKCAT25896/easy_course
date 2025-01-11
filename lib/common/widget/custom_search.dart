import 'package:flutter/material.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';


class CustomSearch extends StatefulWidget {
  final String? hintText;
  final TextEditingController searchController;
  final Function()? onSearch;
  final Function()? reset;
  final double? horizontalPadding;
  const CustomSearch({super.key, required this.hintText, required this.searchController, this.onSearch, this.reset, this.horizontalPadding});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding?? Dimensions.paddingSizeDefault, vertical: 10),
      child: Stack(children: [
        ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
            child: SizedBox(height: 50 , width: MediaQuery.of(context).size.width)),

        Container(width : MediaQuery.of(context).size.width, height:  50 ,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
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
                    hintStyle: textRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),
                    border: InputBorder.none,
                    prefixIconConstraints:  const BoxConstraints(maxHeight: 30),
                    prefixIcon: const CustomImage(image: Images.profile, height: 40,localAsset: true),
                    suffixIcon: widget.searchController.text.isNotEmpty? InkWell(
                        onTap: (){
                          setState(() {
                            widget.searchController.clear();

                          });

                        },
                        child: Padding(padding: const EdgeInsets.only(bottom: 3.0),
                          child: Icon(Icons.clear, color: Theme.of(context).colorScheme.error),
                        )):const SizedBox(),
                  ),
                ),
              ),

            ),
            ),

            InkWell(onTap: widget.onSearch,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(padding: const EdgeInsets.all(5),
                  width: 60,height: 50 ,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child:  Center(child: Text("Post", style: textRegular.copyWith(color: Colors.white))),
                ),
              ),
            )


          ]),
        ),
      ]),
    );
  }
}
