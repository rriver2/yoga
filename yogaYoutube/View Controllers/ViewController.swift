//
//  ViewController.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var modal = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        modal.delegate = self
        modal.getVideos()
        
    }
    
    // segue 선택시 호출되는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Confirm that a video was selected
        guard let videoIndex = tableView.indexPathForSelectedRow else { return }
        
        // Get a reference to the video that was tab on
        let selectedVideo = videos[videoIndex.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    //MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our viedio property
        self.videos = videos
        // refresh tableView
        tableView.reloadData()
    }

}

extension ViewController {
    //MARK: for UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        // Return the cell
        return cell
    }
    //MARK: for UITableViewDelegate
    // row를 선택했을 때 반응함
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

