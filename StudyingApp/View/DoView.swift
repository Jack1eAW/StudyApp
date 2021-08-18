//
//  DoView.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 15.06.2021.
//

import SwiftUI

struct DoView: View {
    @State var next = false
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                
                HStack{
                    
                    Button(action: {self.next.toggle()}, label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18))
                            .foregroundColor(Color(#colorLiteral(red: 0.6392156863, green: 0.6941176471, blue: 0.7764705882, alpha: 1)))
                            .padding(.horizontal, 20)
                            .foregroundColor(Color("red"))
                            .cornerRadius(8)
                    })
                    Spacer()
                }
                .overlay(
                    HStack(spacing: 4){
                        Text("Задания")
                            .fontWeight(.semibold)
                            .font(.system(size: 38))
                            .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.5725490196, blue: 0.5725490196, alpha: 1)))
                            .padding(.vertical)
                    }
                )
                .padding()
                HStack(spacing: 4){
                    Text("Сегодня 3 пары с 9:00 до 14:35")
                        .fontWeight(.light)
                        .font(.system(size: 18))
                        .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                        .padding(.vertical)
                }
            ScrollView {
                    VStack(alignment: .leading,spacing: 25){
                        ForEach(Today_items) { Now in
                            ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color("Background"))
                                .frame(width: 343, height: 140)
                                .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                                .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                                HStack{
                            VStack(spacing: 25) {
                                Button(action: {self.next.toggle()}) {
                                    VStack(){
                                    Text(Now.title)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 38))
                                    .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.5725490196, blue: 0.5725490196, alpha: 1)))
                                    .padding()
                                    .frame(width: 250, height: 30)
                                    
                                    }
                                    .padding()
                                }
                                .frame(width: 343, height: 140)
                                .background(Color("Background"))
                                .cornerRadius(44)
//                                .sheet(isPresented: $next) {
//                                    SignUpView2()
//                                }
                            }
                        }
                            }
                            .padding()
                    .frame(maxWidth: .infinity)
                    }
                }
        }
    }
}
}
}
struct DoView_Previews: PreviewProvider {
    static var previews: some View {
        DoView()
    }
}
