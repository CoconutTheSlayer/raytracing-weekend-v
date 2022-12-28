module vec

import math

pub struct Vec3 {
mut:
	e []f64 = [0.0, 0.0, 0.0]
}

pub fn (v Vec3) x() f64 {
	return v.e[0]
}

pub fn (v Vec3) y() f64 {
	return v.e[1]
}

pub fn (v Vec3) z() f64 {
	return v.e[2]
}

pub fn (v Vec3) length() f64 {
	return math.sqrt(v.length_squared())
}

pub fn (v Vec3) length_squared() f64 {
	return v.e[0] * v.e[0] + v.e[1] * v.e[1] + v.e[2] * v.e[2]
}

pub fn (v Vec3) str() string {
	return '{${v.e[0]}, ${v.e[1]}, ${v.e[2]}}'
}

pub fn (a Vec3) + (b Vec3) Vec3 {
	return Vec3{[a.e[0] + b.e[0], a.e[1] + b.e[1], a.e[2] + b.e[2]]}
}

pub fn (a Vec3) - (b Vec3) Vec3 {
	return Vec3{[a.e[0] - b.e[0], a.e[1] - b.e[1], a.e[2] - b.e[2]]}
}

pub fn (a Vec3) minus(t f64) Vec3 {
	return Vec3{[a.e[0] - t, a.e[1] - t, a.e[2] - t]}
}

pub fn (a Vec3) * (b Vec3) Vec3 {
	return Vec3{[a.e[0] * b.e[0], a.e[1] * b.e[1], a.e[2] * b.e[2]]}
}

pub fn (a Vec3) mul_scalar(t f64) Vec3 {
	return Vec3{
		e: [a.e[0] * t, a.e[1] * t, a.e[2] * t]
	}
}

pub fn (a Vec3) / (b Vec3) Vec3 {
	return Vec3{[a.e[0] / b.e[0], a.e[1] / b.e[1], a.e[2] / b.e[2]]}
}

pub fn (a Vec3) divide(t f64) Vec3 {
	return Vec3{[a.e[0] / t, a.e[1] / t, a.e[2] / t]}
}

pub fn (a Vec3) dot(b Vec3) f64 {
	return a.e[0] * b.e[0] + a.e[1] * b.e[1] + a.e[2] * b.e[2]
}

pub fn dot(a Vec3, b Vec3) f64 {
	return a.e[0] * b.e[0] + a.e[1] * b.e[1] + a.e[2] * b.e[2]
}

pub fn (a Vec3) cross(b Vec3) Vec3 {
	return Vec3{[
		a.e[1] * b.e[2] - a.e[2] * b.e[1],
		a.e[2] * b.e[0] - a.e[0] * b.e[2],
		a.e[0] * b.e[1] - a.e[1] * b.e[0],
	]}
}

pub fn (a Vec3) write_color() {
	println('${int(255.999 * a.x())} ${int(255.999 * a.y())} ${int(255.999 * a.z())}')
}

pub fn (a Vec3) unit_vector() Vec3 {
	return a.divide(a.length())
}

pub fn unit_vector(a Vec3) Vec3 {
	return a.divide(a.length())
}
