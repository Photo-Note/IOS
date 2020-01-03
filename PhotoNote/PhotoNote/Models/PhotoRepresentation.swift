//
//  PhotoRepresentation.swift
//  PhotoNote
//
//  Created by Alex Shillingford on 1/2/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import Foundation

struct PhotoRepresentation: Codable {
    var photo, name: String
    var partner, note: String?
}
