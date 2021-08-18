//
//  PredmetyView.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 15.06.2021.
//

import SwiftUI

struct PredmetyView: View {
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NewRed") as Any]
        }
    @State var next = false
    var body: some View {
        NavigationView {
            ZStack{
                Text(" ")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color("Background"))
                    .edgesIgnoringSafeArea(.all)
            ScrollView {
                Spacer()
                    VStack(spacing: 20){
                        ForEach(Today_items) { Now in
                            ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color("Background"))
                                .frame(width: 370, height: 50)
                                .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                                .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                            HStack{
                            VStack(spacing: 25) {
                                Button(action: {self.next.toggle()}) {
                                    VStack(){
                                    Text(Now.title)
                                    .fontWeight(.medium)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                                    .padding()
                                    .frame(width: 500, height: 30)
                                    }
                                    .padding()
                                }
                                .frame(width: 370, height: 50)
                                .background(Color("Background"))
                                .cornerRadius(44)
                            }
                        }
                            }
                    .frame(maxWidth: .infinity)
                    }
                }
        }
            .navigationTitle("Предметы")
            }
        }
    }
}

struct PredmetyView_Previews: PreviewProvider {
    static var previews: some View {
        PredmetyView()
    }
}
