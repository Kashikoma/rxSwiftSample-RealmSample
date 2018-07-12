//
//  TaskTableViewController.swift
//  RxSwiftSample
//
//  Created by kashikomasweet on 2018/06/18.
//  Copyright © 2018年 kashikomasweet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskTableViewController :UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel:TaskTableViewModel = TaskTableViewModel()
    @IBOutlet weak var addBtn: UIBarButtonItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element.title)"
            }
            .disposed(by: disposeBag)
        
        
        tableView.rx
            .modelSelected(Item.self)
            .subscribe(onNext:  { value in
                print(value)
            })
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemDeleted.subscribe(onNext: {
            indexPath in
                self.viewModel.deleteData(path: indexPath.row)
                self.viewModel.reloadData()
        }).disposed(by: disposeBag)
        
        addBtn.rx.tap.subscribe(onNext:{ _ in
            let nextVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddTaskView") as UIViewController
            nextVc.modalTransitionStyle = .coverVertical
            self.present(nextVc,animated: true,completion: nil)
        }).disposed(by: disposeBag)
        
        editBtn.rx.tap.subscribe(onNext:{ _ in
            self.viewModel.clickEditBtn()
        }).disposed(by: disposeBag)
        viewModel.isEditMode.asObservable().subscribe(onNext: {newValue in
            self.tableView.setEditing(newValue, animated: true)
        }).disposed(by: disposeBag)
        
        viewModel.editBtnStr.asObservable().map{ $0 }.bind(to: editBtn.rx.title).disposed(by: disposeBag)
        
        viewModel.isEdit.asObservable().map{ $0 }.bind(to: editBtn.rx.isEnabled).disposed(by: disposeBag)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadData()
    }
}
