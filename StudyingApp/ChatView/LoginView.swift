//
//  LoginView.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var usernameInput = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        VStack {
            Text("Сообщения")
                .fontWeight(.semibold)
                .font(.system(size: 38))
                .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.5725490196, blue: 0.5725490196, alpha: 1)))
                .padding(.top, 100)
                .padding(.bottom, 170)
            Text("Вход в чат")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("Background"))
                        .frame(width: 343, height: 45)
                        .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: 3)
                        .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
            TextField("Введите имя...", text: $usernameInput)
                .padding()
                .cornerRadius(8)
                .padding()
            }
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color("Background"))
                    .frame(width: 350, height: 50)
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
            Button(action: {self.signIn()}) {
                Text("Войти")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                    .padding()
                    .cornerRadius(15.0)
            }
            }
            Spacer()
        }
        }
    }
    
    func signIn() {
        
        guard !usernameInput.isEmpty else {
            return
        }
        
        let defaults = UserDefaults.standard
        defaults.set(usernameInput, forKey: "username")
        
        viewRouter.currentPage = .chatView

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
