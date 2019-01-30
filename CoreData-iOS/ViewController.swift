//
//  ViewController.swift
//  CoreData-iOS
//
//  Created by Priyanka on 29/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataPass {
   
    @IBOutlet weak var labelResponse: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
  
    @IBOutlet weak var streamText: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelResponse.isHidden = true
        
    }
    
   
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        nameText.text = object["name"]
        streamText.text = object["stream"]
        i = index
        isUpdate = isEdit
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        
        let name = nameText.text
        let stream = streamText.text
        labelResponse.isHidden = false

        if ((name?.isEmpty)! || (stream?.isEmpty)!) {
            
            labelResponse.text = "Please enter the values"
        }
        else {
            
            let dict = ["name":name,"stream":stream]
            if isUpdate {
                DatabaseHelper.sharedInstance.editData(object: dict as! [String : String], i: i)
                labelResponse.text = "Data updated"
                navigate()
            }
            else {
                DatabaseHelper.sharedInstance.save(object: dict as! [String : String])
                labelResponse.text = "data submitted"
                navigate()
            }
            
        }
        
        
        
    }
    
    @IBAction func showData(_ sender: UIButton) {
        navigate()
    }
    
    func navigate() {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
}

