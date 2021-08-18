//
//  ChatMessage.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import Foundation

struct ChatMessage: Hashable {
    let messageText: String
    let username: String
    let isMe: Bool
    let messageID = UUID()
    
    init(messageText: String, username: String) {
        self.messageText = messageText
        self.username = username
        if UserDefaults.standard.string(forKey: "username") == username {
            self.isMe = true
        } else {
            self.isMe = false
        }
    }
}
