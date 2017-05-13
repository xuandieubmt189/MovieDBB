//
//  File.swift
//  MovieDB
//
//  Created by Cntt12 on 5/13/17.
//  Copyright © 2017 cntt12. All rights reserved.
//

import Foundation
class Movie{
    
    class func getMovie() {
        
        var Results = [Movie]()
        
        let postData = NSData(data: "{}".data(using: String.Encoding.utf8)!)

        let request = NSMutableURLRequest(url: NSURL(string:"https://api.themoviedb.org/3/movie/283995?language=en-US&api_key=24b1973f805d7f765ee59e3481812a29" )! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0 )
            request.httpMethod = "GET"
            request.httpBody = postData as Data

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
                    } else {
                do {
                    if let data = data, let response = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions(rawValue:0)) as? [String: AnyObject] {
                        
                        // Get the results array
                        if let array: AnyObject = response["results"] {
                            for movieDictonary in array as! [AnyObject] {
                                if let trackDictonary = movieDictonary as? [String: AnyObject],
                                    let overview = movieDictonary["overview"] as? String {
                                    let title = movieDictonary["title"] as? String
                                    let poster_Path = movieDictonary["poster_Path"] as? String
                                    Results.append(Movie(overview: overview, title: title, poster_Path: poster_Path))
                                    
                                } else {
                                    print("Not a dictionary")
                                }
                            }
                        } else {
                            print("Results key not found in dictionary")
                        }
                    } else {
                        print("JSON Error")
                    }
                } catch let error as NSError {
                    print("Error parsing results: \(error.localizedDescription)")
                }

                    }
            })
            dataTask.resume()
            }
}
