module ray

import vec

pub struct Ray {
	origin    vec.Vec3
	direction vec.Vec3
}

pub fn (r Ray) origin() vec.Vec3 {
	return r.origin
}

pub fn (r Ray) direction() vec.Vec3 {
	return r.direction
}

pub fn (r Ray) at(t f64) vec.Vec3 {
	return r.origin() + r.direction().mul_scalar(t)
}
