//
//  ViewController.swift
//  UITabelView練習
//
//  Created by 黃柏瀚 on 2022/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var theTabelView: UITableView!
    
    var contents:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTabelView.dataSource = self
        theTabelView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefult = UserDefaults.standard
        if let c = userDefult.value(forKey: "contents") as? [[String : String]]
        {
            contents = c
        }
        theTabelView.reloadData()
    }
    
    /**
        * 實作TableView方法，自動出現左滑功能
       **/
       func tableView(_ tableView: UITableView,
                      commit editingStyle: UITableViewCell.EditingStyle,
                               forRowAt indexPath: IndexPath)
       {
           let _:Int = indexPath.row
           
           contents.remove(at: indexPath.row)
           let userDefult = UserDefaults.standard
           userDefult.setValue(self.contents, forKey: "contents")
           userDefult.synchronize()
           self.theTabelView.reloadData()
           //=========
           // 操作
           //=========
           tableView.reloadData() // 更新tableView
       }
       
       /**
        * 自訂delete的文字為刪除
        */
       func tableView(_ tableView: UITableView,
                               titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath)
               -> String?
       {
           return "刪除"
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell") as? MyTableViewCell
        cell?.headerImg.clipsToBounds = true
        cell?.headerImg.layer.cornerRadius = 20
        cell?.phone.text = contents[indexPath.row]["phone"]
        cell?.name.text = contents[indexPath.row]["name"]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)-\(indexPath.row)")
        let name = contents[indexPath.row]["name"] ?? ""
        let phone = contents[indexPath.row]["phone"] ?? ""
        
        let alert = UIAlertController(title: "選項",
                                      message: "你選擇了: \(name) \(phone)",
                                      preferredStyle: .alert)
        
        let deleteAction = UIAlertAction.init(title: "刪除", style: .cancel) { alert in
            print("Delete Action")
            self.contents.remove(at: indexPath.row)
            let userDefult = UserDefaults.standard
            userDefult.setValue(self.contents, forKey: "contents")
            userDefult.synchronize()
            self.theTabelView.reloadData()
        }
        
        alert.addAction(deleteAction)
        
        let okAction = UIAlertAction(title: "我知道了", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
   
    @IBAction func sort(_ sender: Any) {
        print("test")
        contents.sort { item1, item2 in
            let name1 = item1["name"] ?? ""
            let name2 = item2["name"] ?? ""
            return name1 < name2
        }
        theTabelView.reloadData()
        }
   
}
