function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Godhands')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Additional local binds
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +1"}
	sets.precast.JA['Boost'] = {hands="Anchorite's Gloves"}
	sets.precast.JA['Boost'].OutOfCombat = {hands="Anchorite's Gloves"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown"}
	sets.precast.JA['Counterstance'] = {} --feet="Hesychast's Gaiters +1"
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Mel. Gaiters +2"} --feet="Hesychast's Gaiters +1"

	sets.precast.JA['Chi Blast'] = {}
	
	sets.precast.JA['Chakra'] = {
		head="Dampening Tam",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",
		legs="Hes. Hose +1",feet="Anch. Gaiters"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
		
	sets.precast.Flourish1 = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}


	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
	body="Dread Jupon",hands="Leyline Gloves",ring2="Lebeche Ring",ring2="Kishar Ring",
	legs="Rawhide Trousers"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Voluspa Tathlum",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Niqmaddu Ring",
		back="Segomo's Mantle",waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
	sets.precast.WSAcc = {ammo="Falcon Eye",head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ring2="Ramuh Ring +1",body="Malignance Tabard",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)


	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {head="Lilitu Headpiece",body=gear.herculean_wsd_body})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {neck="Caro Necklace",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {head="Dampening Tam"})
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	
	sets.precast.WS['Cataclysm'] = {ammo="Ghastly Tathlum +1",
		neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		hands="Malignance Gloves",ring1="Shiva Ring +1",
		back="Toro Cape",legs="Nahtirah Trousers"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Black Belt",legs="Nyame Flanchard",feet="Hippo. Socks +1"}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {body="Hesychast's Cyclas",ring2="Sheltered Ring"}
	

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Hiza. Haramaki +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Sheltered Ring",
		back="Moonlight Cape",waist="Black Belt",legs="Nyame Flanchard",feet="Hippo. Socks +1"}

	sets.Kiting = {feet="Herald's Gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Aurgelmir Orb +1",
		head="Dampening Tam",neck="Monk's Nodowa +1",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back="Segomo's Mantle",waist="Moonbow Belt",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.engaged.Acc = {ammo="Aurgelmir Orb +1",
		head="Dampening Tam",neck="Monk's Nodowa +1",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back="Segomo's Mantle",waist="Moonbow Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +1"}
	sets.buff.Footwork = {feet="Shukuyu Sune-Ate"}
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {feet="Shukuyu Sune-Ate"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {legs="Ryuo Hakama"}
	
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(5, 20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 20)
	elseif player.sub_job == 'THF' then
		set_macro_page(6, 20)
	elseif player.sub_job == 'RUN' then
		set_macro_page(7, 20)
	else
		set_macro_page(6, 20)
	end
end