function user_job_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'SomeAcc','FullAcc')
    state.WeaponskillMode:options('Normal')
    state.HybridMode:options('Normal', 'DT')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
    state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'DT')
    state.Weapons:options('Godhands','Verethragna')

    state.ExtraMeleeMode = M {
        ['description'] = 'Extra Melee Mode',
        'None'
    }

    update_melee_groups()

    -- Additional local binds
    send_command('bind ^` input /ja "Boost" <me>')
    send_command('bind !` input /ja "Perfect Counter" <me>')
    send_command('bind ^backspace input /ja "Mantra" <me>')
    send_command('bind @` gs c cycle SkillchainMode')

    select_default_macro_book()
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs on use
    sets.precast.JA['Hundred Fists'] = {
        legs = "Hesychast's Hose +1"
    }
    sets.precast.JA['Boost'] = {} -- hands="Anchorite's Gloves +1"
    sets.precast.JA['Boost'].OutOfCombat = {} -- hands="Anchorite's Gloves +1", Remove Haste and Add Slow Gear.
    sets.precast.JA['Dodge'] = {
        feet = "Anchorite's Gaiters +1"
    }
    sets.precast.JA['Focus'] = {
        head = "Anchorite's Crown +1"
    }
    sets.precast.JA['Counterstance'] = {} -- feet="Hesychast's Gaiters +1"
    sets.precast.JA['Footwork'] = {
        feet = "Shukuyu Sune-Ate"
    }
    sets.precast.JA['Formless Strikes'] = {
        body = "Hesychast's Cyclas"
    }
    sets.precast.JA['Mantra'] = {
        feet = "Mel. Gaiters +2"
    } -- feet="Hesychast's Gaiters +1"

    sets.precast.JA['Chi Blast'] = {}

    sets.precast.JA['Chakra'] = {
        head = "Dampening Tam",
        body = "Malignance Tabard",
        hands = "Hesychast's Gloves +1",
        legs = "Hes. Hose +1",
        feet = "Anch. Gaiters +1"
    }

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {
        ammo = "Falcon Eye",
        head = "Malignance Chapeau",
        neck = "Moonbeam Nodowa",
        ear1 = "Mache Earring +1",
        ear2 = "Telos Earring",
        body = "Malignance Tabard",
        hands = "Hesychast's Gloves +1",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = "Segomo's Mantle",
        waist = "Olseni Belt",
        legs = "Hiza. Hizayoroi +2",
        feet = "Malignance Boots"
    }

    sets.precast.Flourish1 = {
        ammo = "Falcon Eye",
        head = "Malignance Chapeau",
        neck = "Moonbeam Nodowa",
        ear1 = "Mache Earring +1",
        ear2 = "Telos Earring",
        body = "Malignance Tabard",
        hands = "Hesychast's Gloves +1",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = "Segomo's Mantle",
        waist = "Olseni Belt",
        legs = "Mummu Kecks +2",
        feet = "Malignance Boots"
    }

    -- Fast cast sets for spells

    sets.precast.FC = {
        ammo = "Impatiens",
        head = gear.herculean_fc_head,
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Dread Jupon",
        hands = "Leyline Gloves",
        ring2 = "Lebeche Ring",
        ring2 = "Kishar Ring",
        legs = "Rawhide Trousers"
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        neck = "Magoraga Beads",
        body = "Passion Jacket"
    })

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo = "Voluspa Tathlum",
        head = "Adhemar Bonnet +1",
        neck = "Fotia Gorget",
        ear1 = "Brutal Earring",
        ear2 = "Sherida Earring",
        body = "Ken. Samue",
        hands = "Adhemar Wrist. +1",
        ring1 = "Niqmaddu Ring",
        ring2 = "Gere Ring",
        back = "Segomo's Mantle",
        waist = "Fotia Belt",
        legs = "Hiza. Hizayoroi +2",
        feet = gear.herculean_ta_feet
    }

	sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {
        waist = "Grunfeld Rope"
    })
    sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {
        head = "Lilitu Headpiece",
        body = gear.herculean_wsd_body
    })
    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {
        waist = "Grunfeld Rope"
    })
    sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {
        neck = "Caro Necklace",
        body = "Abnoba Kaftan",
        hands = "Ryuo Tekko",
        ring2 = "Begrudging Ring",
        waist = "Grunfeld Rope",
        feet = gear.herculean_wsd_feet
    })
    sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {
        ear1 = "Moonshade Earring",
        body = "Abnoba Kaftan",
        hands = "Ryuo Tekko",
        ring2 = "Begrudging Ring",
        legs = "Mummu Kecks +2",
        feet = "Mummu Gamash. +2"
    })
    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
        head = "Dampening Tam"
    })
    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {
        waist = "Grunfeld Rope"
    })
    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {
        waist = "Grunfeld Rope"
    })


    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {
        ear1 = "Brutal Earring",
        ear2 = "Sherida Earring"
    }
    sets.AccMaxTP = {
        ear1 = "Mache Earring +1",
        ear2 = "Telos Earring"
    }

    -- Midcast Sets
    sets.midcast.FastRecast = {
        ammo = "Staunch Tathlum +1",
        head = gear.herculean_fc_head,
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Dread Jupon",
        hands = "Leyline Gloves",
        ring1 = "Defending Ring",
        ring2 = "Prolix Ring",
        back = "Moonlight Cape",
        waist = "Black Belt",
        legs = gear.herculean_dt_legs,
        feet = "Hippo. Socks +1"
    }

    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {
        back = "Mujin Mantle"
    })

    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {
        body = "Hesychast's Cyclas",
        ring2 = "Sheltered Ring"
    }

	sets.DT = {
	
	}
    -- Idle sets
    sets.idle = {
        ammo = "Staunch Tathlum +1",
        head = "Dampening Tam",
        neck = "Loricate Torque +1",
        ear1 = "Etiolation Earring",
        ear2 = "Sanare Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        ring2 = "Sheltered Ring",
        back = "Moonlight Cape",
        waist = "Black Belt",
        legs = gear.herculean_dt_legs,
        feet = "Hippo. Socks +1"
    }

    sets.idle.Weak = set_combine(sets.idle, {})

    sets.idle.DT = set_combine(sets.idle, sets.DT)

    -- Defense sets
    sets.defense.PDT  = set_combine(sets.DT, {})

    sets.defense.MDT = set_combine(sets.DT, {})

    sets.defense.MEVA = set_combine(sets.DT, {})

    sets.Kiting = {
        feet = "Herald's Gaiters"
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee sets
    sets.engaged = {
        ammo = "Ginsen",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Herald's Gaiters",
        neck = "Loricate Torque +1",
        waist = "Windbuffet Belt +1",
        left_ear = "Etiolation Earring",
        right_ear = "Sherida Earring",
        left_ring = "Defending Ring",
        right_ring = "Gere Ring",
        back = {
            name = "Segomo's Mantle",
            augments = {'STR+30', 'Accuracy+20 Attack+20', 'STR+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        }

    }

    sets.engaged.SomeAcc = {
    ammo="Ginsen",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Anch. Gaiters +3",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%'}
        
    }
	}
	
    sets.engaged.FullAcc = {
    ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
        
    }

    -- Defensive melee hybrid sets
    sets.engaged.DT = set_combine(sets.engaged, sets.DT)
	
    sets.engaged.SomeAcc.DT = set_combine(sets.engaged.SomeAcc, sets.DT)
   
    sets.engaged.FullAcc.DT = set_combine(sets.engaged.SomeAcc, sets.DT)


    -- Hundred Fists/Impetus melee set mods

    sets.engaged.HF = set_combine(sets.engaged, {})
    sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
    sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})

    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {
        head = "Frenzy Sallet"
    }
    sets.buff.Impetus = {
        waist = "Aristo Belt"
    }
    sets.buff.Footwork = {
        feet = "Shukuyu Sune-Ate"
    }
    sets.buff.Boost = {} -- waist="Ask Sash"

    sets.FootworkWS = {
        feet = "Shukuyu Sune-Ate"
    }
    sets.DayIdle = {}
    sets.NightIdle = {}
    sets.Knockback = {}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.Skillchain = {
        legs = "Ryuo Hakama"
    }

    -- Weapons sets
    sets.weapons.Godhands = {
        main = "Godhands"
    }
    sets.weapons.Verethragna = {
        main = "Verethragna"
    }
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
