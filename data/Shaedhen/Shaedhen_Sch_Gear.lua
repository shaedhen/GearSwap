-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
include('Shaedhen-Items.lua')
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Duration','Potency','Resistant','OccultAcumen','9k','DT')
    state.IdleMode:options('Normal','PDT')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Bunzi','Mpaca','Occult')

	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	
    select_default_macro_book()
	
		----SCH	
	--Academic
	gear.SCH_AF_Head		=	{ name="Academic's Mortarboard +3"}
    gear.SCH_AF_Body		=	{ name="Academic's Gown +2"}
    gear.SCH_AF_Hands		=	{ name="Academic's Bracers +2"}
    gear.SCH_AF_Legs		=	{ name="Academic's Pants +2"}
    gear.SCH_AF_Feet		=	{ name="Academic's Loafers +3"}
    --Pedagogy
    gear.SCH_RELIC_Head		=	{ name="Pedagogy Mortarboard +3"}
    gear.SCH_RELIC_Body		=	{ name="Pedagogy Gown +3"}
    gear.SCH_RELIC_Hands 	=	{ name="Pedagogy Bracers +3"}
    gear.SCH_RELIC_Legs		=	{ name="Pedagogy Pants +3"}
    gear.SCH_RELIC_Feet		=	{ name="Pedagogy Loafers +3"}
    --Arbatel
    gear.SCH_EMPY_Head		=	{ name="Arbatel Bonnet +3"}
    gear.SCH_EMPY_Body		=	{ name="Arbatel Gown +2"}
    gear.SCH_EMPY_Hands		=	{ name="Arbatel Bracers +2"}
    gear.SCH_EMPY_Legs		=	{ name="Arbatel Pants +2"}
    gear.SCH_EMPY_Feet		=	{ name="Arbatel Loafers +3"}	
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	sets.buff.Sleep = {main="Opashoro"}
    -- Precast Sets
	
    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs=gear.SCH_RELIC_Legs}
    sets.precast.JA['Enlightenment'] = {body=gear.SCH_RELIC_Body} --body="Peda. Gown +1"
    
    sets.precast.JA['Sublimation'] = {
      main="Malignance Pole",
      sub="Khonsu",
      ammo="Homiliary",
      head=gear.SCH_AF_Head,
      body=gear.SCH_RELIC_Body,
      hands=gear.SCH_AF_Hands,
      legs=gear.SCH_AF_Legs,
      feet="Skaoi Boots",
      neck="Sanctity Necklace",
      waist="Porous Rope",
      left_ear="Thureous Earring",
      right_ear="Calamitous Earring",
      back=gear.SCH_IDLE_Cape,
    }
    -- Fast cast sets for spells

    sets.precast.FC = {
    --    /RDM --15
        main={ name="Grioavolr", augments={'"Fast Cast"+5','INT+11','Mag. Acc.+19','"Mag.Atk.Bns."+4','Magic Damage +2',}}, --9
        sub="Clerisy Strap +1", -- 12
        range="Impatiens", -- sapience orb
        head=gear.SCH_RELIC_HEAD, --spellcasting 13%
        body="Volte Doublet", --22  pinga ou merlinic
        hands=gear.SCH_AF_Hands, --29 
        legs="Psycloth Lappas", --36
        feet=gear.SCH_AF_Feet, -- spellcasting 10%
        neck="Voltsurge Torque", -- 40 
        ear1="Malignance Earring", --44
        ear2="Loquacious Earring", --46
        ring1="Kishar Ring", --50
        waist="Embla Sash", --55
        back=gear.SCH_IDLE_Cape, --65
    }
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Malignance Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        ear1="Mendi. Earring", --5
        ring1="Lebeche Ring", --(2)
				back="Pahtli Cape", --10
        })
    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Ghastly Tathlum +1",
		head="Nyame Helm",
		neck="Argute Stole +1",
		ear1="Regal Earring",
		ear2="Malignance Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Freke Ring",
		ring2="Metamorph Ring +1",
		back="Aurist's Cape +1",
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
    }
	
	
	sets.precast.WS['Myrkr'] = {
		ammo="Psilomene",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
		body=gear.SCH_AF_Body,
		hands="Agwu's Gages",
		ring1="Mephitas's Ring +1",
		ring2="Metamorph Ring +1",
		back="Aurist's Cape +1",
		waist="Shinjutsu-no-Obi +1",
		legs="Amalric Slops +1",
		feet="Psycloth Boots"
    }
	
	sets.precast.WS['Shattersoul'] = {
		ammo="Ghastly Tathlum +1",
		head="Nyame Helm",
		neck="Argute Stole +1",
		ear1="Regal Earring",
		ear2="Malignance Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Freke Ring",
		ring2="Metamorph Ring +1",
		back="Aurist's Cape +1",
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
    }
	
		sets.precast.WS['Cataclysm'] = {
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		neck="Sibyl Scarf",
		ear1="Regal Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Metamorph Ring +1",
		back="Aurist's Cape +1",
		waist="Hachirin-no-Obi",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
    }

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}

	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = 
{main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Agwu's Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.SCH_IDLE_Cape,waist="Witful Belt",legs="Psycloth Lappas",feet="regal pumps +1"}
		
    sets.midcast.Cure = {
        main="Daybreak", --22/(-10)
        sub="Sors Shield", --3/(-5)
        ammo="Esper Stone +1",
        head="Kaykaus Mitra +1", 
        body="Kaykaus Bliaut +1", 
        hands=gear.SCH_RELIC_Hands, 
        legs="Kaykaus Tights +1", 
        feet="Kaykaus Boots +1", 
        neck="Incanter's Torque",
        ear1="Malignance Earring", --5
        ear2="Mendi. Earring",
        ring1="Lebeche Ring", --3/(-5)
        ring2="Stikini Ring +1",
        back="Pahtli Cape", --10
        waist="Pythia Sash",
    }
	
	    sets.midcast.Cure.DT = {
        main="Daybreak", 
        sub="Sors Shield", 
        ammo="Staunch Tathlum +1", --3
        head="Kaykaus Mitra +1", 
        body=gear.SCH_EMPY_Body, --15
        hands=gear.SCH_RELIC_Hands, 
        legs="Kaykaus Tights +1", 
        feet="Kaykaus Boots +1", 
        neck="Loricate Torque +1", --21
        ear1="Malignance Earring", 
        ear2="Mendi. Earring",
        ring1="Defending Ring",  --31
        ring2="Stikini Ring +1",
        back=gear.SCH_IDLE_Cape,  --36
        waist="Pythia Sash",
    }
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff", --10
        sub="Enki Strap", --0/(-5)
        waist="Hachirin-no-Obi",
        back="Twilight Cape",
        })
		
		sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {
        main="Chatoyant Staff", 
        sub="Khonsu",--42
        waist="Hachirin-no-Obi",
        })
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff", --10
        sub="Enki Strap", --0/(-5)
        waist="Hachirin-no-Obi",
        back="Twilight Cape",
        })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        ring1="Metamor. Ring +1",
        waist="Luminary Sash",
        })

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {
		main="Gada",
		sub="Sors Shield",
		ammo="Hasty Pinion +1",
		head="Vanya Hood",
		neck="Debilis Medallion",
		ear1="Meili Earring",
		ear2="Beatific Earring",
		body=gear.SCH_RELIC_Body,
		hands="Hieros Mittens",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring",
		back="Oretan. Cape +1",
		waist="Witful Belt",
		legs=gear.SCH_AF_Legs,
		feet="Vanya Clogs"
	}
		
	sets.midcast.StatusRemoval  = {
        main="Daybreak",
        sub="Ammurapi Shield",
        head="Vanya Hood",
        body="Vanya Robe",
        hands=gear.SCH_RELIC_Hands,
        legs=gear.SCH_AF_Legs,
        feet="Vanya Clogs",
        neck="Incanter's Torque",
        ear2="Meili Earring",
        ring1="Haoma's Ring",
        ring2="Menelaus's Ring",
        waist="Bishop's Sash",
  }

	sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Homiliary",
		head="Befouled Crown",
		body=gear.SCH_RELIC_Body,
		hands=gear.Chiro_refresh_hands,
		legs=gear.Telch_Enh_legs,
		feet="Regal pumps +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Fi Follet Cape",
  }
		
	sets.midcast.EnhancingDuration = {
		main="Pedagogy Staff",
		sub="Giuoco Strap",
		head=gear.Telch_Enh_head,
		neck="Incanter's Torque",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		body=gear.SCH_RELIC_Body,
		hands=gear.Telch_Enh_hands,
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Fi Follet Cape",
		legs=gear.Telch_Enh_legs,
		feet=gear.Telch_Enh_feet,
		waist="Embla Sash",
	}

    sets.midcast.Regen= {
	    main="Pedagogy Staff",
		sub="Giuoco Grip",
		ammo="Pemphredo Tathlum",
		head=gear.SCH_EMPY_Head,
		neck="Incanter's Torque",
        ear1="Calamitous Earring",
		ear2="Gifted Earring",
		body=gear.Telch_Enh_body,
		hands=gear.Telch_Enh_hands,
		ring1="Mephitas's Ring +1",
		ring2="Stikini Ring +1",
        back="Lugh's Cape",
		waist="Embla Sash",
		legs=gear.Telch_Enh_legs,
		feet=gear.Telch_Enh_feet,		
	}


    sets.midcast.Regen.Duration = set_combine(sets.midcast.Regen, {
        head=gear.Telch_Enh_head,
        body=gear.Telch_Enh_body,
    })
	
	sets.midcast.Regen.Potency = set_combine(sets.midcast.Regen, {
        back="Bookworm's Cape"
    })

    sets.midcast.Haste = sets.midcast.EnhancingDuration

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        head="Amalric Coif +1",

    })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        neck="Nodens Gorget",
        waist="Siegel Sash",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        main="Vadose Rod",
        sub="Ammurapi Shield",
        ammo="Staunch Tathlum +1",
        head="Amalric Coif +1",
		hands="Regal Cuffs",
        ear1="Halasz Earring",
        ring1="Freke Ring",
        waist="Emphatikos Rope",
        })

    sets.midcast.Storm = set_combine(sets.midcast.EnhancingDuration, {feet=gear.SCH_RELIC_Feet})

    sets.midcast.Stormsurge = set_combine(sets.midcast.EnhancingDuration, {feet=gear.SCH_RELIC_Feet})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


	sets.midcast['Enfeebling Magic'] = {
        main="Contemplator +1",
        sub	="Khonsu",
		ammo="Pemphredo Tathlum",
        head=empty,
        body="Cohort Cloak +1",
		hands="Regal Cuffs",
		legs=gear.SCH_EMPY_Legs,
		feet=gear.SCH_AF_Feet,
		neck="Erra Pendant",
		waist="Obstinate Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Metamorph Ring +1",
		right_ring="Stikini Ring +1",
		back="Aurist's Cape +1",
    }
	

    sets.midcast['Dark Magic'] = {
		main="Rubicundity",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head=gear.SCH_EMPY_Head,
		body=gear.Merli_DraAsp_body,
		hands=gear.SCH_EMPY_Hands,
		legs=gear.SCH_RELIC_Legs,
		feet="Agwu's Pigaches",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Mani Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Bookworm's Cape",
    }

    sets.midcast.Kaustra  = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Agwu's Robe",
        hands="Amalric Gages +1", --(5)
        legs="Amalric Slops +1", --6
        feet=gear.Jhakri_Feet, --11
        neck="Argute Stole +1", --8
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Freke Ring",
        ring2="Archon Ring",
        back=gear.SCH_INT_Cape,
        waist="Acuity Belt +1",
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
	    main="Pedagogy Staff",
		sub="Khonsu",
		ammo="Pemphredo Tathlum",
		head=gear.SCH_AF_Head,
		body=gear.SCH_AF_Body,
		hands=gear.SCH_AF_Hands,
		legs=gear.SCH_AF_Legs,
		feet=gear.SCH_RELIC_Feet,
		neck="Argute Stole +1",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Aurist's Cape +1",
    }

    -- Elemental Magic sets are default for handling low-tier nukes.
		-- Gear for Magic Burst mode.
    sets.MagicBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
        head=gear.SCH_RELIC_Head,
		neck="Argute Stole +1",
		ear1="Malignance Earring",
		ear2="Regal Earring",
        body="Agwu's Robe",
		hands="Agwu's Gages",
		ring1="Freke Ring",
		ring2="Mujin Band",
        back=gear.SCH_INT_Cape,
		waist="Acuity Belt +1",
		legs="Agwu's Slops",
		feet=gear.SCH_EMPY_Feet
	}

    sets.HelixBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
        head=gear.SCH_RELIC_Head,
		neck="Argute Stole +1",
		ear1="Malignance Earring",
		ear2="Regal Earring",
        body="Agwu's Robe",
		hands="Agwu's Gages",
		ring1="Freke Ring",
		ring2="Mujin Band",
        back=gear.SCH_INT_Cape,
		waist="Acuity Belt +1",
		legs="Agwu's Slops",
		feet=gear.SCH_EMPY_Feet
	}
	
	
    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Amalric Gages +1",
        legs="Amalric Slops +1",
        feet="Amalric Nails +1",
        neck="Sibyl Scarf",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Metamorph Ring +1",
        ring2="Freke Ring",
        back=gear.SCH_INT_Cape,
        waist="Sacro Cord",
        }

    sets.midcast['Elemental Magic'].Resistant = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck="Argute Stole +1",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Metamorph Ring +1",
        ring2="Freke Ring",
        back=gear.SCH_INT_Cape,
        waist="Sacro Cord",
        }
		
		
    sets.midcast['Elemental Magic'].OccultAcumen = {
		ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",
		neck="Combatant's Torque",
		ear1="Dedition Earring",
		ear2="Telos Earring",
		ring1="Chirich Ring +1",
		ring2="Petrov Ring",
        back=gear.SCH_INT_Cape,
		waist="Oneiros Rope",
		legs="Perdition Slops",
	}
		

	sets.midcast.Helix = {
        main="Bunzi's rod",
        sub="Culminus",
		ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Amalric Gages +1",
        legs="Agwu's Slops",
        feet="Amalric Nails +1",
		ring1="Mallquis Ring",
		ring2="Freke Ring",
		ear1="Malignance Earring",
		ear2="Regal Earring",
        neck="Argute Stole +1",
        waist="Acuity Belt +1",
		back="Bookworm's Cape"
        }
		
	sets.midcast.DarkHelix = set_combine(sets.midcast.Helix, {
        head="Pixie Hairpin +1",
        ring2="Archon Ring",
    })

    sets.midcast.LightHelix = set_combine(sets.midcast.Helix, {
        main="Daybreak",
        sub="Ammurapi Shield",
    })
	

	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
   --     waist="Shinjutsu-no-Obi +1",
        })
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})

	sets.idle = {
		main="Mpaca's Staff",
		sub="Khonsu",
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body=gear.SCH_EMPY_Body,
		hands=gear.Chiro_refresh_hands,
		legs="Nyame Flanchard",
		feet=gear.Chiro_refresh_feet,
		neck="Warder's charm +1",
		waist="Slipor Sash",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back=gear.SCH_IDLE_Cape,
    }

		
    -- Defense sets
		
 --   sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	--sets.latent_refresh_grip = {sub="Oneiros Grip"}
