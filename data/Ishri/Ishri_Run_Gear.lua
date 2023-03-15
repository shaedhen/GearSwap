function user_job_setup()

	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','Tank')
	state.WeaponskillMode:options('Match','Normal','Acc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT','BDT')
	state.ResistDefenseMode:options('MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Aettir')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	-- Additional local binds
	
	select_default_macro_book()
	
		--RUN	
	--Academic
	gear.RUN_AF_Head		=	{ name="Runeist Bandeau +1"}
    gear.RUN_AF_Body		=	{ name="Runeist Coat +1"}
    gear.RUN_AF_Hands		=	{ name="Runeist Mitons +1"}
    gear.RUN_AF_Legs		=	{ name="Runeist Trousers +1"}
    gear.RUN_AF_Feet		=	{ name="Runeist Bottes +1"}
    --Pedagogy
    gear.RUN_RELIC_Head		=	{ name="Futhark Bandeau"}
    gear.RUN_RELIC_Body		=	{ name="Futhark Coat +2"}
    gear.RUN_RELIC_Hands 	=	{ name="Futhark Mitons"}
    gear.RUN_RELIC_Legs		=	{ name="Futhark Trousers"}
    gear.RUN_RELIC_Feet		=	{ name="Futhark Boots"}
    --Peltast
    gear.RUN_EMPY_Head		=	{ name="Erilaz Galea +1"}
    gear.RUN_EMPY_Body		=	{ name="Erilaz Surcoat +1"}
    gear.RUN_EMPY_Hands		=	{ name="Erilaz Gauntlets +1"}
    gear.RUN_EMPY_Legs		=	{ name="Erilaz Leg Guards +2"}
    gear.RUN_EMPY_Feet		=	{ name="Erilaz Greaves +2"}	
	
end

function init_gear_sets()

    sets.Enmity = {
    main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum",
    head="Rabid Visor",
    body= "Emet Harness",
    hands="Turms Mittens",
    legs=gear.RUN_EMPY_Legs,
    feet=gear.RUN_EMPY_Feet,
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Warwolf Belt",
    left_ear="Friomisi Earring",
    right_ear="Etiolation Earring",
    left_ring="Petrov Ring",
    right_ring="Vexer Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}}
	}
		 
    sets.Enmity.SIRD = {
    main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum",
    head="Rabid Visor",
    body= "Emet Harness",
    hands="Turms Mittens",
    legs=gear.RUN_EMPY_Legs,
    feet=gear.RUN_EMPY_Feet,
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Warwolf Belt",
    left_ear="Friomisi Earring",
    right_ear="Etiolation Earring",
    left_ring="Petrov Ring",
    right_ring="Vexer Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}
	}
	}
		
    sets.Enmity.SIRDT = {
    main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum",
    head="Rabid Visor",
    body= "Emet Harness",
    hands="Turms Mittens",
    legs=gear.RUN_EMPY_Legs,
    feet=gear.RUN_EMPY_Feet,
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Warwolf Belt",
    left_ear="Friomisi Earring",
    right_ear="Etiolation Earring",
    left_ring="Petrov Ring",
    right_ring="Vexer Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}
	}
	}

    sets.Enmity.DT = {
    main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum",
    head="Rabid Visor",
    body= "Emet Harness",
    hands="Turms Mittens",
    legs=gear.RUN_EMPY_Legs,
    feet=gear.RUN_EMPY_Feet,
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Warwolf Belt",
    left_ear="Friomisi Earring",
    right_ear="Etiolation Earring",
    left_ring="Petrov Ring",
    right_ring="Vexer Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}
	}
		}
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body=gear.RUN_RELIC_Body})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body=gear.RUN_RELIC_Body})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +1", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet=gear.RUN_AF_Feet})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head=gear.RUN_RELIC_Head})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body=gear.RUN_RELIC_Body})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands=gear.RUN_AF_Hands})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet=gear.RUN_RELIC_Feet})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body=gear.RUN_RELIC_Body})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands=gear.RUN_RELIC_Hands})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
		ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Samnuha Coat",
		hands="Carmine Fin. Ga. +1",
		ring1="Metamor. Ring +1",
		ring2="Shiva Ring +1",
        back="Toro Cape",
		waist="Eschan Stone",
		legs=gear.herculean_nuke_legs,
		feet=gear.herculean_nuke_feet
	}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
	head=gear.RUN_EMPY_Head,
	neck="Incanter's Torque",
	ring1="Stikini Ring +1",
	ring2="Stikini Ring +1",
	legs=gear.RUN_AF_Legs
	}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
		
	-- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
            head="Rune. Bandeau +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Audumbla Sash",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
			
	sets.precast.FC.DT = {ammo="Impatiens",
        head="Rune. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +1",hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Audumbla Sash",legs="Eri. Leg Guards +1",feet="Carmine Greaves +1"}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {    
	ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Meg. Gloves +1",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Futhark Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Karieyh Ring",
    right_ring="Niqmaddu Ring",
    back="Ogma's Cape"}


    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})


    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{})

	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Impatiens",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +1",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +1",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{main="Pukulatmuj +1",head=gear.RUN_EMPY_Head,neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",hands=gear.RUN_AF_Hands,back="Merciful Cape",waist="Olympus Sash",legs=gear.RUN_RELIC_Legs})
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Deacon Sword",head=gear.RUN_RELIC_Head,hands=gear.herculean_phalanx_hands,legs="Carmine Cuisses +1",feet=gear.herculean_nuke_feet})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head=gear.RUN_AF_Head,neck="Sacro Gorget"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head=gear.RUN_EMPY_Head}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum",
        head="Carmine Mask +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Phalanx_Received = {main="Deacon Sword",hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
		main="Aettir",
		sub="Utu Grip",
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}},
		waist="Flume Belt +1",
		legs=gear.RUN_EMPY_Legs,
		feet=gear.RUN_EMPY_Feet
	}
					
	sets.idle.Tank = {		main="Aettir",
		sub="Utu Grip",
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}},
		waist="Flume Belt +1",
		legs=gear.RUN_EMPY_Legs,
		feet=gear.RUN_EMPY_Feet}

	sets.idle.KiteTank = {		main="Aettir",
		sub="Utu Grip",
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}},
		waist="Flume Belt +1",
		legs="Carmine Cuisses +1",
		feet=gear.RUN_EMPY_Feet}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +1",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
	
	-- Defense Sets
	
	sets.defense.PDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Futhark Coat +2",hands=gear.herculean_dt_hands,ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.defense.MDT = {main="Aettir",sub="Utu Grip",ammo="Yamarang",
        head="Erilaz Galea",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	
	sets.defense.BDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	
	sets.defense.MEVA = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
    main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum",
    head="Turms Cap",
    body=gear.RUN_RELIC_Body,
    hands="Turms Mittens",
    legs=gear.RUN_EMPY_Legs,
    feet=gear.RUN_EMPY_Feet,
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}
	}
}
	sets.engaged.Acc = {
    main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum",
    head="Turms Cap",
    body=gear.RUN_RELIC_Body,
    hands="Turms Mittens",
    legs=gear.RUN_EMPY_Legs,
    feet=gear.RUN_EMPY_Feet,
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}
	}
}
	
    sets.engaged.Tank = {
    main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum",
    head="Turms Cap",
    body=gear.RUN_RELIC_Body,
    hands="Turms Mittens",
    legs=gear.RUN_EMPY_Legs,
    feet=gear.RUN_EMPY_Feet,
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}
	}
}
	
--	sets.engaged.Acc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

end

--Job Specific Trust Overwrite
function check_trust()
end

function user_job_lockstyle()
end