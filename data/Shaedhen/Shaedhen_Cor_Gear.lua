-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.Weapons:options('Default','DualWeapons','DualSavageWeapons','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','None')
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Chrono Bullet"
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
	
	----COR----
	--Laksamana
	gear.COR_AF_Head		=	{ name="Laksamana's Hat +2"}
    gear.COR_AF_Body		=	{ name="Laksamana's Frac +2"}
    gear.COR_AF_Hands		=	{ name="Laksamana's Gants +2"}
    gear.COR_AF_Legs		=	{ name="Laksamana's Trews +2"}
    gear.COR_AF_Feet		=	{ name="Laksamana's Bottes +2"}
    --Lanun
    gear.COR_RELIC_Head		=	{ name="Lanun Tricorne +3"}
    gear.COR_RELIC_Body		=	{ name="Lanun Frac +3"}
    gear.COR_RELIC_Hands 	=	{ name="Lanun Gants +2"}
    gear.COR_RELIC_Legs		=	{ name="Lanun Trews +3"}
    gear.COR_RELIC_Feet		=	{ name="Lanun Bottes +2"}
    --Chasseur
    gear.COR_EMPY_Head		=	{ name="Chasseur's Tricorne +1"}
    gear.COR_EMPY_Body		=	{ name="Chasseur's Frac +1"}
    gear.COR_EMPY_Hands		=	{ name="Chasseur's Gants +1"}
    gear.COR_EMPY_Legs		=	{ name="Chasseur's Culottes +1"}
    gear.COR_EMPY_Feet		=	{ name="Chasseur's Bottes +1"}	
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
	sets.weapons.DualWeapons 		=	{main="Naegling"	,sub="Blurred Knife +1"	,range="Fomalhaut"}
	sets.weapons.DualSavageWeapons 	= 	{main="Naegling"	,sub="Blurred Knife +1"	,range="Anarchy +2"}
	sets.weapons.DualLeadenRanged	= 	{main="Tauret"		,sub="Kustawi +1"		,range="Fomalhaut"}
	sets.weapons.DualLeadenMelee 	= 	{main="Naegling"	,sub="Tauret"			,range="Fomalhaut"}
	sets.weapons.DualAeolian 		= 	{main="Tauret"		,sub="Blurred Knife +1"	,range="Anarchy +2"}
	sets.weapons.DualLeadenMeleeAcc = 	{main="Naegling"	,sub="Blurred Knife +1"	,range="Fomalhaut"}
	sets.weapons.DualRanged 		= 	{main="Kustawi +1"	,sub="Fettering Blade"	,range="Fomalhaut"}
    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] 	= 	{body	=	gear.COR_EMPY_Body}
    sets.precast.JA['Snake Eye'] 	=	{legs	=	gear.COR_RELIC_Legs}
    sets.precast.JA['Wild Card'] 	= 	{feet	=	gear.COR_RELIC_Feet}
    sets.precast.JA['Random Deal'] 	= 	{body	=	gear.COR_RELIC_Body}
    sets.precast.FoldDoubleBust 	= 	{hands	=	gear.COR_RELIC_Hands}

    sets.precast.CorsairRoll = 
	{
		range	=	"Compensator",
        head	=	gear.COR_RELIC_Head,
		neck	=	"Regal Necklace",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	gear.COR_EMPY_Hands,
		ring1	=	"Defending Ring",
	--	ring2	=	"Gelatinous Ring",
    --    back	=	gear.COR_TP_STP_Cape,
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
		ear1	=	"Dedition Earring",
		ear2	=	"Telos Earring",
        body	=	"Malignance Tabard",
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Petrov Ring",
        back	=	gear.COR_TP_STP_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	gear.Herc_Mab_legs,
		feet	=	"Carmine Greaves +1"
	}
		
	sets.precast.CorsairShot.Damage = 
	{
		ammo	=	gear.QDbullet,
        head	=	gear.COR_AF_Head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Friomisi Earring",
		ear2	=	"Dignitary's Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Shiva Ring +1",
		ring2	=	"Dingir Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Eschan Stone",
		legs	=	gear.Herc_Mab_legs,
		feet	=	gear.COR_AF_Feet,
	}	

    sets.precast.CorsairShot['Light Shot'] = 
	{
		ammo	=	gear.QDbullet,
        head	=	gear.COR_AF_Head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Gwati Earring",
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
		head	=	gear.Taeon_Phalanx_head, 
		body	=	gear.Taeon_Phalanx_body, 
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
--      body	=	"Dread Jupon",
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
        body	=	gear.COR_AF_Body,
		hands	=	"Carmine Fin. Ga. +1",
--      back	=	gear.snapshot_jse_back,
		waist	=	"Yemaya Belt",
		legs	=	gear.COR_AF_Legs,
		feet	=	"Meg. Jam. +2"
	}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = 
	{
        head	=	"Meghanada Visor +2",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	gear.COR_AF_Body,
		hands	=	"Meg. Gloves +2",
		ring1	=	"Karieyh Ring",
		ring2	=	"Ilabrat Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Meg. Chausses +2",
		feet	=	gear.COR_RELIC_Feet
	}
		
    sets.precast.WS.Acc = 
	{
        head	=	"Carmine Mask +1",
		neck	=	"Sanctity Necklace",
		ear1	=	"Digni. Earring",
		ear2	=	"Telos Earring",
        body	=	"Meg. Cuirie +2",
		hands	=	"Meg. Gloves +2",
		ring1	=	"Chirich Ring",
		ring2	=	"Ilabrat Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Grunfeld Rope",
		legs	=	"Carmine Cuisses +1",
		feet	=	gear.COR_RELIC_Feet
	}				
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
	{
		head	=	"Carmine Mask +1",
		ring2	=	"Rufescent Ring",
		legs	=	"Carmine Cuisses +1",
		feet	=	"Carmine Greaves +1"
	})

	sets.precast.WS['Savage Blade'] = 
	{
		ammo	=	gear.WSbullet,
        head	=	gear.Herc_WSD_head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	gear.COR_AF_Body,
		hands	=	"Meg. Gloves +2",
		ring1	=	"Rufescent Ring",
		ring2	=	"Karieyh Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	gear.Herc_WS_legs,
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Savage Blade'].Acc = 
	{
		ammo	=	gear.WSbullet,
        head	=	gear.Herc_WSD_head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Telos Earring",
        body	=	"Meg. Cuirie +2",
		hands	=	"Meg. Gloves +2",
		ring1	=	"Rufescent Ring",
		ring2	=	"Karieyh Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Grunfeld Rope",
		legs	=	gear.Herc_WS_legs,
		feet	=	gear.COR_RELIC_Feet
	}
	sets.precast.WS['Evisceration'] = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Adhemar Bonnet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Odr Earring",
        body	=	"Mummu Jacket +2",
		hands	=	"Mummu Wrists +2",
		ring1	=	"Mummu Ring",
		ring2	=	"Begrudging Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Mummu Kecks +2",
		feet	=	"Mummu Gamashes +2"
	}

    sets.precast.WS['Evisceration'].Acc = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Adhemar Bonnet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Odr Earring",
        body	=	"Mummu Jacket +2",
		hands	=	"Mummu Wrists +2",
		ring1	=	"Mummu Ring",
		ring2	=	"Begrudging Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Mummu Kecks +2",
		feet	=	"Mummu Gamashes +2"
	}	
    sets.precast.WS['Last Stand'] = 
	{
		ammo	=	gear.WSbullet,
        head	=	gear.COR_RELIC_Head,
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	gear.COR_AF_Body,
		hands	=	"Meg. Gloves +2",
		ring1	=	"Dingir Ring",
		ring2	=	"Karieyh Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Fotia Belt",
		legs	=	"Meg. Chausses +2",
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Last Stand'].Acc = 
	{
		ammo	=	gear.WSbullet,
        head	=	gear.COR_RELIC_Head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Telos Earring",
        body	=	gear.COR_AF_Body,
		hands	=	"Meg. Gloves +2",
		ring1	=	"Dingir Ring",
		ring2	=	"Paqichikaji Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Yemaya Belt",
		legs	=	"Meg. Chausses +2",
		feet	=	gear.COR_RELIC_Feet
	}
		
    sets.precast.WS['Detonator']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc	=	sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc	=	sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc	=	sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc	=	sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot']		=	sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc	=	sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = 
	{
		ammo	=	gear.MAbullet,
        head	=	"Pixie Hairpin +1",
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
        body	=	gear.COR_RELIC_Body,
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Dingir Ring",
		ring2	=	"Archon Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Svelt. Gouriz +1 ",
		legs	=	gear.Herc_Mab_legs,
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Aeolian Edge'] = 
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
		waist	=	"Eschan Stone",
		legs	=	gear.Herc_Mab_legs,
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Wildfire'] = 
	{
		ammo	=	gear.MAbullet,
        head	=	gear.COR_AF_Head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Hermetic Earring",
		ear2	=	"Friomisi Earring",
        body	=	gear.COR_AF_Body,
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Dingir Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Eschan Stone",
		legs	=	gear.Herc_Mab_legs,
		feet	=	gear.COR_RELIC_Feet
	}

    sets.precast.WS['Wildfire'].Acc = 
	{
		ammo	=	gear.MAbullet,
        head	=	gear.COR_AF_Head,
		neck	=	"Commodore Charm +1",
		ear1	=	"Hermetic Earring",
		ear2	=	"Friomisi Earring",
        body	=	gear.COR_AF_Body,
		hands	=	"Carmine Fin. Ga. +1",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Dingir Ring",
        back	=	gear.COR_WS3_Cape,
		waist	=	"Eschan Stone",
		legs	=	gear.Herc_Mab_legs,
		feet	=	gear.COR_RELIC_Feet
	}
		
    sets.precast.WS['Hot Shot'] 	= sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
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
		waist	=	"Eschan Stone",
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
        head	=	"Malignance Chapeau",
		neck	=	"Iskur Gorget",
		ear1	=	"Enervating Earring",
		ear2	=	"Telos Earring",
        body	=	"Malignance Tabard",
		hands	=	"Meg. Gloves +2",
		ring1	=	"Dingir Ring",
		ring2	=	"Ilabrat Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Yemaya Belt",
		legs	=	"Malignance Tights",
		feet	=	"Meg. Jam. +2"
	}

    sets.midcast.RA.Acc = 
	{
		ammo	=	gear.RAbullet,
        head	=	"Malignance Chapeau",
		neck	=	"Iskur Gorget",
		ear1	=	"Enervating Earring",
		ear2	=	"Telos Earring",
        body	=	"Malignance Tabard",
		hands	=	"Meg. Gloves +2",
		ring1	=	"Dingir Ring",
		ring2	=	"Paqichikaji Ring",
        back	=	gear.COR_WS1_Cape,
		waist	=	"Yemaya Belt",
		legs	=	"Malignance Tights",
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
		hands	=	gear.Meghanada_Hands,
		ring1	=	"Defending Ring",
		ring2	=	"Meghanada Ring",
        back	=	"Moonbeam Cape",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		feet	=	gear.Meghanada_Feet
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
    
    -- Defense sets
    sets.defense.PDT = 
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

    sets.defense.MDT = 
	{
		ammo	=	gear.RAbullet,
        head	=	"Malignance Chapeau",
		neck	=	"Warder's Charm +1",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	"Malignance Tabard",
		hands	=	gear.Mummu_Hands,
		ring1	=	"Defending Ring",
		ring2	=	"Purity Ring",
        back	=	"Moonbeam Cape",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		feet	=	gear.Mummu_Feet
	}
		
    sets.defense.MEVA = 
	{
		ammo	=	gear.RAbullet,
        head	=	"Malignance Chapeau",
		neck	=	"Warder's Charm +1",
		ear1	=	"Hearty Earring",
		ear2	=	"Eabani Earring",
        body	=	"Malignance Tabard",
		hands	=	gear.Mummu_Hands,
		ring1	=	"Defending Ring",
		ring2	=	"Purity Ring",
        back	=	"Solemnity Cape",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		feet	=	gear.Mummu_Feet
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
    
    sets.engaged.Acc = {
		head	=	"Malignance Chapeau",
		neck	=	"Lissome Necklace",
		ear1	=	"Odr Earring",
		ear2	=	"Telos Earring",
		body	=	"Malignance Tabard",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	"Malignance Tights",
		feet	=	gear.Herc_trip_feet
	}
		
    sets.engaged.DT = set_combine(sets.engaged, sets.DefensiveMali)  
	sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.DefensiveMali)
	
    sets.engaged.DW = 
	{							--	48 needed
		head	=	"Adhemar Bonnet +1",
		neck	=	"Iskur Gorget",
		ear1	=	"Suppanomimi",				--	5
		ear2	=	"Eabani Earring",			--	4
		body	=	"Adhemar Jacket +1",		--	6
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Carmine Cuisses +1",		--	6
		feet	=	gear.herculean_ta_feet
	}
	-----Haste & Dual Wield-----
	sets.engaged.DW.LowHaste = 
	{				--	42 needed
		head	=	"Adhemar Bonnet +1",
		neck	=	"Iskur Gorget",
		ear1	=	"Suppanomimi",				--	5
		ear2	=	"Eabani Earring",			--	4
		body	=	"Adhemar Jacket +1",		--	6
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Carmine Cuisses +1",		--	6
		feet	=	gear.herculean_ta_feet
	}
	
	sets.engaged.DW.MidHaste = 
	{				--	31/31 needed
		head	=	"Adhemar Bonnet +1",
		neck	=	"Iskur Gorget",
		ear1	=	"Suppanomimi",				--	5
		ear2	=	"Eabani Earring",			--	4
		body	=	"Adhemar Jacket +1",		--	6
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Carmine Cuisses +1",		--	6
		feet	=	gear.herculean_ta_feet
	}
		
	sets.engaged.DW.HighHaste = 
	{				--	17/27 needed
		head	=	"Adhemar Bonnet +1",
		neck	=	"Iskur Gorget",
		ear1	=	"Suppanomimi",				--	5
		ear2	=	"Telos Earring",
		body	=	"Adhemar Jacket +1",		--	6
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Carmine Cuisses +1",		--	6
		feet	=	gear.herculean_ta_feet
	}    
	
	sets.engaged.DW.MaxHaste = 
	{				-- 11/11 needed
		head	=	"Adhemar Bonnet +1",
		neck	=	"Iskur Gorget",
		ear1	=	"Suppanomimi",				--	5
		ear2	=	"Telos Earring",
		body	=	"Adhemar Jacket +1",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Samnuha Tights",		--	6
		feet	=	gear.Herc_trip_feet
	}    
	-----------------------
    sets.engaged.DW.Acc = 
	{
		head	=	"Malignance Chapeau",
		neck	=	"Lissome Necklace",
		ear1	=	"Suppanomimi",				--	5
		ear2	=	"Telos Earring",
		body	=	"Adhemar Jacket +1",		--	6
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring",
		ring2	=	"Petrov Ring",
		back	=	gear.COR_TP_STP_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	"Carmine Cuisses +1",		--	6
		feet	=	"Carmine Greaves +1"
	}
	-----------------------
    sets.engaged.DW.Acc = 
	set_combine(sets.engaged.DW, 
		{
			head	=	"Malignance Chapeau",
			neck	=	"Lissome Necklace",		
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring",
			waist	=	"Kentarch Belt +1",
			legs	=	"Carmine Cuisses +1",	
			feet	=	"Carmine Greaves +1"
		}
	)
	-----Haste & Dual Wield-----
	sets.engaged.DW.Acc.LowHaste = 
	set_combine(sets.engaged.DW.LowHaste, 
		{
			head	=	"Malignance Chapeau",
			neck	=	"Lissome Necklace",		
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring",
			waist	=	"Kentarch Belt +1",
			legs	=	"Carmine Cuisses +1",	
			feet	=	"Carmine Greaves +1"
		}
	)
	
	sets.engaged.DW.Acc.MidHaste = 
	set_combine(sets.engaged.DW.MidHaste, 
		{
			head	=	"Malignance Chapeau",
			neck	=	"Lissome Necklace",		
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring",
			waist	=	"Kentarch Belt +1",
			legs	=	"Carmine Cuisses +1",	
			feet	=	"Carmine Greaves +1"
		}
	)
	
	sets.engaged.DW.Acc.HighHaste = 
	set_combine(sets.engaged.DW.HighHaste, 
		{
			head	=	"Malignance Chapeau",
			neck	=	"Lissome Necklace",		
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring",
			waist	=	"Kentarch Belt +1",
			legs	=	"Carmine Cuisses +1",	
			feet	=	"Carmine Greaves +1"	
		}
	)   
	
	sets.engaged.DW.Acc.MaxHaste = 
	set_combine(sets.engaged.DW.MaxHaste, 
		{
			head	=	"Malignance Chapeau",
			neck	=	"Lissome Necklace",		
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring",
			waist	=	"Kentarch Belt +1",
			legs	=	"Carmine Cuisses +1",	
			feet	=	"Carmine Greaves +1"	
		}
	)  
	-----------------------		
    sets.engaged.DW.DT =  set_combine(sets.engaged.DW, sets.DefensiveMali)      
    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.DefensiveMali)
	
	sets.engaged.DW.DT.LowHaste =  set_combine(sets.engaged.DW.LowHaste, sets.DefensiveMali)      
    sets.engaged.DW.Acc.DT.LowHaste = set_combine(sets.engaged.DW.Acc.LowHaste, sets.DefensiveMali)
	
	sets.engaged.DW.DT.MidHaste =  set_combine(sets.engaged.DW.MidHaste, sets.DefensiveMali)      
    sets.engaged.DW.Acc.DT.MidHaste = set_combine(sets.engaged.DW.Acc.MidHaste, sets.DefensiveMali)
	
	sets.engaged.DW.DT.HighHaste =  set_combine(sets.engaged.DW.HighHaste, sets.DefensiveMali)      
    sets.engaged.DW.Acc.DT.HighHaste = set_combine(sets.engaged.DW.Acc.HighHaste, sets.DefensiveMali)
	
	sets.engaged.DW.DT.MaxHaste =  set_combine(sets.engaged.DW.MaxHaste, sets.DefensiveMali)      
    sets.engaged.DW.Acc.DT.MaxHaste = set_combine(sets.engaged.DW.Acc.MaxHaste, sets.DefensiveMali)
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end

function user_job_lockstyle()

end