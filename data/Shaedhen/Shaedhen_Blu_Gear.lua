function user_job_setup()
	include('Shaedhen-Items.lua')
	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Normal','Capped')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','NaegCola','NaegThib','Tanma','MeleeClubs')
	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	----BLU	
	--Assimilator
	gear.BLU_AF_Head		=	{ name="Assimilator's Keffiyeh +2"}
    gear.BLU_AF_Body		=	{ name="Assimilator's Jubbah +2"}
    gear.BLU_AF_Hands		=	{ name="Assimilator's Bazubands +2"}
    gear.BLU_AF_Legs		=	{ name="Assimilator's Shalwar +2"}
    gear.BLU_AF_Feet		=	{ name="Assimilator's Charuqs +2"}
    --Luhlaza
    gear.BLU_RELIC_Head		=	{ name="Luhlaza Keffiyeh +1"}
    gear.BLU_RELIC_Body		=	{ name="Luhlaza Jubbah +1"}
    gear.BLU_RELIC_Hands 	=	{ name="Luhlaza Bazubands +1"}
    gear.BLU_RELIC_Legs		=	{ name="Luhlaza Shalwar +1"}
    gear.BLU_RELIC_Feet		=	{ name="Luhlaza Charuqs +2"}
    --Hashishin
    gear.BLU_EMPY_Head		=	{ name="Hashishin Kavuk +2"}
    gear.BLU_EMPY_Body		=	{ name="Hashishin Mintan +2"}
    gear.BLU_EMPY_Hands		=	{ name="Hashishin Bazubands +2"}
    gear.BLU_EMPY_Legs		=	{ name="Hashishin Tayt +1"}
    gear.BLU_EMPY_Feet		=	{ name="Hashishin Basmak +1"}	

	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_nuke_waist = "Eschan Stone"
	gear.obi_cure_back = "Tempered Cape +1"

	-- Additional local binds
