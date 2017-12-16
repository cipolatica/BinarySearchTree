//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let bst = BST<Int>()
_ = bst.insert(value: 50)
_ = bst.insert(value: 25)
_ = bst.insert(value: 75)
_ = bst.insert(value: 10)
_ = bst.insert(value: 40)
_ = bst.insert(value: 60)
_ = bst.insert(value: 90)
_ = bst.insert(value: 3)
_ = bst.insert(value: 13)
_ = bst.insert(value: 14)

bst.printInOrder()
print("\n")
bst.printPreOrder()
print("\n")
bst.printPostOrder()

_ = bst.remove(value: 50)
print(bst.isBalanced())
print("\n")
bst.printInOrder()
print(bst.isBalanced())

_ = bst.remove(value: 13)
bst.printInOrder()
print(bst.isBalanced())
_ = bst.insert(value: 39)
print(bst.isBalanced())
bst.printInOrder()
print("\n")
print(bst.findLCA(v1: 14, v2: 3)    ?? "nil")
print(bst.findLCA(v1: 3, v2: 14)    ?? "nil")
print(bst.findLCA(v1: 14, v2: 14)   ?? "nil")
print(bst.findLCA(v1: 10, v2: 3)    ?? "nil")
print(bst.findLCA(v1: 10, v2: 10)   ?? "nil")
print(bst.findLCA(v1: 90, v2: 3)    ?? "nil")
print(bst.findLCA(v1: 39, v2: 4)    ?? "nil")
print(bst.findLCA(v1: 40, v2: 40)   ?? "nil")



print("\n")
bst.printBFS()

print("\n")
print(bst.isBST(min: Int.min, max: Int.max))

