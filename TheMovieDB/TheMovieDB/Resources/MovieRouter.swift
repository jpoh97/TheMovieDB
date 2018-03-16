//
//  MovieRouter.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Alamofire

public enum MovieRouter: URLRequestConvertible {
    static let baseURLPath = "https://api.themoviedb.org/3"
    static var apiKey = "1f4d7de5836b788bdfd897c3e0d0a24b"
    static var typeOfList = TypeOfLists.nowPlaying
    
    case list(Int)
    case search(String, Int)

    var path: String {
        switch self {
        case .list:
            switch MovieRouter.typeOfList {
            case TypeOfLists.nowPlaying:
                return "/movie/now_playing"
            case TypeOfLists.popular:
                return "/movie/popular"
            case TypeOfLists.topRated:
                return "/movie/top_rated"
            case TypeOfLists.upcoming:
                return "/movie/upcoming"
            }
        case .search:
            return "/search/movie"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let parameters: [String: Any] = {
            switch self {
            case .list(let page):
                return ["page": page, "api_key" : MovieRouter.apiKey]
            case .search(let query, let page):
                return ["page": page, "query": query, "api_key" : MovieRouter.apiKey]
            }
        }()
        
        let url = try MovieRouter.baseURLPath.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

enum TypeOfLists {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}
