//
//  DetailViewController.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/03.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLable.text = ""
        dateLable.text = ""
        textView.text = ""
        
        // Check if there's a video
        guard let video = video else {
            return
        }
        
        // Create the embed URL
        let embedURLString = Constants.YOUTUBE_EMBED_URL + video.videoId
        
        // Load it inti the WebView
        if let url = URL(string: embedURLString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        // Set the title
        titleLable.text = video.title
        
        // Set the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLable.text = dateFormatter.string(from: video.published)
        
        // Set the description
        textView.text = video.description
        
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
