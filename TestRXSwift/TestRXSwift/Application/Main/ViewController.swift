//
//  ViewController.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 14/04/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
    @IBOutlet weak var disposeButton: UIButton!
    
    var subscription: Disposable?
    var a: Int = 0
    
    var disposeBag: DisposeBag?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        testDispose()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.a = 0
        let disposeBag = DisposeBag()
        self.disposeBag = disposeBag
        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        Observable<Int>.interval(.milliseconds(500), scheduler: scheduler)
            .subscribe { event in
                self.a += 1
//                print(event)
            }
            .disposed(by: disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        print("Deallocated DisposeBag")
        self.disposeBag = nil
        self.subscription?.dispose()
    }
    
    func setUpButton(){
        self.disposeButton.titleLabel?.text = "Dispose"
    }
    
    func testDispose(){
        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        self.subscription =  Observable<Int>.interval(.milliseconds(500), scheduler: scheduler)
            .subscribe { event in
                self.a += 1
                print(event)
            }
        print("CIAO1")
        Thread.sleep(forTimeInterval: 2.0)
        print("CIAO2")
        print("CIAO3")
        /*
         out:
         CIAO1
         next(0)
         next(1)
         next(2)
         next(3)
         CIAO2
         CIAO3
         */
    }
    
    
    @IBAction func disposeButtonTouchUpInside(_ sender: Any) {
        let alert = UIAlertController(title: "Stop with dispose", message: "Not the best way to use observables.\n Number of events = \(self.a)", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.subscription?.dispose()
            print("OK Pressed")
        }
        let pushAction = UIAlertAction(title: "Push", style: UIAlertAction.Style.default) {
            UIAlertAction in
            let vc = CoinBaseViewController(nibName: "CoinBaseViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        alert.addAction(okAction)
        alert.addAction(pushAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

