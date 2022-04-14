//
//  ViewController.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 14/04/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testDispose()
        
    }

    func testDispose(){
        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        let subscription = Observable<Int>.interval(.milliseconds(500), scheduler: scheduler)
            .subscribe { event in
                print(event)
            }
        print("CIAO1")
        Thread.sleep(forTimeInterval: 2.0)
        print("CIAO2")
        subscription.dispose()
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

}

