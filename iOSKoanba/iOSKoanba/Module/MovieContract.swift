//
//  MovieContract.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import UIKit
import Foundation

protocol MovieView: MovieViewController {
    func successGetMovie(data: [Movie]?)
    func showLoading()
    func hideLoading()
    func showError(title: String, message: String)
}

protocol MoviePresentation: class {
    var view: MovieView? { get set }
    var interactor: MovieUseCase? { get set }
    var router: MovieWireFrame? { get set }
    
    func getMovie()
}

protocol MovieUseCase: class {
    var output: MovieInteractorOutput? { get set }
    
    func requestMovie()
}

protocol MovieInteractorOutput: class {
    func dataFailed(message: String)
    func responseMovie(data: [Movie])
}

protocol MovieWireFrame: class {
    var viewController: UIViewController? { get set }
    
    static func createModule() -> MovieViewController
}
