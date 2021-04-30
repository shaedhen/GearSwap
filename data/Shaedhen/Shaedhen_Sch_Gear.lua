-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','OccultAcumen','9k')
    state.IdleMode:options('Normal','PDT')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos')

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	
    select_default_macro_book()
	
		----SCH	
	--Academic
	gear.SCH_AF_Head		=	{ name="Academic's Mortarboard +2"}
    gear.SCH_AF_Body		=	{ name="Academic's Gown +2"}
    gear.SCH_AF_Hands		=	{ name="Academic's Bracers +2"}
    gear.SCH_AF_Legs		=	{ name="Academic's Pants +2"}
    gear.SCH_AF_Feet		=	{ name="Academic's Loafers +2"}
    --Pedagogy
    gear.SCH_RELIC_Head		=	{ name="Pedagogy Mortarboard +2"}
    gear.SCH_RELIC_Body		=	{ name="Pedagogy Gown +3"}
    gear.SCH_RELIC_Hands 	=	{ name="Pedagogy Bracers +3"}
    gear.SCH_RELIC_Legs		=	{ name="Pedagogy Pants +3"}
    gear.SCH_RELIC_Feet		=	{ name="Pedagogy Loafers +3"}
    --Arbatel
    gear.SCH_EMPY_Head		=	{ name="Arbatel Bonnet +1"}
    gear.SCH_EMPY_Body		=	{ name="Arbatel Gown +1"}
    gear.SCH_EMPY_Hands		=	{ name="Arbatel Bracers +1"}
    gear.SCH_EMPY_Legs		=	{ name="Arbatel Pants +1"}
    gear.SCH_EMPY_Feet		=	{ name="Arbatel Loafers +1"}	
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs=gear.SCH_RELIC_Legs}
	sets.precast.JA['Enlightenment'] = {body=gear.SCH_RELIC_Body} --body="Peda. Gown +1"
	sets.precast.JA['Sublimation'] = {
    main="Malignance Pole",
    sub="Kaja Grip",
    ammo="Homiliary",
    head=gear.SCH_AF_Head,
    body="Gyve Doublet",
    hands=gear.SCH_AF_Hands,
    legs=gear.SCH_AF_Legs,
    feet="Skaoi Boots",
    neck="Sanctity Necklace",
    waist="Porous Rope",
    left_ear="Thureous Earring",
    right_ear="Calamitous Earring",
    back="Moonbeam Cape",
        }
    -- Fast cast sets for spells

    sets.precast.FC = {
    --    /RDM --15
        main="Grioavolr", --7
        sub="Kaja Grip", --3
        range="Impatiens", --3
        head="Amalric Coif +1", --10
        body="Merlinic Jubbah", --13
        hands=gear.SCH_AF_Hands, --9
        legs="Psycloth Lappas", --7
        feet=gear.SCH_RELIC_Feet, --8
        neck="Voltsurge Torque", --5
        ear1="Malignance Earring", --4
        ear2="Loquacious Earring", --2
        ring1="Kishar Ring", --4
        waist="Embla Sash", --5
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
    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Amalric Doublet",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Psycloth Lappas",feet="Medium's Sabots"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Akademos",
        sub="Enki Strap",
	--	head=gear.Merli_Burst_head,
		ring2="Mujin Band",
		legs=gear.Merli_Burst_legs,feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Cure = {
        main="Daybreak", --22/(-10)
        sub="Sors Shield", --3/(-5)
		head="Vanya Hood",
        hands="Vanya Cuffs", --10
		legs="Doyen Pants",
		feet="Vanya Clogs",
        neck="Incanter's Torque",
        ear1="Malignance Earring", --5
        ear2="Mendi. Earring",
        ring1="Lebeche Ring", --3/(-5)
        ring2="Menelaus's Ring",
        back="Pahtli Cape", --10
        waist="Pythia Sash",
        }
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff", --10
        sub="Kaja Grip", --0/(-5)
        waist="Hachirin-no-Obi",
        })
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff", --10
        sub="Kaja Grip", --0/(-5)
        waist="Hachirin-no-Obi",
        })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
       -- neck="Nuna Gorget +1",
        ring1="Stikini Ring",
        ring2="Metamor. Ring +1",
        waist="Luminary Sash",
        })

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Debilis Medallion",ear1="Meili Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring",
		back="Oretan. Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
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
        ring1="Ephedra Ring",
        ring2="Menelaus's Ring",
        waist="Bishop's Sash",
        }
		
	sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        main=gear.Gada_ENH,
        sub="Ammurapi Shield",
        hands="Hieros Mittens",
        feet="Vanya Clogs",
        feet="Gende. Galosh. +1",
        neck="Debilis Medallion",
        ear1="Beatific Earring",
        ring2="Menelaus's Ring",
        back="Oretan. Cape +1",
        })

	sets.midcast['Enhancing Magic'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Befouled Crown",
    body=gear.SCH_RELIC_Body,
    hands=gear.Chiro_refresh_hands,
    legs=gear.Telch_Enh_legs,
    feet="Skaoi Boots",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Perimede Cape",
        }
		
	sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'],{
        head=gear.Telch_Enh_head,
        body=gear.SCH_RELIC_Body,
     --   hands=gear.Telchine_ENH_hands,
        legs=gear.Telch_Enh_legs,
     --   feet=gear.Telchine_ENH_feet,
        waist="Embla Sash",
        })

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main="Bolelabunga",
        sub="Ammurapi Shield",
        head=gear.SCH_EMPY_Head,
        body=gear.Telchine_ENH_body,
        back="Lugh's Cape",
        })

    sets.midcast.Haste = sets.midcast.EnhancingDuration

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        head="Amalric Coif +1",
     --   waist="Gishdubar Sash",
      --  back="Grapevine Cape",
        })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        neck="Nodens Gorget",
        waist="Siegel Sash",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        main="Vadose Rod",
        sub="Ammurapi Shield",
        ammo="Staunch Tathlum",
        head="Amalric Coif +1",
     --   hands="Regal Cuffs",
        ear1="Halasz Earring",
     --   ring1="Freke Ring",
        waist="Emphatikos Rope",
        })

    sets.midcast.Storm = sets.midcast.EnhancingDuration

    sets.midcast.Stormsurge = set_combine(sets.midcast.Storm, {feet=gear.SCH_RELIC_Feet})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Ombre Tathlum +1",
    head=gear.SCH_AF_Head,
    body=gear.SCH_AF_Body,
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Conserve MP"+1','MND+8','"Mag.Atk.Bns."+9',}},
    feet="Skaoi Boots",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Lugh's Cape",
        }
	
	sets.midcast['Enfeebling Magic'].Resistant = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Ombre Tathlum +1",
    head=gear.SCH_AF_Head,
    body=gear.SCH_AF_Body,
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Conserve MP"+1','MND+8','"Mag.Atk.Bns."+9',}},
    feet="Skaoi Boots",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Lugh's Cape",
        }
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {main="Maxentius",head="Amalric Coif +1",ear2="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Maxentius",head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {main="Maxentius",head="Amalric Coif +1",ear1="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Maxentius",head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring2="Stikini Ring",feet=gear.chironic_nuke_feet})

    sets.midcast['Dark Magic'] = {
    main={ name="Rubicundity", augments={'Mag. Acc.+4','"Mag.Atk.Bns."+5','Dark magic skill +2','"Conserve MP"+3',}},
    sub="Ammurapi Shield",
    ammo="Ombre Tathlum +1",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Psycloth Vest", augments={'Elem. magic skill +20','INT+7','Enmity-6',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Conserve MP"+1','MND+8','"Mag.Atk.Bns."+9',}},
    feet="Jhakri Pigaches +2",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Perimede Cape",
        }

    sets.midcast.Kaustra  = {
        main="Akademos", --10
        sub="Enki Strap",
        ammo="Ombre Tathlum +1",
        head="Pixie Hairpin +1",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +9','CHR+7','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
        hands=gear.Jhakri_Hands, --(5)
        legs=gear.Mallquis_Legs, --6
        feet=gear.Jhakri_Feet, --11
        neck="Argute Stole", --8
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Diamond Ring +1",
        ring2="Archon Ring",
        back="Lugh's Cape",
        waist="Acuity Belt +1",
        }
		
    sets.midcast.Kaustra.Resistant  = {
        main="Akademos", --10
        sub="Enki Strap",
        ammo="Ombre Tathlum +1",
        head="Pixie Hairpin +1",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +9','CHR+7','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
        hands=gear.Jhakri_Hands, --(5)
        legs=gear.Mallquis_Legs, --6
        feet=gear.Jhakri_Feet, --11
        neck="Argute Stole", --8
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Diamond Ring +1",
        ring2="Archon Ring",
        back="Lugh's Cape",
        waist="Acuity Belt +1",
        }

    sets.midcast.Drain  = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        ear1="Hirudinea Earring",
        ring1="Evanescence Ring",
        ring2="Archon Ring",
        waist="Fucho-no-obi",
        })
		
    sets.midcast.Drain.Resistant  = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        ear1="Hirudinea Earring",
        ring1="Evanescence Ring",
        ring2="Archon Ring",
        waist="Fucho-no-obi",
        })

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
    main={ name="Rubicundity", augments={'Mag. Acc.+4','"Mag.Atk.Bns."+5','Dark magic skill +2','"Conserve MP"+3',}},
    sub="Ammurapi Shield",
    ammo="Ombre Tathlum +1",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Psycloth Vest", augments={'Elem. magic skill +20','INT+7','Enmity-6',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Conserve MP"+1','MND+8','"Mag.Atk.Bns."+9',}},
    feet="Jhakri Pigaches +2",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Perimede Cape",
        }

    sets.midcast.Stun.Resistant = {
    main={ name="Rubicundity", augments={'Mag. Acc.+4','"Mag.Atk.Bns."+5','Dark magic skill +2','"Conserve MP"+3',}},
    sub="Ammurapi Shield",
    ammo="Ombre Tathlum +1",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Psycloth Vest", augments={'Elem. magic skill +20','INT+7','Enmity-6',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Conserve MP"+1','MND+8','"Mag.Atk.Bns."+9',}},
    feet="Jhakri Pigaches +2",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Perimede Cape",
        }

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
        main="Daybreak",
        sub="Ammurapi Shield",
		ammo= "Ombre Tathlum +1",
        head=gear.SCH_RELIC_Head,
        body=gear.Merli_DraAsp_body,
        hands=gear.SCH_RELIC_Hands,
        legs=gear.SCH_RELIC_Legs,
        feet=gear.SCH_RELIC_Feet,
        neck="Saevus Pendant +1",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Shiva Ring +1",
        ring2="Shiva Ring +1",
        back="Lugh's Cape",
        waist="Refoccilation Stone",
        }

    sets.midcast['Elemental Magic'].Resistant = {
        main="Daybreak",
        sub="Ammurapi Shield",
		ammo= "Ombre Tathlum +1",
        head=gear.SCH_RELIC_Head,
        body=gear.Merli_DraAsp_body,
        hands=gear.SCH_RELIC_Hands,
        legs=gear.SCH_RELIC_Legs,
        feet=gear.SCH_RELIC_Feet,
        neck="Saevus Pendant +1",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Shiva Ring +1",
        ring2="Shiva Ring +1",
        back="Lugh's Cape",
        waist="Refoccilation Stone",
        }
		
		
    sets.midcast['Elemental Magic']['9k'] = {
        main="Daybreak",
        sub="Ammurapi Shield",
		ammo= "Ombre Tathlum +1",
        head=gear.SCH_RELIC_Head,
        body=gear.Merli_DraAsp_body,
        hands=gear.SCH_RELIC_Hands,
        legs=gear.SCH_RELIC_Legs,
        feet=gear.SCH_RELIC_Feet,
        neck="Saevus Pendant +1",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Shiva Ring +1",
        ring2="Shiva Ring +1",
        back="Lugh's Cape",
        waist="Refoccilation Stone",
        }
		
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back=gear.nuke_jse_back,waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1",ring1="Metamor. Ring +1"})

	sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {
        main="Daybreak",
        sub="Culminus",
		head=gear.Mallquis_Head,
        body=gear.Mallquis_Body,
        hands=gear.Mallquis_Hands,
        legs=gear.Mallquis_Legs,
        feet=gear.Mallquis_Feet,
		ring1="Mallquis Ring",
     --   ammo="Ghastly Tathlum +1",
        neck="Argute Stole",
     --   waist="Sacro Cord",
        })
		
	    sets.midcast.DarkHelix = set_combine(sets.midcast.Helix, {
        head="Pixie Hairpin +1",
        ring2="Archon Ring",
        })

    sets.midcast.LightHelix = set_combine(sets.midcast.Helix, {
        main="Daybreak",
        sub="Ammurapi Shield",
        })
	
	sets.midcast.Helix.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Malignance Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}	

	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        main="Akademos",
        sub="Kaja Grip",
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
   --     waist="Shinjutsu-no-Obi +1",
        })
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric Doublet",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
    main="Akademos",
    sub="Kaja Grip",
    ammo="Staunch Tathlum",
    head="Befouled Crown",
    body=gear.SCH_AF_Body,
    hands={ name="Chironic Gloves", augments={'MND+5','AGI+2','"Refresh"+1','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs="Assiduity Pants +1",
    feet={ name="Chironic Slippers", augments={'Pet: "Store TP"+7','Crit.hit rate+3','"Refresh"+1','Accuracy+13 Attack+13','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    neck="Yngvi Earring",
    waist="Slipor Sash",
    left_ear="Hearty Earring",
    right_ear="Etiolation Earring",
    left_ring="Paguroidea Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
        }

    sets.idle.PDT = {
    main="Akademos",
    sub="Kaja Grip",
    ammo="Staunch Tathlum",
    head="Befouled Crown",
    body=gear.SCH_AF_Body,
    hands={ name="Chironic Gloves", augments={'MND+5','AGI+2','"Refresh"+1','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs="Assiduity Pants +1",
    feet={ name="Chironic Slippers", augments={'Pet: "Store TP"+7','Crit.hit rate+3','"Refresh"+1','Accuracy+13 Attack+13','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    neck="Yngvi Earring",
    waist="Slipor Sash",
    left_ear="Hearty Earring",
    right_ear="Etiolation Earring",
    left_ring="Paguroidea Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
        }
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {
    main="Akademos",
    sub="Kaja Grip",
    ammo="Staunch Tathlum",
    head="Befouled Crown",
    body=gear.SCH_AF_Body,
    hands={ name="Chironic Gloves", augments={'MND+5','AGI+2','"Refresh"+1','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs="Assiduity Pants +1",
    feet={ name="Chironic Slippers", augments={'Pet: "Store TP"+7','Crit.hit rate+3','"Refresh"+1','Accuracy+13 Attack+13','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    neck="Yngvi Earring",
    waist="Slipor Sash",
    left_ear="Hearty Earring",
    right_ear="Etiolation Earring",
    left_ring="Paguroidea Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
        }
		
    -- Defense sets

    sets.defense.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Mallquis Saio +2",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Mallquis Saio +2",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum",
        head=gear.merlinic_nuke_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.merlinic_nuke_body,hands="Gende. Gages +1",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
	sets.engaged.PDT = {main="Malignance Pole", sub="Oneiros Grip",ammo="Staunch Tathlum",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet=gear.chironic_refresh_feet}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head=gear.SCH_EMPY_Head}
    sets.buff['Perpetuance'] = {hands=gear.SCH_EMPY_Hands}
    sets.buff['Immanence'] = {hands=gear.SCH_EMPY_Hands, "Lugh's Cape"}
    sets.buff['Penury'] = {legs=gear.SCH_EMPY_Legs}
    sets.buff['Parsimony'] = {legs=gear.SCH_EMPY_Legs}
    sets.buff['Celerity'] = {feet=gear.SCH_RELIC_Feet}
    sets.buff['Alacrity'] = {feet=gear.SCH_RELIC_Feet}
    sets.buff['Klimaform'] = {feet=gear.SCH_EMPY_Feet}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
		
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonlight Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.Sublimation = {head="Acad. Mortar. +3",waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Akademos = {main="Akademos",sub="Enki Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end