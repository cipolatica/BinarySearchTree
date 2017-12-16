# BinarySearchTree
This is a generic Binary Search Tree class made in Swift. This BST class uses an enum for its node (BST_Node).


# Methods:

public func getSize() -> int 					

// Returns the number of nodes in the BST


public func insert(value: T) -> Bool			

// Insert a value into the BST. This BST does not insert duplicate values. Returns true if value was inserted into the BST, false otherwise. Runtime: O(h) where h is the height of the tree


public func remove(value: T) -> Bool  			

// Remove a value from the BST. Returns true if value was removed, false otherwise (if value wasn't in BST). Runtime: O(h) where h is the height of the tree


public func contains(value: T) -> Bool   		

// Checks if value is contained within the BST. Returns true if value is present, false otherwise. Runtime: O(h) where h is the height of the tree


public func isBST(min: T, max: T) -> Bool  		

// Checks if BST is a valid binary search tree. i.e. left nodes are smaller and right nodes are larger. Returns true if BST is valid, false otherwiseand. Runtime: O(n) where n is the number of nodes in the tree


public func findLCA(v1: T, v2: T) -> T?  		

// Finds lowest common ancestor of two particular values in the BST. Return the value of the LCA, or nil if there is no LCA. Runtime: O(h) where h is the height of the tree


public func isBalanced() -> Bool    			

// Checks if BST is balanced. Returns true if the longest height of the tree and shortest height of the tree are within 1 level apart. Runtime: O(n) where n is the number of nodes in the tree


public func printPreOrder()						

// Prints the BST via Pre Order traversal


public func printInOrder()

// Prints the BST via In Order traversal


public func printPostOrder()

// Prints the BST via Post Order traversal


public func printBFS()

// Prints the BST via Breadth First Search traversal


# Instructions:

Open up Playground and use that bad boy. There are already some examples in Playground :-)

