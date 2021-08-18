//
//  Login.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI


struct Login: View {
    
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    var body: some View {
        
        VStack{
            
            Text("Войти")
                .fontWeight(.medium)
                .font(.system(size: 18))
                .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                .frame(width: 53, height: 46)
                .padding(.top,15)
            
            HStack(spacing: 15){
                
                TextField("+7", text: $accountCreation.code)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .frame(width: 55)
                    .background(Color("Background"))
                    .cornerRadius(8)
                    .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                    .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
                
                TextField("Номер телефона", text: $accountCreation.phNumber)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .frame(width: 300)
                    .background(Color("Background"))
                    .cornerRadius(8)
                    .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                    .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
            }
            
            .padding(.top)
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color("Background"))
                    .frame(width: 350, height: 50)
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                HStack{
            Button(action: accountCreation.login, label: {
                HStack{
                    Spacer()
                    Text("Войти")
                        .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                        .padding(.bottom)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .padding(.bottom)
                }
                .cornerRadius(8)
                .padding(.vertical,50)
                .padding(.horizontal)
            })
                }
            .padding(.top)
            .disabled((accountCreation.code != "" && accountCreation.phNumber != "") ? false : true)
            .opacity((accountCreation.code != "" && accountCreation.phNumber != "") ? 1 : 0.6)
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
