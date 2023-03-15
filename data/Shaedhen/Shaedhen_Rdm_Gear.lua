function user_job_setup()
	include('Shaedhen-Items.lua')
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','Enspell','Htwo')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Normal','Acc')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','DT','FullRefresh')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Vitiation','DualVitiation','DualVitiSeraph','DualVitiClub','Naegling','Tauret','DualWeapons','DualTPBonus','DualEvisceration','DualClubs','DualAeolian','HtwoH','EnspellOnly')

	----RDM
	--Atrophy
	gear.RDM_AF_Head		=	{ name	=	"Atrophy Chapeau +3"}
    gear.RDM_AF_Body		=	{ name	=	"Atrophy Tabard +3"}
    gear.RDM_AF_Hands		=	{ name	=	"Atrophy Gloves +3"}
    gear.RDM_AF_Legs		=	{ name	=	"Atrophy Tights +3"}
    gear.RDM_AF_Feet		=	{ name	=	"Atrophy Boots +3"}
    --Vitiation
    gear.RDM_RELIC_Head		=	{ name	=	"Vitiation Chapeau +3"}
    gear.RDM_RELIC_Body		=	{ name	=	"Vitiation Tabard +3"}
    gear.RDM_RELIC_Hands 	=	{ name	=	"Vitiation Gloves +3"}
    gear.RDM_RELIC_Legs		=	{ name	=	"Vitiation Tights +3"}
    gear.RDM_RELIC_Feet		=	{ name	=	"Vitiation Boots +3"}
    --Lethargy
    gear.RDM_EMPY_Head		=	{ name	=	"Lethargy Chappel +3"}
    gear.RDM_EMPY_Body		=	{ name	=	"Lethargy Sayon +3"}
    gear.RDM_EMPY_Hands		=	{ name	=	"Lethargy Gantherots +3"}
    gear.RDM_EMPY_Hands		=	{ name	=	"Lethargy Gantherots +3"}
    gear.RDM_EMPY_Legs		=	{ name	=	"Lethargy Fuseau +3"}
    gear.RDM_EMPY_Feet		=	{ name	=	"Lethargy Houseaux +3"}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = "Toro Cape"
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = "Toro Cape"
	gear.obi_high_nuke_waist = "Refoccilation Stone"

    gear.RDM_MND_Cape = {name	=	"Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}} --*
	gear.RDM_INT_Cape ={name	=	"Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10',}} --*
	gear.RDM_TP_Cape ={name	=	"Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Damage taken-5%',}} --*
    gear.RDM_WS1_Cape ={name	=	"Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+2','Weapon skill damage +10%',}} --*
	gear.RDM_WS2_Cape ={name	=	"Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10',}} --*
	gear.RDM_WS3_Cape ={name	=	"Sucellos's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}} --*

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
--	send_command('bind ^@!` input /ja "Accession" <me>')
--	send_command('bind ^backspace input /ja "Saboteur" <me>')
--	send_command('bind !backspace input /ja "Spontaneity" <t>')
--	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
--	send_command('bind != input /ja "Penury" <me>')
--	send_command('bind @= input /ja "Parsimony" <me>')
--	send_command('bind ^delete input /ja "Dark Arts" <me>')
--	send_command('bind !delete input /ja "Addendum: Black" <me>')
--	send_command('bind @delete input /ja "Manifestation" <me>')
--	send_command('bind ^\\\\ input /ma "Protect V" <t>')
--	send_command('bind @\\\\ input /ma "Shell V" <t>')
--	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
--	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
--	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
--	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
--	send_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcDaggers;gs c set weaponskillmode proc')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body	=	gear.RDM_RELIC_Body}
	sets.precast.JA['Convert'] = {main="Murgleis"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = 
	{
		head	=	gear.Taeon_PhalWalz_head, 
		body	=	gear.Taeon_PhalWalz_body, 
        hands	=	gear.Taeon_PhalWalz_hands, 
        legs	=	gear.Taeon_PhalWalz_legs, 
        feet	=	gear.Taeon_PhalWalz_feet, 
		neck	=	"Phalaina Locket",
		ring1	=	"Asklepian Ring",
        waist	=	"Gishdubar Sash"		
	}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz']=  {}

	-- Fast cast sets for spells
	
	sets.precast.FC = --38
	{
	--	main	=	"Vitiation Sword",
	--	sub		=	"Ammurapi Shield",
	--	range	=	empty,
	--	ammo	=	"Impatiens",
		head	=	gear.RDM_AF_Head,   --54 
		neck	=	"Voltsurge Torque", --58
		ear1	=	"Malignance Earring", --62
		ear2	=	"Lethargy Earring +1", --70
		body	=	gear.RDM_RELIC_Body, --85
--		hands	=	"Leyline Gloves",
--		ring1	=	"Kishar Ring",
		ring2	=	"Lebeche Ring",
		back	=	"Perimede Cape",
		waist	=	"Witful Belt",
		legs	=	"Malignance Tights",
--		feet	=	gear.merlinic_aspir_feet
	}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body	=	"Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main	=	"Daybreak",sub	=	"Ammurapi Shield"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = 
	{
        ammo	=	"Coiste Bodhar",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet=gear.RDM_EMPY_Feet,	
        neck	=	"Rep. Plat. Medal",
		ear1	=	"Moonshade Earring",
		ear2	=	"Sherida Earring",
        ring1	=	"Epaminondas's Ring",
		ring2	=	"Rufescent Ring",
		back	=	gear.RDM_WS1_Cape,
		waist	=	"Sailfi Belt +1",	
	}
		
	sets.precast.WS.Acc = 
		set_combine(sets.precast.WS, 
		{
			ear2	=	"Telos Earring",
			waist	=	"Grunfeld Rope",
		}
	)
		
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = 
	{
		ammo	=	"Regal Gem",
		head	=	"Nyame Helm",
		body	=	gear.RDM_RELIC_Body,
		hands	=	gear.RDM_AF_Hands,
		legs	=	gear.RDM_AF_Legs,
		feet	=	gear.RDM_EMPY_Feet,
		neck	=	"Fotia Gorget",
		waist	=	"Fotia Belt",
		ear1	=	"Moonshade Earring",
		ear2	= 	"Sherida Earring",
		ring1	=	"Petrov Ring",
		ring2	=	"Rufescent Ring",
		back	=	gear.RDM_WS1_Cape,
	}
	
	sets.precast.WS['Chant Du Cygne'] = 
	{
		ammo	=	"Yetshila +1",
		head	=	"Blistering Sallet +1",
		body	=	gear.RDM_EMPY_Body,
		hands	=	"Bunzi's Gloves",
		legs 	=	"Zoar Subligar +1",
		feet	=	"Thereoid Greaves",
		neck	=	"Fotia Gorget",
		ear1	=	"Sherida Earring",
		ear2	=	"Mache Earring +1",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Begrudging Ring", 	
		back	=	gear.RDM_WS2_Cape,
		waist	=	"Fotia Belt"
	}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = 
	{
		ammo	=	"Coiste Bodhar",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	gear.RDM_EMPY_Feet,	
        neck	=	"Rep. Plat. Medal",
		ear1	=	"Moonshade Earring",		
        ear2	=	"Regal Earring",
        ring1	=	"Epaminondas's Ring",		
		ring2	=	"Sroda Ring",
		back	=	gear.RDM_WS1_Cape,
		waist	=	"Sailfi Belt +1"	
	}
	
	sets.precast.WS['Knights of the Round'] = sets.precast.WS['Savage Blade']
	
	sets.precast.WS['Knights of the Round'] = sets.precast.WS['Savage Blade']
	
	sets.precast.WS['Death Blossom'] = sets.precast.WS['Savage Blade']
		
	sets.precast.WS['Sanguine Blade'] = 
	{
		ammo	=	"Sroda Tathlum", 
        head	=	"Pixie Hairpin +1",
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	"Jhakri Cuffs +2",
		legs	=	gear.RDM_EMPY_Legs,
		feet	=	gear.RDM_EMPY_Feet,	
        neck	=	"Sibyl Scarf",
        ear1	=	"Regal Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Epaminondas's Ring",	
		ring2	=	"Archon Ring",
        back	=	gear.RDM_WS4_Cape,
		waist	=	"Orpheus's Sash",
	}
		
	sets.precast.WS['Seraph Blade'] = 
	{
		ammo	=	"Sroda Tathlum", 
		head	=	{ name="Nyame Helm", augments={'Path: B',}},
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	"Jhakri Cuffs +2",
		legs	=	gear.RDM_EMPY_Legs,
		feet	=	gear.RDM_EMPY_Feet,	
        neck	=	"Duelist's Torque +2",
        ear1	=	"Moonshade Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Epaminondas's Ring",
		ring2	=	"Weatherspoon Ring",
        back	=	gear.RDM_WS4_Cape,
		waist	=	"Orpheus's Sash",
	}
		
	sets.precast.WS['Aeolian Edge'] = 
	{
		ammo	=	"Sroda Tathlum", 
		head	=	gear.RDM_EMPY_Head,
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	"Jhakri Cuffs +2",
		legs	=	gear.RDM_EMPY_Legs,
		feet	=	gear.RDM_EMPY_Feet,	
        neck	=	"Sibyl Scarf",
        ear1	=	"Moonshade Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Metamorph Ring +1",
		ring2	=	"Freke Ring",
        back	=	gear.RDM_WS5_Cape,
        waist	=	"Orpheus's Sash"
	}
	
	sets.precast.WS['Empyreal Arrow'] = 
	{
		range	=	"Ullr",
		ammo	=	"Demon Arrow",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},	
		neck	=	"Sanctity Necklace",
		waist	=	"Yemaya Belt",
		ear1	=	"Enervating Earring",
		ear2	=	"Telos Earring",
		ring1	=	"Cacoethic Ring +1",
		ring2	=	"Crepuscular Ring",
		back 	=	gear.RDM_WS3_Cape
    }
	
	sets.precast.WS['Asuran Fists'] = 
	{
		ammo="Voluspa Tathlum",
		head="Viti. Chapeau +3",
		neck="Rep. Plat. Medal",
		ear1="Mache Earring +1",
		ear2="Mache Earring +1",
		body="Viti. Tabard +3",
		hands="Atrophy Gloves +3",
		ring1="Shukuyu Ring",
		ring2="Rufescent Ring",
		back= gear.RDM_WS1_Cape ,
		waist="Grunfeld Rope",
		legs="Viti. Tights +3",
		feet="Atro. Boots +3"
    }
	
	sets.precast.WS['Black Halo'] = 
	{
		ammo	=	"Coiste Bodhar",
		head	=	{ name="Nyame Helm", augments={'Path: B',}},
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	gear.RDM_EMPY_Feet,	
        neck	=	"Duelist's Torque +2",
		ear1	=	"Sherida Earring",		
        ear2	=	"Regal Earring",
        ring1	=	"Epaminondas's Ring",		
		ring2	=	"Metamorph Ring +1",
		back	=	gear.RDM_WS1_Cape,
		waist	=	"Sailfi Belt +1"	
	}

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter)
	
	-- Gear that converts elemental damage done to recover MP.	
	--sets.RecoverMP = {body	=	"Seidr Cotehardie"}
	
	sets.midcast.FastRecast = 
	{
	--	main	=	"Vitiation Sword",
	--	sub		=	"Ammurapi Shield",
	--	range	=	empty,
	--	ammo	=	"Hasty Pinion +1",
		head	=	gear.RDM_AF_Head,
		neck	=	"Voltsurge Torque",
		ear1	=	"Loquacious Earring",
		ear2	=	"Malignance Earring",
		body	=	gear.RDM_RELIC_Body, 
		hands	=	"Leyline Gloves",
		ring1	=	"Kishar Ring",
		ring2	=	"Purity Ring",
		back	=	gear.RDM_IDLE_Cape,
		waist	=	"Witful Belt",
		legs	=	"Malignance Tights",
		feet	=	"Medium's Sabots"
	}
	
	
    sets.midcast.SpellInterrupt = 
	{
		ammo	=	"Staunch Tathlum +1", --10
		body	=	"Rosette Jaseran +1", --35
		hands	=	"Chironic Gloves", --55
        legs	=	"Carmine Cuisses +1", --75
		ring1	=	"Evanescence Ring", --85
	    waist	=	"Emphatikos Rope", --97
		feet	=	"Amalric Nails +1" --100+
    }

    sets.midcast.Cure = 
	{
     --   main	=	"Daybreak", 		assuming we're solo/meleeing
     --   sub		=	"Sors Shield", 
        ammo	=	"Psilomene", 
        head	=	"Kaykaus Mitra +1", 
        body	=	"Kaykaus Bliaut +1", 
        hands	=	"Kaykaus Cuffs +1", 
        legs	=	"Kaykaus Tights +1", 
        feet	=	"Kaykaus Boots +1", 
        neck	=	"Incanter's Torque",
        ear2	=	"Meili Earring", 
        ear1	=	"Beatific Earring", 
        ring1	=	"Menelaus's Ring", 
        ring2	=	"Sirona's Ring",
        back	=	"Pahtli Cape", 
        waist	=	"Pythia Sash"
    }
		
    sets.midcast.LightWeatherCure = 
	{
		main	=	"Chatoyant Staff",
		sub		=	"Enki Strap", 
        ammo	=	"Psilomene", 
        head	=	"Kaykaus Mitra +1", 
        body	=	"Kaykaus Bliaut +1", 
        hands	=	"Kaykaus Cuffs +1", 
        legs	=	"Kaykaus Tights +1", 
        feet	=	"Kaykaus Boots +1", 
        neck	=	"Incanter's Torque",
        ear2	=	"Meili Earring", 
        ear1	=	"Beatific Earring",  
        ring1	=	"Menelaus's Ring", 
        ring2	=	"Sirona's Ring",
        back	=	"Twilight Cape", 
        waist	=	"Hachirin-no-obi"
    }
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = 
	{
		main	=	"Chatoyant Staff",
		sub		=	"Enki Strap", 
        ammo	=	"Psilomene", 
        head	=	"Kaykaus Mitra +1", 
        body	=	"Kaykaus Bliaut +1", 
        hands	=	"Kaykaus Cuffs +1", 
        legs	=	"Kaykaus Tights +1", 
        feet	=	"Kaykaus Boots +1", 
        neck	=	"Incanter's Torque",
        ear2	=	"Meili Earring", 
        ear1	=	"Beatific Earring", 
        ring1	=	"Menelaus's Ring", 
        ring2	=	"Sirona's Ring",
        back	=	"Twilight Cape", 
        waist	=	"Hachirin-no-obi"
    }
		
    sets.midcast.StatusRemoval = 
	{
		head	=	"Vanya Hood",
	    body	=	gear.RDM_RELIC_Body,
        legs	=	"Atrophy Tights +3",
        feet	=	"Vanya Clogs",
        neck	=	"Incanter's Torque",
        ear2	=	"Meili Earring", 
        ear1	=	"Beatific Earring", 
        ring1	=	"Menelaus's Ring",
		ring2	=	"Haoma's Ring",
        back	=	gear.RDM_MND_Cape,
		waist	=	"Bishop's Sash",
    }

    sets.midcast.Cursna = 
		set_combine(sets.midcast.StatusRemoval, 
		{
			main	=	"Prelatic Pole",
			sub		=	"Curatio Grip",
			--   hands="Hieros Mittens",
			neck	=	"Debilis Medallion",
			back	=	"Oretan. Cape +1",
		})
	
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.Self_Healing = 
	{
		neck	=	"Phalaina Locket",
	--	hands	=	"Buremte Gloves", not needed it seems
		ring2	=	"Kunaji Ring",
		waist	=	"Gishdubar Sash"
	}
	
	sets.Cure_Received = 
	{
		neck	=	"Phalaina Locket",
		hands	=	"Buremte Gloves",
		ring2	=	"Kunaji Ring",
		waist	=	"Gishdubar Sash"
	}

    sets.midcast['Enhancing Magic'] = 
	{
		main	=	gear.Colada_ENH,
        sub		=	"Ammurapi Shield",
        ammo	=	"Regal Gem",
        head	=	"Befouled Crown",
        body	=	gear.RDM_RELIC_Body,
        hands	=	gear.RDM_RELIC_Hands, 
        legs	=	gear.RDM_AF_Legs, 
        feet	=	gear.RDM_EMPY_Feet,
        neck	=	"Incanter's Torque",
        ear1	=	"Malignance Earring",
        ear2	=	"Andoaa Earring",
        ring1	=	"Stikini Ring +1",
        ring2	=	"Stikini Ring +1",
        back	=	"Ghostfyre Cape",
        waist	=	"Olympus Sash",
    }
	
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.EnhancingSkill = 
	{
		main	=	"Pukulatmuj +1",
		sub		=	"Forfend +1",
		head	=	"Befouled Crown",
		neck	=	"Incanter's Torque",
		ear1	=	"Mimir Earring",
		hands	=	gear.RDM_RELIC_Hands,
		back	=	"Ghostfyre Cape",
		waist	=	"Olympus Sash",
        ammo	=	"Regal Gem",
        body	=	gear.RDM_RELIC_Body,
        legs	=	gear.RDM_AF_Legs, 
        feet	=	gear.RDM_EMPY_Feet,
        ear2	=	"Andoaa Earring",
        ring1	=	"Stikini Ring +1",
        ring2	=	"Stikini Ring +1",
	}
	
	sets.midcast.EnhancingDuration = 
		set_combine(sets.midcast['Enhancing Magic'], 
		{
			head	=	"Telchine Cap",
			neck	=	"Duelist's torque +2",
			hands	=	gear.RDM_AF_Hands, 
			legs	=	"Telchine Braconi",
			waist	=	"Embla Sash",
			ear2	=	"Lethargy Earring +1",
		})
	
	sets.midcast['Haste II'] = 
		set_combine(sets.midcast.EnhancingDuration, {
		})

    sets.midcast.Regen = 
		set_combine(sets.midcast.EnhancingDuration, 
		{
			main	=	"Bolelabunga",
			body	=	"Telchine Chas.",
			feet	=	"Bunzi's Sabots"
        })

    sets.midcast.Refresh = 
		set_combine(sets.midcast.EnhancingDuration, 
		{
			head	=	"Amalric Coif +1", -- +1
			body	=	gear.RDM_AF_Body, -- +3
			legs	=	gear.RDM_EMPY_Legs, -- +2
		})

    sets.midcast.RefreshSelf = 
		set_combine(sets.midcast.Refresh, 
		{
			waist	=	"Gishdubar Sash",
			-- back="Grapevine Cape"
		})

    sets.midcast.Stoneskin = 
		set_combine(sets.midcast.EnhancingSkill, 
		{
			head	=	"Umuthi Hat",
			neck	=	"Nodens Gorget",
			legs	=	"Haven Hose",
			ear1	=	"Earthcry Earring",
			waist	=	"Siegel Sash",
		})

    sets.midcast['Phalanx'] = set_combine(sets.midcast.EnhancingSkill, {
		main = "Sakpata's Sword",
		sub	 = "Egeking",
        head=gear.Taeon_PhalWalz_head, --3
		body=gear.Taeon_PhalWalz_body, --1
        hands=gear.Taeon_PhalWalz_hands, --2
        legs=gear.Taeon_PhalWalz_legs, --3
        feet=gear.Taeon_PhalWalz_feet, --3
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        head="Amalric Coif +1",
        waist="Emphatikos Rope",
    })
	
		sets.midcast.BarStatus = 
		set_combine(sets.midcast.EnhancingDuration, 
		{neck="Sroda Necklace"})
	
		--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = 
	{
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','Mag. Acc.+14','"Mag.Atk.Bns."+15','DMG:+15',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head=gear.RDM_EMPY_Head,
    body=gear.RDM_EMPY_Body,
    hands="Atrophy Gloves +3",
    legs=gear.RDM_EMPY_Legs,
    feet=gear.RDM_EMPY_Feet,
    neck="Duelist's Torque +2",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Lethargy Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Enha.mag. skill +8','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}},
	}

    sets.midcast.Storm = sets.midcast.EnhancingDuration	sets.midcast.BarElement =
	{
		legs	=	"Shedir Seraweels"}
		
	
	sets.midcast.BoostStat = 
	{
		hands	=	gear.RDM_RELIC_Hands
	}
	
	sets.midcast.Protect = 
	{
		ring2	=	"Sheltered Ring"}
	sets.midcast.Shell = 
	{
		ring2	=	"Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = 
	{
		main	=	"Crocea Mors",
		sub		=	"Ammurapi Shield",
        ammo	=	"Regal Gem",
        head	=	gear.RDM_RELIC_Head,
		body	=	gear.RDM_EMPY_Body,
		hands	=	gear.RDM_EMPY_Hands,
        legs	=	"Chironic Hose",
        feet	=	gear.RDM_RELIC_Feet,
        neck	=	"Duelist's torque +2",
        ear1	=	"Regal Earring",
        ear2	=	"Snotra Earring",
        ring1	=	"Kishar Ring",
        ring2	=	"Stikini Ring +1",
        back	=	gear.RDM_MND_Cape,
        waist	=	"Obstinate Sash"
	}
		
	sets.midcast['Enfeebling Magic'].Resistant = 
	{
		main	=	"Crocea Mors",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	gear.RDM_AF_Head,
		body	=	gear.RDM_AF_Body,
		hands	=	gear.RDM_EMPY_Hands,
        legs	=	gear.RDM_EMPY_Legs,
        feet	=	gear.RDM_RELIC_Feet,
        neck	=	"Duelist's torque +2",
        ear1	=	"Regal Earring",
        ear2	=	"Snotra Earring",
        ring1	=	"Stikini Ring +1",
        ring2	=	"Stikini Ring +1",
        back	=	"Aurist's Cape +1",
        waist	=	"Obstinate Sash"
	}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {body	=	gear.RDM_AF_Body,range	=	"Ullr", hands="Regal Cuffs"})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist	=	"Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist	=	"Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist	=	"Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist	=	"Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = 
		set_combine(sets.midcast['Enfeebling Magic'], 
		{
			sub		=	"Mephitis Grip",
			ear1	=	"Vor Earring",
			ring1	=	"Stikini Ring +1",
			legs	=	"Psycloth Lappas",
			back	=	"Ghostfyre Cape"
		}
	)
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {waist	=	"Chaac Belt"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head	=	gear.RDM_RELIC_Head,waist	=	"Chaac Belt"})

	-- Gear for Magic Burst mode.
    sets.MagicBurst = 
	{
		head	=	"Ea Hat",
		body	=	"Ea Houppelande",
		hands	=	"Amalric Gages +1",
		ring1	=	"Mujin Band",
		legs	=	gear.RDM_EMPY_Legs,
		feet	=	"Bunzi's Sabots"
	}

    sets.midcast['Elemental Magic'] = 
	{
		main	=	"Bunzi's Rod",
        sub		=	"Ammurapi Shield",
		ammo	=	"Pemphredo Tathlum",
        head	=	gear.RDM_EMPY_Head,
        body	=	"Amalric Doublet +1",
        hands	=	"Amalric Gages +1",
        legs	=	"Amalric Slops +1",
        feet	=	"Amalric Nails +1",
        neck	=	"Sibyl Scarf",
        ear1	=	"Regal Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Metamorph Ring +1",
        ring2	=	"Freke Ring",
        back	=	gear.RDM_INT_Cape,
        waist	=	"Sacro Cord"
	}
		
    sets.midcast['Elemental Magic'].Resistant = 
	{
		main	=	"Bunzi's Rod",
        sub		=	"Ammurapi Shield",
		ammo	=	"Pemphredo Tathlum",
        head	=	gear.RDM_EMPY_Head,
        body	=	gear.RDM_EMPY_Body,
        hands	=	"Amalric Gages +1",
        legs	=	"Amalric Slops +1",
        feet	=	gear.RDM_EMPY_Feet,
        neck	=	"Duelist's torque +2",
        ear1	=	"Hermetic Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Metamorph Ring +1",
        ring2	=	"Freke Ring",
        back	=	gear.RDM_INT_Cape,
        waist	=	"Sacro Cord"
	}		
	
	sets.midcast.Impact = 
	{
		main	=	"Daybreak",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	empty,
		neck	=	"Duelist's torque +2",
		ear1	=	"Snotra Earring",
		ear2	=	"Malignance Earring",
		body	=	"Twilight Cloak",
		hands	=	gear.RDM_EMPY_Hands,
		ring1	=	"Metamor. Ring +1",
		ring2	=	"Stikini Ring +1",
		back	=	"Aurist's Cape +1",
		waist	=	"Acuity Belt +1",
        legs	=	gear.RDM_EMPY_Legs,
        feet	=	gear.RDM_EMPY_Feet,
	}

	sets.midcast['Dark Magic'] = 
	{
		main	=	"Rubicundity",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	"Amalric Coif +1",
		neck	=	"Erra Pendant",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
		body	=	gear.RDM_AF_Body,
		hands	=	"Jhakri Cuffs +2",
		ring1	=	"Metamor. Ring +1",
		ring2	=	"Stikini Ring +1",
		back	=	gear.RDM_INT_Cape,
		waist	=	"Luminary Sash",
		legs	=	"Psycloth Lappas",
        feet	=	gear.Jhakri_Feet
	}

    sets.midcast.Drain = 
	{
		main	=	"Rubicundity",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
        head	=	"Pixie Hairpin +1",
		neck	=	"Erra Pendant",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
        body	=	"Psycloth Vest",
		hands	=	"Helios Gloves",
		ring1	=	"Evanescence Ring",
		ring2	=	"Archon Ring",
        back	=	gear.RDM_INT_Cape,
		waist	=	"Fucho-no-obi",
		legs	=	"Chironic Hose",
        feet	=	"Merlinic Crackows"
	}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = 
	{
		main	=	"Daybreak",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	gear.RDM_AF_Head,
		neck	=	"Duelist's torque +2",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
		body	=	gear.RDM_AF_Body,
		hands	=	gear.RDM_EMPY_Hands,
		ring1	=	"Metamor. Ring +1",
		ring2	=	"Stikini Ring +1",
		back	=	"Aurist's Cape +1",
		waist	=	"Luminary Sash",
		legs	=	gear.RDM_EMPY_Legs,
		feet	=	gear.RDM_EMPY_Feet
	}
	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = 
	{
		hands	=	gear.RDM_EMPY_Hands}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = 
	{
		main	=	"Chatoyant Staff",sub	=	"Enki Strap",range=empty,ammo	=	"Impatiens",
		head	=	gear.RDM_RELIC_Head,neck	=	"Loricate Torque +1",ear1	=	"Etiolation Earring",ear2	=	"Loquacious Earring",
		body	=	"Jhakri Robe +2",hands	=	gear.Chiro_refresh_hands,ring1	=	"Defending Ring",ring2	=	"Sheltered Ring",
		back	=	gear.RDM_IDLE_Cape,waist	=	"Slipor Sash",legs	=	"Lengo Pants",feet	=	gear.chironic_refresh_feet}
	

	-- Idle sets
	sets.idle = 
	{
        main="Sakpata's Sword",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1",
		head=gear.RDM_RELIC_Head,
		body=gear.RDM_EMPY_Body,
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Volte Gaiters",
        neck="Warder's Charm +1",
        ear1="Hearty Earring",
        ear2="Etiolation Earring",
        ring1="Stikini Ring +1",
        ring2="Defending Ring",
        back=gear.RDM_IDLE_Cape,
        waist="Slipor Sash"
	}
	
		sets.idle.FullRefresh = 
	{
        main="Sakpata's Sword",
        sub="Genmei Shield",
        ammo="Homiliary",
		head=gear.RDM_RELIC_Head,
		body=gear.RDM_EMPY_Body,
		hands="Chironic Gloves",
		legs="Assiduity pants +1 ",
		feet=gear.Chiro_refresh_feet,
        neck="Sibyl Scarf",
        ear1="Hearty Earring",
        ear2="Etiolation Earring",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        back=gear.RDM_IDLE_Cape,
        waist="Slipor Sash"
	}
		
	sets.idle.DT = 
	{
        main="Sakpata's Sword",
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body=gear.RDM_EMPY_Body,
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        ear1="Hearty Earring",
        ear2="Etiolation Earring",
        ring1="Purity Ring",
        ring2="Defending Ring",
        back=gear.RDM_IDLE_Cape,
        waist="Slipor Sash"
	 }
	
	sets.idle.DT = set_combine(sets.idle.PDT, {back	=	gear.RDM_IDLE_Cape,legs	=	"Carmine Cuisses +1"})
	
	-- Defense sets

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.Kiting = { legs	=	"Carmine Cuisses +1"}
	
	sets.latent_refresh = 
	{
		waist	=	"Fucho-no-obi"}

	sets.DayIdle = 
	{
		}
	sets.NightIdle = 
	{
		}
		
	-- Weapons sets
	sets.weapons.Vitiation = {main	=	"Crocea Mors",sub	=	"Ammurapi Shield",range = empty}
	sets.weapons.DualVitiation = {main	=	"Crocea Mors",sub	=	"Gleti's Knife",range = empty}
	sets.weapons.DualVitiSeraph = {main	=	"Crocea Mors",sub	=	"Daybreak",range = empty}
	sets.weapons.DualVitiClub = {main	=	"Crocea Mors",sub	=	"Bunzi's Rod",range = empty}
	sets.weapons.Naegling=  {main	=	"Naegling",sub	=	"Genmei Shield",range = empty}
	sets.weapons.Tauret=  {main	=	"Tauret",sub	=	"Ammurapi Shield",range = empty}
	sets.weapons.DualWeapons = {main	=	"Naegling",sub	=	"Gleti's Knife",range = empty}
	sets.weapons.DualTPBonus = {main	=	"Naegling",sub	=	"Machaera +2",range = empty}
	sets.weapons.DualEvisceration = {main	=	"Tauret",sub	=	"Gleti's Knife",range = empty}
	sets.weapons.DualAeolian = {main	=	"Tauret",sub	=	"Crocea Mors",range = empty}
	sets.weapons.EnspellOnly=  {main	=	"Qutrub Knife",sub	=	"Norgish Dagger",range	=	"Ullr",ammo	=	"Demon Arrow"}
	sets.weapons.DualClubs=  {main	=	"Maxentius",sub	=	"Daybreak",range = empty}
	sets.weapons.HtwoH=	{main=	"Karambit",sub = empty,range = empty}
	
    sets.buff.Sublimation = {waist	=	"Embla Sash"}
    sets.buff.DTSublimation = {waist	=	"Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = 
	{
        ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Anu Torque",
        ear1="Dedition Earring",
		ear2="Sherida Earring",
        ring1="Chirich Ring +1",
        ring2="Petrov Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
	}
		
	sets.engaged.EnspellOnly = 
	{		 
		ammo="Sroda Tathlum", 
		head="Malignance Chapeau", 
        body="Malignance Tabard",  
		hands=gear.Ayanmo_Hands, 
        legs="Carmine Cuisses +1", 
		feet=gear.Chiro_Quad_feet,
		ear1="Hollow Earring",
		ear2="Suppanomimi",
		ring1="Chirich Ring +1",
        ring2="Petrov Ring", 
        neck="Sanctity Necklace",  
		back=gear.RDM_TP_Cape,
        waist="Orpheus's Sash",	
	}

	sets.engaged.Acc = 
	{		
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Lissome Necklace",
        ear1="Dedition Earring",
		ear2="Sherida Earring",
        ring1="Chirich Ring +1",
        ring2="Ilabrat Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
	}	
	
	sets.engaged.Htwo = {
	    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Malignance Tabard",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet="Aya. Gambieras +2",
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Hetairoi Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10',}},
	}
		
	sets.engaged.DT = 
	{
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Lissome Necklace",
        ear1="Dedition Earring",
		ear2="Sherida Earring",
        ring1="Chirich Ring +1",
        ring2="Petrov Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
	}
		
	sets.engaged.Acc.DT = 
	{
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Lissome Necklace",
        ear1="Dedition Earring",
		ear2="Sherida Earring",
        ring1="Chirich Ring +1",
        ring2="Petrov Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
	}
		
	sets.engaged.DW = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Anu Torque",
		ear2="Sherida Earring",
        ear1="Suppanomimi",
        ring1="Ilabrat Ring",
        ring2="Chirich Ring +1",
        back=gear.RDM_TP_Cape,
        waist="Reiki Yotai",
    } --41

    sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {
     --   neck="Combatant's Torque",
     --   ring2="Ilabrat Ring",
        })
		
    -- 15% Magic Haste (67% DW to cap)
    sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {
        }) --41

    sets.engaged.DW.Acc.LowHaste = set_combine(sets.engaged.DW.LowHaste,sets.engaged.DW.MidAcc)

    -- 30% Magic Haste (56% DW to cap)
    sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {

		}) -- /42

    sets.engaged.DW.Acc.MidHaste = set_combine(sets.engaged.DW.MidHaste,sets.engaged.DW.MidAcc)


    -- 35% Magic Haste (51% DW to cap)
    sets.engaged.DW.HighHaste = set_combine(sets.engaged.DW, {

        }) --29/31

    sets.engaged.DW.Acc.HighHaste = set_combine(sets.engaged.DW.HighHaste,sets.engaged.DW.MidAcc)


    -- 45% Magic Haste (36% DW to cap)
    sets.engaged.DW.MaxHaste = set_combine(sets.engaged.DW, {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Anu Torque",
		ear2="Sherida Earring",
        ear1="Suppanomimi",
        ring1="Ilabrat Ring",
        ring2="Chirich Ring +1",
        back=gear.RDM_TP_Cape,
        waist="Reiki Yotai",
		}) --11/11

    sets.engaged.DW.Acc.MaxHaste = set_combine(sets.engaged.DW.MaxHaste,sets.engaged.DW.MidAcc)

			-----------------------		
    sets.engaged.DW.DT =  set_combine(sets.engaged.DW, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})      
    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})
	
	sets.engaged.DW.DT.LowHaste =  set_combine(sets.engaged.DW.LowHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})      
    sets.engaged.DW.Acc.DT.LowHaste = set_combine(sets.engaged.DW.Acc.LowHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})
	
	sets.engaged.DW.DT.MidHaste =  set_combine(sets.engaged.DW.MidHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})      
    sets.engaged.DW.Acc.DT.MidHaste = set_combine(sets.engaged.DW.Acc.MidHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})
	
	sets.engaged.DW.DT.HighHaste =  set_combine(sets.engaged.DW.HighHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})      
    sets.engaged.DW.Acc.DT.HighHaste = set_combine(sets.engaged.DW.Acc.HighHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})
	
	sets.engaged.DW.DT.MaxHaste =  set_combine(sets.engaged.DW.MaxHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})      
    sets.engaged.DW.Acc.DT.MaxHaste = set_combine(sets.engaged.DW.Acc.MaxHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	set_macro_page(1, 1)
end


function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()

end