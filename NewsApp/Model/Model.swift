//
//  Model.swift
//  NewsApp
//
//  Created by Dmitry Tatarintsev on 13.03.2021.
//

import Foundation
var articles: [Article]{
    
    let data = try? Data(contentsOf: urlToData)
    if data == nil{
        return []
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []
        
        for dict in array{
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        
        return returnArray
    }
    return []
}

var urlToData: URL{
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(completionHandler: (()->Void)?) {
    let url = URL(string: "http://newsapi.org/v2/everything?q=apple&from=2021-03-12&to=2021-03-12&sortBy=popularity&apiKey=2ec20a4644ee4f828c383a70047e30a6")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
            
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            completionHandler?()
        }
    }
    downloadTask.resume()
}
