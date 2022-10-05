//
//  Model.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos(_ APIURL: Constants.PlayListCategory) {
        
        // create URL object
        let url = URL(string: Constants.getAPIURL(APIURL))
        
        guard let url = url else { return }
        
        // get URLSession object
        let session = URLSession.shared
        
        // get data task from the URLSession object
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            // error 처리
            if error != nil || data == nil {
                return
            }
            
            do {
                // parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // date 일자를 string -> date 변환 기준 설정
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if let videos = response.items {
                    DispatchQueue.main.async { // view를 그리는 작업은 main에서 일어나야함
                        // Call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(videos)
                    }
                }
//                dump(response)
            } catch {
                
            }
        }
        
        // kick off the task
        dataTask.resume()
    }
}
