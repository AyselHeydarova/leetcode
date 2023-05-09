/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reorderList(_ head: ListNode?) {
        /// find middle point
        var slow = head
        var fast = head?.next

        while fast != nil || fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        /// Reverse the second part
        var secondHalf = slow?.next // second half of list starts after slow
        slow?.next = nil  // breaking first half of the list

        var previous: ListNode? = nil

        while secondHalf != nil {
            var tmp = secondHalf?.next
            secondHalf?.next = previous // reversing second half of list
            previous = secondHalf // update prev pointer
            secondHalf = tmp // update second pointer
         }

         /// Merge two halfs
         var first = head
         var second = previous // after while loop second will be nil, prev will be new head

         while second != nil { // second half could be shorter so check with second part
            var tmp1 = first?.next
            var tmp2 = second?.next // as links will be broken we need to save next ones on tempr variable

            first?.next = second
            second?.next = tmp1 
            // shift the pointers
            first = tmp1
            second = tmp2  
        }
    }
}
