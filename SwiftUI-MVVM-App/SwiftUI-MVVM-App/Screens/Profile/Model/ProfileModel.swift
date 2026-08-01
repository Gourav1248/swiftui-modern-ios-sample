//
//  ProfileModel.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 27/07/26.
//

import Foundation

struct UserActivitiesDataResponse: Codable {
   var activityDetails: [UserActivitiesDataModel]? = [UserActivitiesDataModel]()
}

struct UserActivitiesDataModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
   var description: String? = String()
   var store: StoresDataModel? = StoresDataModel()
   var deal: DealsAndVoucherModel? = DealsAndVoucherModel()
}

struct TransactionModelDataResponse: Codable {
   var transactions: [TransactionDataModel]? = [TransactionDataModel]()
}

struct TransactionDataModel: Codable {
   var id: Int? = Int()
   var documentId: String? = String()
   var createdAt: String? = String()
   var updatedAt: String? = String()
   var publishedAt: String? = String()
   var locale: String? = String()
   var transactionStatus: String? = String()
   var Amount: CGFloat? = CGFloat()
   var cashback: CGFloat? = CGFloat()
   var userCashback: CGFloat? = CGFloat()
   var cashbacPercentage: CGFloat? = CGFloat()
   var apiResponse: APIResponseDataModel? = APIResponseDataModel()
   var awinTransactionId: String? = String()
   var store: StoresDataModel? = StoresDataModel()
}

struct APIResponseDataModel: Codable {
   var id: Int? = Int()
   var url: String? = String()
   var type: String? = String()
   var ipHash: String? = String()
   var amended: Bool? = Bool()
   var campaign: String? = String()
   var orderRef: String? = String()
   var siteName: String? = String()
   var amendDate: String? = String()
   var clickDate: String? = String()
   var clickRefs: ClickRefModel? = ClickRefModel()
   var lapseTime: Int? = Int()
   var paymentId: Int? = Int()
   var saleAmount: AmountDataModel? = AmountDataModel()
   var amendReason: String? = String()
   var clickDevice: String? =  String()
   var publisherId: Int? = Int()
   var declineReason: String? = String()
   var advertiserCost: AmountDataModel? = AmountDataModel()
   var oldSaleAmount: CGFloat? = CGFloat()
   var basketProducts: String? = String()
   var customerCountry: String? = String()
   var validationDate: String? = String()
   var paidToPublisher: Bool? = Bool()
   var transactionDate: String? = String()
   var voucherCodeUsed: Bool? = Bool()
   var commissionAmount: AmountDataModel? = AmountDataModel()
   var commissionStatus: String? = String()
   var customParameters: String? = String()
   var transactionParts: [TransactionPartsDataModel]? = [TransactionPartsDataModel]()
   var advertiserCountry: String? = String()
   var transactionDevice: String? = String()
   var originalSaleAmount: CGFloat? = CGFloat()
   var transactionQueryId: Int? = Int()
   var customerAcquisition: String? = String()
   var oldCommissionAmount: CGFloat? = CGFloat()
   var trackedCurrencyAmount: CGFloat? = CGFloat()
   var commissionSharingPublisherId: Int? = Int()
   var commissionSharingSelectedRatePublisherId: Int? = Int()
}

struct AmountDataModel: Codable {
   var amount: CGFloat? = CGFloat()
   var currency: String? = String()
}

struct ClickRefModel: Codable {
   var clickRef: String? = String()
   var clickRef2: String? = String()
}

struct TransactionPartsDataModel: Codable {
   var amount: CGFloat? = CGFloat()
   var trackedParts: [TrackedPartsDataModel]? = [TrackedPartsDataModel]()
   var advertiserCost: CGFloat? = CGFloat()
   var commissionAmount: CGFloat? = CGFloat()
   var commissionGroupId: Int? = Int()
   var commissionGroupCode: String? = String()
   var commissionGroupName: String? = String()

}

struct TrackedPartsDataModel: Codable {

}
