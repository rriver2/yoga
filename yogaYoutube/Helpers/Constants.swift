//
//  Constants.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyDtMJAURu7IRGpdNI_qdVPOEr0tUhsiGDc"
    static var PLAYLIST_ID = "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    static var YOUTUBE_EMBED_URL = "https://www.youtube.com/watch?v="
}
