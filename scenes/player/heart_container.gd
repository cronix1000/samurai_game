extends HBoxContainer

func on_health_updated(health):
	var heart_sections := 4  
	var total_hearts := get_child_count()  

	for i in range(total_hearts):
		var heart = get_child(i)
		var atlas = heart.texture as AtlasTexture

		var health_for_this_heart = clamp(health - i * heart_sections, 0, heart_sections)

		if health_for_this_heart < heart_sections:
			atlas.region.position.x = (heart_sections - health_for_this_heart) * atlas.region.size.x
