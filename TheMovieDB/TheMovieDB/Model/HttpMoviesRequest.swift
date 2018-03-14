//
//  HttpMoviesRequest.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Alamofire

class HttpMoviesRequest {
    
    func searchMovies(query : String, apiKey : String, page : Int, completion : @escaping ([String : Any]) -> ()) {
        Alamofire.request(
            "https://api.themoviedb.org/3/search/movie",
            parameters : [
                "api_key" : apiKey,
                "query" : query,
                "page" : page
            ]
            ).responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching movies: \(response.result.error)")
                    return
                }
                guard let responseJSON = response.result.value as? [String : Any] else {
                    print("Invalid tag information received from the service")
                    return
                }                
                completion(responseJSON)
        }
    }
}
