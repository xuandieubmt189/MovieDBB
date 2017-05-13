//
//  File.swift
//  MovieDB
//
//  Created by Cntt12 on 5/13/17.
//  Copyright © 2017 cntt12. All rights reserved.
//

import Foundation

let postData = NSData(data: "{}".data(using: String.Encoding.utf8)!)

class getMovie {    

    
    let request = URLRequest(url: "https://api.themoviedb.org/3/movie/now_playing?page=1&language=en-US&api_key=24b1973f805d7f765ee59e3481812a29" )! as URL,
                            cachePolicy: .useProtocolCachePolicy,
                            timeoutInterval: 10.0 )

    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = RequestBody
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) {
        (data, response, error) in...
        
    }
    dataTask.resume()
}
