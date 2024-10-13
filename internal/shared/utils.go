package shared

import (
    "testing"
)

func CheckSlice[E Element](t *testing.T, test, control []E) bool {
    if len(test) != len(control) {
        t.Errorf("lengths not equal")
        return false
    }
    if cap(test) != cap(control) {
        t.Errorf("capacities not equal")
        return false
    }
    for i := 0; i < len(control); i++ {
        if test[i] != control[i] {
            t.Errorf("elements not equal")
            return false
        }
    }
    return true
}

func CheckOperation[E Element](t *testing.T, test, control Operation[E], left, right, result []E) bool {
    testLeft := make([]E, len(left), cap(left))
    copy(testLeft, left)
    testRight := make([]E, len(right), cap(right))
    copy(testRight, right)
    testResult := make([]E, len(result), cap(result))
    copy(testResult, result)
    if test(testLeft, testRight, testResult) != control(left, right, result) {
        t.Errorf("operation returned incorrect length")
	return false
    }
    if !CheckSlice(t, testLeft, left) {
        return false
    }
    if !CheckSlice(t, testRight, right) {
        return false
    }
    if !CheckSlice(t, testResult, result) {
        return false
    }
    return true
}

var (
    counter int8
)

func Vector[E Element](length int) []E {
    elements := make([]E, length)
    for i := 0; i < length; i++ {
        counter++
        if counter == 0 {
            counter = 1
        }
        elements[i] = E(counter)
    }
    return elements
}