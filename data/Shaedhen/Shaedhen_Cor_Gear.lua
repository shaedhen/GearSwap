-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	include('Shaedhen-Items.lua')

    state.OffenseMode:options('Normal')
    state.RangedMode:options('Normal')
    state.WeaponskillMode:options('Normal', 'Capped')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.Weapons:options('Default','DualWeapons','DualSavageWeapons','DualSavageWeapons2','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','SingleRanged','SingleSavage','None')
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Chrono Bullet"
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
	
	----COR----
	--Laksamana
	gear.COR_AF_Head		=	{ name="Laksamana's Tricorne +2"}
    gear.COR_AF_Body		=	{ name="Laksamana's Frac +2"}
    gear.COR_AF_Hands		=	{ name="Laksamana's Gants +2"}
    gear.COR_AF_Legs		=	{ name="Laksamana's Trews +2"}
    gear.COR_AF_Feet		=	{ name="Laksamana's Bottes +2"}
    --Lanun
    gear.COR_RELIC_Head		=	{ name="Lanun Tricorne +3"}
    gear.COR_RELIC_Body		=	{ name="Lanun Frac +3"}
    gear.COR_RELIC_Hands 	=	{ name="Lanun Gants +2"}
    gear.COR_RELIC_Legs		=	{ name="Lanun Trews +3"}
    gear.COR_RELIC_Feet		=	{ name="Lanun Bottes +3"}
    --Chasseur
    gear.COR_EMPY_Head		=	{ name="Chasseur's Tricorne +2"}
    gear.COR_EMPY_Body		=	{ name="Chasseur's Frac +2"}
    gear.COR_EMPY_Hands		=	{ name="Chasseur's Gants +3"}
    gear.COR_EMPY_Legs		=	{ name="Chasseur's Culottes +2"}
    gear.COR_EMPY_Feet		=	{ name="Chasseur's Bottes +2"}	
	-------------
	----Capes----
    gear.COR_WS1_Cape		=	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}} --*
	gear.COR_WS2_Cape		=	{name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+3','Weapon skill damage +10%',}} --*
	gear.COR_WS3_Cape		=	{name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}
	gear.COR_TP_STP_Cape	=	{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}} --*
	-------------
	
    -- Additional local binds
--	send_command('bind ^` gs c cycle ElementalMode')
--	send_command('bind !` gs c elemental quickdraw')
	
--	send_command('bind ^backspace input /ja "Double-up" <me>')
--	send_command('bind @backspace input /ja "Snake Eye" <me>')
--	send_command('bind !backspace input /ja "Fold" <me>')
--	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
--	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
--    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
--	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

