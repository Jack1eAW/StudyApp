//
//  ChatView.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

struct ChatView: View {
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NewRed") as Any]
        }
    
    @StateObject var chatController = ChatController()
    
    @State var newMessageInput = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollViewReader { scrollView in
                    ScrollView {
                        ForEach(chatController.messages, id: \.messageID) { message in
                            ChatRoww(message: message)
                                .id(chatController.messages.firstIndex(of: message))
                        }
                            .onAppear(perform: {
                                scrollView.scrollTo(chatController.messages.count-1)
                            })
                    }
                }
                Spacer()
                ZStack {
                    HStack {
                        TextField("Введите сообщение...", text: $newMessageInput, onCommit: {
                            guard !newMessageInput.isEmpty else {
                                print("New message input is empty.")
                                return
                            }
                            chatController.sendMessage(messageText: newMessageInput)
                            newMessageInput = ""
                        })
                        .frame(height: 45)
                        .background(Color("Background"))
                        .cornerRadius(8)
                        .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                        .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
                            .padding(30)
                        Button(action: {
                            guard !newMessageInput.isEmpty else {
                                print("New message input is empty.")
                                return
                            }
                            chatController.sendMessage(messageText: newMessageInput)
                            newMessageInput = ""
                        }) {
                            Image(systemName: "paperplane")
                                .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                                .frame(width: 45, height: 45)
                                .background(Color("Background"))
                                .clipShape(Circle())
                                .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                                .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
                                .imageScale(.large)
                                .padding(30)
                        }
                    }
                }
                    .frame(height: 70)
            }
                .navigationTitle("Сообщения")
                .onAppear {
                    chatController.receiveMessages()
                }
        }
    }
}
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
