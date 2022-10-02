//
//  Model.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // create URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else { return }
        
        // get URLSession object
        let session = URLSession.shared
        
        // get data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // error 처리
            if error != nil || data == nil {
                return
            }
            
            do {
                // parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // date 일자를 string -> date 변환 기준 설정
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            } catch {
                
            }
        }
        
        // kick off the task
        dataTask.resume()
        
    }
    
}
