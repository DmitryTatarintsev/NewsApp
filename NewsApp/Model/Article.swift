//
//  Article.swift
//  NewsApp
//
//  Created by Dmitry Tatarintsev on 13.03.2021.
//

import Foundation
/*
 {
 "status": "ok",
 "totalResults": 2722,
 -"articles": [
 -{
 -"source": {
 "id": null,
 "name": "Lifehacker.com"
 },
 "author": "Brendan Hesse",
 "title": "How to Fix the Controller Disconnection Bug on Your Xbox Series X/S",
 "description": "Microsoft is finally fixing the annoying controller disconnection bug that plagued the Xbox Series X/S since launch, and the patch is included in the March 2021 firmware update rolling out this week. Microsoft doesn’t directly mention the bug fixes in its ann…",
 "url": "https://lifehacker.com/how-to-fix-the-controller-disconnection-bug-on-your-xbo-1846465584",
 "urlToImage": "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/f7z50oogvzcjtbbdtkqt.jpg",
 "publishedAt": "2021-03-12T18:30:00Z",
 "content": "Microsoft is finally fixing the annoying controller disconnection bug that plagued the Xbox Series X/S since launch, and the patch is included in the March 2021 firmware update rolling out this week.… [+1897 chars]"
 }
 */
struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    init (dictionary: Dictionary<String, Any>) {
      
     author = dictionary["author"] as? String ?? ""
     title = dictionary["title"] as? String ?? ""
     description = dictionary["description"] as? String ?? ""
     url = dictionary["url"] as? String ?? ""
     urlToImage = dictionary["urlToImage"] as? String ?? ""
     publishedAt = dictionary["publishedAt"] as? String ?? ""
     sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""]) ["name"] as? String ?? ""
     
    }
}
