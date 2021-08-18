//
//  LoadingScreen.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        
        ZStack{
            
            Color("Background").ignoresSafeArea(.all, edges: .all)
            
            ProgressView()
                .padding(20)
                .background(Color("Background"))
                .cornerRadius(10)
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
