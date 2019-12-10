//
//  User.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

struct Login: Codable {
    var user: User
}

struct User: Codable {
    var _id: String
    var email: String
    var token: String
}
