//
//  ViewController.swift
//  HotAndCold
//
//  Created by 박진수 on 2021/01/06.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subject = PublishSubject<Int>()
        let observableToDriver = Observable<Int>.create { create in
            create.onNext(1)
            create.onNext(2)
            return Disposables.create()
        }.asDriver(onErrorJustReturn: 0)
        
        observableToDriver.drive(onNext: {
            print($0)
        }).disposed(by: disposeBag)
        
        observableToDriver.drive(onNext: {
            print($0)
        }).disposed(by: disposeBag)
        
        
        
        let driver = subject.asDriver(onErrorJustReturn: 0)
        
        subject.onNext(1)
        subject.onNext(2)
        
        driver.drive(onNext: {
            print($0)
        }).disposed(by: disposeBag)
        
        
        subject.onNext(3)
        subject.onNext(4)
        
        
        
    }


}

