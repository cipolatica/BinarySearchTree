//
//  BST.swift
//  BST
//
//  Created by Alberto Plata on 12/13/17.
//  Copyright © 2017 Alberto Plata. All rights reserved.
//

import Foundation

enum BST_Node <T: Comparable> {
    
    case empty
    indirect case node(BST_Node,T,BST_Node)
    
    init() {
        self = BST_Node.empty
    }
    
    init(value: T) {
        self = BST_Node.node(.empty, value, .empty)
    }
    
    func insert(value: T) -> BST_Node {
        switch self {
        case .empty:
            return .node(.empty,value,.empty)
            
        case let .node(left,currentValue,right):
            if value < currentValue {
                return .node(left.insert(value: value),currentValue,right)
            } else {
                return .node(left,currentValue,right.insert(value: value))
            }
        }
        
    }
    
    func remove(value: T) -> BST_Node {
        switch self {
        case .empty:
            return .empty
        case .node(let left, var currentValue, let right):
            if value < currentValue {
                return .node(left.remove(value: value),currentValue,right)
            }
            else if value > currentValue {
                return .node(left.remove(value: value),currentValue,right.remove(value: value))
            }
            else {
                if case .node(_,_,_) = left {
                    currentValue = left.findMax()!
                    return .node(left.remove(value: currentValue),currentValue,right)
                } else if case .node(_,_,_) = right {
                    currentValue = right.findMin()!
                    return .node(left,currentValue,right.remove(value: currentValue))
                } else {
                    return .empty
                }
            }
        }
    }
    
    func findMax() -> T? {
        
        if case let .node(_,currentValue,right) = self {
            if case .empty = right {
                return currentValue
            }
            else {
                return right.findMax()
            }
        }
        return nil
    }
    
    func findMin() -> T? {
        
        if case let .node(left,currentValue,_) = self {
            if case .empty = left {
                return currentValue
            }
            else {
                return left.findMax()
            }
        }
        return nil
    }
    
    func isBST(min: T, max: T) -> Bool {
        switch self {
        case .empty:
            return true
            
        case let .node(left,currentValue,right):
            if min < currentValue && max > currentValue {
                return left.isBST(min: min, max: currentValue) && right.isBST(min: currentValue, max: max)
            }
            return false
        }
    }
    
    func findLCA(v1: T, v2: T) -> T? {
        switch self {
        case .empty:
            return nil
        case let .node(left,currentValue,right):
            let doesEitherValueEqualCurrent = v1 == currentValue || v2 == currentValue
            let areValuesOnOppositeChildren = (v1 < currentValue && v2 > currentValue) || (v2 < currentValue && v1 > currentValue)
            
            if doesEitherValueEqualCurrent || areValuesOnOppositeChildren {
                return currentValue
            } else if v1 < currentValue {
                return left.findLCA(v1: v1, v2: v2)
            } else {
                return right.findLCA(v1: v1, v2: v2)
            }
        }
    }
    
    func contains(value: T) -> Bool {
        switch self {
        case .empty:
            return false
            
        case let .node(left, currentValue, right):
            if value < currentValue {
                return left.contains(value: value)
            } else if value > currentValue {
                return right.contains(value: value)
            } else {
                return true
            }
        }
    }
    
    func maxHeight() -> Int{
        switch self {
        case .empty:
            return 0
        case let .node(left,_,right):
            return max(left.maxHeight() + 1, right.maxHeight() + 1)
        }
    }
    
    func minHeight() -> Int{
        switch self {
        case .empty:
            return 0
        case let .node(left,_,right):
            return min(left.minHeight() + 1, right.minHeight() + 1)
        }
    }
    
    func printPreOrder(level: Int) {
        switch self {
        case .empty:
            return
        case let .node(left,currentValue,right):
            for _ in 0..<level{
                print("  |", terminator: "")
            }
            print(currentValue)
            left.printPreOrder(level: level+1)
            right.printPreOrder(level: level+1)
        }
    }
    
    func printInOrder(level: Int) {
        switch self {
        case .empty:
            return
        case let .node(left,currentValue,right):
            left.printInOrder(level: level+1)
            for _ in 0..<level{
                print("  |", terminator: "")
            }
            print(currentValue)
            right.printInOrder(level: level+1)
        }
    }
    
