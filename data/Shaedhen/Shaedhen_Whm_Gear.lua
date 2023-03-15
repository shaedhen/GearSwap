-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
include('Shaedhen-Items.lua')
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Duration','DT')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons','DualWeapDag','DualWeapDagg')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.


    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Maxentius",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Maxentius",sub="Daybreak"}
	sets.weapons.DualWeapDag = {main="Magesmasher +1",sub="Daybreak"}
	sets.weapons.DualWeapDagg = {main="Maxentius",sub="Magesmasher +1"}
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
    main={ name="Grioavolr", augments={'"Fast Cast"+5','INT+11','Mag. Acc.+19','"Mag.Atk.Bns."+4','Magic Damage +2',}},
    sub="Clerisy Strap +1", --
    ammo="Impatiens",
    head="Bunzi's hat",
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Kaykaus Tights +1",
    feet="regal pumps +1",
    neck="Cleric's Torque +1",
    waist="Witful Belt",
    ear2="Malignance Earring",
    ear2="Loquacious Earring",
    ring1="Kishar Ring",
    ring2="Lebeche Ring",
    back =gear.WHM_IDLE_Cape,
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +2"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	sets.precast.FC.Cursna = set_combine(sets.precast.FC, {main="Yagrush"})
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {hands = "Vanya Gloves",feet="Vanya Clogs",back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = 
	{
        ammo	=	"Crepuscular Pebble",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},	
        neck	=	"Caro Necklace",
		ear1	=	"Moonshade Earring",
		ear2	=	"Regal Earring",
        ring1	=	"Karieyh Ring",
		ring2	=	"Rufescent Ring",
		back	=	"Aurist's Cape +1",
		waist	=	"Sailfi Belt +1",	
	}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

  --  sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {main=gear.grioavolr_fc_staff,sub="Umbra Strap",ammo="Hasty Pinion +1",
		head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Gwati Earring",
		body="Vedic Coat",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Solemnity Cape",waist="Austerity Belt +1",legs="Vanya Slops",feet="Medium's Sabots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head= "Kaykaus Mitra +1",
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Shinjutsu-no-obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back=gear.WHM_Cure_Cape
}

	sets.midcast.Cure.DT =  set_combine(sets.midcast.Cure, {sub="Genmei Shield",ammo="Staunch Tathlum +1",
	ring1 = "Defending Ring",
	ring2 = "Gelatinous Ring +1"})
		
	sets.midcast.CureSolace = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Shinjutsu-no-obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back=gear.WHM_Cure_Cape
}

sets.midcast.CureSolace.DT =  set_combine(sets.midcast.CureSolace, {sub="Genmei Shield",ammo="Staunch Tathlum +1",
	ring1 = "Defending Ring",
	ring2 = "Gelatinous Ring +1"})

	sets.midcast.LightWeatherCure = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back=gear.WHM_Cure_Cape
}

	sets.midcast.LightWeatherCureSolace = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back=gear.WHM_Cure_Cape
}
		
	sets.midcast.LightDayCureSolace = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back=gear.WHM_Cure_Cape
}

	sets.midcast.LightDayCure = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back=gear.WHM_Cure_Cape
}

	sets.midcast.Curaga = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Theophany Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Shinjutsu-no-obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back="Tempered Cape +1",
}

