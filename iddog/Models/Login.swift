//
//  User.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

struct Login: Codable {
    let user: User
}

struct User: Codable {
    let _id: String
    let email: String
    let token: String
}
