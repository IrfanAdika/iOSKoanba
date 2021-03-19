//
//  MoieRouter.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import UIKit

class MovieRouter: MovieWireFrame {
    var viewController: UIViewController?

    class func createModule() -> MovieViewController {
        let view = MovieViewController()
        let presenter: MoviePresentation & MovieInteractorOutput = MoviePresenter()
        let interactor: MovieUseCase = MovieIntector()
        let router: MovieWireFrame = MovieRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.viewController = view
        presenter.interactor = interactor
        interactor.output = presenter
        
        return view
    }
}
