//
//  APICalling.swift
//  test-rxswift
//
//  Created by Trung Dang on 27/07/2023.
//

import Foundation
import RxSwift
import Alamofire

public enum RequestType: String {
    case GET, POST, PUT,DELETE
}


class APIRequest {
    let baseURL = URL(string: "https://api.printful.com/countries")!
    var method = RequestType.GET
    var parameters = [String: String]()
    
    func request(with baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL)
           request.httpMethod = method.rawValue
           request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
       }
    
}

class APICalling {
    public static let shared: APICalling = APICalling()
    
    // create a method for calling api which is return a Observable
    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            AF.request(apiRequest.baseURL).response(completionHandler: { response in
                do {
                    let model: CountryModel = try JSONDecoder().decode(CountryModel.self, from: response.data ?? Data())
                    
                    
                    let isMainThread = Thread.isMainThread
                    let threadName = isMainThread ? "Main Thread" : Thread.current.name
                    print("\n\n 😀 Queue call API: \(threadName)")
                    
                    observer.onNext(model.result as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            
            
            return Disposables.create()
        }
    }
}
