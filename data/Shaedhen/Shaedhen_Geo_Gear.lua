function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','DT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Idris','Maxentius','Daybreak','Staff','Malevolence','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+30','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'MND+20','Eva.+17 /Mag. Eva.+17','Pet: "Regen"+10','Damage taken-4%',}}
	gear.stp_jse_back = {name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+30 Attack+20','"Store TP"+10','Damage taken-5%',}}
	gear.wsd_jse_back = {name="Nantosuelta's Cape", augments={'MND+25','Accuracy+20 Attack+20','Weapon skill damage +10%',}} --*
  
	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')

	
	indi_duration = 290
	
	select_default_macro_book()
	
		----GEO
	--Geomancy
	gear.GEO_AF_Head		=	{ name="Geomancy Galero +2"}
    gear.GEO_AF_Body		=	{ name="Geomancy Tunic +2"}
    gear.GEO_AF_Hands		=	{ name="Geomancy Mitaines +3"}
    gear.GEO_AF_Legs		=	{ name="Geomancy Pants +2"}
    gear.GEO_AF_Feet		=	{ name="Geomancy Sandals +3"}
    --Bagua
    gear.GEO_RELIC_Head		=	{ name="Bagua Galero +3"}
    gear.GEO_RELIC_Body		=	{ name="Bagua Tunic +3"}
    gear.GEO_RELIC_Hands 	=	{ name="Bagua Mitaines +3"}
    gear.GEO_RELIC_Legs		=	{ name="Bagua Pants +3"}
    gear.GEO_RELIC_Feet		=	{ name="Bagua Sandals +3"}
    --Azimuth
    gear.GEO_EMPY_Head		=	{ name="Azimuth Hood +2"}
    gear.GEO_EMPY_Body		=	{ name="Azimuth Coat +2"}
    gear.GEO_EMPY_Hands		=	{ name="Azimuth Gloves +2"}
    gear.GEO_EMPY_Legs		=	{ name="Azimuth Tights +2"}
    gear.GEO_EMPY_Feet		=	{ name="Azimuth Gaiters +2"}	
	
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body=gear.GEO_RELIC_Body}
	sets.precast.JA['Life Cycle'] = {body=gear.GEO_AF_Body,back="Nantosuelta's Cape"}
	sets.precast.JA['Radial Arcana'] = {feet=gear.GEO_RELIC_Feet}
	sets.precast.JA['Mending Halation'] = {legs=gear.GEO_RELIC_Legs}
	sets.precast.JA['Full Circle'] = {head=gear.GEO_EMPY_Head,hands=gear.GEO_RELIC_Hands}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {main = gear.Gada_Indi}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

    sets.precast.FC = {
    --  /RDM --15
        main={ name="Grioavolr", augments={'"Fast Cast"+5','INT+11','Mag. Acc.+19','"Mag.Atk.Bns."+4','Magic Damage +2',}}, --9
        sub="Clerisy Strap +1", -- 12
        range="Impatiens", --12
        head="Amalric Coif +1", --23
        body="Volte Doublet", --33
        legs=gear.GEO_AF_Legs, --48
        feet="Regal Pumps +1", --55
        neck="Voltsurge Torque", --59
        ear1="Malignance Earring", --63
		ear2="Etiolation Earring", --64
        ring1="Kishar Ring", --68
        back="Lifestream Cape", --75
        waist="Embla Sash", --80
    }
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Malignance Earring",hands=gear.GEO_RELIC_Hands})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
        sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash",
        back="Perimede Cape",
        })

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak"})
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
		sets.precast.WS = {
--	ammo="Aurgelmir Orb +1",
	head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck="Fotia Gorget",
	ear1="Malignance Earring",
	ear2="Moonshade Earring",
	ring1="Rufescent Ring",
	ring2="Metamorph Ring +1",
	back=gear.wsd_jse_back,
	waist="Fotia Belt",
	}

		sets.precast.WS["Earth Crusher"] = {
	ammo="Ghastly Tathlum +1",
	head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets", -- Agwu's Gages
    legs="Nyame Flanchard",
    feet="Nyame Sollerets", -- Agwu's Pigaches
	neck="Quanpur Necklace",
	ear1="Malignance Earring",
	ear2="Moonshade Earring",
	ring1="Epaminondas's Ring",
	ring2="Metamorph Ring +1",
	back=gear.nuke_jse_back,
	waist="Orpheus's Sash", -- Hachirin-no-Obi
	}
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {
        head="Amalric Coif +1",
        legs=gear.GEO_AF_Legs,
        feet="Regal Pumps +1",
        ear1="Loquacious Earring",
		ear2="Malignance Earring",
        ring1="Kishar Ring",
        back="Lifestream Cape",
    }

	sets.midcast.Geomancy = {
		main="Idris",
		sub="Genmei Shield",
		ammo="Pemphredo Tathlum",  --4
		head="Vanya Hood",     --10
		body="Vedic Coat",     -- 20
		hands=gear.GEO_AF_Hands,
		legs=gear.GEO_RELIC_Legs,
		feet=gear.GEO_EMPY_Feet,
		neck="Bagua's Charm +1",
		waist="Luminary Sash",  -- 24
		ear1="Calamitous Earring",  --28
		ear2="Gifted Earring",  -- 32
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Lifestream Cape",
  }

  sets.midcast.Cure = {
        main="Idris", --22/(-10)
        sub="Sors Shield", --3/(-5)
		head="Vanya Hood",
        body="Annointed Kalasiris",
        hands=gear.GEO_AF_Hands,
		legs="Doyen Pants",
		feet="Vanya Clogs",
        neck="Incanter's Torque",
        ear1="Malignance Earring", --5
        ear2="Mendi. Earring",
        ring1="Menelaus's Ring", --3/(-5)
        ring2="Mephitas's Ring +1",
		back="Fi Follet Cape +1", --10
        waist="Shinjutsu-no-obi",
        }
		
    sets.midcast.LightWeatherCure = {
        main="Idris", --22/(-10)
        sub="Sors Shield", --3/(-5)
		head="Vanya Hood",
        body="Annointed Kalasiris",
        hands=gear.GEO_AF_Hands,
		legs="Doyen Pants",
		feet="Vanya Clogs",
        neck="Incanter's Torque",
        ear1="Malignance Earring", --5
        ear2="Mendi. Earring",
        ring1="Menelaus's Ring", --3/(-5)
        ring2="Sirona's Ring",
		back="Pahtli Cape", --10
        waist="Hachirin-no-Obi",
        }
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
        main="Idris", --22/(-10)
        sub="Sors Shield", --3/(-5)
		head="Vanya Hood",
        body="Annointed Kalasiris",
        hands=gear.GEO_AF_Hands,
		legs="Doyen Pants",
		feet="Vanya Clogs",
        neck="Incanter's Torque",
        ear1="Malignance Earring", --5
        ear2="Mendi. Earring",
        ring1="Menelaus's Ring", --3/(-5)
        ring2="Sirona's Ring",
		back="Pahtli Cape", --10
        waist="Hachirin-no-Obi",
        }

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {main="Daybreak",sub="Sors Shield"})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {
        main	="Bunzi's Rod",
        sub		="Ammurapi Shield",
		ammo	=	"Ghastly Tathlum +1",
        head	=	"Agwu's Cap",
        body	=	"Agwu's Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck="Sibyl Scarf",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Freke Ring",
        ring2="Diamond Ring +1",
        back=gear.nuke_jse_back,
        waist="Sacro Cord",
    }
	
	sets.MagicBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
        head="Ea Hat",
		neck="Sibyl Scarf",
		ear1="Malignance Earring",
		ear2="Regal Earring",
        body="Agwu's Robe",
		hands="Amalric Gages +1",
		ring1="Freke Ring",
		ring2="Mujin Band",
        back=gear.nuke_jse_back,
        waist="Sacro Cord",
		legs="Agwu's Slops",
		feet="Amalric Nails +1"
	}
		
    sets.midcast['Dark Magic'] = {
		main="Rubicundity",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head=gear.GEO_EMPY_Head,
        body=gear.Merli_DraAsp_body,
		hands=gear.GEO_EMPY_Hands,
		legs=gear.GEO_EMPY_Legs,
		feet="Agwu's Pigaches",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Mani Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
    }
	
    sets.midcast.Drain  = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        ear1="Hirudinea Earring",
        ring1="Evanescence Ring",
        ring2="Archon Ring",
        waist="Fucho-no-obi",
        })

    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {        
		main="Daybreak",
        sub="Ammurapi Shield",
        head="Amalric Coif +1",
		body="Agwu's Robe",
        hands=gear.Mallquis_Hands,
        legs="Jhakri Slops +2",
        feet=gear.Jhakri_Feet,
        neck="Bagua Charm +1",
        ear1="Dignitary's Earring",
        ear2="Malignance Earring",
        ring1="Metamorph Ring +1",
        ring2="Stikini Ring +1",
        back="Aurist's Cape +1",
        waist="Luminary Sash"
	}		
		
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
    })		

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = {        
        main	=	"Contemplator +1",
        sub		=	"Khonsu",
		ammo="Pemphredo Tathlum",
        head	=	gear.GEO_AF_Head,
        body	=	gear.GEO_AF_Body,
        hands=gear.GEO_EMPY_Hands,
        legs=gear.GEO_AF_Legs,
        feet=gear.GEO_AF_Feet,
        neck="Bagua Charm +1",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Kishar Ring",
        ring2="Stikini Ring +1",
        back="Aurist's Cape +1",
        waist="Luminary Sash"
	}	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})
		
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {
        main="Malignance Pole",
        sub="Khonsu",
        ammo="Staunch Tathlum +1", --5/0		
        head="Nyame Helm",
        body=gear.GEO_EMPY_Body,
		hands=gear.GEO_RELIC_Hands,
        legs="Nyame Flanchard",
        feet=gear.GEO_AF_Feet,
        neck="Warder's Charm +1",
        ear1="Hearty Earring",
        ear2="Etiolation Earring",
        ring1="Stikini Ring +1",
        ring2="Defending Ring",
        back=gear.idle_jse_back,
		waist="Carrier's Sash",	
        }
		
	    sets.idle.DT = set_combine(sets.idle, {
   --     main="Bolelabunga",
    --    sub="Genmei Shield", --10/0
    --    body="Mallquis Saio +2", --8/8
    --    feet="Azimuth Gaiters +2", --4/0
        neck="Loricate Torque +1", --6/6
   --     ear1="Genmei Earring", --2/0
        ring1="Jelly Ring", --7/(-1)
        ring2="Defending Ring", --10/10
     --   back="Moonlight Cape", --6/6
     --   waist="Slipor Sash", --0/3
        })

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = set_combine(sets.idle, {
        -- Pet: -DT (37.5% to cap) / Pet: Regen
        main="Idris", --3/3
        sub="Genmei Shield",
        ranged="Dunna",
        head=gear.GEO_EMPY_Head,
        body="Agwu's Robe",
		hands=gear.GEO_RELIC_Hands,
        --legs="Nyame Flanchard",
        legs="Assiduity Pants +1",
		feet=gear.GEO_RELIC_Feet,
        neck="Bagua Charm +1",
        ear1="Etiolation Earring", --3*/0
        ear2="Lugalbanda Earring", --4*/0
		ring1="Stikini Ring +1",
        ring2="Defending Ring",
        back= gear.idle_jse_back ,
        waist="Isa Belt" --3/1
        })


	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 

--	sets.Kiting = {feet=gear.GEO_AF_Feet}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {    
	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back=gear.stp_jse_back
	}

		
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Kayapa Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Idris = {main='Idris',sub='Genmei Shield'}
	sets.weapons.Maxentius = {main='Maxentius',sub='Genmei Shield'}
	sets.weapons.Daybreak = {main='Daybreak',sub='Genmei Shield'}
	sets.weapons.Malevolence = {main='Malevolence',sub='Ammurapi Shield'}
	sets.weapons.Staff = {main='Malignance Pole',sub='Khonsu'}
	sets.weapons.DualWeapons = {main='Daybreak',sub='Idris'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end