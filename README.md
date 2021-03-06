## LWW-Element-Set (Last-Write-Wins-Element-Set)

LWW-Element-Set is similar to 2P-Set in that it consists of an "add set" and a "remove set", with a timestamp for each element. Elements are added to an LWW-Element-Set by inserting the element into the add set, with a timestamp. Elements are removed from the LWW-Element-Set by being added to the remove set, again with a timestamp. An element is a member of the LWW-Element-Set if it is in the add set, and either not in the remove set, or in the remove set but with an earlier timestamp than the latest timestamp in the add set. Merging two replicas of the LWW-Element-Set consists of taking the union of the add sets and the union of the remove sets. When timestamps are equal, the "bias" of the LWW-Element-Set comes into play. A LWW-Element-Set can be biased towards adds or removals. The advantage of LWW-Element-Set over 2P-Set is that, unlike 2P-Set, LWW-Element-Set allows an element to be reinserted after having been removed.

### Usage
- Import framework using below statement.

```
import LWWElementSet
```

- To create an instance of `LWWSet`

```
var set = LWWSet()
```
we are using `var` as `LWWSet` is implemented using struct and operations on this set are mutating.

- To add element 

```
set.addElement(element: SetElement(name: "apple", timestamp: Date()))
```

or 

```
set.addElement(element: SetElement(name: "apple")) // timestamp is created internally

```

- To remove element

```
set.removeElement(element: SetElement(name: "apple", timestamp: Date()))
```

or 

```
set.removeElement(element: SetElement(name: "apple"))
```

- To get current list of items present in set

```
let items:[SetElement] = set.listItems()
```

- To query existence of element

```
let isItemExist: Bool = set.query(name: "apple")
```

## Author
Harpreet Singh 
[harry.singh1064@gmail.com](mailto:harry.singh1064@gmail.com)

### Reference 
https://en.wikipedia.org/wiki/Conflict-free_replicated_data_type#LWW-Element-Set_(Last-Write-Wins-Element-Set)

https://medium.com/livefront/how-to-add-a-dynamic-swift-framework-to-a-command-line-tool-bab6426d6c31
