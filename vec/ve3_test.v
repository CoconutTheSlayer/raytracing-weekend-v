module vec3

const (
	vec_a = Vec3{
		e: [1.0, 1.0, 1.0]
	}
	vec_b = Vec3{
		e: [2.0, 2.0, 2.0]
	}
)

fn test_addition() {
	assert vec3.vec_a + vec3.vec_b == Vec3{
		e: [3.0, 3.0, 3.0]
	}
}

fn test_subtraction() {
	assert vec3.vec_a - vec3.vec_b == Vec3{
		e: [-1.0, -1.0, -1.0]
	}
}

fn test_multiply() {
	assert vec3.vec_a * vec3.vec_b == Vec3{
		e: [2.0, 2.0, 2.0]
	}
}

fn test_hypotenuse() {
	assert vec3.vec_a.length_squared() == 3.0
}

fn test_length() {
	assert vec3.vec_a.length() == 1.7320508075688772
}

fn test_divice() {
	assert vec3.vec_b.divide(2.0) == Vec3{
		e: [1.0, 1.0, 1.0]
	}
}
