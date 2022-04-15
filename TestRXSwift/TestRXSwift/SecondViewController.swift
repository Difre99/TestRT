//
//  SecondViewController.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 15/04/22.
//

import UIKit
import RxSwift

class SecondViewController: UIViewController {
    let observable = Observable<String>.create { (observer) -> Disposable in
        observer.onNext("aaaa")
        observer.onCompleted()
        return Disposables.create()
    }
    
    var testArr = ["a", "b", "c", "d", "e"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        observable.subscribe(onNext: { print($0) },
                             onError: { _ in print("error") },
                             onCompleted: { print("completed") },
                             onDisposed: { print("disposed")
        })
        
        var observableArr = Observable.from(self.testArr)
        
        observableArr.subscribe(onNext: {
            print($0)
        })
        
        testArr.append("f")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let counter = myInterval(.milliseconds(100))
//
//        print("Started ----")
//
//        let subscription = counter
//            .subscribe(onNext: { n in
//                print(n)
//            })
//
//
//        Thread.sleep(forTimeInterval: 0.5)
//
//        subscription.dispose()
//
//        print("Ended ----")
    }

    func myInterval(_ interval: DispatchTimeInterval) -> Observable<Int> {
        return Observable.create { observer in
            print("Subscribed")
            let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
            timer.schedule(deadline: DispatchTime.now() + interval, repeating: interval)

            let cancel = Disposables.create {
                print("Disposed")
                timer.cancel()
            }

            var next = 0
            timer.setEventHandler {
                if cancel.isDisposed {
                    return
                }
                observer.on(.next(next))
                next += 1
            }
            timer.resume()

            return cancel
        }
    }
    
    func testLifeCycleObservable(){
        
    }
}
