//
//  WebService.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 02/02/26.
//
import Foundation
import Alamofire
import SVProgressHUD

class WebService {
  
  static let shared = WebService()
  private var HUD = SVProgress()
  
  private init(){} 
  
  private func checkInternetConnection() throws {
    if Reachability.isConnectedToNetwork() == false {
      throw NetworkError.noInternet
    }
  }
} 
  
extension WebService {
  func GetWebAPIData<T: Decodable>(param parameters: [String: Any]?, endPointName: String, headers: [String: String]) async throws -> T {
    do {
      try checkInternetConnection()
       //DispatchQueue.main.async {
      self.HUD.show()
       //}

      
      let request = SessionManager.shared.request(Server.BaseUrl + endPointName, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(headers))
      
      let response = await request.serializingDecodable(T.self).response
      return try handleResponse(response)
    } catch {
      self.HUD.hide()
      ErrorHandler.shared.handle(error)
      throw error
    }
  }
  
  func PostWebAPIData<T: Decodable>(param parameters: [String: Any]?, endPointName: String, headers: [String: String]) async throws -> T {
    do {
      
      dPrint("endPointName = \(endPointName), param = \(parameters), headers = \(headers)")
      
      try checkInternetConnection()
       DispatchQueue.main.async {
          self.HUD.show()
       }

      let request = SessionManager.shared.request(
        Server.BaseUrl + endPointName,
        method: .post,
        parameters: parameters,
        encoding: JSONEncoding.default,
        headers: HTTPHeaders(headers))
      
      request.cURLDescription() { curl in 
        dPrint("request = \(curl)")
      }
      
      
      
      let response = await request.serializingDecodable(T.self).response
      return try handleResponse(response)
    } catch {
      self.HUD.hide()
      ErrorHandler.shared.handle(error)
      throw error
    }
  }
  
  func handleResponse<T: Decodable>(_ response: AFDataResponse<T>) throws -> T {
    
    dPrint("response = \(response)")
    self.HUD.hide()
    
    guard let statusCode = response.response?.statusCode else {
      throw NetworkError.unknown
    }
    
    dPrint("statusCode = \(statusCode)")
    
    switch statusCode {
    case 200:
      // Success – return data
      if let value = response.value {
        // Optional: show toast/message for 200
       
        return value
      } else {
        throw NetworkError.decodingError
      }
      
    case 401:
      throw NetworkError.unauthorized
    case 403:
      throw NetworkError.forbidden
    case 404:
      throw NetworkError.notFound
    case 500...599:
      throw NetworkError.serverError("Server Error: \(statusCode)")
    default:
      throw NetworkError.unknown
    }
  }
  
  func convertToDictionary<T: Encodable>(_ encodable: T) -> [String: Any]? {
    do {
      let data = try JSONEncoder().encode(encodable)
      let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
      return dict
    } catch {
      print(error)
      return nil
    }
  }
}


class SessionManager {
  static let shared: Session = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30 // seconds
    configuration.timeoutIntervalForResource = 60 // seconds
    
    return Session(configuration: configuration)
  }()
  
  private init() {}
}
