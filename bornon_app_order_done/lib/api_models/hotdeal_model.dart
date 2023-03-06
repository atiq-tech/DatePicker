class HotDealProductModel {
  int? id;
  String? productCode;
  String? name;
  String? slug;
  String? model;
  int? price;
  String? simillarPorduct;
  String? similarDiscount;
  String? sizeId;
  String? colorId;
  int? categoryId;
  int? subCategoryId;
  int? brandId;
  String? discount;
  String? shortDetails;
  String? description;
  String? mainImage;
  String? thumbImage;
  String? smallImage;
  String? sizeguide;
  String? isFeature;
  String? isCollectionTitle1;
  String? isCollectionTitle2;
  String? isDeal;
  String? isTailoring;
  Null? tailoringCharge;
  String? isTrending;
  String? newArrival;
  Null? dealStart;
  Null? dealEnd;
  String? rewardPoint;
  int? status;
  int? quantity;
  String? saveBy;
  Null? updateBy;
  String? ipAddress;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? currencyAmount;
  Category? category;
  List<ProductImage>? productImage;

  HotDealProductModel(
      {this.id,
      this.productCode,
      this.name,
      this.slug,
      this.model,
      this.price,
      this.simillarPorduct,
      this.similarDiscount,
      this.sizeId,
      this.colorId,
      this.categoryId,
      this.subCategoryId,
      this.brandId,
      this.discount,
      this.shortDetails,
      this.description,
      this.mainImage,
      this.thumbImage,
      this.smallImage,
      this.sizeguide,
      this.isFeature,
      this.isCollectionTitle1,
      this.isCollectionTitle2,
      this.isDeal,
      this.isTailoring,
      this.tailoringCharge,
      this.isTrending,
      this.newArrival,
      this.dealStart,
      this.dealEnd,
      this.rewardPoint,
      this.status,
      this.quantity,
      this.saveBy,
      this.updateBy,
      this.ipAddress,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.currencyAmount,
      this.category,
      this.productImage});

  HotDealProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCode = json['product_code'];
    name = json['name'];
    slug = json['slug'];
    model = json['model'];
    price = json['price'];
    simillarPorduct = json['simillar_porduct'];
    similarDiscount = json['similar_discount'];
    sizeId = json['size_id'];
    colorId = json['color_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    brandId = json['brand_id'];
    discount = json['discount'];
    shortDetails = json['short_details'];
    description = json['description'];
    mainImage = json['main_image'];
    thumbImage = json['thumb_image'];
    smallImage = json['small_image'];
    sizeguide = json['sizeguide'];
    isFeature = json['is_feature'];
    isCollectionTitle1 = json['is_collection_title_1'];
    isCollectionTitle2 = json['is_collection_title_2'];
    isDeal = json['is_deal'];
    isTailoring = json['is_tailoring'];
    tailoringCharge = json['tailoring_charge'];
    isTrending = json['is_trending'];
    newArrival = json['new_arrival'];
    dealStart = json['deal_start'];
    dealEnd = json['deal_end'];
    rewardPoint = json['reward_point'];
    status = json['status'];
    quantity = json['quantity'];
    saveBy = json['save_by'];
    updateBy = json['update_by'];
    ipAddress = json['ip_address'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currencyAmount = json['currency_amount'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_code'] = this.productCode;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['model'] = this.model;
    data['price'] = this.price;
    data['simillar_porduct'] = this.simillarPorduct;
    data['similar_discount'] = this.similarDiscount;
    data['size_id'] = this.sizeId;
    data['color_id'] = this.colorId;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['brand_id'] = this.brandId;
    data['discount'] = this.discount;
    data['short_details'] = this.shortDetails;
    data['description'] = this.description;
    data['main_image'] = this.mainImage;
    data['thumb_image'] = this.thumbImage;
    data['small_image'] = this.smallImage;
    data['sizeguide'] = this.sizeguide;
    data['is_feature'] = this.isFeature;
    data['is_collection_title_1'] = this.isCollectionTitle1;
    data['is_collection_title_2'] = this.isCollectionTitle2;
    data['is_deal'] = this.isDeal;
    data['is_tailoring'] = this.isTailoring;
    data['tailoring_charge'] = this.tailoringCharge;
    data['is_trending'] = this.isTrending;
    data['new_arrival'] = this.newArrival;
    data['deal_start'] = this.dealStart;
    data['deal_end'] = this.dealEnd;
    data['reward_point'] = this.rewardPoint;
    data['status'] = this.status;
    data['quantity'] = this.quantity;
    data['save_by'] = this.saveBy;
    data['update_by'] = this.updateBy;
    data['ip_address'] = this.ipAddress;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['currency_amount'] = this.currencyAmount;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.productImage != null) {
      data['product_image'] =
          this.productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? details;
  String? image;
  String? thumbimage;
  String? smallimage;
  String? status;
  String? isHomepage;
  String? isMenu;
  String? saveBy;
  Null? updatedBy;
  String? ipAddress;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.details,
      this.image,
      this.thumbimage,
      this.smallimage,
      this.status,
      this.isHomepage,
      this.isMenu,
      this.saveBy,
      this.updatedBy,
      this.ipAddress,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    details = json['details'];
    image = json['image'];
    thumbimage = json['thumbimage'];
    smallimage = json['smallimage'];
    status = json['status'];
    isHomepage = json['is_homepage'];
    isMenu = json['is_menu'];
    saveBy = json['save_by'];
    updatedBy = json['updated_by'];
    ipAddress = json['ip_address'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['details'] = this.details;
    data['image'] = this.image;
    data['thumbimage'] = this.thumbimage;
    data['smallimage'] = this.smallimage;
    data['status'] = this.status;
    data['is_homepage'] = this.isHomepage;
    data['is_menu'] = this.isMenu;
    data['save_by'] = this.saveBy;
    data['updated_by'] = this.updatedBy;
    data['ip_address'] = this.ipAddress;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductImage {
  int? id;
  int? productId;
  String? otherMainImage;
  String? otherMediamImage;
  String? otherSmallImage;
  String? createdAt;
  String? updatedAt;

  ProductImage(
      {this.id,
      this.productId,
      this.otherMainImage,
      this.otherMediamImage,
      this.otherSmallImage,
      this.createdAt,
      this.updatedAt});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    otherMainImage = json['other_main_image'];
    otherMediamImage = json['other_mediam_image'];
    otherSmallImage = json['other_small_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['other_main_image'] = this.otherMainImage;
    data['other_mediam_image'] = this.otherMediamImage;
    data['other_small_image'] = this.otherSmallImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}