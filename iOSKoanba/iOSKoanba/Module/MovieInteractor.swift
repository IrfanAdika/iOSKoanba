//
//  MovieInteractor.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation

class MovieIntector: MovieUseCase {
    var output: MovieInteractorOutput?
    private let movieApi: CoreApi
    
    init() {
        self.movieApi = CoreApi()
        movieApi.delegate = self
    }
    
    func requestMovie() {
        movieApi.getRequest(ServiceConfig.movie)
    }
}

extension MovieIntector: CoreApiDelegate {
    func finish(interFace: CoreApi, responseHeaders: HTTPURLResponse, data: Data) {
        do {
            let response = try JSONDecoder().decode(BaseApiModel.self, from: data)
            
            self.output?.responseMovie(data: response.results)
        } catch let error {
            print("error server \(error.localizedDescription)")
            self.output?.dataFailed(message: "Data error, \(error.localizedDescription)")
        }
    }
    
    func failed(interFace: CoreApi, result: AnyObject) {
        self.output?.dataFailed(message: "Failed get data")
    }
    
    
}
