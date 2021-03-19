//
//  MoviePresenter.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation

class MoviePresenter: MoviePresentation {
    var router: MovieWireFrame?
    var view: MovieView?
    var interactor: MovieUseCase?
    
    func getMovie() {
        view?.showLoading()
        interactor?.requestMovie()
    }
    
}

extension MoviePresenter: MovieInteractorOutput {
    func responseMovie(data: [Movie]) {
        view?.hideLoading()
        view?.successGetMovie(data: data)
    }
    
    func dataFailed(message: String) {
        view?.showError(title: "Error", message: message)
    }
    
    
}
