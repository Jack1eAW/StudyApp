//
//  DataBaseConstans.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import Firebase
import FirebaseDatabase

let databaseRoot = Database.database().reference()
let databaseChats = databaseRoot.child("chats")
