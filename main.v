import vec
import math
import ray

fn hit_sphere(center vec.Vec3, radius f64, r ray.Ray) f64 {
	oc := r.origin() - center
	a := r.direction().dot(r.direction())
	b := oc.dot(r.direction()) * 2.0
	c := oc.dot(oc) - radius * radius
	discriminant := b * b - 4.0 * (a * c)
	if discriminant < 0 {
		return -1.0
	} else {
		return (-b - math.sqrt(discriminant)) / (2.0 * a)
	}
}

fn ray_color(r ray.Ray) vec.Vec3 {
	mut t := hit_sphere(vec.Vec3{ e: [0.0, 0.0, -1.0] }, 0.5, r)
	if t > 0.0 {
		n := vec.unit_vector(r.at(t) - vec.Vec3{
			e: [0.0, 0.0, -1.0]
		})
		return vec.Vec3{
			e: [n.x() + 1.0, n.y() + 1.0, n.z() + 1.0]
		}.mul_scalar(0.5)
	}

	unit_direction := vec.unit_vector(r.direction())
	t = 0.5 * (unit_direction.y() + 1.0)
	return vec.Vec3{
		e: [1.0, 1.0, 1.0]
	}.mul_scalar(1.0 - t) + vec.Vec3{
		e: [0.5, 0.7, 1.0]
	}.mul_scalar(t)
}

fn main() {
	aspect_ratio := 16.0 / 9.0
	image_width := 600
	image_height := int(image_width / aspect_ratio)

	// Camera
	viewport_height := 2.0
	viewport_width := aspect_ratio * viewport_height
	focal_length := 1.0

	origin := vec.Vec3{
		e: [0.0, 0.0, 0.0]
	}
	horizontal := vec.Vec3{
		e: [viewport_width, 0.0, 0.0]
	}
	vertical := vec.Vec3{
		e: [0.0, viewport_height, 0.0]
	}
	lower_left_corner := origin - horizontal.divide(2) - vertical.divide(2) - vec.Vec3{
		e: [0.0, 0.0, focal_length]
	}

	// Render
	println('P3\n${image_width} ${image_height}\n255')
	for j in 0 .. image_width {
		// eprintln('Scanlines remaining ${j}')
		for i in 0 .. image_width {
			u := f64(i) / (image_width - 1)
			v := f64(j) / (image_height - 1)
			r := ray.Ray{origin, lower_left_corner + horizontal.mul_scalar(u) +
				vertical.mul_scalar(v) - origin}
			pixel_color := ray_color(r)
			pixel_color.write_color()
		}
	}
}
