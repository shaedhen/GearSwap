function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','DT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Idris','Daybreak','Staff','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')

	
	indi_duration = 290
	
	select_default_macro_book()
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
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

    sets.precast.FC = {
    --  /RDM --15
        main="Grioavolr", --7
        sub="Kaja Grip", --3
        range="Impatiens", --3
        head="Amalric Coif +1", --10
        body="Merlinic Jubbah", --13
        legs=gear.GEO_AF_Legs, --11
        feet=gear.Merli_DraAsp_feet, --7
        neck="Voltsurge Torque", --5
        ear1="Loquacious Earring", --2
        ring1="Kishar Ring", --4
        back="Lifestream Cape", --7
        waist="Witful Belt", --3/(2)
        }

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
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
	sets.precast.WS = {}


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
		range="Dunna",
		head=gear.GEO_EMPY_Head,
		body=gear.GEO_RELIC_Body,
		hands=gear.GEO_AF_Hands,
		legs=gear.GEO_RELIC_Legs,
		feet=gear.GEO_EMPY_Feet,
		neck="Bagua Charm +1",
		waist="Luminary Sash",
		ear1="Gna Earring",
		ear2="Fulla Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        back="Lifestream Cape",
        }


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back=gear.idle_jse_back,legs=gear.GEO_RELIC_Legs,feet="Azimuth Gaiters +1"})
		
    sets.midcast.Cure = {
        main="Daybreak", --22/(-10)
        sub="Sors Shield", --3/(-5)
		head="Vanya Hood",
     --   body="Vanya Robe",
        hands="Vanya Cuffs", --10
		legs="Doyen Pants",
		feet="Vanya Clogs",
        neck="Incanter's Torque",
        ear1="Malignance Earring", --5
        ear2="Mendi. Earring",
        ring1="Menelaus's Ring", --3/(-5)
        ring2="Sirona's Ring",
		back="Pahtli Cape", --10
        waist="Pythia Sash",
        }
		
    sets.midcast.LightWeatherCure = {
        main="Daybreak", --22/(-10)
        sub="Sors Shield", --3/(-5)
		head="Vanya Hood",
     --   body="Vanya Robe",
        hands="Vanya Cuffs", --10
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
        main="Daybreak", --22/(-10)
        sub="Sors Shield", --3/(-5)
		head="Vanya Hood",
     --   body="Vanya Robe",
        hands="Vanya Cuffs", --10
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
        main="Daybreak",
        sub="Ammurapi Shield",
		ammo	=	"Ghastly Tathlum +1",
        head=gear.GEO_RELIC_Head,
		body=gear.Merli_DraAsp_body,
        hands=gear.GEO_RELIC_Hands,
        legs=gear.Jhakri_Legs,
        feet=gear.Jhakri_Feet,
        neck="Saevus Pendant +1",
        ear1="Friomisi Earring",
        ear2="Malignance Earring",
        ring1="Shiva Ring +1",
        ring2="Shiva Ring +1",
        back="Izdubar Mantle",
        waist="Refoccilation Stone",
        }
		
    sets.midcast['Elemental Magic'].HighTierNuke = {
        main="Daybreak",
        sub="Ammurapi Shield",
		ammo	=	"Ombre Tathlum +1",
        head=gear.GEO_RELIC_Head,
		body=gear.Merli_DraAsp_body,
        hands=gear.GEO_RELIC_Hands,
        legs=gear.Jhakri_Legs,
        feet=gear.Jhakri_Feet,
        neck="Saevus Pendant +1",
        ear1="Friomisi Earring",
        ear2="Malignance Earring",
        ring1="Shiva Ring +1",
        ring2="Shiva Ring +1",
        back="Izdubar Mantle",
        waist="Refoccilation Stone",
        }
		
    sets.midcast['Dark Magic'] = {
	    main="Grioavolr",
        sub="Niobid Strap",
        head="Chironic Hat",
        body=gear.Merli_DraAsp_body,
		hands="Jhakri Cuffs +2",
        legs="Jhakri Slops +2",
        feet="Merlinic Crackows",
        neck="Erra Pendant",
        ear1="Dignitary's Earring",
        ear2="Malignance Earring",
        ring1="Metamorph Ring +1",
		ring2="Stikini Ring",
        back="Perimede Cape",
        waist="Luminary Sash",
        }
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.Merli_DraAsp_body,hands="Jhakri Cuffs +2",ring1="Archon Ring",ring2="Evanescence Ring",
        back="Perimede Cape",waist="Fucho-no-obi",legs="Jhakri Slops +2",feet="Merlinic Crackows"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {        
		main="Daybreak",
        sub="Ammurapi Shield",
        head="Amalric Coif +1",
		body=gear.Mallquis_Body,
        hands=gear.Mallquis_Hands,
        legs="Jhakri Slops +2",
        feet=gear.Jhakri_Feet,
        neck="Bagua Charm +1",
        ear1="Dignitary's Earring",
        ear2="Malignance Earring",
        ring1="Metamorph Ring +1",
        ring2="Stikini Ring",
        back="Nantosuelta's Cape",
        waist="Luminary Sash"
	}		
		
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
    })
		
	sets.midcast.Dispel = {        
		main="Daybreak",
        sub="Ammurapi Shield",
		range="Dunna",
        head="Befouled Crown",
		body=gear.Merli_DraAsp_body,
        hands=gear.GEO_EMPY_Hands,
        legs="Psycloth Lappas",
        feet="Skaoi Boots",
        neck="Bagua Charm +1",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Metamorph Ring +1",
        ring2="Stikini Ring",
        back="Nantosuelta's Cape",
        waist="Luminary Sash"
	}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = {        
		main="Daybreak",
        sub="Ammurapi Shield",
		range="Dunna",
        head="Befouled Crown",
		body=gear.Merli_DraAsp_body,
        hands=gear.GEO_EMPY_Hands,
        legs="Psycloth Lappas",
        feet="Skaoi Boots",
        neck="Bagua Charm +1",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Metamorph Ring +1",
        ring2="Stikini Ring",
        back="Nantosuelta's Cape",
        waist="Luminary Sash"
	}	
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})

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
        main="Daybreak",
        sub="Genmei Shield",
        ranged="Dunna",
        head="Befouled Crown",
        body="Annointed Kalasiris",
		hands=gear.GEO_RELIC_Hands,
        legs="Assiduity Pants +1",
        feet=gear.GEO_AF_Feet,
        neck="Yngvi Earring",
        ear1="Hearty Earring",
        ear2="Etiolation Earring",
        ring1="Paguroidea Ring",
        ring2="Defending Ring",
        back="Lifestream Cape",
		waist="Porous Rope",	
        }
		
	    sets.idle.DT = set_combine(sets.idle, {
   --     main="Bolelabunga",
    --    sub="Genmei Shield", --10/0
    --    body="Mallquis Saio +2", --8/8
    --    feet="Azimuth Gaiters +1", --4/0
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
        range="Dunna", --5/0
        head=gear.GEO_EMPY_Head, --0/3
		neck ="Bagua Charm +1",
        body="Annointed Kalasiris",
        hands=gear.GEO_AF_Hands, --11/0
       legs="Telchine Braconi",
        feet="Telchine Pigaches", --0/3
        ear1="Handler's Earring", --3*/0
        ear2="Handler's Earring +1", --4*/0
		ring1="Paguroidea Ring",
        ring2="Defending Ring",
        back="Nantosuelta's Cape",
        waist="Isa Belt" --3/1
        })


	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 

	sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet="Azimuth Gaiters +1"}

	-- Defense sets
	
	sets.defense.PDT = {main="Malignance Pole",sub="Kaja Grip",ammo="Staunch Tathlum",
		head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Azimuth Gaiters +1"}

	sets.defense.MDT = {main="Malignance Pole",sub="Kaja Grip",ammo="Staunch Tathlum",
		head=gear.GEO_EMPY_Head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Azimuth Gaiters +1"}
		
    sets.defense.MEVA = {main="Malignance Pole",sub="Kaja Grip",ammo="Staunch Tathlum",
        head=gear.GEO_EMPY_Head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=gear.merlinic_nuke_body,hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back=gear.idle_jse_back,waist="Luminary Sash",legs="Telchine Braconi",feet="Azimuth Gaiters +1"}
		
	sets.defense.PetPDT = {}
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Jhakri Robe +2",hands="Gazu Bracelet +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Kayapa Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Kayapa Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Alber Strap",head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	sets.ResistantMagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Idris = {main='Idris',sub='Genmei Shield'}
	sets.weapons.Daybreak = {main='Daybreak',sub='Genmei Shield'}
	sets.weapons.Staff = {main='Malignance Pole',sub='Kaja Grip'}
	sets.weapons.DualWeapons = {main='Daybreak',sub='Idris'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end