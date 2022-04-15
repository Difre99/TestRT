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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        testDispose()
        
    }
    
    func setUpButton(){
        self.disposeButton.titleLabel?.text = "Dispose"
    }
    
    func testDispose(){
        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        self.subscription = Observable<Int>.interval(.milliseconds(500), scheduler: scheduler)
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
        self.subscription?.dispose()
        let alert = UIAlertController(title: "Stop with dispose", message: "Not the best way to use observables.\n Number of events = \(self.a)", preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            print("Yes Pressed")
        }
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

