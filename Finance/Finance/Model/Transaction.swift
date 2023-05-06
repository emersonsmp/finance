//
//  Transaction.swift
//  Finance
//
//  Created by Emerson Sampaio on 05/05/23.
//

import Foundation
import UIKit

struct Transaction {
    var icon: String
    
    var image: UIImage{
        return UIImage(named: icon)!
    }
    
    var userName: String
    var bank: String
    var value: Float
}
