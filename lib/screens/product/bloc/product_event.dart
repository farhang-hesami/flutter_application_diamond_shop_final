part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class LatestProductsPageStarted extends ProductEvent {}

class PopularProductsPageStarted extends ProductEvent {}

class DetailProductPageStarted extends ProductEvent {
  final int productId;
  DetailProductPageStarted(this.productId);
}

class SendProductComment extends ProductEvent {
  final Comments comment;
  SendProductComment(this.comment);
}
