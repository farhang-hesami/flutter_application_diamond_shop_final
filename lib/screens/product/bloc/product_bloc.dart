import 'package:bloc/bloc.dart';
import 'package:flutter_application_diamond_shop_final/data/models/product.dart';
import 'package:flutter_application_diamond_shop_final/data/services/product.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productServise;
  ProductBloc(this.productServise) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      //Latest
      if (event is LatestProductsPageStarted) {
        emit(GetLatestProductLoading());
        try {
          var response = await productServise.getLatestProducts();
          emit(GetLatestProductSuccess(response));
        } catch (e) {
          emit(GetLatestProductError('Error...!'));
        }
      }
      //Popular
      if (event is PopularProductsPageStarted) {
        emit(GetPopularProductLoading());
        try {
          var response = await productServise.getPopularProducts();
          emit(GetPopularProductSuccess(response));
        } catch (e) {
          emit(GetPopularProductError('Error...!'));
        }
      }
      ////Detail
      if (event is DetailProductPageStarted) {
        emit(GetProductDetailLoading());
        try {
          var response = await productServise.getDetailProduct(event.productId);
          emit(GetProductDetailSuccess(response));
        } catch (e) {
          emit(GetProductDetailError('Error...!'));
        }
      }

      ///Comments
      if (event is SendProductComment) {
        emit(SendProductCommentLoading());
        try {
          await productServise.sendProductComment(event.comment);
          emit(SendProductCommentSuccess());
        } catch (e) {
          emit(SendProductCommentError('Error...!'));
        }
      }
    });
  }
}
