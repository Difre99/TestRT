//
//  CoinBase.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 19/04/22.
//

import Foundation
import Alamofire
import RxSwift

struct CoinResponse: Codable{
    let data: [Coin]?
}

struct Coin: Codable{
    let id: String?
    let name: String?
    let min_size: String?
}

class CoinBase{
    
    static let shared = CoinBase()
    var coins: [Coin] = []
    
    
    private init (){}
    
    public func callApi (refresh: Bool){
        if (coins.isEmpty){
            coins = [
                Coin(id: "1", name: "Pino", min_size: "AAA"),
                Coin(id: "1", name: "Pino", min_size: "AAA"),
                Coin(id: "1", name: "Pino", min_size: "AAA"),
                Coin(id: "1", name: "Pino", min_size: "AAA"),
                Coin(id: "1", name: "Pino", min_size: "AAA")

            ]
        }
        
//        if !refresh || coins.isEmpty{
//            print("calling Api..")
//            let endpoint = "https://api.coinbase.com/v2/currencies"
//            AF.request(endpoint, method: .get).responseJSON { response in
//                guard let itemsData = response.data else {
//                    print("Fail")
//                  return
//                }
//                do {
//                    let decoder = JSONDecoder()
//                    //TODO: -Fare con observable
//                    let items: CoinResponse = try decoder.decode(CoinResponse.self, from: itemsData)
//                    DispatchQueue.main.async {
//                        self.coins = items.data!
//                        print("Succes")
////                        print(self.coins)
////                        return self.coins
//                    }
//                } catch {
//                    print("Fail \(error)")
//                }
//            }
//        }
    }
}

