-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Pet','DT','Normal')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.PhysicalDefenseMode:options('PDT')
	state.IdleMode:options('Normal','PDT','Refresh')
	state.Weapons:options('None','Godhands','PetWeapons','Kenkonken')

    -- Default/Automatic maneuvers for each pet mode.  Define at least 3.
	defaultManeuvers = {
		Melee = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=1},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=0},
		},
		Ranged = {
			{Name='Wind Maneuver', 	  Amount=3},
			{Name='Fire Maneuver',	  Amount=0},
			{Name='Light Maneuver',	  Amount=0},
			{Name='Thunder Maneuver', Amount=0},
		},
		HybridRanged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
		},
		Tank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		LightTank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		Magic = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Ice Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Heal = {
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Nuke = {
			{Name='Ice Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
	}

	deactivatehpp = 85
	
    select_default_macro_book()
	
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f8 gs c toggle AutoPuppetMode')
	send_command('bind @f7 gs c toggle AutoRepairMode')
end

-- Define sets used by this job file.
function init_gear_sets()
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
	body="Zendik Robe",hands="Malignance Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
	back="Perimede Cape",waist="Isa Belt",legs="Rawhide Trousers",feet="Regal Pumps +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe +1"}
    sets.precast.JA['Maintenance'] = set_combine(sets.precast.JA["Repair"],{ammo="Automat. Oil +3"})
	sets.precast.JA["Overdrive"] = {body = "Pitre Tobe +1"}
	
	sets.precast.JA["Repair"] = {
    main="Nibiru Sainti",
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Herculean Helm", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','"Repair" potency +6%','Pet: AGI+2',}},
    body={ name="Herculean Vest", augments={'Pet: Attack+4 Pet: Rng.Atk.+4','"Repair" potency +7%','Pet: CHR+9',}},
    hands={ name="Herculean Gloves", augments={'"Repair" potency +7%','Pet: STR+11','Pet: Attack+11 Pet: Rng.Atk.+11','Pet: "Mag.Atk.Bns."+10',}},
    legs={ name="Desultor Tassets", augments={'"Repair" potency +10%','Movement speed +8%',}},
    feet="Foire Bab. +1",
    neck="Empath Necklace",
    waist="Isa Belt",
    left_ear="Pratik Earring",
    right_ear="Guignol Earring",
    back="Dispersal Mantle",
	}
	
	sets.precast.JA.Maneuver =
	{main="Qutrub Knife",
	neck="Buffoon's Collar +1",
	body="Karagoz Farsetto +1",
	hands="Foire Dastanas +1",
	back="Visucius's Mantle",
	ear1="Burana Earring"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Lilitu Headpiece",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_waltz_feet}
        
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {
        head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {body="Abnoba Kaftan"})
    sets.precast.WS['Victory Smite'].Acc = set_combine(sets.precast.WS.Acc, {body="Sayadio's Kaftan"})
	
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {body="Abnoba Kaftan"})
    sets.precast.WS['Stringing Pummel'].Acc = set_combine(sets.precast.WS.FullAcc, {body="Sayadio's Kaftan"})
	
	sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
		
    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dragon Kick'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tornado Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
		
    sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Howling Fist'].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Backhand Blow'].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shoulder Tackle'].Acc = set_combine(sets.precast.WS.Acc, {})


    -- Midcast Sets

    sets.midcast.FastRecast = {
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
	body="Zendik Robe",hands="Malignance Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
	back="Perimede Cape",waist="Isa Belt",legs="Rawhide Trousers",feet="Regal Pumps +1"}
	
	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	
    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {}
	sets.midcast.Pet['Enfeebling Magic'] = {neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Handler's Earring +1",body="Taeon Tabard",hands="Regimen Mittens",ring1="Varar Ring +1",ring2="Varar Ring +1",waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
    sets.midcast.Pet['Elemental Magic'] = {neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Handler's Earring +1",body="Taeon Tabard",hands="Regimen Mittens",ring1="Varar Ring +1",ring2="Varar Ring +1",waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
	
	-- The following sets are predictive and are equipped before we even know the ability will happen, as a workaround due to
	-- the fact that start of ability packets are too late in the case of Pup abilities, WS, and certain spells.
	sets.midcast.Pet.PetEnmityGear = {
	    head="Heyoka Cap +1",
		neck="Twilight Torque",
		body="Heyoka Harness +1",
		hands="Heyoka mittens +1",
		legs="Heyoka Subligar +1",
		feet="Heyoka Leggings +1",
		rear="Domes. Earring",
		lear="Rimeice Earring",
	}
	
	sets.midcast.Pet.PetWSGear = {neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",body="Taeon Tabard",hands="Regimen Mittens",ring1="Varar Ring +1",ring2="Varar Ring +1",back="Dispersal Mantle",waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
	
    sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {ring2="C. Palug Ring"})
	sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear, {
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    hands="Mpaca's Gloves",
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Incarnation Sash",
    left_ear="Kyrene's Earring",
    right_ear="Domes. Earring",
    left_ring="Overbearing Ring",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
})
	sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear, {
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    hands="Mpaca's Gloves",
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Incarnation Sash",
    left_ear="Kyrene's Earring",
    right_ear="Domes. Earring",
    left_ring="Overbearing Ring",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {	})
	sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})
    
	-- Currently broken, preserved in case of future functionality.
	--sets.midcast.Pet.WeaponSkill = {}

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets

    sets.idle = {
            range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Mpaca's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Mpaca's Boots",
    neck="Loricate Torque +1",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}
		
	sets.idle.Refresh = {
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Vrikodara Jupon",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Fucho-no-Obi",legs="Rawhide Trousers",feet="Hippo. Socks +1"}
		
    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = {
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
        body="Taeon Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Hippo. Socks +1"}

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
    range="Animator P +1",
    ammo="Automat. Oil +2",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Acc.+20','Pet: Damage taken -5%',}},
}

 
    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {})
	
	sets.idle.Pet.Engaged.Tank =  {
    main="Gnafron's Adargas",
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="C. Palug Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -4%',}},
}
	
	sets.idle.Pet.Engaged.LightTank = {
    main="Kenkonken",
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Acc.+20','Pet: Damage taken -5%',}},
}
    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Heal = sets.idle.Pet.Engaged.Magic
	sets.idle.Pet.Engaged.Nuke = sets.idle.Pet.Engaged.Magic
	
	sets.idle.Pet.Engaged.Overdrive = {
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Rimeice Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Acc.+20','Pet: Damage taken -5%',}},
}



    -- Defense sets

    sets.defense.PDT = {
            range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Mpaca's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Mpaca's Boots",
    neck="Loricate Torque +1",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}

    sets.defense.MDT = {
        head="Blistering Sallet",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Isa Belt",legs=gear.herculean_dt_legs,feet="Malignance Boots"}
		
    sets.defense.MEVA = {
        head="Blistering Sallet",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Isa Belt",legs=gear.herculean_dt_legs,feet="Malignance Boots"}

    sets.Kiting = {feet="Hermes' Sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Windbuffet Belt +1",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.Acc = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Ramuh Ring +1",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.FullAcc = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.engaged.Fodder = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Windbuffet Belt +1",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.DT = {
            range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Mpaca's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Mpaca's Boots",
    neck="Loricate Torque +1",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}
    sets.engaged.Acc.DT = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
    sets.engaged.FullAcc.DT = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
    sets.engaged.Fodder.DT = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
        body=gear.herculean_wsd_body,hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Grunfeld Rope",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
    sets.engaged.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.Acc.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.FullAcc.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
    sets.engaged.Fodder.Pet = {
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
		
	-- Weapons sets
	sets.weapons.PetWeapons = {main="Kaja Knuckles",range="Animator P +1",}
	sets.weapons.Godhands = {main="Godhands",range="Animator P +1",}
	sets.weapons.Kenkonken = {main="Kenkonken",range="Animator P +1",}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 20)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 20)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 20)
    else
        set_macro_page(2, 20)
    end
end