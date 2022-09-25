//
//  DetailProtocols.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

// MARK: - Navigation Option
enum DetailNavigationOption {
    /**
     - example usage
     */
}

// MARK: - Presenter -> View
protocol DetailPresenterToViewProtocl: BaseViewProtocol {
    func initialControlSetup()
}

// MARK: - View -> Presenter
protocol DetailViewToPresenterProtocol: AnyObject {
    func started()
}

// MARK: - Interactor -> Presenter
protocol DetailInterectorToPresenterProtocol: AnyObject {
    
}

// MARK: - Presenter -> Interactor
protocol DetailPresentorToInterectorProtocol: AnyObject {
    
}

// MARK: - Presenter -> Router or WireFrame
protocol DetailPresenterToRouterProtocol: BaseRouterProtocol {
    func navigate(to option: DetailNavigationOption)
}


