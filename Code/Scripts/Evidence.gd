extends Node2D

var items_selected = 0
var current_items = []
var excluded_items = []
var evidence = 0
var exclude = 0

const fingerprints = 1
const freezingtemps = 2
const book = 4
const emf = 8
const orbs = 16
const spiritbox = 32

const number_to_evidence_name = {
		1: "Fingerprints",
		2: "Freezing Temps",
		4: "Ghost Writing",
		8: "EMF 5",
		16: "Ghost Orbs",
		32: "Spiritbox"
}

const index_to_evidence = {
	0: fingerprints,
	1: freezingtemps,
	2: book,
	3: emf,
	4: orbs,
	5: spiritbox
}

const ghosts = [
	["Banshee", emf + freezingtemps + fingerprints], 
	["Demon", freezingtemps + book + spiritbox],
	["Jinn", emf + orbs + spiritbox],
	["Mare", freezingtemps + orbs + spiritbox],
	["Oni", emf + book + spiritbox], 
	["Phantom", emf + freezingtemps + orbs], 
	["Poltergeist", fingerprints + orbs + spiritbox], 
	["Revenant", emf + fingerprints + book], 
	["Shade", emf + orbs + book], 
	["Spirit", fingerprints + book + spiritbox], 
	["Wraith", fingerprints + freezingtemps + spiritbox], 
	["Yurei", freezingtemps + orbs + book]
]

func missing_evidence(ghost):
	var missing_text = ""
	for number in number_to_evidence_name:
		if number & (ghost - evidence) == number:
			missing_text += " | " + number_to_evidence_name[number]
	return missing_text

func possible_outcomes():
	var evidence_text = ""
	for ghost in ghosts:
		if ghost[1] == evidence:
			evidence_text = "Ghost is a " + ghost[0] + "\n"
		elif (ghost[1] & evidence) == evidence and (ghost[1] & exclude) == 0:
			if items_selected == 0 and exclude == 0:
				evidence_text = "All" + "\n"
			else:
				evidence_text += ghost[0] + missing_evidence(ghost[1]) + "\n"
	return evidence_text

func _on_Evidence_List_multi_selected(index, selected):
	if get_node("Evidence_List").get_item_custom_bg_color(index) == Color(1, 0, 0, 1):
		get_node("Evidence_List").set_item_custom_bg_color(index, Color(0, 0, 0, 1))
		excluded_items.erase(index)
		exclude -= index_to_evidence[index]
		get_node("Evidence_Outcomes").text = possible_outcomes()
	elif get_node("Evidence_List").get_item_custom_bg_color(index) == Color(0, 1, 0, 1):
		get_node("Evidence_List").set_item_custom_bg_color(index, Color(1, 0, 0, 1))
		items_selected -= 1
		excluded_items.append(index)
		exclude += index_to_evidence[index]
		evidence -= index_to_evidence[index]
		get_node("Evidence_Outcomes").text = possible_outcomes()
	else:
		if items_selected < 3:
			get_node("Evidence_List").set_item_custom_bg_color(index, Color(0, 1, 0, 1))
			items_selected += 1
			current_items.append(index)
			evidence += index_to_evidence[index]
			get_node("Evidence_Outcomes").text = possible_outcomes()
