//
//  CoinBaseViewController.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 19/04/22.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class CoinBaseViewController: UIViewController {


    @IBOutlet weak var coinsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoinBase.shared
        registerTableViewCell()
    }
    
    private func registerTableViewCell(){
        self.coinsTableView?.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinTableViewCell")
    }

}
