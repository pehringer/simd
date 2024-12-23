//go:build arm64
// +build arm64

package neon

func AddFloat32(left, right, result []float32) int

func AddFloat64(left, right, result []float64) int

func AddInt32(left, right, result []int32) int

func AddInt64(left, right, result []int64) int

func AndInt32(left, right, result []int32) int

func AndInt64(left, right, result []int64) int

func MulFloat32(left, right, result []float32) int

func MulFloat64(left, right, result []float64) int

func MulInt32(left, right, result []int32) int

func OrInt32(left, right, result []int32) int

func OrInt64(left, right, result []int64) int

func SubFloat32(left, right, result []float32) int

func SubFloat64(left, right, result []float64) int

func SubInt32(left, right, result []int32) int

func SubInt64(left, right, result []int64) int
