-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Normal','Acc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Aeneas','AeneasAcc','Tauret','TauretTaming','LowBuff','Shield','DualAE')

	----DNC	
	--Maxixi
	gear.DNC_AF_Head		=	{ name	=	"Maxixi Tiara +2"}
    gear.DNC_AF_Body		=	{ name	=	"Maxixi Casaque +2"}
    gear.DNC_AF_Hands		=	{ name	=	"Maxixi Bangles +3"}
    gear.DNC_AF_Legs		=	{ name	=	"Maxixi Tights +2"}
    gear.DNC_AF_Feet		=	{ name	=	"Maxixi Toe Shoes +2"}
    --Horos
    gear.DNC_RELIC_Head		=	{ name	=	"Horos Tiara +3"}
    gear.DNC_RELIC_Body		=	{ name	=	"Horos Casaque +3"}
    gear.DNC_RELIC_Hands 	=	{ name	=	"Horos Bangles +3"}
    gear.DNC_RELIC_Legs		=	{ name	=	"Horos Tights +3"}
    gear.DNC_RELIC_Feet		=	{ name	=	"Horos Toe Shoes +3"}
    --Maculele
    gear.DNC_EMPY_Head		=	{ name	=	"Maculele Tiara +3"}
    gear.DNC_EMPY_Body		=	{ name	=	"Maculele Casaque +1"}
    gear.DNC_EMPY_Hands		=	{ name	=	"Maculele Bangles +1"}
    gear.DNC_EMPY_Legs		=	{ name	=	"Maculele Tights +1"}
    gear.DNC_EMPY_Feet		=	{ name	=	"Maculele Toe Shoes +2"}
	
	gear.DNC_TP_STP_Cape = 	{ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Damage taken-5%',}} --*
	gear.DNC_WS1_Cape = 	{ name	=	"Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}} --*

	
    -- Additional local binds
--    send_command('bind @` gs c step')
--	send_command('bind ^!@` gs c toggle usealtstep')
--	send_command('bind ^@` gs c cycle mainstep')
--	send_command('bind !@` gs c cycle altstep')
	send_command('bind %~` gs c cycle SkillchainMode')
	send_command('bind ^1 gs c cycle DanceStance')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
			
	-- Weapons sets
	sets.weapons.Aeneas 	= {main="Aeneas"	,sub="Fusetto +2"}
	sets.weapons.AeneasAcc 	= {main="Aeneas"	,sub="Gleti's Knife"}
	sets.weapons.Tauret 	= {main="Tauret"	,sub="Gleti's Knife"}
	sets.weapons.TauretTaming 	= {main="Tauret"	,sub="Taming Sari"}
	sets.weapons.LowBuff 	= {main="Tauret"	,sub="Blurred Knife +1"}
	sets.weapons.Shield 	= {main="Aeneas"	,sub="Airy Buckler"}
	sets.weapons.DualAE 	= {main="Aeneas"	,sub="Tauret"}
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body=gear.DNC_RELIC_Body} --body	=	"Horos Casaque +1"

    sets.precast.JA['Trance'] = {head=gear.DNC_RELIC_Head} 
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		ammo	=	"Yamarang",
        head	=	"Mummu Bonnet +2",
		neck	=	"Etoile Gorget",
		ear1	=	"Handler's Earring",
		ear2	=	"Handler's Earring +1",
        body	=	gear.DNC_AF_Body,
		hands	=	"Regal Gloves",
		ring1	=	"Carbuncle Ring",
		ring2	=	"Asklepian Ring",
        back	=	"Toetapper Mantle",
		waist	=	"Aristo Belt",
		legs	=	"Dashing Subligar",
		feet	=	gear.DNC_AF_Feet
	}
		
	sets.Self_Waltz = {
		head	=	"Mummu Bonnet +2",
		body	=	"Passion Jacket",
		ring2	=	"Asklepian Ring"
	}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {head=gear.DNC_AF_Head,back=gear.DNC_TP_STP_Cape} 

    sets.precast.Jig = {legs=gear.DNC_RELIC_Legs,feet=gear.DNC_AF_Feet}
	
    sets.precast.Step = 
	{
		ammo	=	"Yamarang",
        head	=	"Dampening Tam",
		neck	=	"Etoile Gorget",
		ear1	=	"Telos Earring",
		ear2	=	"Digni. Earring",
        body	=	gear.DNC_AF_Body,
		hands	=	gear.DNC_AF_Hands,
		ring1	=	"Chirich Ring +1",
		ring2	=	"Ilabrat Ring",
        back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	gear.DNC_AF_Legs,
		feet	=	gear.DNC_RELIC_Feet
	}
		
    sets.Enmity = 
	{
		ammo	=	"Paeapua",
        head	=	"Halitus Helm",
		neck	=	"Unmoving Collar +1",
		ear1	=	"Friomisi Earring",
--		ear2	=	"Trux Earring",
        body	=	"Emet Harness +1",
--		hands	=	"Malignance Gloves",
		ring1	=	"Petrov Ring",
		ring2	=	"Vengeful Ring",
        back	=	"Solemnity Cape",
--		waist	=	"Goading Belt",
--		legs	=	gear.herculean_dt_legs,
--		feet	=	"Malignance Boots"
	}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = 
	{
		ammo	=	"Yamarang",
        head	=	"Mummu Bonnet +2",
		neck	=	"Etoile Gorget",
		ear1	=	"Telos Earring",
		ear2	=	"Digni. Earring",
        body	=	gear.DNC_RELIC_Body,
		hands	=	"Mummu Wrists +2",
		ring1	=	"Stikini Ring",
		ring2	=	"Stikini Ring",
        back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Eschan Stone",
		legs	=	gear.DNC_RELIC_Legs,
		feet	=	"Mummu Gamashes +2"
	}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = 
	{
		ammo	=	"Yamarang",
        head	=	"Mummu Bonnet +2",
		neck	=	"Etoile Gorget",
		ear1	=	"Telos Earring",
		ear2	=	"Digni. Earring",
        body	=	"Mummu Jacket +2",
		hands	=	"Mummu Wrists +2",
		ring1	=	"Stikini Ring",
		ring2	=	"Stikini Ring",
        back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Eschan Stone",
		legs	=	gear.DNC_RELIC_Legs,
		feet	=	"Mummu Gamashes +2"
	}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands=gear.DNC_EMPY_Hands,	back	=	"Toetapper Mantle"} 

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body=gear.DNC_EMPY_Body	}
    sets.precast.Flourish3['Climactic Flourish'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = 
	{
		ammo	=	"Impatiens",
		head	=	gear.herculean_fc_head,
		neck	=	"Voltsurge Torque",
		ear1	=	"Enchntr. Earring +1",
		ear2	=	"Loquac. Earring",
		body	=	"Dread Jupon",
		hands	=	"Leyline Gloves",
		ring1	=	"Lebeche Ring",
		ring2	=	"Prolix Ring",
		legs	=	"Rawhide Trousers"
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck	=	"Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = 
	{
		ammo	=	"Charis Feather",
        head	=	"Nyame Helm",
		neck	=	"Etoile Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Sherida Earring",
        body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Regal Ring",
        back	=	gear.DNC_WS1_Cape,
		waist	=	"Grunfeld Rope",
		legs	=	gear.DNC_RELIC_Legs,
		feet	=	"Nyame Sollerets"
	}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = 
	{
		ammo	=	"Charis Feather",
        head	=	gear.DNC_EMPY_Head,
		neck	=	"Etoile Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Odr Earring",
        body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Regal Ring",
        back	=	gear.DNC_WS1_Cape,
		waist	=	"Grunfeld Rope",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets",
	}
	
    sets.precast.WS["Shark Bite"] = 
	{
		ammo	=	"Charis Feather",
        head	=	"Nyame Helm",
		neck	=	"Etoile Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Odr Earring",
        body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Epaminondas's Ring",
        back	=	gear.DNC_WS1_Cape,
		waist	=	"Grunfeld Rope",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets",
	}
	
    sets.precast.WS['Evisceration'] = 
	{
		ammo	=	"Charis Feather",
        head	=	"Adhemar Bonnet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Odr Earring",
		ear2	=	"Sherida Earring",
        body	=	"Meg. Cuirie +2",
		hands	=	"Mummu Wrists +2",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Mummu Ring",
        back	=	gear.DNC_WS1_Cape,
		waist	=	"Fotia Belt",
		legs	=	gear.Mummu_Legs,
		feet	=	gear.Mummu_Feet
	}
	
    sets.precast.WS['Pyrrhic Kleos'] = --TODO
	{
		ammo	=	"Charis Feather",
        head	=	"Adhemar Bonnet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Odr Earring",
		ear2	=	"Sherida Earring",
        body	=	"Meg. Cuirie +2",
		hands	=	"Mummu Wrists +2",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Mummu Ring",
        back	=	gear.DNC_WS1_Cape,
		waist	=	"Fotia Belt",
		legs	=	gear.Mummu_Legs,
		feet	=	gear.Mummu_Feet
	}

    sets.precast.WS['Aeolian Edge'] = 
	{
	ammo	=	"Pemphredo Tathlum",
	head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    ear1="Moonshade Earring",
    ear2="Friomisi Earring",
    ring1="Metamorph Ring +1",
    ring2="Shiva Ring +1",
    back=gear.DNC_WS1_Cape,
    waist="Eschan Stone",
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP 		= {ear1	=	"Ishvara Earring"}
	sets.AccMaxTP 	= {ear1	=	"Ishvara Earring"}
	
    sets.Skillchain = {hands= gear.DNC_EMPY_Hands} 
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = 
	{
        head	=	gear.herculean_fc_head,
		neck	=	"Voltsurge Torque",
		ear1	=	"Enchntr. Earring +1",
		ear2	=	"Loquac. Earring",
        body	=	"Dread Jupon",
		hands	=	"Leyline Gloves",
		ring1	=	"Defending Ring",
		ring2	=	"Prolix Ring",
        back	=	"Moonlight Cape",
		waist	=	"Flume Belt +1",
		legs	=	"Rawhide Trousers",
		feet	=	"Malignance Boots"
	}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back	=	"Mujin Mantle"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
    

    -- Idle sets

    sets.idle = 
	{
		ammo	=	"Staunch Tathlum +1",
        head	=	"Malignance Chapeau",
		neck	=	"Warder's Charm +1",
		ear1	=	"Etiolation Earring",
		ear2	=	"Hearty Earring",
        body	=	"Malignance Tabard",
		hands	=	"Gleti's Gauntlets",
		ring1	=	"Defending Ring",
		ring2	=	"Purity Ring",
        back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Engraved Belt",
		legs	=	"Malignance Tights",
		feet	=	"Gleti's Boots"
	}
		
    sets.idle.Sphere = set_combine(sets.idle, {body	=	"Mekosu. Harness"})

    sets.Kiting = {feet	=	"Skd. Jambeaux +1"}

    sets.precast.RA = 
	{
		range	=	"Albin Bane",
	}
	
	sets.midcast.RA = 
	{
		range	=	"Albin Bane",
	}	

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = 
	{
		ammo	=	"Yamarang",
        head	=	"Adhemar Bonnet +1",
		neck	=	"Etoile Gorget",
		ear1	=	"Telos Earring",
		ear2	=	"Sherida Earring",
        body	=	"Malignance Tabard",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Gere Ring",
		ring2	=	"Chirich Ring +1",
        back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Samnuha Tights",
		feet	=	gear.DNC_EMPY_Feet
	}
		
    sets.engaged.DT =  set_combine(sets.engaged.DW, sets.DefensiveMali)      
		
	sets.engaged.Acc = 
	{
		ammo	=	"Yamarang",
        head	=	"Adhemar Bonnet +1",
		neck	=	"Etoile Gorget",
		ear1	=	"Telos Earring",
		ear2	=	"Sherida Earring",
        body	=	"Malignance Tabard",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Gere Ring",
		ring2	=	"Chirich Ring +1",
        back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Kentarch Belt +1",
		legs	=	"Malignance Tights",
		feet	=	gear.DNC_EMPY_Feet
	}
		
	sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.DefensiveMali)

	sets.engaged.DW = 
	{							--	48 needed
		ammo	=	"Yamarang",
		head	=	"Adhemar Bonnet +1",
		neck	=	"Etoile Gorget",
		ear1	=	"Eabani Earring",				
		ear2	=	"Suppanomimi",
		body	=	"Adhemar Jacket +1",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring +1",
		ring2	=	"Gere Ring",
		back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Reiki Yotai",
		legs	=	"Samnuha Tights",		
		feet	=	gear.DNC_EMPY_Feet
	}
	-----Haste & Dual Wield-----
	sets.engaged.DW.LowHaste = 
	{				--	42 needed
		ammo	=	"Yamarang",
		head	=	"Adhemar Bonnet +1",
		neck	=	"Etoile Gorget",
		ear1	=	"Eabani Earring",				
		ear2	=	"Suppanomimi",
		body	=	"Adhemar Jacket +1",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring +1",
		ring2	=	"Gere Ring",
		back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Reiki Yotai",
		legs	=	"Samnuha Tights",		
		feet	=	gear.DNC_EMPY_Feet
	}
	
	sets.engaged.DW.MidHaste = 
	{				--	21 needed
		ammo	=	"Yamarang",
		head	=	"Adhemar Bonnet +1",
		neck	=	"Etoile Gorget",
		ear1	=	"Eabani Earring",				
		ear2	=	"Suppanomimi",
		body	=	"Adhemar Jacket +1",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring +1",
		ring2	=	"Gere Ring",
		back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Reiki Yotai",
		legs	=	"Samnuha Tights",		
		feet	=	gear.DNC_EMPY_Feet
	}
		
	sets.engaged.DW.HighHaste = 
	{				--	 needed
		ammo	=	"Yamarang",
		head	=	"Adhemar Bonnet +1",
		neck	=	"Etoile Gorget",
		ear1	=	"Sherida Earring",				
		ear2	=	"Telos Earring",
		body	=	"Adhemar Jacket +1",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring +1",
		ring2	=	"Gere Ring",
		back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Samnuha Tights",		
		feet	=	gear.DNC_EMPY_Feet
	}    
	
	sets.engaged.DW.MaxHaste = 
	{				-- 1 needed
		ammo	=	"Yamarang",
		head	=	"Adhemar Bonnet +1",
		neck	=	"Etoile Gorget",
		ear1	=	"Sherida Earring",				
		ear2	=	"Telos Earring",
		body	=	gear.DNC_RELIC_Body,
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Chirich Ring +1",
		ring2	=	"Gere Ring",
		back	=	gear.DNC_TP_STP_Cape,
		waist	=	"Sailfi Belt +1",
		legs	=	"Samnuha Tights",		
		feet	=	gear.DNC_EMPY_Feet
	}    
	-----------------------
    sets.engaged.DW.Acc = 
	set_combine(sets.engaged.DW, 
		{
			head	=	"Malignance Chapeau",
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring +1",
			waist	=	"Kentarch Belt +1",
			legs	=	"Malignance Tights"		
		}
	)
	-----Haste & Dual Wield-----
	sets.engaged.DW.Acc.LowHaste = 
	set_combine(sets.engaged.DW.LowHaste, 
		{
			head	=	"Malignance Chapeau",
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring +1",
			waist	=	"Kentarch Belt +1",
			legs	=	"Malignance Tights"		
		}
	)
	
	sets.engaged.DW.Acc.MidHaste = 
	set_combine(sets.engaged.DW.MidHaste, 
		{
			head	=	"Malignance Chapeau",
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring +1",
			waist	=	"Kentarch Belt +1",
			legs	=	"Malignance Tights"		
		}
	)
	
	sets.engaged.DW.Acc.HighHaste = 
	set_combine(sets.engaged.DW.HighHaste, 
		{
			head	=	"Malignance Chapeau",
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring +1",
			waist	=	"Kentarch Belt +1",
			legs	=	"Malignance Tights"		
		}
	)   
	
	sets.engaged.DW.Acc.MaxHaste = 
	set_combine(sets.engaged.DW.MaxHaste, 
		{
			head	=	"Malignance Chapeau",
			ear2	=	"Telos Earring",
			ring1	=	"Chirich Ring +1",
			waist	=	"Kentarch Belt +1",
			legs	=	"Malignance Tights"		
		}
	)  
	-----------------------		
    sets.engaged.DW.DT =  set_combine(sets.engaged.DW, sets.DefensiveMali)      
    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.Acc, sets.DefensiveMali)
	
	sets.engaged.DW.DT.LowHaste =  set_combine(sets.engaged.DW.LowHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})      
    sets.engaged.DW.Acc.DT.LowHaste = set_combine(sets.engaged.DW.Acc.LowHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})
	
	sets.engaged.DW.DT.MidHaste =  set_combine(sets.engaged.DW.MidHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})      
    sets.engaged.DW.Acc.DT.MidHaste = set_combine(sets.engaged.DW.Acc.MidHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})
	
	sets.engaged.DW.DT.HighHaste =  set_combine(sets.engaged.DW.HighHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})      
    sets.engaged.DW.Acc.DT.HighHaste = set_combine(sets.engaged.DW.Acc.HighHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})
	
	sets.engaged.DW.DT.MaxHaste =  set_combine(sets.engaged.DW.MaxHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})      
    sets.engaged.DW.Acc.DT.MaxHaste = set_combine(sets.engaged.DW.Acc.MaxHaste, sets.DefensiveMali,		{
			waist	=	"Reiki Yotai",	hands = "Gleti's Gauntlets", feet = "Gleti's boots",ear2	=	"Odnowa Earring+1"
		})


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {legs=gear.DNC_RELIC_Legs} 
    sets.buff['Climactic Flourish'] = {ammo	=	"Charis Feather",head	=gear.DNC_EMPY_Head}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head	=	"Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'SAM' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 1)
    else
        set_macro_page(2, 1)
    end
end