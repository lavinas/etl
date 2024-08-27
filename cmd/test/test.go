package main

import (
	"fmt"
)

type Node struct {
	Id           int64
	Dependencies []*Node
}

// Helper function to perform DFS and detect cycles
func topologicalSortUtil(node *Node, visited map[int64]bool, stack *[]*Node, tempMark map[int64]bool) bool {
	if tempMark[node.Id] {
		return false // Cycle detected
	}
	if !visited[node.Id] {
		tempMark[node.Id] = true
		for _, dep := range node.Dependencies {
			if !topologicalSortUtil(dep, visited, stack, tempMark) {
				return false
			}
		}
		tempMark[node.Id] = false
		visited[node.Id] = true
		*stack = append(*stack, node)
	}
	return true
}

// Function to perform topological sort
func topologicalSort(nodes []*Node) ([]*Node, error) {
	visited := make(map[int64]bool)
	tempMark := make(map[int64]bool)
	var stack []*Node

	for _, node := range nodes {
		if !visited[node.Id] {
			if !topologicalSortUtil(node, visited, &stack, tempMark) {
				return nil, fmt.Errorf("cycle detected in the graph")
			}
		}
	}

	// Reverse the stack to get the correct order
	for i, j := 0, len(stack)-1; i < j; i, j = i+1, j-1 {
		stack[i], stack[j] = stack[j], stack[i]
	}

	return stack, nil
}

func main() {
	// Example usage
	node1 := &Node{Id: 1}
	node2 := &Node{Id: 2}
	node3 := &Node{Id: 3}
	node4 := &Node{Id: 4}

	node3.Dependencies = []*Node{node1}
	node4.Dependencies = []*Node{node2, node3}

	nodes := []*Node{node1, node2, node3, node4}

	sortedNodes, err := topologicalSort(nodes)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		for _, node := range sortedNodes {
			fmt.Println("Node ID:", node.Id)
		}
	}
}
