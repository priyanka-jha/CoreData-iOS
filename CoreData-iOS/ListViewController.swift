//
//  ListViewController.swift
//  CoreData-iOS
//
//  Created by Priyanka on 30/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit
protocol DataPass  {
    func data(object:[String:String], index:Int, isEdit:Bool)
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var student = [Student]()
    var delegate:DataPass!
    
    
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        student = DatabaseHelper.sharedInstance.getData()
        
        //hide default back button
        self.navigationItem.hidesBackButton = true
        
        //create custom back button
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back1"), for: .normal)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont(name: "System", size: 18)
        button.backgroundColor = UIColor.clear
        button.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0);
        button.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        button.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.labelName.text = student[indexPath.row].name
        cell.labelStream.text = student[indexPath.row].stream
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            student = DatabaseHelper.sharedInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["name":student[indexPath.row].name,"stream":student[indexPath.row].stream]
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //back button action
    @objc func back(_ sender: UIBarButtonItem) {
        
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let DV = MainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(DV, animated: true)
        
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
