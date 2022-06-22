//
//  InputViewController.swift
//  UITabelView練習
//
//  Created by 黃柏瀚 on 2022/3/28.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    var contents:[[String:String]] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefult = UserDefaults.standard
        if let c = userDefult.value(forKey: "contents") as? [[String : String]]
        {
            contents = c
        }
    }
    @IBAction func inputClicked(_ sender: Any) {
        let name = nameTF.text ?? ""
        let phone = phoneTF.text ?? ""
        
        if name.count == 0 {
            let alert = UIAlertController.init(title: "錯誤",
                                               message: "姓名不能為空白",
                                               preferredStyle: .alert)
            
            let action = UIAlertAction.init(title: "OK",
                                            style: .default,
                                            handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        if phone.count == 0 {
            let alert = UIAlertController.init(title: "錯誤", message: "電話不能為空白", preferredStyle: .alert)
            
            let action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
    }
        if phone.count < 10 {
            let alert = UIAlertController.init(title: "提示", message: "電話號碼至少10碼", preferredStyle: .alert)
            
            let action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        
    }
        
    let content = ["name":name,"phone":phone]
        
        contents.append(content)
        
        let userDefult = UserDefaults.standard
        userDefult.setValue(contents, forKey: "contents")
        userDefult.synchronize()
        phoneTF.text = ""
        nameTF.text = ""
    
}
}
