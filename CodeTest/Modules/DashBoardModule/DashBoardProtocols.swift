//
//  DashBoardProtocols.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

// MARK: - Navigation Option
enum DashBoardNavigationOption {
    /**
     - example usage
     */
}

// MARK: - Presenter -> View
protocol DashBoardPresenterToViewProtocl: BaseViewProtocol {
    func initialControlSetup()
}

// MARK: - View -> Presenter
protocol DashBoardViewToPresenterProtocol: AnyObject {
    func started()
    func clickedGoButton()
}

// MARK: - Interactor -> Presenter
protocol DashBoardInterectorToPresenterProtocol: AnyObject {
    
}

// MARK: - Presenter -> Interactor
protocol DashBoardPresentorToInterectorProtocol: AnyObject {
    
}

// MARK: - Presenter -> Router or WireFrame
protocol DashBoardPresenterToRouterProtocol: BaseRouterProtocol {
    func navigateToSearchResultScreen()
}


