//
//  File.swift
//  MovieDB
//
//  Created by Cntt12 on 5/13/17.
//  Copyright © 2017 cntt12. All rights reserved.
//

class Movie {
    var overview: String?
    var title: String?
    var poster_Path: String?
    
    init(overview: String?, title: String?, poster_Path: String?) {
        self.overview = overview
        self.title = title
        self.poster_Path = poster_Path
    }
}
