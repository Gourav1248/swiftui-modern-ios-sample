//
//  HomeModel.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 22/04/26.
//

import Foundation

struct HomeDataResponseModel: Codable {
   var data: HomeDataModel? = HomeDataModel()
   var meta: MetaDataModel? = MetaDataModel()
}

struct HomeDataModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var title: String? = String()
   var locale: String? = String()
   var updatedAt: String? = String()
   var createdAt: String? = String()
   var publishedAt: String? = String()
   var bannerSection: BannerSectionModel? = BannerSectionModel()
   var bannerSlider: [BannerSliderModel]? = [BannerSliderModel]()
   var storesSection: StoresSectionModel? = StoresSectionModel()
   var voucherSection: VouchersSectionModel? = VouchersSectionModel()
   var referBanner: ReferBannerModel? = ReferBannerModel()
   var statsSection: StatsSectionModel? = StatsSectionModel()
}

struct BannerSectionModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var subTitle: String? = String()
   var logo: LogoDataModel? = LogoDataModel()
}

struct BannerSliderModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var subTitle: String? = String()
   var buttonText: String? = String()
   var deepLink: String? = String()
   var image: LogoDataModel? = LogoDataModel()
}

struct StoresSectionModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var featuredStores: [StoresDataModel]? = [StoresDataModel]()
}

struct VouchersSectionModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var featuredVouchers: [DealsAndVoucherModel]? = [DealsAndVoucherModel]()
}

struct ReferBannerModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var subTitle: String? = String()
   var btnText: String? = String()
}


struct StatsSectionModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var subTitle: String? = String()
   var tagLine: String? = String()
   var item: [ItemModel]? = [ItemModel]()
}

struct ItemModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var value: String? = String()
}

struct MetaDataModel: Codable {
   var pagination: PaginationModel? = PaginationModel()
}

struct PaginationModel: Codable {
   var page: Int? = Int()
   var pageSize: Int? = Int()
   var pageCount: Int? = Int()
   var total: Int? = Int()
}

// Stores Data Model

struct StoresDataModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var name: String? = String()
   var slug: String? = String()
   var storeId: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
   var description: String? = String()
   var displayUrl: String? = String()
   var clickThroughUrl: String? = String()
   var currencyCode: String? = String()
   var detailsDescription: String? = String()
   var isFeatured: Bool? = Bool()
   var storeTerms: String? = String()
   var deliveryLocation: [String]? = [String]()
   var paymentOption: [String]? = [String]()
   var isFav: Bool? = Bool()
   var logo: LogoDataModel? = LogoDataModel()
   var storeCashback:StoreCashBackDataModel? = StoreCashBackDataModel()
   var storeTag:[StoreTagsModel]? = [StoreTagsModel]()
   var categories: [StoreCategoriesModel]? = [StoreCategoriesModel]()
   var shippingLocations:[ShippingLocationsModel]? = [ShippingLocationsModel]()
}

struct StoreCashBackDataModel: Codable {
   var id: Int? = Int()
   var cashbackPercentage: CGFloat? = CGFloat()
   var minCashbackPercentage: CGFloat? = CGFloat()
   var maxCashbackPercentage: CGFloat? = CGFloat()
   var minCashbackAmount: CGFloat? = CGFloat()
   var maxCashbackAmount: CGFloat? = CGFloat()
}

struct TagsDataResponseModel: Codable {
   var data:[StoreTagsModel]? = [StoreTagsModel]()
   var meta: MetaDataModel? = MetaDataModel()
}

struct StoreTagsModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var tag: String? = String()
   var title: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
   var icon: LogoDataModel? = LogoDataModel()
   var isSelected: Bool? = false

   enum CodingKeys: String, CodingKey {
      case id = "id"
      case documentId = "documentId"
      case tag = "tag"
      case createdAt = "createdAt"
      case updatedAt = "updatedAt"
      case publishedAt = "publishedAt"
      case icon = "icon"
      case isSelected = "isSelected"
   }

   init(from decoder: any Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
      self.documentId = try values.decodeIfPresent(String.self, forKey: .documentId) ?? ""
      self.tag = try values.decodeIfPresent(String.self, forKey: .tag) ?? ""
      self.createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
      self.updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
      self.publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
      self.icon = try values.decodeIfPresent(LogoDataModel.self, forKey: .icon) ?? LogoDataModel()
      self.isSelected = try values.decodeIfPresent(Bool.self, forKey: .isSelected) ?? false
   }
}

struct StoreCategoriesModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var name: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
   var nameDe: String? = String()
}

struct ShippingLocationsModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var location: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
   var flagIcon: LogoDataModel? = LogoDataModel()
}

//Vouchers Data Model

struct DealsAndVoucherModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var name: String? = String()
   var code: String? = String()
   var value: String? = String()
   var startDate: String? = String()
   var expiryDate: String? = String()
   var type: String? = String()
   var numTimesUsed: Int? = Int()
   var usageLimit: Int? = Int()
   var updatedAt: String? = String()
   var createdAt: String? = String()
   var publishedAt: String? = String()
   var url: String? = String()
   var urlTracking: String? = String()
   var promotionId: String? = String()
   var description: String? = String()
   var terms: String? = String()
   var isFeatured: Bool? = Bool()
   var isFav: Bool? = Bool()
   var logo: LogoDataModel? = LogoDataModel()
   var store: StoresDataModel? = StoresDataModel()

}

struct VoucherWishListToggleRequestParams {
   var voucherId: String? = String()
}

struct VoucherBannersDataResponse: Codable {
   var data: VoucherBannerDataModel? = VoucherBannerDataModel()
   var meta: MetaDataModel? = MetaDataModel()
}

struct VoucherBannerDataModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var locale: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
  // var voucherBanners: [BannersDataModel]? = [BannersDataModel]()
}

