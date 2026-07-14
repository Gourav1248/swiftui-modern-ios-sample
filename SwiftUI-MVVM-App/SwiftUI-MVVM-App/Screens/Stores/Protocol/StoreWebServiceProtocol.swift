//
//  StoreWebServiceProtocol.swift
//  SwiftUI-MVVM-App
//
//  Created by Gourav Joshi on 13/07/26.
//

import Foundation
import Combine

protocol StoreWebServiceProtocol {
   func fetchStoreBanners() async throws -> StoreBannersDataResponse
   func fetchStoreTags() async throws -> StoreTagsDataResponseModel
   func fetchAllStoresAsync(isPopulateLogo: Bool,
                            isPopulateCashBack: Bool,
                            pageSize: Int,
                            pageNo: Int,
                            status: String,
                            sort: String,
                            storeTag: String,
                            categories: String,
                            filterBy: String,
                            shippingLocations: String,
                            searchText: String) async throws -> StoresDataResponseModel
   
}

extension StoresWebService : StoreWebServiceProtocol {

}


