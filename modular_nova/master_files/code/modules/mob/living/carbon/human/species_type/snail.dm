#define SHELL_TRANSPARENCY_ALPHA 90

/datum/species/snail
	mutantliver = /obj/item/organ/liver/snail //This is just a better liver to deal with toxins, it's a thematic thing.
	mutantheart = /obj/item/organ/heart/snail //This gives them the shell buff where they take less damage from behind, and their heart's more durable.

/datum/species/snail/on_species_gain(mob/living/carbon/new_snailperson, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	new_snailperson.update_icons()

/obj/item/storage/backpack/snail
	/// Whether or not a bluespace anomaly core has been inserted
	var/storage_core = FALSE
	slowdown = 6 // The snail's shell is what's making them slow.
	obj_flags = IMMUTABLE_SLOW //This should hopefully solve other issues involing it as well.
	alternate_worn_layer = ABOVE_BODY_FRONT_LAYER //This makes them layer over tails like the cult backpack; some tails really shouldn't appear over them!
	uses_advanced_reskins = TRUE
	storage_type = /datum/storage/backpack/snail
	unique_reskin = list(
		"Conical Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "coneshell",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "coneshell"
		),
		"Round Shell" = list(
			RESKIN_ICON = 'icons/obj/storage/backpack.dmi',
			RESKIN_ICON_STATE = "snailshell",
			RESKIN_WORN_ICON = 'icons/mob/clothing/back/backpack.dmi',
			RESKIN_WORN_ICON_STATE = "snailshell"
		),
		"Cinnamon Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "cinnamonshell",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "cinnamonshell"
		),
		"Caramel Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "caramelshell",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "caramelshell"
		),
		"Metal Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "mechashell",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "mechashell"
		),
		"Pyramid Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "pyramidshell",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "pyramidshell"
		),
		"Ivory Pyramid Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "pyramidshellwhite",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "pyramidshellwhite"
		),
		"Spiral Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "spiralshell",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "spiralshell"
		),
		"Ivory Spiral Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "spiralshellwhite",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "spiralshellwhite"
		),
		"Rocky Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "rockshell",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "rockshell"
		),
		"Ivory Rocky Shell" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi',
			RESKIN_ICON_STATE = "rockshellwhite",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/back.dmi',
			RESKIN_WORN_ICON_STATE = "rockshellwhite"
		),
	)

/datum/storage/backpack/snail
	max_total_storage = 30

/obj/item/storage/backpack/snail/build_worn_icon(
	default_layer = 0,
	default_icon_file = null,
	isinhands = FALSE,
	female_uniform = NO_FEMALE_UNIFORM,
	override_state = null,
	override_file = null,
	mutant_styles = NONE,
)

	var/mutable_appearance/standing = ..()
	if(storage_core == TRUE)
		standing.add_filter("bluespace_shell", 2, list("type" = "outline", "color" = COLOR_BLUE_LIGHT, "alpha" = SHELL_TRANSPARENCY_ALPHA, "size" = 1))
	return standing

/obj/item/storage/backpack/snail/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(storage_core || !istype(tool, /obj/item/assembly/signaler/anomaly/bluespace))
		return NONE

	qdel(tool)
	upgrade_to_bluespace(user)
	to_chat(user, span_notice("You insert [tool] into your shell, and it starts to glow blue with expanded storage potential!"))
	return ITEM_INTERACT_SUCCESS

/// Upgrades the storage capacity of the snail shell and gives it a glowy blue outline
/obj/item/storage/backpack/snail/proc/upgrade_to_bluespace(mob/living/wearer)
	add_filter("bluespace_shell", 2, list("type" = "outline", "color" = COLOR_BLUE_LIGHT, "size" = 1))
	playsound(src, 'sound/machines/click.ogg', 50, TRUE)
	storage_core = TRUE
	var/old_inventory = atom_storage.return_inv(FALSE)
	emptyStorage()
	create_storage(max_specific_storage = WEIGHT_CLASS_GIGANTIC, max_total_storage = 35, max_slots = 30, storage_type = /datum/storage/bag_of_holding)
	for(var/obj/item/stored_item in old_inventory)
		atom_storage.attempt_insert(stored_item, override = TRUE, messages = FALSE, force = TRUE)
	name = "snail shell of holding"
	update_appearance()

	// Update the worn sprite with the blue outline too if applicable
	if(isnull(wearer))
		wearer = loc
	if(istype(wearer))
		wearer.update_worn_back()

/datum/species/snail/prepare_human_for_preview(mob/living/carbon/human/snail)
	snail.dna.features["mcolor"] = "#adaba7"
	snail.update_body(TRUE)

/datum/species/snail/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "home",
			SPECIES_PERK_NAME = "Shellback",
			SPECIES_PERK_DESC = "Snails have a shell fused to their back. It offers great storage and most importantly gives them 50% brute damage reduction from behind, or while resting. Alt click to change the sprite!",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "wine-glass",
			SPECIES_PERK_NAME = "Poison Resistance",
			SPECIES_PERK_DESC = "Snails have a higher tolerance for poison owing to their robust livers.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "heart",
			SPECIES_PERK_NAME = "Double Hearts",
			SPECIES_PERK_DESC = "Snails have two hearts, meaning it'll take more to break theirs.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "water",
			SPECIES_PERK_NAME = "Water Breathing",
			SPECIES_PERK_DESC = "Snails can breathe underwater.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bone",
			SPECIES_PERK_NAME = "Boneless",
			SPECIES_PERK_DESC = "Snails are invertebrates, meaning they don't take bone wounds, but are easier to delimb.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "crutch",
			SPECIES_PERK_NAME = "Sheer Mollusk Speed",
			SPECIES_PERK_DESC = "Snails move incredibly slow while standing. They move much faster while crawling, and can stick to the floors when the gravity is out.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "frown",
			SPECIES_PERK_NAME = "Weak Fighter",
			SPECIES_PERK_DESC = "Snails punch half as hard as a human.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "skull",
			SPECIES_PERK_NAME = "Salt Weakness",
			SPECIES_PERK_DESC = "Salt burns snails, and salt piles will block their path.",
		),
	)

	return to_add

#undef SHELL_TRANSPARENCY_ALPHA