sets.midcast.Curaga.DT =  set_combine(sets.midcast.Curaga, {sub="Genmei Shield",ammo="Staunch Tathlum +1",
	ring1 = "Defending Ring",
	ring2 = "Gelatinous Ring +1"})
		
	sets.midcast.LightWeatherCuraga = {
    main="Chatoyant Staff",
    sub="Curatio Grip",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Theophany Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back="Twilight Cape",
}
		
	sets.midcast.LightDayCuraga = {
    main="Chatoyant Staff",
    sub="Curatio Grip",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Theophany Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Mephitas's Ring +1",
    ring2="Stikini Ring +1",
    back="Twilight Cape",
}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {
    main= "Raetic Rod +1",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head="Kaykaus Mitra +1",
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet="Kaykaus Boots +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Shinjutsu-no-obi",
    ear1="Nourishing Earring +1",
    ear2="Ebers Earring +1",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back="Tempered Cape +1",
}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
    main=="Yagrush",
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	body="Theophany Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Theophany Pantaloons +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Shinjutsu-no-obi",
    ear1="Ebers Earring +1",
    ear2="Meili Earring",
    ring1="Menelaus's Ring",
    ring2="Haoma's Ring",
    back=gear.WHM_Cure_Cape
}

	sets.midcast.StatusRemoval = {
    main="Yagrush",
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	body="Theophany Bliaut +3",  
	hands="Theophany Mitts +3",
    legs="Ebers Pantaloons +2",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Nodens Gorget",
    waist="Shinjutsu-no-obi",
    ear1="Ebers Earring +1",
    ear2="Meili Earring",
    ring1="Menelaus's Ring",
    ring2="Haoma's Ring",
    back=gear.WHM_Cure_Cape
}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque +1"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head=gear.Telch_Enh_head,neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.Telch_Enh_body,hands=gear.Telch_Enh_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs=gear.Telch_Enh_legs,feet="Theo. Duckbills +3"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +2"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = {
    main="Bolelabunga",
    sub="Ammurapi Shield",
    ammo="Kalboron Stone",
    head="Inyanga Tiara +2",
    body="Piety Bliaut +3",
    hands="Ebers Mitts +2",
    legs="Theophany Pantaloons +3",
    feet="Theophany Duckbills +3",
    neck="Incanter's Torque",
    waist="Embla Sash",
    ear1="Andoaa Earring",
    ear2="Nourishing Earring +1",
    ring1="Persis Ring",
    ring2="Defending Ring",
    back=gear.WHM_IDLE_Cape
}

	sets.midcast.Regen.Duration =  set_combine(sets.midcast.Regen, {head = gear.Telch_Enh_head, })

	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +3",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +3",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +3",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +3",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	sets.midcast.BarElement = {main="Beneficus",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Ebers Bliaut +3",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.WHM_Cure_Cape,waist="Embla Sash",legs="Piety Pantaln. +3",feet="Theophany Duckbills +3"}
	
	sets.midcast.BarStatus = {main="Beneficus",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Sroda Necklace",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Ebers Bliaut +3",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.WHM_Cure_Cape,waist="Embla Sash",legs="Piety Pantaln. +3",feet="Theophany Duckbills +3"}

	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
		head="C. Palug Crown",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Freke Ring",ring2="Freke Ring",
		back="Toro Cape",waist=gear.ElementalObi,legs="Chironic Hose",feet=gear.chironic_nuke_feet}

	sets.midcast['Divine Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="C. Palug Crown",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Stikini Ring +1",ring2="Freke Ring",
		back="Aurist's Cape +1",waist=gear.ElementalObi,legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.midcast.Holy = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="C. Palug Crown",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Stikini Ring +1",ring2="Freke Ring",
		back="Aurist's Cape +1",waist=gear.ElementalObi,legs="Bunzi's Pants",feet="Bunzi's Sabots"}

	sets.midcast['Dark Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Inyanga Jubbah +2",hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
		
	sets.midcast.Dispel = {main="Contemplator +1",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Nahtirah Hat",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {        main	=	"Contemplator +1",
        sub		=	"Enki Strap",ammo="Pemphredo Tathlum",
		head="Ebers cap +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Ebers Bliaut +3",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Obstinate Sash",legs="Chironic Hose",feet="Theophany Duckbills +3"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ebers Bliaut +3",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		main="Malignance Pole",
		sub="Enki Strap",
		ammo="Staunch Tathlum +1",
		    head={ name="Nyame Helm", augments={'Path: B',}},
	    body="Ebers Bliaut +3",	
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
 --   feet={ name="Nyame Sollerets", augments={'Path: B',}},
--		head="Befouled Crown",
--		body="Bunzi's Robe",
--		hands=gear.Chiro_refresh_hands,
  --  legs="Assiduity Pants +1",
    feet=gear.Chiro_refresh_feet,
    neck="Yngvi Choker",
    waist="Carrier's Sash",
    ear1="Etiolation Earring",
    ear2="Eabani Earring",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back=gear.WHM_IDLE_Cape
	}
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {ammo="Staunch Tathlum ",
        head="Bunzi's hat",neck="Lissome Necklace",ear1="Telos Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back=gear.WHM_TP_Cape,waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Nyame Sollerets"}


	sets.engaged.DW = {ammo="Staunch Tathlum +1",
        head="Bunzi's hat",neck="Lissome Necklace",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back=gear.WHM_TP_Cape,waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Nyame Sollerets"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2",back="Mending Cape"}


	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(3, 6)
end