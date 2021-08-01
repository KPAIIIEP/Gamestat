function gamestat_mathround(val)
	return math.floor(val + 0.5)
end

function gamestat_sky_hint()
	local t = '('..time_gen()..')<br>'
	t = t..'Сложность: '..'<color=252,249,220><label=sl_difficulty_'..Game.HSP_difficulty()..'></color><br>'
	t = t..'Класс: <color=252,249,220>'..gen_hero_class()..'</color>(<color=252,249,220>'..Logic.hero_lu_var("level")..'</color>/<color=255,66,0>'..Logic.hero_lu_item("attack", "count")..'</color>/<color=0,254,10>'..Logic.hero_lu_item("defense", "count")..'</color>/<color=0,187,232>'..Logic.hero_lu_item("intellect", "count")..'</color>/'..Logic.hero_lu_item("leadership", "count")..')<br>'
	local bca = Game.GVNum("battles_count")
	--local bcw = Game.GVNum("clear_wins")
	local bcf = Game.AmountFights() - Game.AmountFightsSuccess()
	t = t.."Проведено битв: <color=252,249,220>"..bca.."</color>"
	--if bcw < bca then t = t .. "("..bcw..")"
	--else t = t.."(<color=0,254,10>"..bcw.."</color>)" end
	if bcf > 0 then t = t.."/<color=255,66,0>"..bcf.."</color>" end
	t = t.."<br>Потеряно воинов: <color=255,66,0>"..Game.GVNum("own_units_dead").."</color>("..Game.GVNum("own_units_leadership")..")"
	t = t.."<br>Убито врагов: <color=0,254,10>"..Game.GVNum("enemy_units_killed").."</color>("..Game.GVNum("enemy_units_leadership")..")"
	local d_a, d_m, d_s = Game.GVNum("damage_army"), Game.GVNum("damage_magic"), Game.GVNum("damage_spirits")
	if(d_a < 0) then d_a = 0 end
	local dmg = d_a + d_m + d_s
	if dmg > 0 then
		d_a = gamestat_mathround((d_a * 100) / dmg)
		d_m = gamestat_mathround((d_m * 100) / dmg)
		d_s = 100 - d_a - d_m
		if(d_s < 0) then d_s = 0 end
	end
	t = t.."<br>  войсками: <color=255,66,0>"..d_a.."%</color>"	
	t = t.."<br>  духами ярости: <color=0,254,10>"..d_s.."%</color>"
	t = t.."<br>  магией: <color=0,187,232>"..d_m.."%</color>"
	t = t.."<br>Получено:<br>  рун силы: <color=255,66,0>"..Game.GVNum("runes_might_received").."</color><br>  рун духа: <color=0,254,10>"..Game.GVNum("runes_mind_received").."</color><br>  рун магии: <color=0,187,232>"..Game.GVNum("runes_magic_received").."</color><br>  кристалов магии: <color=252,249,220>"..Game.GVNum("res_crystals_received").."</color>"
	return t
end
