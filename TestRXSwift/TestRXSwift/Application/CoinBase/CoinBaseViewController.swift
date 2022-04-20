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
    private let disposeBag = DisposeBag()
    private let viewModel = CoinBaseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinsTableView.rx.setDelegate(self).disposed(by: disposeBag)
        bindTableView()
        //        setupCellConfiguration()
        //        setupCellTapHandling()
    }
    
    @IBAction func buttonReloadData(_ sender: Any) {
        CoinBase.shared.callApi(refresh: true)
        coinsTableView.reloadData()
    }
    
    private func bindTableView() {
        print("bindTableView")
        
        coinsTableView.register(UINib(nibName: CoinTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: CoinTableViewCell.identifire)
        
        viewModel.coins.bind(to: coinsTableView.rx.items(cellIdentifier: CoinTableViewCell.identifire, cellType: CoinTableViewCell.self)) { (row,coin,cell) in
            cell.coin = coin
        }.disposed(by: disposeBag)
        
        coinsTableView.rx.modelSelected(Coin.self).subscribe(onNext: { item in
            print("SelectedItem: \(item.name)")
        }).disposed(by: disposeBag)
        
        viewModel.fetchCoinList()
    }
    
    
    
//    
//    
//    
//    private func setUpCoinsTableView(){
//        registerTableViewCell()
//    }
//    
//    private func registerTableViewCell(){
//        print("registerTableViewCell")
//        self.coinsTableView?.register(UINib(nibName: CoinTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: CoinTableViewCell.identifire)
//    }
//    
//    private func setupCellConfiguration() {
//        print("setupCellConfiguration")
//        coins
//          .bind(to: coinsTableView
//            .rx //2
//                    .items(cellIdentifier: CoinTableViewCell.identifire,
//                   cellType: CoinTableViewCell.self)) {
//                    row, coin, cell in
////                    cell.configureCell(coin: coin)
//          }
//          .disposed(by: disposeBag) //5
//      }
//    
//    private func setupCellTapHandling() {
//        print("setupCellTapHandling")
//        coinsTableView
//          .rx
//          .modelSelected(Coin.self)
//          .subscribe(onNext: { [unowned self] chocolate in
////            let newValue =  ShoppingCart.sharedCart.chocolates.value + [chocolate]
////            ShoppingCart.sharedCart.chocolates.accept(newValue)
//            if let selectedRowIndexPath = self.coinsTableView.indexPathForSelectedRow {
//              self.coinsTableView.deselectRow(at: selectedRowIndexPath, animated: true)
//            }
//          })
//          .disposed(by: disposeBag)
//      }
}

extension CoinBaseViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
