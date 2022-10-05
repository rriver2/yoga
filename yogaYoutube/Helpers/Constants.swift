//
//  Constants.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import Foundation

struct Constants {
    
    enum PlayListCategory {
        case yoga
    }
    
    static var API_KEY = "AIzaSyDtMJAURu7IRGpdNI_qdVPOEr0tUhsiGDc"
    static var PLAYLIST_ID: [PlayListCategory: String] = [
        .yoga : "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe"
    ]
    
    static var VIDEOCELL_ID = "VideoCell"
    static var YOUTUBE_EMBED_URL = "https://www.youtube.com/watch?v="
    
    static func getAPIURL(_ playListCategory: PlayListCategory) -> String {
        let id = Constants.PLAYLIST_ID[playListCategory]!
        return "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(id)&key=\(Constants.API_KEY)"
    }
}
