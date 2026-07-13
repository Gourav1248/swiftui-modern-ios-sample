//
//  StoreModel.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 08/07/26.
//

import Foundation

struct StoresDataResponseModel: Codable {
   var data: [StoresDataModel]? = [StoresDataModel]()
   var meta: MetaDataModel? = MetaDataModel()
}

struct StoreDetailsDataResponseModel: Codable {
   var data: StoresDataModel? = StoresDataModel()
   var meta: MetaDataModel? = MetaDataModel()
}

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

struct StoreTagsDataResponseModel: Codable {
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

struct StoreBannersDataResponse: Codable {
   var data: StoreBannerDataModel? = StoreBannerDataModel()
   var meta: MetaDataModel? = MetaDataModel()
}

struct StoreBannerDataModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var locale: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
   var storeBanners: [BannersDataModel]? = [BannersDataModel]()
}

struct BannersDataModel: Codable {
   var id: Int? = Int()
   var title: String? = String()
   var subTitle: String? = String()
   var buttonText: String? = String()
   var deepLink: String? = String()
   var image: LogoDataModel? = LogoDataModel()
}
