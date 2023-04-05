//
//  GCD.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 4/5/23.
//

import Foundation

struct GCD {
    
    static func greatesCommonDivisor(_ a: Int, _ b: Int) -> Int{
        // GCD(0,b) = b
        if a == 0{
            return b
        }
        // GCD(a,0) - a
        if b == 0{
            return a
        }
        
        return greatesCommonDivisor(b, a % b)
    }
}
