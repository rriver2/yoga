//
//  FirstViewController.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/05.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Confirm that a video was selected
        guard let categoryvideoIndex = tableView.indexPathForSelectedRow else { return }
        
        // Get a reference to the detail view controller
        let secondVC = segue.destination as! SecondViewController
        
        let playListCategoryList = Constants.PlayListCategory.allCases
        
        // Set the video property of the detail view controller
        secondVC.APIURLCategory = playListCategoryList[categoryvideoIndex.row]
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

extension FirstViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableCellCount = Constants.PlayListCategory.allCases.count
        return tableCellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CATEGORYCELL_ID, for: indexPath) as! CategoryTableViewCell
        let playListCategoryList = Constants.PlayListCategory.allCases
        // Configure the cell with the data
        let category = playListCategoryList[indexPath.row]
        
        cell.titleLabel.text = category.rawValue
        // Return the cell
        return cell
    }
    
}
