//
//  main.swift
//  InsertNodeInPosition
//
//  Created by slava bily on 02.12.2021.
//

import Foundation

class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?
    
    init(data: Int, next: SinglyLinkedListNode? = nil) {
        self.data = data
        self.next = next
    }
}

func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func push(_ value: Int) {
        head = SinglyLinkedListNode(data: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    func append(_ value: Int) {
      // 1
      guard !isEmpty else {
        push(value)
        return
      }
      // 2
      tail!.next = SinglyLinkedListNode(data: value)
      // 3
      tail = tail!.next
    }
    
    func node(at index: Int) -> SinglyLinkedListNode? {
      // 1
      var currentNode = head
      var currentIndex = 0
      // 2
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
      }
      
      return currentNode
    }
    
    func insert(_ value: Int, after node: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
        // 2
        guard tail !== node else {
            append(value)
            return tail!
        }
        // 3
        node?.next = SinglyLinkedListNode(data: value, next: node?.next)
        return node?.next!
    }
    
    head = llist
    let currentNode = node(at: position)
    return insert(data, after: currentNode)
 }

