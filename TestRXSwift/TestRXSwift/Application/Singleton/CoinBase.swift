//
//  CoinBase.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 19/04/22.
//

import Foundation
import Alamofire

struct Coin: Decodable{
    let id: String?
    let name: String?
    let min_size: Float?
}

class CoinBase{
    
    static let shared = CoinBase()
    private var coins: [Coin] = []
    
    private init (){
//        let request = AF.request("https://api.coinbase.com/v2/currencies", method: .get)
//            request.responseJSON { (data) in
////                coins = try JSONDecoder().decode([Coin].self, from: data)
//                print(data)
//            }
        
        
        AF.request("https://api.coinbase.com/v2/currencies", method: .get, headers: nil)
         .validate()
         .responseJSON { response in

            switch (response.result) {

                case .success( _):

                do {
                    let users = try JSONDecoder().decode([Coin].self, from: response.data!)
                    print(users)

                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }

                 case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
             }
         }
    }
}
