//
//  Video.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import Foundation

struct Video: Decodable {
    
    var title = ""
    var description = ""
    var published = Date()
    var thumbnail = ""
    var videoId = ""
    
    enum CodingKeys: String, CodingKey {
        // enCoding 시에 json에 들어있는 key 값이랑 다를 시에 ""을 넣어주기 / 관련있는 key 값들 다 들고와야 함
        case snippet // for all
        case thumbnails // for thumbnail
        case high // for thumbnail
        case resourceId // for videoId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    //MARK: - json에서 해당 struct 파라매터의 값들을 찾아서 넣어주기
    init(from decoder: Decoder) throws {
        
        // items 배열의 객체 추출
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // snippet 객체 추출
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse title, description, publishDate
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // parse thumbnail
        let thumnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // parse videoID
        let resourcedIDContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourcedIDContainer.decode(String.self, forKey: .videoId)
    }
}

// MARK: -  json 예시
//{
//    "kind": "youtube#playlistItemListResponse",
//    "etag": "YZGoFtQIHZy9guGBPYImdVGMgio",
//    "nextPageToken": "EAAaBlBUOkNBVQ",
//    "items": [{
//            "kind": "youtube#playlistItem",
//            "etag": "4mpI1wu4aw1b7fJpY10Z9oJ61lY",
//            "id": "UExIVXl4a0ZQLXdrb0hQdFpyejZTWUxSQ2hiY19FeFNvZS45NzUwQkI1M0UxNThBMkU0",
//            "snippet": {
//                "publishedAt": "2020-11-08T12:05:42Z",
//                "channelId": "UCKmEDAD5k5KFMcY5wvGIeGQ",
//                "title": "항상 피곤한 당신을 위한 요가 | 운동부족, 만성피로 탈출 | 피로회복 스트레칭",
//                "description": "운동을 하게 되면 피곤을 느끼지만,\n역설적으로 심각한 운동 부족이\n만성피로의 원인이 될 수 있습니다.\n\n매일 규칙적인 적정량의 운동은\n에너지를 만드는 원료인 산소를 충분히 공급해주어\n피로 회복은 물론이고, 스트레스까지 해소합니다!\n\n자도자도 졸리고, 항상 피곤함을 느끼는 분들😪\n오늘은 요가 스트레칭으로 피로를 풀어보세요🔋\n\n#피로회복 #요가 #운동부족",
//                "thumbnails": {
//                    "default": {
//                        "url": "https://i.ytimg.com/vi/MdeVTlDNiXE/default.jpg",
//                        "width": 120,
//                        "height": 90
//                    },
//                    "medium": {
//                        "url": "https://i.ytimg.com/vi/MdeVTlDNiXE/mqdefault.jpg",
//                        "width": 320,
//                        "height": 180
//                    },
//                    "high": {
//                        "url": "https://i.ytimg.com/vi/MdeVTlDNiXE/hqdefault.jpg",
//                        "width": 480,
//                        "height": 360
//                    },
//                    "standard": {
//                        "url": "https://i.ytimg.com/vi/MdeVTlDNiXE/sddefault.jpg",
//                        "width": 640,
//                        "height": 480
//                    },
//                    "maxres": {
//                        "url": "https://i.ytimg.com/vi/MdeVTlDNiXE/maxresdefault.jpg",
//                        "width": 1280,
//                        "height": 720
//                    }
//                },
//                "channelTitle": "에일린 mind yoga",
//                "playlistId": "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe",
//                "position": 0,
//                "resourceId": {
//                    "kind": "youtube#video",
//                    "videoId": "MdeVTlDNiXE"
//                },
//                "videoOwnerChannelTitle": "에일린 mind yoga",
//                "videoOwnerChannelId": "UCKmEDAD5k5KFMcY5wvGIeGQ"
//            }
//        },
//        {
//            "kind": "youtube#playlistItem",
//            "etag": "iZUGZjxrx9rGrdT3IWka9Jh4pCg",
//            "id": "UExIVXl4a0ZQLXdrb0hQdFpyejZTWUxSQ2hiY19FeFNvZS5ENDU4Q0M4RDExNzM1Mjcy",
//            "snippet": {
//                "publishedAt": "2020-09-21T14:06:14Z",
//                "channelId": "UCKmEDAD5k5KFMcY5wvGIeGQ",
//                "title": "명상과 함께하는 힐링요가 | 편안한 25분 전신스트레칭",
//                "description": "아침이나 저녁, 언제든지 하기 좋은\n25분 전신스트레칭 요가로\n몸과 마음을 편안하게 힐링하세요.\n\n짧은 호흡명상(2분)으로 시작하여\r\n앉아서 하는 간단한 스트레칭을 하고\n누워서 몸의 구석구석 긴장을 이완하는\n바디스캔 명상으로 마무리합니다.\n\n오늘도 편안한 하루 보내세요.\nNamaste🙏🏻\n\n#요가 #명상 #전신스트레칭",
//                "thumbnails": {
//                    "default": {
//                        "url": "https://i.ytimg.com/vi/IbRvO-HYPNg/default.jpg",
//                        "width": 120,
//                        "height": 90
//                    },
//                    "medium": {
//                        "url": "https://i.ytimg.com/vi/IbRvO-HYPNg/mqdefault.jpg",
//                        "width": 320,
//                        "height": 180
//                    },
//                    "high": {
//                        "url": "https://i.ytimg.com/vi/IbRvO-HYPNg/hqdefault.jpg",
//                        "width": 480,
//                        "height": 360
//                    },
//                    "standard": {
//                        "url": "https://i.ytimg.com/vi/IbRvO-HYPNg/sddefault.jpg",
//                        "width": 640,
//                        "height": 480
//                    },
//                    "maxres": {
//                        "url": "https://i.ytimg.com/vi/IbRvO-HYPNg/maxresdefault.jpg",
//                        "width": 1280,
//                        "height": 720
//                    }
//                },
//                "channelTitle": "에일린 mind yoga",
//                "playlistId": "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe",
//                "position": 1,
//                "resourceId": {
//                    "kind": "youtube#video",
//                    "videoId": "IbRvO-HYPNg"
//                },
//                "videoOwnerChannelTitle": "에일린 mind yoga",
//                "videoOwnerChannelId": "UCKmEDAD5k5KFMcY5wvGIeGQ"
//            }
//        },
//        {
//            "kind": "youtube#playlistItem",
//            "etag": "At9IY3Wl0DfG3SnAkbeetp5V9vU",
//            "id": "UExIVXl4a0ZQLXdrb0hQdFpyejZTWUxSQ2hiY19FeFNvZS4xOTEzQzhBQzU3MDNDNjcz",
//            "snippet": {
//                "publishedAt": "2021-11-25T11:28:40Z",
//                "channelId": "UCKmEDAD5k5KFMcY5wvGIeGQ",
//                "title": "뻐근한 몸 풀어주는 29분 요가 | 전신순환 스트레칭",
//                "description": "굳어 있는 손목과 발목의 긴장을 이완하고\n전신을 골고루 시원하게 풀어주는\n29분 요가 스트레칭입니다.\n\n동작을 수행할 때 너무 힘들거나\n통증이 느껴진다면 절대 무리하지 마시고\n가능한 만큼만 따라해주세요🙏🏻\n\n#요가 #요가스트레칭 #에일린요가",
//                "thumbnails": {
//                    "default": {
//                        "url": "https://i.ytimg.com/vi/vEfk39oliw0/default.jpg",
//                        "width": 120,
//                        "height": 90
//                    },
//                    "medium": {
//                        "url": "https://i.ytimg.com/vi/vEfk39oliw0/mqdefault.jpg",
//                        "width": 320,
//                        "height": 180
//                    },
//                    "high": {
//                        "url": "https://i.ytimg.com/vi/vEfk39oliw0/hqdefault.jpg",
//                        "width": 480,
//                        "height": 360
//                    },
//                    "standard": {
//                        "url": "https://i.ytimg.com/vi/vEfk39oliw0/sddefault.jpg",
//                        "width": 640,
//                        "height": 480
//                    },
//                    "maxres": {
//                        "url": "https://i.ytimg.com/vi/vEfk39oliw0/maxresdefault.jpg",
//                        "width": 1280,
//                        "height": 720
//                    }
//                },
//                "channelTitle": "에일린 mind yoga",
//                "playlistId": "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe",
//                "position": 2,
//                "resourceId": {
//                    "kind": "youtube#video",
//                    "videoId": "vEfk39oliw0"
//                },
//                "videoOwnerChannelTitle": "에일린 mind yoga",
//                "videoOwnerChannelId": "UCKmEDAD5k5KFMcY5wvGIeGQ"
//            }
//        },
//        {
//            "kind": "youtube#playlistItem",
//            "etag": "XtvtIY2UPT6aaiNrlwiE0wUn9K8",
//            "id": "UExIVXl4a0ZQLXdrb0hQdFpyejZTWUxSQ2hiY19FeFNvZS5GNDg1Njc1QzZERjlFRjE5",
//            "snippet": {
//                "publishedAt": "2022-02-14T02:22:27Z",
//                "channelId": "UCKmEDAD5k5KFMcY5wvGIeGQ",
//                "title": "저녁에 하기 좋은 20분 요가 | 자기전 스트레칭, 숙면 요가 스트레칭",
//                "description": "저녁시간 또는 자기 전에 하면 좋은\n20분 저녁 요가 스트레칭입니다.\n\n하루종일 몸과 마음에 쌓인 긴장과 피로.\n오늘은 절대 침대까지 가져가지 마시고\n잠시 시간을 내어 꼭 풀어주고 주무세요😌\n\n오늘 하루도 정말 수고하셨어요.\n요가로 편안한 시간 보내시고, 꿀잠 주무세요🍯💤\n\n\n#저녁요가 #요가스트레칭 #자기전스트레칭",
//                "thumbnails": {
//                    "default": {
//                        "url": "https://i.ytimg.com/vi/umEJnBsHjqg/default.jpg",
//                        "width": 120,
//                        "height": 90
//                    },
//                    "medium": {
//                        "url": "https://i.ytimg.com/vi/umEJnBsHjqg/mqdefault.jpg",
//                        "width": 320,
//                        "height": 180
//                    },
//                    "high": {
//                        "url": "https://i.ytimg.com/vi/umEJnBsHjqg/hqdefault.jpg",
//                        "width": 480,
//                        "height": 360
//                    },
//                    "standard": {
//                        "url": "https://i.ytimg.com/vi/umEJnBsHjqg/sddefault.jpg",
//                        "width": 640,
//                        "height": 480
//                    },
//                    "maxres": {
//                        "url": "https://i.ytimg.com/vi/umEJnBsHjqg/maxresdefault.jpg",
//                        "width": 1280,
//                        "height": 720
//                    }
//                },
//                "channelTitle": "에일린 mind yoga",
//                "playlistId": "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe",
//                "position": 3,
//                "resourceId": {
//                    "kind": "youtube#video",
//                    "videoId": "umEJnBsHjqg"
//                },
//                "videoOwnerChannelTitle": "에일린 mind yoga",
//                "videoOwnerChannelId": "UCKmEDAD5k5KFMcY5wvGIeGQ"
//            }
//        },
//        {
//            "kind": "youtube#playlistItem",
//            "etag": "OjdbeXxdUXEXi1FpwQoDWQRbqRc",
//            "id": "UExIVXl4a0ZQLXdrb0hQdFpyejZTWUxSQ2hiY19FeFNvZS44Mjc5REFBRUE2MTdFRDU0",
//            "snippet": {
//                "publishedAt": "2021-02-18T12:41:59Z",
//                "channelId": "UCKmEDAD5k5KFMcY5wvGIeGQ",
//                "title": "몸과 마음이 편안해지는 25분 힐링요가 | 명상요가 스트레칭",
//                "description": "몸과 마음이 마치 휴식한 것처럼\n편안해지는 힐링 요가입니다.\n\n요가는 '명상으로 가는 여정'이라는 말이 있죠.\n요가 수련의 목적을 깊은 명상의 단계로\n가기 위한 과정으로 보는 것인데요.\n\n먼저 간단한 스트레칭 동작으로 전신을 풀며\n내 몸 구석구석의 상태를 알아차리고\n명상하기 좋은 상태로 만들어 줍니다.\n그리고 마지막 5분은 오롯이 호흡에 집중하는\n명상을 통해 마음 근육까지 편하게 풀어보세요.\n\n#요가 #요가스트레칭 #힐링요가",
//                "thumbnails": {
//                    "default": {
//                        "url": "https://i.ytimg.com/vi/a2dXauQ_yr0/default.jpg",
//                        "width": 120,
//                        "height": 90
//                    },
//                    "medium": {
//                        "url": "https://i.ytimg.com/vi/a2dXauQ_yr0/mqdefault.jpg",
//                        "width": 320,
//                        "height": 180
//                    },
//                    "high": {
//                        "url": "https://i.ytimg.com/vi/a2dXauQ_yr0/hqdefault.jpg",
//                        "width": 480,
//                        "height": 360
//                    },
//                    "standard": {
//                        "url": "https://i.ytimg.com/vi/a2dXauQ_yr0/sddefault.jpg",
//                        "width": 640,
//                        "height": 480
//                    },
//                    "maxres": {
//                        "url": "https://i.ytimg.com/vi/a2dXauQ_yr0/maxresdefault.jpg",
//                        "width": 1280,
//                        "height": 720
//                    }
//                },
//                "channelTitle": "에일린 mind yoga",
//                "playlistId": "PLHUyxkFP-wkoHPtZrz6SYLRChbc_ExSoe",
//                "position": 4,
//                "resourceId": {
//                    "kind": "youtube#video",
//                    "videoId": "a2dXauQ_yr0"
//                },
//                "videoOwnerChannelTitle": "에일린 mind yoga",
//                "videoOwnerChannelId": "UCKmEDAD5k5KFMcY5wvGIeGQ"
//            }
//        }
//    ],
//    "pageInfo": {
//        "totalResults": 48,
//        "resultsPerPage": 5
//    }
//}