    func printPostOrder(level: Int) {
        switch self {
        case .empty:
            return
        case let .node(left,currentValue,right):
            left.printPostOrder(level: level+1)
            right.printPostOrder(level: level+1)
            for _ in 0..<level{
                print("  |", terminator: "")
            }
            print(currentValue)
        }
    }
    
    func printBFS() {
        var node = self
        if case .node(_,_,_) = node {
            
            var queue: [BST_Node<T>] = [node]
            while queue.count > 0 {
                node = queue.first!
                queue.removeFirst()
                switch node {
                case .empty:
                    return
                case let .node(left,val,right):
                    print(val)
                    if case .node(_,_,_) = left {
                        queue.append(left)
                    }
                    if case .node(_,_,_) = right {
                        queue.append(right)
                    }
                }
            }
        }
        else { return }
    }
    
    func printCurrent() {
        switch self {
        case .empty:
            return
        case let .node(_,currentValue,_):
            print(currentValue)
        }
    }
}

// Generic BST class
public class BST <T: Comparable>  {
    
    typealias Node = BST_Node
    var head: Node<T>?
    private var count: Int
    
    // Init method
    public init() {
        count = 0
        head = nil
    }
    
    // Returns the number of nodes in the BST
    public func getSize() -> Int {
        return count
    }
    
    // Insert a value into the BST. This BST does not insert duplicate values.
    // Returns true if value was inserted into the BST, false otherwise
    // Runtime: O(h) where h is the height of the tree
    public func insert(value: T) -> Bool {
        
        if head != nil {
            guard !head!.contains(value: value) else { return false }
            head = head!.insert(value: value)
        }
        else {
            head = Node(value: value)
        }
        count += 1
        return true
    }
    
    // Remove a value from the BST.
    // Returns true if value was removed, false otherwise (if value wasn't in BST)
    // Runtime: O(h) where h is the height of the tree
    public func remove(value: T) -> Bool {
        
        guard head != nil && count > 0 && head!.contains(value: value) else { return false }
        
        if count == 1 {
            head = nil
        } else {
            head = head!.remove(value: value)
        }
        count -= 1
        return true
    }
    
    // Checks if value is contained within the BST
    // Returns true if value is present, false otherwise
    // Runtime: O(h) where h is the height of the tree
    public func contains(value: T) -> Bool {
        
        guard head != nil else { return false }
        return head!.contains(value: value)
    }
    
    // Checks if BST is a valid binary search tree. i.e. left nodes are smaller and right nodes are larger
    // Returns true if BST is valid, false otherwiseand
    // Runtime: O(n) where n is the number of nodes in the tree
    public func isBST(min: T, max: T) -> Bool {
        
        guard head != nil && count > 0 else { return true }
        return head!.isBST(min: min, max: max)
    }
    
    // Finds lowest common ancestor of two particular values in the BST
    // Return the value of the LCA, or nil if there is no LCA
    // Runtime: O(h) where h is the height of the tree
    public func findLCA(v1: T, v2: T) -> T? {
        
        guard head != nil && count > 0 else { return nil }
        guard head!.contains(value: v1) && head!.contains(value: v2) else { return nil }
        
        return head!.findLCA(v1: v1, v2: v2)!
    }
    
    // Checks if BST is balanced.
    // Returns true if the longest height of the tree and shortest height of the tree are within 1 level apart.
    // Runtime: O(n) where n is the number of nodes in the tree
    public func isBalanced() -> Bool {
        
        guard head != nil && count > 0 else { return true }
        
        return head!.maxHeight() - head!.minHeight() <= 1
    }
    
    // Prints the BST via Pre Order traversal
    public func printPreOrder() {
        
        head?.printPreOrder(level: 0)
    }
    
    // Prints the BST via In Order traversal
    public func printInOrder() {
        
        head?.printInOrder(level: 0)
    }
    
    // Prints the BST via Post Order traversal
    public func printPostOrder() {
        
        head?.printPostOrder(level: 0)
    }
    
    // Prints the BST via Breadth First Search traversal
    public func printBFS() {
        head?.printBFS()
    }
}
