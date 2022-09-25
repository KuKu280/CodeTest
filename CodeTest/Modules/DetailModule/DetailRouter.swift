//
//  DetailRouter.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit
import Foundation

class DetailRouter: BaseRouter {
    
    // MARK: - Private properties
    private let storyboard = UIStoryboard(name: "Detail", bundle: nil)
    
    // MARK: Module Setup
    init(data: CarListObject) {
        let moduleViewController = storyboard.instantiateViewController(ofType: DetailViewController.self)
        super.init(viewController: moduleViewController)
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
        moduleViewController.detailList = data
        interactor.presenter = presenter
    }
    
}

// MARK: - Presenter to Wireframe Interface
extension DetailRouter: DetailPresenterToRouterProtocol {
    
    func navigate(to option: DetailNavigationOption) {
        // ...
    }
    
}
