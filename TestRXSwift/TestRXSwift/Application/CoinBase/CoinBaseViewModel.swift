//
//  CoinBaseViewModel.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 20/04/22.
//

import Foundation
import RxSwift
import RxCocoa

class CoinBaseViewModel{
    
    let coins = PublishSubject<[Coin]>()
    
    func fetchCoinList(){
        print("fetchCoinList")
        
//        DispatchQueue.main.async {
//            CoinBase.shared.callApi(refresh: true)
//        }
        CoinBase.shared.callApi(refresh: true)
        coins.onNext(CoinBase.shared.coins)
        coins.onCompleted()
    }
    
}
