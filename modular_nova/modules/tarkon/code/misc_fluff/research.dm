///// First we enstate a techweb so we can add the node. /////

/datum/techweb/tarkon
	id = "TARKON"
	organization = "Tarkon Industries"
	should_generate_points = TRUE

/datum/techweb/tarkon/New()
	. = ..()
	research_node_id(TECHWEB_NODE_OLDSTATION_SURGERY, TRUE, TRUE, FALSE)
	research_node_id(TECHWEB_NODE_TARKON, TRUE, TRUE, FALSE)

/datum/techweb_node/tarkon
	id = TECHWEB_NODE_TARKON
	display_name = "Tarkon Industries Technology"
	description = "Tools used by Tarkon Industries."
	required_items_to_unlock = list(
		/obj/item/mod/construction/plating/tarkon,
		/obj/item/construction/rcd/tarkon,
		/obj/item/gun/energy/recharge/resonant_system,
	)
	design_ids = list(
		"mod_plating_tarkon",
		"arcs",
		"rcd_tarkon",
		"tarkonbsc",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	hidden = TRUE

/datum/techweb_node/tarkonturret //Yes. Tarkon does not start with this unlocked.
	id = TECHWEB_NODE_TARKON_DEFENSE
	display_name = "Tarkon Industries Technology"
	description = "Tarkon Industries Blackrust Salvage division's defense designs."
	prereq_ids = list(TECHWEB_NODE_TARKON, TECHWEB_NODE_BASIC_ARMS, TECHWEB_NODE_AI)
	design_ids = list(
		"hoplite_assembly",
		"cerberus_assembly",
		"target_designator",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)

/datum/design/mod_plating/tarkon
	name = "MOD Tarkon Plating"
	id = "mod_plating_tarkon"
	build_path = /obj/item/mod/construction/plating/tarkon
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/uranium = SHEET_MATERIAL_AMOUNT,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma = HALF_SHEET_MATERIAL_AMOUNT,
	)
	research_icon_state = "tarkon-plating"
	research_icon = 'modular_nova/modules/tarkon/icons/obj/mod_construct.dmi'

/datum/design/arcs
	name = "A.R.C.S Resonator"
	id = "arcs"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/uranium = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/diamond = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/gun/energy/recharge/resonant_system
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MINING
	)

/datum/design/tarkonbsc
	name = "Tarkon BSC Refinery Box"
	id = "tarkonbsc"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 3,
	)
	build_path = /obj/item/flatpacked_machine/boulder_collector/tarkon
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MINING
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO

/datum/design/tarkonrcd
	name = "Tarkon R.C.D"
	desc = "A Rapid Construction Device made by Tarkon Industries. Capable of ranged construction."
	id = "rcd_tarkon"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 30,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/uranium = SHEET_MATERIAL_AMOUNT * 4,
		/datum/material/diamond = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/bluespace = SHEET_MATERIAL_AMOUNT * 3,
		)
	build_path = /obj/item/construction/rcd/tarkon
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)

/datum/design/hoplite_assembly
	name = "Hoplite Turret Assembly"
	desc = "A deployable turret kit designed for basic construct defense. This one makes the \"Hoplite\" model."
	id = "hoplite_assembly"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 25,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 4,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 2,
		)
	build_path = /obj/item/turret_assembly/hoplite
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_WEAPONS_KITS
	)

/datum/design/cerberus_assembly
	name = "Cerberus Turret Assembly"
	desc = "A deployable turret kit designed for basic construct defense. This one makes the \"Cerberus\" model."
	id = "cerberus_assembly"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 30,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT * 20,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 3,
	)
	build_path = /obj/item/turret_assembly/cerberus
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_WEAPONS_KITS,
	)

/datum/design/target_designator
	name = "Turret Target Designator"
	desc = "A basic target designator designed to control magazine-fed turrets."
	id = "target_designator"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/target_designator
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_WEAPONS_KITS,
	)

///// Now we make the physical server /////

/obj/item/circuitboard/machine/rdserver/tarkon
	name = "Tarkon Industries R&D Server"
	build_path = /obj/machinery/rnd/server/tarkon

/obj/machinery/rnd/server/tarkon
	name = "\improper Tarkon Industries R&D Server"
	circuit = /obj/item/circuitboard/machine/rdserver/tarkon
	req_access = list(ACCESS_AWAY_SCIENCE)

/obj/machinery/rnd/server/tarkon/Initialize(mapload)
	var/datum/techweb/tarkon_techweb = locate(/datum/techweb/tarkon) in SSresearch.techwebs
	stored_research = tarkon_techweb
	return ..()

/obj/machinery/rnd/server/tarkon/examine(mob/user)
	. = ..()
	. += span_notice("You can use <b>research notes</b> on this to generate research points.")

/obj/machinery/rnd/server/tarkon/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(attacking_item, /obj/item/research_notes) && stored_research)
		var/obj/item/research_notes/research_notes = attacking_item
		stored_research.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = research_notes.value))
		playsound(src, 'sound/machines/copier.ogg', 50, TRUE)
		qdel(research_notes)
		return
	return ..()

/obj/machinery/rnd/production/protolathe/tarkon
	name = "Tarkon Industries Protolathe"
	desc = "Converts raw materials into useful objects. Refurbished and updated from its previous, limited capabilities."
	circuit = /obj/item/circuitboard/machine/protolathe/tarkon
	stripe_color = "#350f04"

/obj/item/circuitboard/machine/protolathe/tarkon
	name = "Tarkon Industries Protolathe"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/rnd/production/protolathe/tarkon
