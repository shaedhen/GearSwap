function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('Chango','DualWeapons','Greatsword','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcClub','ProcStaff')

	gear.da_jse_back = {name="Cichol's Mantle",augments={'DEX+30','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	gear.wsd_jse_back = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}}
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	
    sets.Enmity = {}
	sets.Knockback = {}
	sets.passive.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back="Cichol's Mantle", feet= "Agoge Calligae +1"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask"}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {}
	sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers"}
	sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses"}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk"}
	sets.precast.JA['Retaliation'] = {hands="Pummeler's Mufflers +2"}
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Blood Rage'] = {}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                  
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
                   
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Knobkierrie",
    head="Sakpata's Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sulev. Leggings +2",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist="Warwolf Belt",
    left_ear="Lugra Earring",
    right_ear="Thrud Earring",
    left_ring="Karieyh Ring",
    right_ring="Niqmaddu Ring",
    back=gear.wsd_jse_back 
		}



    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})

	
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})

	
    sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
	
    sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})
	
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {})
	
    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring"}
	
	--Specialty WS set overwrites.
	sets.AccWSMightyCharge = {}
	sets.AccWSCharge = {}
	sets.AccWSMightyCharge = {}
	sets.WSMightyCharge = {}
	sets.WSCharge = {}
	sets.WSMighty = {}

     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Hjarrandi Breastplate",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets


	sets.Kiting = {}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
     
            -- Engaged sets
	sets.engaged = {    ammo="Focal Orb",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back=gear.da_jse_back }



	
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Chango = {main="Chango",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}
	sets.weapons.ProcDagger = {main="Chicken Knife II",sub=empty}
	sets.weapons.ProcSword = {main="Ark Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
	sets.weapons.ProcClub = {main="Dream Bell +1",sub=empty}
	sets.weapons.ProcStaff = {main="Terra's Staff",sub=empty}

end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(3, 3)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 3)
    else
        set_macro_page(5, 3)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 017')
end