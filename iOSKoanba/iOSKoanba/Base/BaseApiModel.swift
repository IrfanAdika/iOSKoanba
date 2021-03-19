//
//  BaseApiModel.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation

struct BaseApiModel: Codable {
    let page: Int
    let results: [Movie]
}
