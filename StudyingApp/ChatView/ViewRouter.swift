//
//  ViewRouter.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .loginView
    
    init(pageToStartWith: Page) {
        currentPage = pageToStartWith
    }
}
