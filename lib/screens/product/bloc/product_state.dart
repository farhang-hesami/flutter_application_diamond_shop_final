part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

final class ProductInitial extends ProductState {}

/////Latest
class GetLatestProductSuccess extends ProductState {
  final ProductModel productModel;
  GetLatestProductSuccess(this.productModel);
}

class GetLatestProductError extends ProductState {
  final String error;
  GetLatestProductError(this.error);
}

class GetLatestProductLoading extends ProductState {}

///////////Popular

class GetPopularProductSuccess extends ProductState {
  final ProductModel productModel;
  GetPopularProductSuccess(this.productModel);
}

class GetPopularProductError extends ProductState {
  final String error;
  GetPopularProductError(this.error);
}

class GetPopularProductLoading extends ProductState {}

///////// Detail

class GetProductDetailSuccess extends ProductState {
  final ProductDetailModel productDetailModel;
  GetProductDetailSuccess(this.productDetailModel);
}

class GetProductDetailLoading extends ProductState {}

class GetProductDetailError extends ProductState {
  final String error;
  GetProductDetailError(this.error);
}
/////////Comments

class SendProductCommentSuccess extends ProductState {}

class SendProductCommentError extends ProductState {
  final String error;
  SendProductCommentError(this.error);
}

class SendProductCommentLoading extends ProductState {}
