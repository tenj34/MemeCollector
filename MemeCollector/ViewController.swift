//
//  ViewController.swift
//  MemeCollector
//
//  Created by Juan Tenezaca on 11/8/17.
//  Copyright © 2017 Juan Tenezaca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
   // @IBOutlet weak var tableView: UITableView!
    
    
    var memes : [Meme] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            memes = try context.fetch(Meme.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        let meme  = memes[indexPath.row]
        cell.textLabel?.text = meme.title
        cell.imageView?.image = UIImage(data : meme.image as! Data)
        return cell
    }
}

