fn main() {
	// Image
	image_width := 256
	image_height := 256

	//Render
	println('P3\n${image_width} ${image_height}\n255')
	for j in 0 .. image_width {
		eprintln('Scanlines remaining ${j}')
		for i in 0 .. image_width {
			r := f32(i) / (image_width - 1)
			g := f32(j) / (image_height - 1)
			b := 0.25

			ir := int(255.999 * r)
			ig := int(255.999 * g)
			ib := int(255.999 * b)

			println('${ir} ${ig} ${ib}')
		}
	}
}
