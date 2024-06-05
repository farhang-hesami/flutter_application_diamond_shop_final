import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/product.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/bloc/product_bloc.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:flutter_application_diamond_shop_final/utils/snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen(this.productId, {super.key});
  final int productId;
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is SendProductCommentSuccess) {
            BlocProvider.of<ProductBloc>(context)
                .add(DetailProductPageStarted(widget.productId));
            showCustomAlert(
              context,
              'نظر شما با موفقیت ثبت شد',
            );
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              color: AppColors.kWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kGray100,
                  offset: Offset(0.0, 0.75),
                  blurRadius: 8.0,
                ),
              ],
            ),
            height: 85.0,
            padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimary500,
                foregroundColor: AppColors.kWhite,
              ),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  BlocProvider.of<ProductBloc>(context).add(
                    SendProductComment(
                      Comments(
                        productId: widget.productId,
                        subject: subjectController.text,
                        text: textController.text,
                      ),
                    ),
                  );
                }
              },
              child: Text('ثبت نظر'),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('ثبت نظر'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: subjectController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'لطفا عنوان خود را وارد کنید';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'عنوان',
                ),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: textController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'لطفا نظر خود را وارد کنید';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'نظر',
                ),
                textInputAction: TextInputAction.done,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
