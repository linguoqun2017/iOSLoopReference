//
//  ViewController.swift
//  Block演练
//
//  Created by PILIPALA on 2023/6/23.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        demo1()
    }
    
    func demo1() {
        loadData { str in
            print("回调代码\(str)")
        }
    }

    func loadData(finished:@escaping (_ str : String) -> ()) {
        Dispatch.DispatchQueue.global().async() {
            print("耗时操作")
            Dispatch.DispatchQueue.main.sync() {
                print("准备回调")
                finished("<html></html>")
            }
        }
    }

}

