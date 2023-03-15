function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Montante','Anguta')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Nether Void'] = {}
	sets.precast.JA['Blood Weapon'] = {}
	sets.precast.JA['Dark Seal'] = {}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Eschan Stone",legs="Eschite Cuisses",feet="Flam. Gambieras +2"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {})
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {back="Ankou's Mantle"})
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Eschan Stone",legs="Eschite Cuisses",feet="Flam. Gambieras +2"}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Evanescence Ring",ring2="Archon Ring",back="Niht Mantle"})
	
	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Knobkierrie",
    head="Ratri Sallet",
    body="Ignominy Cuirass +2",
    hands="Ratri Gadlings",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Lugra Earring",
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
            -- Idle sets
           
    sets.idle = {ammo="Staunch Tathlum +1",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Amm Greaves"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum +1",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Amm Greaves"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {} --head="Fallen's Burgeonet +3"
     
	-- Engaged sets
	sets.engaged = {    ammo="Focal Orb",
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Flam. Gambieras +2",
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back="Lupine Cape"}

	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Montante = {main="Montante +1",sub="Utu Grip"}
	sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 15)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 15)
    else
        set_macro_page(5, 15)
    end
end