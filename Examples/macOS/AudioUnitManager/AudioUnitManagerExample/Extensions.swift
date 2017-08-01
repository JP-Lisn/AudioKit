//
//  Extensions.swift
//  AudioUnitManagerExample
//
//  Created by Ryan Francesconi on 7/14/17.
//  Copyright © 2017 Ryan Francesconi. All rights reserved.
//

import Cocoa

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    func indexOf(string: String) -> String.Index? {
        return self.range( of:string, options: .literal, range: nil, locale: nil)?.lowerBound
    }
    
    //    func index(of string: String) -> String.Index? {
    //        return range(of: string)?.lowerBound
    //    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func toCGFloat() -> CGFloat {
        if let n = NumberFormatter().number(from: self) {
            let f = CGFloat(n)
            return f
        }
        return 0.0
    }
    
    func toInt() -> Int {
        if let n = NumberFormatter().number(from: self) {
            let f = Int(n)
            return f
        }
        return 0
    }
    
    func toDouble() -> Double {
        if let n = NumberFormatter().number(from: self) {
            let f = Double(n)
            return f
        }
        return 0.0
    }
    
    func startsWith(string: String) -> Bool {
        
        guard let range = self.range( of: string, options:[.anchored, .caseInsensitive]) else {
            return false
        }
        
        return range.lowerBound == startIndex
    }
    
    func removeSpecial() -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-_".characters)
        return String(self.characters.filter {okayChars.contains($0) })
    }
    
    
    func asciiValue() -> [UInt8] {
        
        var retVal = [UInt8]()
        for val in self.unicodeScalars where val.isASCII {
            
            retVal.append(UInt8(val.value))
        }
        return retVal
    }
    
}

extension String.Index {
    func successor(in string:String)->String.Index {
        return string.index(after: self)
    }
    
    func predecessor(in string:String)->String.Index {
        return string.index(before: self)
    }
    
    func advance(_ offset:Int, `for` string:String)->String.Index {
        return string.index(self, offsetBy: offset)
    }
}