--	send_command('bind ^` input /ja "Chain Affinity" <me>')
--	send_command('bind @` input /ja "Efflux" <me>')
--	send_command('bind !` input /ja "Burst Affinity" <me>')
--	send_command('bind ^@!` gs c cycle SkillchainMode')
--	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
--	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
--	send_command('bind @backspace input /ja "Convergence" <me>')
--	send_command('bind @f10 gs c toggle LearningMode')
--	send_command('bind ^@!` gs c cycle MagicBurstMode')
--	send_command('bind @f8 gs c toggle AutoNukeMode')
--	send_command('bind !@^f7 gs c toggle AutoWSMode')
--	send_command('bind !r gs c weapons None;gs c update')
--	send_command('bind @q gs c weapons MaccWeapons;gs c update')
--	send_command('bind ^q gs c weapons Almace;gs c update')
--	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet=gear.BLU_EMPY_Feet}
	sets.buff['Chain Affinity'] = {feet=gear.BLU_AF_Feet}
	sets.buff.Convergence = {head=gear.BLU_RELIC_Head}
	sets.buff.Diffusion = {feet=gear.BLU_RELIC_Feet}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs=gear.BLU_EMPY_Legs}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flume Belt +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands=gear.BLU_RELIC_Hands}


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Carmine Mask +1",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Telos Earring",
					body=gear.BLU_AF_Body,hands=gear.BLU_AF_Hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Malignance Chapeau",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Fast cast sets for spells

	sets.precast.FC = {
	main="Vampirism",
	sub="Vampirism",
	ammo="Impatiens",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body=gear.BLU_Relic_Body,
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
		back="Perimede Cape",
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet="Carmine Greaves +1"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body=gear.BLU_EMPY_Body})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo	=	"Coiste Bodhar",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body = "Gleti's Cuirass",
	--	body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},	
        neck	=	"Rep. Plat. Medal",
		ear1	=	"Moonshade Earring",		
        ear2	=	"Ishvara Earring",
        ring1	=	"Epaminondas's Ring",		
		ring2	=	"Metamorph Ring +1",
		back	=	gear.wsd_jse_back,
		waist	=	"Sailfi Belt +1"	
	}

		sets.precast.WS.Capped = {
		ammo	=	"Crepuscular Pebble",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body = "Gleti's Cuirass",
	--	body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},	
        neck	=	"Mirage Stole +1",
		ear1	=	"Moonshade Earring",		
        ear2	=	"Ishvara Earring",
        ring1	=	"Epaminondas's Ring",		
		ring2	=	"Sroda Ring",
		back	=	gear.wsd_jse_back,
		waist	=	"Sailfi Belt +1"	
	}


	sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS,{ammo="Pemphredo Tathlum",
			         neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
			         back=gear.nuke_jse_back,waist="Eschan Stone"})
					 

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Regal Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.BLU_RELIC_Body,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {
	ammo="Coiste Bodhar",
	head=gear.BLU_EMPY_Head,
	neck="Mirage Stole +1",
	ear1="Odnowa Earring +1",
	ear2="Telos Earring",
	body=gear.EMPY_Body,
	hands="Adhemar Wrist. +1",
	ring1="Shukuyu Ring",
	ring2="Ilabrat Ring",
	back=gear.wsd_jse_back,
	waist="Sailfi Belt +1",
	legs="Gleti's Breeches",
	feet="Jhakri Pigaches +2"
	}


	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {
	main="Bunzi's Rod",
	sub="Maxentius",
	ammo="Pemphredo Tathlum",
	head=empty,
	neck="Sibyl Scarf",
	ear1="Regal Earring",
	ear2="Friomisi Earring",
	body="Cohort Cloak +1",
	hands="Amalric Gages +1",
	ring1="Metamor. Ring +1",
	ring2="Shiva Ring +1",
	back=gear.nuke_jse_back,
	waist="Sacro Cord",
	legs="Amalric Slops +1",
	feet="Amalric Nails +1"
	}					 
					 

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {main="Iris",sub="Iris",ammo="Pemphredo Tathlum",
		head=empty,neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Cohort Cloak +1",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Enfeebling Magic'] = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head=empty,neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Cohort Cloak +1",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}

	sets.midcast['Dark Magic'] = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Vampirism",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Pukulatmuj +1",sub="Pukulatmuj",head="Carmine Mask +1",ear2="Mimir Earring",hands=gear.herculean_phalanx_hands,legs="Carmine Cuisses +1",feet=gear.herculean_nuke_feet})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Elemental Magic'] = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head=empty,neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Cohort Cloak +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Jhakri Pigaches +2"}

	sets.midcast['Elemental Magic'].Resistant = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Medium's Sabots"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head=gear.BLU_RELIC_Head,neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body=gear.BLU_AF_Body,hands=gear.BLU_RELIC_Hands,ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs=gear.BLU_EMPY_Legs,feet=gear.BLU_RELIC_Feet}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {
		ammo = "Pemphredo Tathlum",
        head = "Carmine Mask +1",
        neck = "Mirage Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Dignitary's Earring",
	body="Malignance Tabard",
	hands = "Leyline Gloves",
	ring1 = "Stikini Ring +1",
        ring2 = "Metamorph Ring +1",
        back = "Aurist's Cape +1",
        waist = "Sacro Cord",
	legs="Malignance Tights",
	feet="Gleti's boots "
	}

	sets.midcast['Blue Magic'].Stun.Resistant = {main="Iris",sub="Iris",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Egoist's Tathlum",
		head="Carmine Mask +1",
		neck="Phalaina Locket",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		body="Vrikodara Jupon",
		hands="Telchine Gloves",
        ring1 = "Kunaji Ring",
        ring2 = "Gelatinous Ring +1",
		back="Moonlight Cape",
		waist="Eschan Stone",
		legs="Gyve Trousers",
		feet="Medium's Sabots"
	}
					
	--sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {
		ammo="Mavi Tathlum",
        head = "Nyame Helm",
        neck = "Phalaina Locket", --4
        ear1 = "Mendicant's Earring", --5
        ear2 = "Regal Earring",
		body="Vrikodara Jupon",
		hands="Telchine Gloves",
		ring1 = "Stikini Ring +1",
        ring2 = "Mephitas's Ring +1",
		back=gear.ElementalCape,
		waist = "Luminary Sash",
		legs="Carmine Cuisses +1",
		feet="Medium's Sabots"
	}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head=gear.BLU_RELIC_Head,neck="Mirage Stole +1",ear1="Loquac. Earring",ear2="Hashishin Earring",
		body=gear.BLU_AF_Body,hands="Rawhide Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Witful Belt",legs=gear.BLU_EMPY_Legs,feet=gear.BLU_RELIC_Feet}

	sets.midcast['Blue Magic'].Buff = {
		ammo="Mavi Tathlum",
		head=gear.BLU_RELIC_Head,neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquac. Earring",
		body=gear.BLU_AF_Body,hands=gear.BLU_EMPY_Hands,ring1="Kishar Ring",ring2="Dark Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands=gear.BLU_AF_Hands}

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Falcon Eye",
			      head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
			      back="Bleating Mantle",waist="Flume Belt +1",legs="Lengo Pants",feet=gear.herculean_refresh_feet}

	-- Idle sets
	sets.idle = 
	{
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Gleti's Mask",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring", 
		ear2="Ethereal Earring",
		body=gear.BLU_EMPY_Body,
		hands="Gleti's Gauntlets",
		ring1="Defending Ring",
		ring2="Stikini Ring +1",
		back="Moonbeam Cape",
		waist="Flume Belt +1",
		legs="Gleti's Breeches",
		feet="Nyame Sollerets"
	}

	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})


	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum +1",
				head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
				back="Shadow Mantle",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
				head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
				back="Moonlight Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MEVA = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Carrier's Sash",legs="Telchine Braconi",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.NaegCola = {main="Naegling",sub="Tanmogayi +1"}
	sets.weapons.NaegThib = {main="Naegling",sub="Machaera +2"}
	sets.weapons.Tanma = {main="Tanmayongi +1",sub="Colada"}
	sets.weapons.MeleeClubs = {main="Maxentius",sub="Bunzi's Rod"}
	-- Engaged sets

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +1",
		ear1="Suppanomimi",
		ear2="Brutal Earring",
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		ring1="Chirich Ring +1",
		ring2="Petrov Ring",
		back=gear.stp_jse_back,
		waist="Windbuffet Belt +1",
		legs="Herculean Trousers",
		feet="Herculean Boots",
	}


	sets.engaged.DT = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		neck="Mirage Stole +1",
		ear1="Eabani Earring",
		ear2="Telos Earring",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		ring1="Defending Ring",
		ring2="Petrov Ring",
		back=gear.stp_jse_back,
		waist="Reiki Yotai",
		legs="Malignance Tights",
		feet="Herculean Boots"
	}


	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}
	sets.Phalanx_Received = {hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'BLU' then
		set_macro_page(4, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 2)
	elseif player.sub_job == 'RUN' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'THF' then
		set_macro_page(2, 2)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 2)
	else
		set_macro_page(6, 2)
	end
end
