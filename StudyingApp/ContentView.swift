//
//  ContentView.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

import CoreData

struct ContentView: View {
    @StateObject var accountCreation = AccountCreationViewModel()
    @AppStorage("log_Status") var status = false
    var body: some View {
        NavigationView{
            if status{MainAppView()}
            else{
                
                ZStack{

                    MainView()
                    // setting it as environment Object
                    // so that we can use it in All the Sub Views...
                        .environmentObject(accountCreation)
                    
                    if accountCreation.isLoading{
                        
                        LoadingScreen()
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)

            }
        }
    }
}

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
            case .loginView:
                    LoginView()
                case .chatView:
                    ChatView()
                        .transition(.scale)
            }
        }
    }
}


struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        MotherView().environmentObject(ViewRouter(pageToStartWith: .loginView))
    }
}

