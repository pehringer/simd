//go:build arm64
// +build arm64

package simd

import (
	"github.com/pehringer/simd/internal/neon"
)

func init() {
	if neon.Supported() {
		addFloat32 = neon.AddFloat32
		addInt32 = neon.AddInt32
		subFloat32 = neon.SubFloat32
		subInt32 = neon.SubInt32
	}
}
