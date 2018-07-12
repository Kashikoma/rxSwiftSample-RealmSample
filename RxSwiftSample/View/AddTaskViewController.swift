//
//  AddTaskViewController.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/20.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa

class AddTaskViewController : UIViewController {
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var titleTextFIeld: UITextField!
    
    let viewModel = AddTaskViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextFIeld.rx.text.orEmpty.bind(to: viewModel.title).disposed(by: disposeBag)
        viewModel.isValid.map{ $0 }.bind(to: addBtn.rx.isEnabled).disposed(by: disposeBag)
        addBtn.rx.tap.subscribe(onNext: { _ in
            self.viewModel.addTitleData()
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
