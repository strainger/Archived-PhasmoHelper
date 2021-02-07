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
	["Yurei", freezingtemps + orbs + book]
]

# FINGERPRINTS
var Image_Fingerprints_state = 0
var Image_Fingerprints_path_white = "res://Images/Evidence/White/img_handprint.png"
var Image_Fingerprints_path_green = "res://Images/Evidence/Green/img_handprint.png"
var Image_Fingerprints_path_red   = "res://Images/Evidence/Red/img_handprint.png"
var Image_Fingerprints_white = Image.new()
var Texture_Fingerprints_white = ImageTexture.new()
var Image_Fingerprints_green = Image.new()
var Texture_Fingerprints_green = ImageTexture.new()
var Image_Fingerprints_red = Image.new()
var Texture_Fingerprints_red = ImageTexture.new()

# FREEZINGTEMPS
var Image_Freezing_state = 0
var Image_Freezing_path_white = "res://Images/Evidence/White/img_freezing.png"
var Image_Freezing_path_green = "res://Images/Evidence/Green/img_freezing.png"
var Image_Freezing_path_red   = "res://Images/Evidence/Red/img_freezing.png"
var Image_Freezing_white = Image.new()
var Texture_Freezing_white = ImageTexture.new()
var Image_Freezing_green = Image.new()
var Texture_Freezing_green = ImageTexture.new()
var Image_Freezing_red = Image.new()
var Texture_Freezing_red = ImageTexture.new()

# BOOK
var Image_Book_state = 0
var Image_Book_path_white = "res://Images/Evidence/White/img_book.png"
var Image_Book_path_green = "res://Images/Evidence/Green/img_book.png"
var Image_Book_path_red   = "res://Images/Evidence/Red/img_book.png"
var Image_Book_white = Image.new()
var Texture_Book_white = ImageTexture.new()
var Image_Book_green = Image.new()
var Texture_Book_green = ImageTexture.new()
var Image_Book_red = Image.new()
var Texture_Book_red = ImageTexture.new()

# EMF
var Image_EMF_state = 0
var Image_EMF_path_white = "res://Images/Evidence/White/img_emf.png"
var Image_EMF_path_green = "res://Images/Evidence/Green/img_emf.png"
var Image_EMF_path_red   = "res://Images/Evidence/Red/img_emf.png"
var Image_EMF_white = Image.new()
var Texture_EMF_white = ImageTexture.new()
var Image_EMF_green = Image.new()
var Texture_EMF_green = ImageTexture.new()
var Image_EMF_red = Image.new()
var Texture_EMF_red = ImageTexture.new()

# ORBS
var Image_Orbs_state = 0
var Image_Orbs_path_white = "res://Images/Evidence/White/img_orbs.png"
var Image_Orbs_path_green = "res://Images/Evidence/Green/img_orbs.png"
var Image_Orbs_path_red   = "res://Images/Evidence/Red/img_orbs.png"
var Image_Orbs_white = Image.new()
var Texture_Orbs_white = ImageTexture.new()
var Image_Orbs_green = Image.new()
var Texture_Orbs_green = ImageTexture.new()
var Image_Orbs_red = Image.new()
var Texture_Orbs_red = ImageTexture.new()

# SPIRITBOX
var Image_Spiritbox_state = 0
var Image_Spiritbox_path_white = "res://Images/Evidence/White/img_spiritbox.png"
var Image_Spiritbox_path_green = "res://Images/Evidence/Green/img_spiritbox.png"
var Image_Spiritbox_path_red   = "res://Images/Evidence/Red/img_spiritbox.png"
var Image_Spiritbox_white = Image.new()
var Texture_Spiritbox_white = ImageTexture.new()
var Image_Spiritbox_green = Image.new()
var Texture_Spiritbox_green = ImageTexture.new()
var Image_Spiritbox_red = Image.new()
var Texture_Spiritbox_red = ImageTexture.new()

func _ready():
# FINGERPRINTS
	Image_Fingerprints_white.load(Image_Fingerprints_path_white)
	Image_Fingerprints_green.load(Image_Fingerprints_path_green)
	Image_Fingerprints_red.load(Image_Fingerprints_path_red)
	Texture_Fingerprints_white.create_from_image(Image_Fingerprints_white)
	Texture_Fingerprints_green.create_from_image(Image_Fingerprints_green)
	Texture_Fingerprints_red.create_from_image(Image_Fingerprints_red)
	get_node("Evidence_Fingerprints").texture_normal = Texture_Fingerprints_white
	
# FREEZINGTEMPS
	Image_Freezing_white.load(Image_Freezing_path_white)
	Image_Freezing_green.load(Image_Freezing_path_green)
	Image_Freezing_red.load(Image_Freezing_path_red)
	Texture_Freezing_white.create_from_image(Image_Freezing_white)
	Texture_Freezing_green.create_from_image(Image_Freezing_green)
	Texture_Freezing_red.create_from_image(Image_Freezing_red)
	get_node("Evidence_Freezing").texture_normal = Texture_Freezing_white

# BOOK
	Image_Book_white.load(Image_Book_path_white)
	Image_Book_green.load(Image_Book_path_green)
	Image_Book_red.load(Image_Book_path_red)
	Texture_Book_white.create_from_image(Image_Book_white)
	Texture_Book_green.create_from_image(Image_Book_green)
	Texture_Book_red.create_from_image(Image_Book_red)
	get_node("Evidence_Book").texture_normal = Texture_Book_white

