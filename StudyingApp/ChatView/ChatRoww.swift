//
//  ChatRoww.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

struct ChatRoww: View {
    
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isMe {
                Spacer()
            }
            VStack(alignment: .leading) {
                Text(message.username)
                    .font(.footnote)
                    .foregroundColor(message.isMe ? Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)) : Color(#colorLiteral(red: 0.8745098039, green: 0.5725490196, blue: 0.5725490196, alpha: 1)))
                Text(message.messageText)
                    .font(.body)
                    .foregroundColor(message.isMe ? .black : .black)
                    .lineLimit(nil)
            }
                .padding(10)
                .background(message.isMe ? Color("Background") : Color("Background"))
                .cornerRadius (10)
                .frame(maxWidth: 280, alignment: message.isMe ? .trailing : .leading)
                .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
            if !message.isMe {
                Spacer()
            }
        }
            .padding()
    }
}

struct ChatRoww_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoww(message: ChatMessage(messageText: "Hello", username: "Not me"))
    }
}
