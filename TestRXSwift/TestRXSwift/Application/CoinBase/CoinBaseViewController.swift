//
//  CoinBaseViewController.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 19/04/22.
//

import UIKit
import RxSwift
import RxCocoa

class CoinBaseViewController: UIViewController {


    @IBOutlet weak var coinsTableView: UITableView!
    
    let coins = Observable.just(CoinBase.shared.coins)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        setupCellConfiguration()
        setupCellTapHandling()
    }
    
    private func registerTableViewCell(){
        print("registerTableViewCell")
        self.coinsTableView?.register(UINib(nibName: CoinTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: CoinTableViewCell.identifire)
    }
    
    private func setupCellConfiguration() {
        print("setupCellConfiguration")
        coins
          .bind(to: coinsTableView
            .rx //2
                    .items(cellIdentifier: CoinTableViewCell.identifire,
                   cellType: CoinTableViewCell.self)) {
                    row, coin, cell in
                    cell.configureCell(coin: coin)
          }
          .disposed(by: disposeBag) //5
      }
    
    private func setupCellTapHandling() {
        print("setupCellTapHandling")
        coinsTableView
          .rx
          .modelSelected(Coin.self)
          .subscribe(onNext: { [unowned self] chocolate in
//            let newValue =  ShoppingCart.sharedCart.chocolates.value + [chocolate]
//            ShoppingCart.sharedCart.chocolates.accept(newValue)
            if let selectedRowIndexPath = self.coinsTableView.indexPathForSelectedRow {
              self.coinsTableView.deselectRow(at: selectedRowIndexPath, animated: true)
            }
          })
          .disposed(by: disposeBag)
      }
}