# EMF
	Image_EMF_white.load(Image_EMF_path_white)
	Image_EMF_green.load(Image_EMF_path_green)
	Image_EMF_red.load(Image_EMF_path_red)
	Texture_EMF_white.create_from_image(Image_EMF_white)
	Texture_EMF_green.create_from_image(Image_EMF_green)
	Texture_EMF_red.create_from_image(Image_EMF_red)
	get_node("Evidence_EMF").texture_normal = Texture_EMF_white

# ORBS
	Image_Orbs_white.load(Image_Orbs_path_white)
	Image_Orbs_green.load(Image_Orbs_path_green)
	Image_Orbs_red.load(Image_Orbs_path_red)
	Texture_Orbs_white.create_from_image(Image_Orbs_white)
	Texture_Orbs_green.create_from_image(Image_Orbs_green)
	Texture_Orbs_red.create_from_image(Image_Orbs_red)
	get_node("Evidence_Orbs").texture_normal = Texture_Orbs_white

# SPIRITBOX
	Image_Spiritbox_white.load(Image_Spiritbox_path_white)
	Image_Spiritbox_green.load(Image_Spiritbox_path_green)
	Image_Spiritbox_red.load(Image_Spiritbox_path_red)
	Texture_Spiritbox_white.create_from_image(Image_Spiritbox_white)
	Texture_Spiritbox_green.create_from_image(Image_Spiritbox_green)
	Texture_Spiritbox_red.create_from_image(Image_Spiritbox_red)
	get_node("Evidence_Spiritbox").texture_normal = Texture_Spiritbox_white
	
	
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
		get_node("Evidence_Fingerprints").texture_normal = Texture_Fingerprints_green
		Image_Fingerprints_state = 1
		items_selected += 1
		evidence += fingerprints
	elif Image_Fingerprints_state == 1:
		get_node("Evidence_Fingerprints").texture_normal = Texture_Fingerprints_red
		Image_Fingerprints_state = 2
		items_selected -= 1
		exclude += fingerprints
		evidence -= fingerprints
	elif Image_Fingerprints_state == 2:
		get_node("Evidence_Fingerprints").texture_normal = Texture_Fingerprints_white
		Image_Fingerprints_state = 0
		exclude -= fingerprints
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Freezing_pressed():	
	if Image_Freezing_state == 0 and items_selected != 3:
		get_node("Evidence_Freezing").texture_normal = Texture_Freezing_green
		Image_Freezing_state = 1
		items_selected += 1
		evidence += freezingtemps
	elif Image_Freezing_state == 1:
		get_node("Evidence_Freezing").texture_normal = Texture_Freezing_red
		Image_Freezing_state = 2
		items_selected -= 1
		exclude += freezingtemps
		evidence -= freezingtemps
	elif Image_Freezing_state == 2:
		get_node("Evidence_Freezing").texture_normal = Texture_Freezing_white
		Image_Freezing_state = 0
		exclude -= freezingtemps
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Book_pressed():
	if Image_Book_state == 0 and items_selected != 3:
		get_node("Evidence_Book").texture_normal = Texture_Book_green
		Image_Book_state = 1
		items_selected += 1
		evidence += book
	elif Image_Book_state == 1:
		get_node("Evidence_Book").texture_normal = Texture_Book_red
		Image_Book_state = 2
		items_selected -= 1
		exclude += book
		evidence -= book
	elif Image_Book_state == 2:
		get_node("Evidence_Book").texture_normal = Texture_Book_white
		Image_Book_state = 0
		exclude -= book
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_EMF_pressed():
	if Image_EMF_state == 0 and items_selected != 3:
		get_node("Evidence_EMF").texture_normal = Texture_EMF_green
		Image_EMF_state = 1
		items_selected += 1
		evidence += emf
	elif Image_EMF_state == 1:
		get_node("Evidence_EMF").texture_normal = Texture_EMF_red
		Image_EMF_state = 2
		items_selected -= 1
		exclude += emf
		evidence -= emf
	elif Image_EMF_state == 2:
		get_node("Evidence_EMF").texture_normal = Texture_EMF_white
		Image_EMF_state = 0
		exclude -= emf
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Orbs_pressed():
	if Image_Orbs_state == 0 and items_selected != 3:
		get_node("Evidence_Orbs").texture_normal = Texture_Orbs_green
		Image_Orbs_state = 1
		items_selected += 1
		evidence += orbs
	elif Image_Orbs_state == 1:
		get_node("Evidence_Orbs").texture_normal = Texture_Orbs_red
		Image_Orbs_state = 2
		items_selected -= 1
		exclude += orbs
		evidence -= orbs
	elif Image_Orbs_state == 2:
		get_node("Evidence_Orbs").texture_normal = Texture_Orbs_white
		Image_Orbs_state = 0
		exclude -= orbs
	get_node("Evidence_Outcomes").text = possible_outcomes()

func _on_Evidence_Spiritbox_pressed():
	if Image_Spiritbox_state == 0 and items_selected != 3:
		get_node("Evidence_Spiritbox").texture_normal = Texture_Spiritbox_green
		Image_Spiritbox_state = 1
		items_selected += 1
		evidence += spiritbox
	elif Image_Spiritbox_state == 1:
		get_node("Evidence_Spiritbox").texture_normal = Texture_Spiritbox_red
		Image_Spiritbox_state = 2
		items_selected -= 1
		exclude += spiritbox
		evidence -= spiritbox
	elif Image_Spiritbox_state == 2:
		get_node("Evidence_Spiritbox").texture_normal = Texture_Spiritbox_white
		Image_Spiritbox_state = 0
		exclude -= spiritbox
	get_node("Evidence_Outcomes").text = possible_outcomes()