--	send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
--	send_command('bind ^q gs c weapons DualAeolian;gs c update')
--	send_command('bind @q gs c weapons DualKustawi;gs c update')
--	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
--	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	-- Weapons sets
	sets.weapons.Default 			=	{main="Naegling"	,sub="Nusku Shield"		,range="Fomalhaut"}
	sets.weapons.DualWeapons 		=	{main="Naegling"	,sub="Gleti's Knife"	,range="Fomalhaut"}
	sets.weapons.DualSavageWeapons 	= 	{main="Naegling"	,sub="Gleti's Knife"	,range="Anarchy +2"}
	sets.weapons.DualSavageWeapons2 	= 	{main="Naegling"	,sub="Lanun Knife"	,range="Anarchy +2"}
	sets.weapons.DualLeadenRanged	= 	{main="Tauret"		,sub="Kustawi +1"		,range="Fomalhaut"}
	sets.weapons.DualLeadenMelee 	= 	{main="Naegling"	,sub="Tauret"			,range="Fomalhaut"}
	sets.weapons.DualLeadenMeleeAcc = 	{main="Tauret"	,sub="Naegling"	,range="Fomalhaut"}
	sets.weapons.DualRanged 		= 	{main="Rostam"	,sub="Lanun Knife"	,range="Fomalhaut"}
	sets.weapons.SingleRanged		=	{main="Kustawi +1", sub="Nusku Shield"	, range="Fomalhaut"}
	sets.weapons.SingleSavage 	= 	{main="Naegling"	,sub="Nusku Shield"	,range="Anarchy +2"}
	sets.weapons.DualAeolian 		= 	{main="Tauret"		,sub="Naegling"	,range="Anarchy +2"}
    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] 	= 	{body	=	gear.COR_EMPY_Body}
    sets.precast.JA['Snake Eye'] 	=	{legs	=	gear.COR_RELIC_Legs}
    sets.precast.JA['Wild Card'] 	= 	{feet	=	gear.COR_RELIC_Feet}
    sets.precast.JA['Random Deal'] 	= 	{body	=	gear.COR_RELIC_Body}
    sets.precast.FoldDoubleBust 	= 	{hands	=	gear.COR_RELIC_Hands}

    sets.precast.CorsairRoll = 
	{
		main 	=	"Rostam",
		range	=	"Compensator",
        head	=	gear.COR_RELIC_Head,
		neck	=	"Regal Necklace",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	gear.COR_EMPY_Hands,
		ring1	=	"Defending Ring",
	--	ring2	=	"Gelatinous Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Carrier's Sash",
	--	legs	=	"Desultor Tassets",
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.LuzafRing	=	{ring2	=	"Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"]	=	set_combine(sets.precast.CorsairRoll, {legs		=	gear.COR_EMPY_Legs})
    sets.precast.CorsairRoll["Courser's Roll"]	=	set_combine(sets.precast.CorsairRoll, {feet		=	gear.COR_EMPY_Feet})
    sets.precast.CorsairRoll["Blitzer's Roll"]	=	set_combine(sets.precast.CorsairRoll, {head		=	gear.COR_EMPY_Head})
    sets.precast.CorsairRoll["Tactician's Roll"]=	set_combine(sets.precast.CorsairRoll, {body		=	gear.COR_EMPY_Body})
    sets.precast.CorsairRoll["Allies' Roll"]	=	set_combine(sets.precast.CorsairRoll, {hands	=	gear.COR_EMPY_Hands})
    
    sets.precast.CorsairShot = 
	{
		ammo	=	gear.QDbullet,
        head	=	"Malignance Chapeau",
		neck	=	"Iskur Gorget",
		ear1	=	"Crepuscular Earring",
		ear2	=	"Telos Earring",
        body	=	"Malignance Tabard",
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Petrov Ring",
        back	=	gear.COR_TP_STP_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	gear.COR_EMPY_Legs,
		feet	=	gear.COR_EMPY_Feet
	}
		
	sets.precast.CorsairShot.Damage = 
	{
		ammo	=	gear.QDbullet,
        head	=	"Ikenga's Hat",
		neck	=	"Commodore Charm +1",
		ear1	=	"Friomisi Earring",
		ear2	=	"Hermetic Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Shiva Ring +1",
		ring2	=	"Dingir Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Orpheus's Sash",
		legs	=	"Nyame Flanchard",
		feet	=	gear.COR_EMPY_Feet
	}	

    sets.precast.CorsairShot['Light Shot'] = 
	{
		ammo	=	gear.QDbullet,
        head	=	gear.COR_AF_Head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Crepuscular Earring",
		ear2	=	"Dignitary's Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	gear.COR_AF_Hands,
		ring1	=	"Stikini Ring",
		ring2	=	"Metamorph Ring +1",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Eschan Stone",
		legs	=	"Malignance Tights",
		feet	=	gear.COR_AF_Feet,
	}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet	=	gear.COR_EMPY_Feet})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = 
	{
		head	=	gear.Taeon_PhalWalz_head, 
		body	=	gear.Taeon_PhalWalz_body, 
        hands	=	gear.Taeon_PhalWalz_hands, 
        legs	=	"Dashing Subligar", 
        feet	=	gear.Taeon_PhalWalz_feet, 
		neck	=	"Phalaina Locket",
		ring1	=	"Asklepian Ring",
        waist	=	"Gishdubar Sash"
	}
		
	sets.Self_Waltz = 
	{
		head	=	"Mummu Bonnet +2",
		body	=	"Passion Jacket",
		ring1	=	"Asklepian Ring"
	}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = 
	{
        head	=	"Carmine Mask +1",
		neck	=	"Voltsurge Torque",
--		ear1	=	"Enchntr. Earring +1",
		ear2	=	"Loquac. Earring",
		body	=	"Dread Jupon",
		hands	=	"Leyline Gloves",
		ring1	=	"Kishar Ring",
		ring2	=	"Lebeche Ring",
        back	=	"Moonlight Cape",
--		waist	=	"Flume Belt +1",
		legs	=	"Rawhide Trousers",
		feet	=	"Carmine Greaves +1"
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, 
	{
		neck	=	"Magoraga Beads",
		body	=	"Passion Jacket"
	})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2	=	"Mendi. Earring"})

    sets.precast.RA = 
	{
		ammo	=	gear.RAbullet,
        head	=	gear.COR_EMPY_Head,
		neck	=	"Commodore Charm +1",		
        body	=	"Oshosi Vest",
		hands	=	gear.COR_RELIC_Hands,
--      back	=	gear.snapshot_jse_back,
		waist	=	"Yemaya Belt",
		legs	=	"Oshosi Trousers",
		feet	=	"Meg. Jam. +2"
	}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = 
	{
        head	=	gear.COR_RELIC_Head,
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	gear.COR_AF_Body,
		hands	=	"Meg. Gloves +2",
		ring1	=	"Epaminondas's Ring",
		ring2	=	"Ilabrat Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Meg. Chausses +2",
		feet	=	gear.COR_RELIC_Feet
	}			
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Savage Blade'] = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Nyame Helm",
		neck	=	"Rep. Plate Medal",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	"Nyame Mail",
		hands	=	gear.COR_EMPY_Hands,
		ring1	=	"Regal Ring",
		ring2	=	"Epaminondas's Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}

    sets.precast.WS['Savage Blade'].Capped = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Nyame Helm",
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
		body 	= 	"Ikenga's Vest",
		hands	=	gear.COR_EMPY_Hands,
		ring1	=	"Sroda Ring",
		ring2	=	"Epaminondas's Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	sets.precast.WS['Evisceration'] = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Blistering Sallet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Odr Earring",
        body	=	"Meg. Cuirie +2",
		hands	=	"Adhemar Wrist. +2",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Regal Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Zoar Subligar +1",
		feet	=	"Adhemar Gamashes +1"
	}
	
		sets.precast.WS['Evisceration'].Capped = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Blistering Sallet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Mache Earring +1",
		ear2	=	"Odr Earring",
        body	=	"Ikenga's Vest",
		hands	=	"Malignance Gloves",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Regal Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Zoar Subligar +1",
		feet	=	"Ikenga's Clogs"
	}

    sets.precast.WS['Last Stand'] = 
	{
		ammo	=	gear.WSbullet,
        head	=	gear.COR_RELIC_Head,
		neck	=	"Commodore Gorget +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	"Ikenga's Vest",
		hands	=	gear.COR_EMPY_Hands,
		ring1	=	"Regal Ring",
		ring2	=	"Dingir Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Nyame Flanchard",
		feet	=	gear.COR_RELIC_Feet
	}
	
	sets.precast.WS['Last Stand'].Capped = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Nyame Helm",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	"Ikenga's Vest",
		hands	=	gear.COR_EMPY_Hands,
		ring1	=	"Sroda Ring",
		ring2	=	"Epaminondas's Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Ikenga's Trousers",
		feet	=	"Nyame Sollerets"
	}
		
    sets.precast.WS['Detonator']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot']		=	sets.precast.WS['Last Stand']
	
    sets.precast.WS['Leaden Salute'] = 
	{
		ammo	=	gear.MAbullet,
        head	=	"Pixie Hairpin +1",
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	"Nyame Gauntlets",
		ring1	=	"Dingir Ring",
		ring2	=	"Archon Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Orpheus's Sash",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Aeolian Edge'] = 
	{
		ammo	=	gear.QDbullet,
		head={ name="Nyame Helm", augments={'Path: B',}},
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		ring1	=	"Dingir Ring",
		ring2	=	"Epaminondas's Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Orpheus's Sash",
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Wildfire'] = 
	{
		ammo	=	gear.MAbullet,
		head	=	{ name="Nyame Helm", augments={'Path: B',}},
		neck	=	"Commodore Charm +1",
		ear1	=	"Hermetic Earring",
		ear2	=	"Friomisi Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		ring1	=	"Epaminondas's Ring",
		ring2	=	"Dingir Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Orpheus's Sash",
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Hot Shot'] = 
	{
		ammo	=	gear.MAbullet,
		head={ name="Nyame Helm", augments={'Path: B',}},
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
        body	=	"Nyame Mail",
		hands	= 	gear.COR_EMPY_Hands,
		ring1	=	"Epaminondas's Ring",
		ring2	=	"Dingir Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Orpheus's Sash",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	gear.COR_RELIC_Feet
	}
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = 
	{
		ammo	=	gear.QDbullet,
        head	=	gear.COR_AF_Head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Dingir Ring",
		ring2	=	"Shiva Ring +1",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Orpheus's Sash",
		legs	=	gear.Herc_Mab_legs,
		feet	=	gear.COR_RELIC_Feet
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = 
	{
        head	=	"Carmine Mask +1",
		neck	=	"Voltsurge Torque",
--		ear1	=	"Enchntr. Earring +1",
		ear2	=	"Loquac. Earring",
--      body	=	"Dread Jupon",
		hands	=	"Leyline Gloves",
		ring1	=	"Kishar Ring",
		ring2	=	"Lebeche Ring",
        back	=	"Moonlight Cape",
--		waist	=	"Flume Belt +1",
		legs	=	"Rawhide Trousers",
		feet	=	"Carmine Greaves +1"
	}
        
    -- Specific spells

	sets.midcast.Cure = 
	{
        head	=	"Carmine Mask +1",
		neck	=	"Phalaina Locket",
		ear1	=	"Roundel Earring",
		ear2	=	"Mendi. Earring",
        body	=	"Dread Jupon",
		hands	=	"Leyline Gloves",
		ring1	=	"Ephedra Ring",
		ring2	=	"Lebeche Ring",
        back	=	"Solemnity Cape",
		waist	=	"Flume Belt +1",
		legs	=	"Carmine Cuisses +1",
		feet	=	"Carmine Greaves +1"
	}
	
	sets.Self_Healing = 
	{
		neck	=	"Phalaina Locket",
		hands	=	"Buremte Gloves",
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
	
	sets.Self_Refresh = {waist	=	"Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = 
	{
		ammo	=	gear.RAbullet,
        head	=	"Ikenga's Hat",
		neck	=	"Iskur Gorget",
		ear1	=	"Enervating Earring",
		ear2	=	"Telos Earring",
        body	=	"Ikenga's Vest",
		hands	=	"Meg. Gloves +2",
		ring1	=	"Dingir Ring",
		ring2	=	"Ilabrat Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Yemaya Belt",
		legs	=	"Ikenga's Trousers",
		feet	=	"Meg. Jam. +2"
	}
		
	sets.buff['Triple Shot'] = {body=gear.COR_EMPY_Body}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = 
	{
		ammo	=	gear.RAbullet,
        head	=	"Malignance Chapeau",
		neck	=	"Warder's Charm +1",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	"Malignance Tabard",
		ring1	=	"Defending Ring",
		ring2	=	"Meghanada Ring",
        back	=	"Moonbeam Cape",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
	}
		
    sets.idle.DT = 
	{
		ammo	=	gear.RAbullet,
        head	=	"Malignance Chapeau",
		neck	=	"Loricate Torque +1",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	"Malignance Tabard",
		hands	=	gear.Meghanada_Hands,
		ring1	=	"Defending Ring",
		ring2	=	"Meghanada Ring",
        back	=	"Moonbeam Cape",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		feet	=	gear.Meghanada_Feet
	}
		
    sets.idle.Refresh = 
	{
		ammo	=	gear.RAbullet,
        head	=	"Rawhide Mask",
		neck	=	"Warder's Charm +1",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	"Malignance Tabard",
		hands	=	gear.Meghanada_Hands,
		ring1	=	"Defending Ring",
		ring2	=	"Meghanada Ring",
        back	=	"Moonbeam Cape",
		waist	=	"Carrier's Sash",
		legs	=	"Rahwide Trousers",
		feet	=	gear.Meghanada_Feet
	}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = 
	{
		head	=	"Adhemar Bonnet +1",
		neck	=	"Iskur Gorget",
		ear1	=	"Brutal Earring",
		ear2	=	"Telos Earring",
		body	=	"Malignance Tabard",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	"Samnuha Tights",
		feet	=	gear.Herc_trip_feet
	}
		
    sets.engaged.DT = set_combine(sets.engaged, sets.DefensiveMali)  
	
	sets.engaged.DW = 
	{				-- 11/11 needed
		head	=	"Adhemar Bonnet +1",
		neck	=	"Iskur Gorget",
		ear1	=	"Eabani Earring",				--	5
		ear2	=	"Telos Earring",
		body	=	"Adhemar Jacket +1",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Samnuha Tights",		--	6
		feet	=	"Carmine Greaves +1"
	}    
	-----------------------
	-----------------------		
    sets.engaged.DW.DT =  set_combine(sets.engaged.DW, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	
		})      
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end

function user_job_lockstyle()

end