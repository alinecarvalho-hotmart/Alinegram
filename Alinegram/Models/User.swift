//
//  User.swift
//  Alinegram
//
//  Created by Aline Miranda Dutra de Carvalho on 16/07/21.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {

    // MARK: - Properties

    let uid: String
    let username: String

    // MARK: - Init

    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? NSDictionary,
              let username = dict["username"] as? String
        else { return nil }

        self.uid = snapshot.key
        self.username = username
    }
}
