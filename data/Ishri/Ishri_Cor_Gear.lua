-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	include('Ishri-Items.lua')

    state.OffenseMode:options('Normal')
    state.RangedMode:options('Normal')
    state.WeaponskillMode:options('Normal')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal', 'DT')
	state.HybridMode:options('Normal','DT')
	state.Weapons:options('Default','None')
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
    gear.COR_RELIC_Head		=	{ name="Lanun Tricorne"}
    gear.COR_RELIC_Body		=	{ name="Lanun Frac"}
    gear.COR_RELIC_Hands 	=	{ name="Lanun Gants"}
    gear.COR_RELIC_Legs		=	{ name="Lanun Trews"}
    gear.COR_RELIC_Feet		=	{ name="Lanun Bottes"}
    --Chasseur
    gear.COR_EMPY_Head		=	{ name="Chasseur's Tricorne +1"}
    gear.COR_EMPY_Body		=	{ name="Chasseur's Frac +1"}
    gear.COR_EMPY_Hands		=	{ name="Chasseur's Gants"}
    gear.COR_EMPY_Legs		=	{ name="Chasseur's Culottes +1"}
    gear.COR_EMPY_Feet		=	{ name="Chasseur's Bottes +1"}	
	-------------
	----Capes----
    gear.COR_WS1_Cape		=	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}} --*
	gear.COR_WS2_Cape		=	{name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+3','Weapon skill damage +10%',}} --*
	gear.COR_WS3_Cape		=	{name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}
	gear.COR_TP_STP_Cape	=	{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}} --*
	-------------

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	-- Weapons sets
	sets.weapons.Default 			=	{main="Naegling"	,sub="Nusku Shield"		,range="Compensator"}
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
		hands	=	gear.COR_EMPY_Hands,
        body	=	gear.COR_RELIC_Body,
		back	=	"Camulus's Mantle",
		waist	=	"Carrier's Sash",
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
	}
		
	sets.precast.CorsairShot.Damage = 
	{
	}	

    sets.precast.CorsairShot['Light Shot'] = 
	{
	}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet	=	gear.COR_EMPY_Feet})

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
        head	=	gear.COR_RELIC_Head,
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

	sets.precast.WS['Savage Blade'] = 
	{
		ammo	=	gear.WSbullet,
        head	=	"Nyame Helm",
		neck	=	"Commodore Charm +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Ishvara Earring",
        body	=	"Nyame Mail",
		--body = "Ikenga's Vest",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Rufescent Ring",
		ring2	=	"Karieyh Ring",
        back	=	gear.COR_WS2_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
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
	}

    sets.midcast.RA.Acc = 
	{
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
        head	=	"Nyame Helm",
		neck	=	"Warder's Charm",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Defending Ring",
		ring2	=	"Meghanada Ring",
        back	=	"Camulus's Mantle",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		feet	=	"Nyame Sollerets",			
	}
		
    sets.idle.DT = 
	{
        head	=	"Nyame Helm",
		neck	=	"Warder's Charm",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Defending Ring",
		ring2	=	"Meghanada Ring",
        back	=	"Camulus's Mantle",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		feet	=	"Nyame Sollerets",		
	}
		
    sets.idle.Refresh = 
	{
        head	=	"Nyame Helm",
		neck	=	"Warder's Charm",
		ear1	=	"Etiolation Earring",
		ear2	=	"Eabani Earring",
        body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Defending Ring",
		ring2	=	"Meghanada Ring",
        back	=	"Camulus's Mantle",
		waist	=	"Carrier's Sash",
		legs	=	"Carmine Cuisses +1",
		feet	=	"Nyame Sollerets",		
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
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end

function user_job_lockstyle()

end