--	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

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
	}		

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head=gear.SCH_EMPY_Head}
    sets.buff['Rapture'] = {head=gear.SCH_EMPY_Head}
    sets.buff['Perpetuance'] = {hands=gear.SCH_EMPY_Hands}
    sets.buff['Immanence'] = {hands=gear.SCH_EMPY_Hands, "Lugh's Cape"}
    sets.buff['Penury'] = {legs=gear.SCH_EMPY_Legs}
    sets.buff['Parsimony'] = {legs=gear.SCH_EMPY_Legs}
    sets.buff['Celerity'] = {feet=gear.SCH_RELIC_Feet}
    sets.buff['Alacrity'] = {feet=gear.SCH_RELIC_Feet}
    sets.buff['Klimaform'] = {feet=gear.SCH_EMPY_Feet}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {legs=gear.SCH_AF_Legs} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {body=gear.SCH_AF_Body} --body="Academic's Gown +3"

    sets.buff.Sublimation = {head=gear.SCH_AF_Head,body=gear.SCH_RELIC_Body,waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Akademos = {main="Akademos",sub="Enki Strap"}
	sets.weapons.Bunzi = {main="Bunzi's Rod",sub="Ammurapi Shield"}
	sets.weapons.Mpaca = {main="Mpaca's Staff",sub="Enki Strap"}
	sets.weapons.Occult = {main="Mpaca's Staff",sub="Bloodrain Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end