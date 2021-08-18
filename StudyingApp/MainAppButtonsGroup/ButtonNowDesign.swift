//
//  ButtonNowDesign.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 14.06.2021.
//

import SwiftUI
import Foundation

struct ButtonNowDesign: View {
var body: some View {
    ZStack {
    RoundedRectangle(cornerRadius: 25.0)
        .fill(Color("Background"))
        .frame(width: 343, height: 140)
        .shadow(color: Color("LightShadow"), radius: 6, x: -6, y: -6)
        .shadow(color: Color("DarkShadow"), radius: 6, x: 6, y: 6)
        VStack(spacing: 25) {
                VStack(){
                Text("Сегодня")
                .fontWeight(.semibold)
                .font(.system(size: 38))
                .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.5725490196, blue: 0.5725490196, alpha: 1)))
                .padding()
                .frame(width: 250, height: 30)
                Text("На повестке дня")
                    .fontWeight(.light)
                    .font(.system(size: 18))
                    .foregroundColor(Color(#colorLiteral(red: 0.6392156863, green: 0.6941176471, blue: 0.7764705882, alpha: 1)))
                    .frame(width: 200, height: 21)
                }
                .padding()
            .frame(width: 343, height: 140)
            .background(Color("Background"))
            .cornerRadius(44)
            
        }
    }
    .frame(maxWidth: .infinity)
}
}
