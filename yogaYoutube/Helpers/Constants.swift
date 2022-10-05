//
//  Constants.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import Foundation

struct Constants {
    
    enum PlayListCategory: String, CaseIterable {
        case yoga
        case meditation
        case coding
        case jazz
        case music
    }
    
    static var API_KEY = "AIzaSyDtMJAURu7IRGpdNI_qdVPOEr0tUhsiGDc"
    static var PLAYLIST_ID: [PlayListCategory: String] = [
        .yoga : "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe",
        .meditation : "PLHUyxkFP-wkpVrza1pu6vyaXwoUPzb7VT",
        .coding: "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua",
        .jazz: "PLdgUERwLEXZgsYVZCS9nqVyk6-5c_lebV",
        .music: "PLdgUERwLEXZiwxTtSiiQYWTrjjxhFx06i"
    ]
    
    static var VIDEOCELL_ID = "VideoCell"
    static var CATEGORYCELL_ID = "CategoryCell"
    static var YOUTUBE_EMBED_URL = "https://www.youtube.com/watch?v="
    
    static func getAPIURL(_ playListCategory: PlayListCategory) -> String {
        let id = Constants.PLAYLIST_ID[playListCategory]!
        return "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(id)&key=\(Constants.API_KEY)"
    }
}
