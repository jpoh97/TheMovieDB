//
//  HttpMoviesRequest.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Alamofire

class HttpMoviesRequest {
    
    func searchMovies(query : String, page : Int, completion : @escaping ([String : Any]) -> ()) {
        Alamofire.request(MovieRouter.search(query, page)).responseJSON { response in
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
    
    func getList(page : Int, completion : @escaping ([String : Any]) -> ()) {
        Alamofire.request(MovieRouter.list(page)).responseJSON { response in
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
