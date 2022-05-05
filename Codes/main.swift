//
//  main.swift
//  Codes
//
//  Created by Михаил Фокин on 02.05.2022.
//

import Foundation

class Solution {
    let chars = "([{"
    let dict = [
            ")":"(",
            "]":"[",
            "}":"{"
        ]
    func isValid(_ s: String) -> Bool {
        var stack: [String] = []
        for c in s {
            if chars.contains(c) {
                stack.append(String(c))
            } else {
                if stack.isEmpty { continue }
                guard let last = stack.popLast() else { continue }
                if last != dict[String(c)]! {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let set = Set<Int>(nums)
        var arr: [Int]? = set.map({$0}).sorted()
        for (i, c) in arr!.enumerated() {
            let j = nums.index(nums.startIndex, offsetBy: i)
            nums[j] = c
        }
        arr = nil
        return set.count
    }
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let arr = nums.filter( {$0 != val} )
        for (i, c) in arr.enumerated() {
            let j = nums.index(nums.startIndex, offsetBy: i)
            nums[j] = c
        }
        return arr.count
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        var s = 0
        var resS = Int.min
        for n in nums {
            s += n
            s = max(n, s)
            resS = max(s, resS)
        }
        return resS
    }
    
    func lengthOfLastWord(_ s: String) -> Int {
        let arr = s.split{ $0 == " "}.map( { String($0) } )
        guard let last = arr.last else { return 0 }
        return last.count
    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var div = 1
        var result = [Int]()
        for digit in digits.reversed() {
            let num = (digit + div)
            result.append(num % 10)
            div = num / 10
        }
        if div != 0 { result.append(div) }
        return result.reversed()
    }
    
    // MARK: 67. Add Binary
    private func stringToBinary(_ s: String) -> [Int] {
            var num = [Int]()
            for c in s {
                if c == "1" {
                    num.append(1)
                } else {
                    num.append(0)
                }
            }
            return num
        }
        
    func addBinary(_ a: String, _ b: String) -> String {
        var one = stringToBinary(a)
        var two = stringToBinary(b)
        if one.count < two.count {
            (one, two) = (two, one)
        }
        var div = 0
        var result = [Int]()
        for bitOne in one.reversed() {
            let bitTwo: Int
            if !two.isEmpty {
                bitTwo = two.popLast()!
            } else {
                bitTwo = 0
            }
            let num = (bitOne + bitTwo + div)
            result.append(num % 2)
            div = num / 2
        }
        if div != 0 { result.append(div) }
        var str = ""
        result = result.reversed()
        result.forEach( { str.append(String($0)) })
        return str
    }
}
let one = Solution()
var arr = [1,1,2]
print(one.removeDuplicates(&arr), arr)
