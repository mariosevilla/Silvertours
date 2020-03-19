//
//  AddTransactionRouter.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 18/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation
import UIKit

protocol AddTransactionRouterProtocol{
    static func createAddTransactionModule(delegate: AddTransactionDelegate) -> UIViewController
    func dismissViewController(view: AddTransactionViewProtocol)
    
    //PRESENTER -> ROUTER
}


class AddTransactionRouter: AddTransactionRouterProtocol {
    static func createAddTransactionModule(delegate: AddTransactionDelegate) -> UIViewController {
        
        let addTransactionViewController = AddTransactionViewController()
               
        var presenter: AddTransactionPresenterProtocol & AddTransactionInteractorOutputProtocol = AddTransactionPresenter()
        var interactor: AddTransactionInteractorInputProtocol = AddTransactionInteractor()
        let router = AddTransactionRouter()

        addTransactionViewController.presenter = presenter
        presenter.view = addTransactionViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.delegate = delegate

        let navigationController = UINavigationController(rootViewController: addTransactionViewController)
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }
    
    func dismissViewController(view: AddTransactionViewProtocol) {
        
        guard let viewController = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }

        viewController.navigationController?.dismiss(animated: true, completion: nil)
    }
}
