//
//  VideoTableViewCell.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/03.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailimageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        self.video = v
        
        guard self.video != nil else { return }
        
        // Set the title label
        self.titleLabel.text = video!.title
        
        // Set the date label
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dateFormatter.string(from: video!.published)
        
        // Set the date thumbnail
        guard self.video!.thumbnail != "" else { return }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            DispatchQueue.main.async {
                // Set the imageView
                self.thumbnailimageView.image = UIImage(data: cachedData)
            }
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Settion object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // Save the data in the Cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // 다운로드한 URL이 이 셀이 현재 표시하도록 설정된 비디오 섬네일 URL과 일치하는지 확인
                if url!.absoluteString != self.video?.thumbnail {
                    // 비디오 셀이 다른 비디오에 재활용되어 다운로드된 thumbnail과는 더 이상 일치하지 않음
                    return
                }
                // Create the image object
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    // Set the imageView
                    self.thumbnailimageView.image = image
                }
                
            }
        }
        // Start data task
        dataTask.resume()
    }

}
