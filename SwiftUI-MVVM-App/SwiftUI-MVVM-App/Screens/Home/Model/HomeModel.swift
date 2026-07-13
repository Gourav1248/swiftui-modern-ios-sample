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

struct ErrorHandlingDataResponse: Codable {
   var data: [String: String]?
   var error: ErrorDataModel? = ErrorDataModel()
}

struct ErrorDataModel: Codable {
   var status: Int? = Int()
   var name: String? = String()
   var message: String? = String()
   var details: [String: String]? = [String: String]()
}
