//
//  Register.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI
import CoreLocation

struct Register: View {
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    @State var manager = CLLocationManager()
    
    var body: some View {
        
        VStack{
            
            Text("Создать аккаунт")
                .font(.title)
                .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,35)
            
            HStack(spacing: 15){
                
                Image(systemName: "person.fill")
                    .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                
                TextField("Ваше имя", text: $accountCreation.name)
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(Color("Background"))
            .cornerRadius(8)
            .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
            .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
            .padding(.vertical)
            
            HStack(spacing: 15){
                
                HStack(spacing: 15){
                    
                    TextField("Местоположение", text: $accountCreation.location)
                    
                    Button(action: {manager.requestWhenInUseAuthorization()}, label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                    })
                }
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(Color("Background"))
                .cornerRadius(8)
                .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
                
                TextField("Кто вы?", text: $accountCreation.age)
                .padding(.vertical,12)
                .padding(.horizontal)
                .frame(width: 130)
                .background(Color("Background"))
                .cornerRadius(8)
                    .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                    .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
            }
            
            TextEditor(text: $accountCreation.bio)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(Color("Background"))
                .cornerRadius(8)
                .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
                .padding(.vertical)
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color("Background"))
                    .frame(width: 350, height: 50)
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                HStack{
            Button(action: {accountCreation.pageNumber = 2}, label: {
                HStack{
                    Spacer(minLength: 0)
                    Text("Зарегестрироваться")
                    .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                    Spacer(minLength: 0)
                    
                    Image(systemName: "arrow.right")
                }
                .padding(.vertical,12)
                .padding(.horizontal)
                .cornerRadius(8)
            })
                }
            // disabling Button....
            .opacity((accountCreation.name != "" && accountCreation.age != "" && accountCreation.bio != "" && accountCreation.location != "") ? 1 : 0.6)
            .disabled((accountCreation.name != "" && accountCreation.age != "" && accountCreation.bio != "" && accountCreation.location != "") ? false : true)
        }
        }
        .padding(.horizontal)
        .onAppear(perform: {
            manager.delegate = accountCreation
        })
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
