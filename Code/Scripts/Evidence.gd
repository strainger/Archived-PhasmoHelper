extends Node2D

var items_selected = 0
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
	["Yurei", freezingtemps + orbs + book],
	["Yokai", orbs + book + spiritbox],
	["Hantu", fingerprints + orbs + book]
]

# FINGERPRINTS
var Image_Fingerprints_state = 0
var Image_Fingerprints_White = preload("res://Images/Evidence/White/img_handprint.png")
var Image_Fingerprints_Green = preload("res://Images/Evidence/Green/img_handprint.png")
var Image_Fingerprints_Red   = preload("res://Images/Evidence/Red/img_handprint.png")

# FREEZINGTEMPS
var Image_Freezing_state = 0
var Image_Freezing_White = preload("res://Images/Evidence/White/img_freezing.png")
var Image_Freezing_Green = preload("res://Images/Evidence/Green/img_freezing.png")
var Image_Freezing_Red   = preload("res://Images/Evidence/Red/img_freezing.png")

# BOOK
var Image_Book_state = 0
var Image_Book_White = preload("res://Images/Evidence/White/img_book.png")
var Image_Book_Green = preload("res://Images/Evidence/Green/img_book.png")
var Image_Book_Red   = preload("res://Images/Evidence/Red/img_book.png")

# EMF
var Image_EMF_state = 0
var Image_EMF_White = preload("res://Images/Evidence/White/img_emf.png")
var Image_EMF_Green = preload("res://Images/Evidence/Green/img_emf.png")
var Image_EMF_Red   = preload("res://Images/Evidence/Red/img_emf.png")

# ORBS
var Image_Orbs_state = 0
var Image_Orbs_White = preload("res://Images/Evidence/White/img_orbs.png")
var Image_Orbs_Green = preload("res://Images/Evidence/Green/img_orbs.png")
var Image_Orbs_Red   = preload("res://Images/Evidence/Red/img_orbs.png")

# SPIRITBOX
var Image_Spiritbox_state = 0
var Image_Spiritbox_White = preload("res://Images/Evidence/White/img_spiritbox.png")
var Image_Spiritbox_Green = preload("res://Images/Evidence/Green/img_spiritbox.png")
var Image_Spiritbox_Red   = preload("res://Images/Evidence/Red/img_spiritbox.png")

func _ready():
	get_node("Evidence_Fingerprints").texture_normal = Image_Fingerprints_White
	get_node("Evidence_Freezing").texture_normal = Image_Freezing_White
	get_node("Evidence_Book").texture_normal = Image_Book_White
	get_node("Evidence_EMF").texture_normal = Image_EMF_White
	get_node("Evidence_Orbs").texture_normal = Image_Orbs_White
	get_node("Evidence_Spiritbox").texture_normal = Image_Spiritbox_White

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

func _on_Evidence_Fingerprints_pressed():
	if Image_Fingerprints_state == 0 and items_selected != 3:
		get_node("Evidence_Fingerprints").texture_normal = Image_Fingerprints_Green
		Image_Fingerprints_state = 1
		items_selected += 1
		evidence += fingerprints
	elif Image_Fingerprints_state == 1:
		get_node("Evidence_Fingerprints").texture_normal = Image_Fingerprints_Red
		Image_Fingerprints_state = 2
		items_selected -= 1
		exclude += fingerprints
		evidence -= fingerprints
	elif Image_Fingerprints_state == 2:
		get_node("Evidence_Fingerprints").texture_normal = Image_Fingerprints_White
		Image_Fingerprints_state = 0
		exclude -= fingerprints
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Freezing_pressed():	
	if Image_Freezing_state == 0 and items_selected != 3:
		#get_node("Evidence_Freezing").texture_normal = Texture_Freezing_green
		get_node("Evidence_Freezing").texture_normal = Image_Freezing_Green
		Image_Freezing_state = 1
		items_selected += 1
		evidence += freezingtemps
	elif Image_Freezing_state == 1:
		get_node("Evidence_Freezing").texture_normal = Image_Freezing_Red
		Image_Freezing_state = 2
		items_selected -= 1
		exclude += freezingtemps
		evidence -= freezingtemps
	elif Image_Freezing_state == 2:
		get_node("Evidence_Freezing").texture_normal = Image_Freezing_White
		Image_Freezing_state = 0
		exclude -= freezingtemps
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Book_pressed():
	if Image_Book_state == 0 and items_selected != 3:
		get_node("Evidence_Book").texture_normal = Image_Book_Green
		Image_Book_state = 1
		items_selected += 1
		evidence += book
	elif Image_Book_state == 1:
		get_node("Evidence_Book").texture_normal = Image_Book_Red
		Image_Book_state = 2
		items_selected -= 1
		exclude += book
		evidence -= book
	elif Image_Book_state == 2:
		get_node("Evidence_Book").texture_normal = Image_Book_White
		Image_Book_state = 0
		exclude -= book
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_EMF_pressed():
	if Image_EMF_state == 0 and items_selected != 3:
		get_node("Evidence_EMF").texture_normal = Image_EMF_Green
		Image_EMF_state = 1
		items_selected += 1
		evidence += emf
	elif Image_EMF_state == 1:
		get_node("Evidence_EMF").texture_normal = Image_EMF_Red
		Image_EMF_state = 2
		items_selected -= 1
		exclude += emf
		evidence -= emf
	elif Image_EMF_state == 2:
		get_node("Evidence_EMF").texture_normal = Image_EMF_White
		Image_EMF_state = 0
		exclude -= emf
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Orbs_pressed():
	if Image_Orbs_state == 0 and items_selected != 3:
		get_node("Evidence_Orbs").texture_normal = Image_Orbs_Green
		Image_Orbs_state = 1
		items_selected += 1
		evidence += orbs
	elif Image_Orbs_state == 1:
		get_node("Evidence_Orbs").texture_normal = Image_Orbs_Red
		Image_Orbs_state = 2
		items_selected -= 1
		exclude += orbs
		evidence -= orbs
	elif Image_Orbs_state == 2:
		get_node("Evidence_Orbs").texture_normal = Image_Orbs_White
		Image_Orbs_state = 0
		exclude -= orbs
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Spiritbox_pressed():
	if Image_Spiritbox_state == 0 and items_selected != 3:
		get_node("Evidence_Spiritbox").texture_normal = Image_Spiritbox_Green
		Image_Spiritbox_state = 1
		items_selected += 1
		evidence += spiritbox
	elif Image_Spiritbox_state == 1:
		get_node("Evidence_Spiritbox").texture_normal = Image_Spiritbox_Red
		Image_Spiritbox_state = 2
		items_selected -= 1
		exclude += spiritbox
		evidence -= spiritbox
	elif Image_Spiritbox_state == 2:
		get_node("Evidence_Spiritbox").texture_normal = Image_Spiritbox_White
		Image_Spiritbox_state = 0
		exclude -= spiritbox
	get_node("Evidence_Outcomes").text = possible_outcomes()
