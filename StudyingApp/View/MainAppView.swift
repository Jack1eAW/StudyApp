//
//  MainAppView.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 15.06.2021.
//

import SwiftUI
import CoreData

    struct MainAppView: View {
        var body: some View {
            NavigationView {
                ZStack{
                Text(" ")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color("Background"))
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(spacing: 25) {
                NavigationLink(destination: SubView()) {
                    ButtonNowDesign()
                }
                NavigationLink(destination: DoView()) {
                        ButtonDoDesign()
                    }
                        NavigationLink(destination: PredmetyView()) {
                                ButtonSubDesign()
                            }
                        NavigationLink(destination: LectureView()) {
                                ButtonLecDesign()
                            }
                        NavigationLink(destination: MotherView()
                                        .environmentObject(ViewRouter(pageToStartWith: .loginView))) {
                                ButtonChatDesign()
                            }
                }
                }
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
