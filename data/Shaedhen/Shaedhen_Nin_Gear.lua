-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	include('Shaedhen-Items.lua')
	state.OffenseMode:options('Normal')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal')
	state.WeaponskillMode:options('Normal','Capped')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal','Sphere')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Shun','TenHybrid','Metsu','Ku','Naegling','Hachimonji','Ei','Tauret')

	----NIN
	--Hachiya
	gear.NIN_AF_Head		=	{ name="Hachiya Hatsuburi +2"}
    gear.NIN_AF_Body		=	{ name="Hachiya Chainmail +1"}
    gear.NIN_AF_Hands		=	{ name="Hachiya Tekko +1"}
    gear.NIN_AF_Legs		=	{ name="Hachiya Hakama +1"}
    gear.NIN_AF_Feet		=	{ name="Hachiya Kyahan +1"}
    --Mochizuki
    gear.NIN_RELIC_Head		=	{ name="Mochizuki Hatsuburi +3"}
    gear.NIN_RELIC_Body		=	{ name="Mochizuki Chainmail +2"}
    gear.NIN_RELIC_Hands 	=	{ name="Mochizuki Tekko +1"}
    gear.NIN_RELIC_Legs		=	{ name="Mochizuki Hakama +1"}
    gear.NIN_RELIC_Feet		=	{ name="Mochizuki Kyahan +3"}
    --Hattori
    gear.NIN_EMPY_Head		=	{ name="Hattori Zukin +2"}
    gear.NIN_EMPY_Body		=	{ name="Hattori Ningi +2"}
    gear.NIN_EMPY_Hands		=	{ name="Hattori Tekko +2"}
    gear.NIN_EMPY_Legs		=	{ name="Hattori Hakama +2"}
    gear.NIN_EMPY_Feet		=	{ name="Hattori Kyahan +2"}	



	gear.da_jse_back = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Double attack +10%',}}
	gear.wsd_jse_back = {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.stp_jse_back = {name="Andartia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.mab_jse_back = {name="Andartia's Mantle",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	send_command('bind ^` input /ja "Innin" <me>')
	send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c set WeaponskillMode Proc;gs c set CastingMode Proc;gs c update')
	send_command('bind ^r gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')

	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {ammo="Paeapua",
        head="Dampening Tam",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Emet Harness +1",hands="Kurys Gloves",ring1="Petrov Ring",ring2="Vengeful Ring",
        back="Moonlight Cape",waist="Goading Belt",legs=gear.herculean_dt_legs,feet="Amm Greaves"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs=gear.NIN_RELIC_Legs	} --legs="Mochizuki Hakama",--main="Nagi"
    sets.precast.JA['Futae'] = {hands=gear.NIN_EMPY_Hands}
    sets.precast.JA['Sange'] = {body=gear.NIN_RELIC_Body} --legs="Mochizuki Chainmail"
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}

    sets.precast.Flourish1 = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Hattori Hakama +1",feet="Malignance Boots"}

    -- Fast cast sets for spells

    sets.precast.FC = {
		ammo="Impatiens",
		head="Herculean Helm",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Kishar Ring",
		legs="Rawhide Trousers",
		feet=gear.NIN_RELIC_Feet
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket",feet=gear.NIN_EMPY_Feet})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ammo="Staunch Tathlum +1",ring1="Prolix Ring"})

    -- Snapshot for ranged
    sets.precast.RA = {}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	
    sets.precast.WS = {
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},	
        neck	=	"Rep. Plat. Medal",
		ear1	=	"Moonshade Earring",
		ear2	=	"Hattori Earring +1",
        ring1	=	"Epaminondas's Ring",
		ring2	=	"Regal Ring",
		waist	=	"Sailfi Belt +1",	
        back=gear.wsd_jse_back,
	}
	
	sets.precast.WS['Blade: Metsu'] = {
		ammo	=	"Coiste Bodhar",
		head	=	"Nyame Helm",
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Odr Earring",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Sailfi Belt +1",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Metsu'].Capped = {
		ammo	=	"Crepuscular Pebble",
		head	=	gear.NIN_AF_Head,
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Hattori Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Regal Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Kentarch Belt +1",
		legs	=	"Mpaca's Hose",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Hi'] = {
		ammo	=	"Yetshila +1",
		head	=	gear.NIN_AF_Head,
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Odr Earring",
		body	=	gear.NIN_EMPY_Body,
		hands	=	"Nyame Gauntlets",
		ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Kentarch Belt +1",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Hi'].Capped = {
		ammo	=	"Yetshila +1",
		head	=	gear.NIN_AF_Head,
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Odr Earring",
		ear2	=	"Hattori Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Sroda Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Kentarch Belt +1",
		legs	=	"Mpaca's Hose",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Ei'] = {
		ammo	=	"Seeth. Bomblet +1",
		head	=	"Pixie Hairpin +1",
		neck	=	"Sibyl Scarf",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Epaminondas's Ring",
		ring2	=	"Archon Ring",
		back	=	"Andartia's Mantle",
		waist	=	"Eschan Stone",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS["Blade: Chi"] = {
		ammo	=	"Seeth. Bomblet +1",
		head	=	gear.NIN_RELIC_Head,
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Lugra Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Gere Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back,
		waist	=	"Orpheus's Sash",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS["Blade: Teki"] = {
		ammo	=	"Seeth. Bomblet +1",
		head	=	gear.NIN_RELIC_Head,
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Lugra Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Gere Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back,
		waist	=	"Orpheus's Sash",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS["Blade: To"] = {
		ammo	=	"Seeth. Bomblet +1",
		head	=	gear.NIN_RELIC_Head,
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Lugra Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Gere Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back,
		waist	=	"Orpheus's Sash",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}

	
	sets.precast.WS['Blade: Ku'] = {
		ammo	=	"Coiste Bodhar",
		head	=	"Mpaca's Cap",
		neck	=	"Fotia Gorget",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Brutal Earring",
		body	=	"Nyame Mail",
		hands	=	gear.NIN_Relic_Hands,
		ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.da_jse_back ,
		waist	=	"Fotia Belt",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Ku'].Capped = {
		ammo	=	"Coiste Bodhar",
		head	=	"Mpaca's Cap",
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Hattori Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Malignance Gloves",
		ring1	=	"Gere Ring",
		ring2	=	"Sroda Ring",
		back	=	gear.da_jse_back ,
		waist	=	"Fotia Belt",
		legs	=	"Mpaca's Hose",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Shun'] = {
		ammo	=	"Coiste Bodhar",
		head	=	"Mpaca's Cap",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Hattori Earring +1",
		body	=	"Malignance Tabard",
		hands	=	"Adhemar Wrist. +1",
		ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.da_jse_back ,
		waist	=	"Fotia Belt",
		legs	=	"Mpaca's Hose",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Shun'].Capped = {
		ammo	=	"Crepuscular Pebble",
		head	=	"Ken. Jinpachi +1",
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Hattori Earring +1",
		body	=	"Malignance Tabard",
		hands	=	"Malignance Gloves",
		ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.da_jse_back ,
		waist	=	"Fotia Belt",
		legs	=	"Mpaca's Hose",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Ten'] = {
		ammo	=	"Coiste Bodhar",
		head	=	"Mpaca's Cap",
		neck	=	"Rep. Plat. Medal",
		ear1	=	"Moonshade Earring",
		ear2	=	"Lugra Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Sailfi Belt +1",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Ten'].Capped = {
		ammo	=	"Crepuscular Pebble",
		head	=	"Mpaca's Cap",
		neck	=	"Rep. Plat. Medal",
		ear1	=	"Moonshade Earring",
		ear2	=	"Lugra Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Sroda Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Sailfi Belt +1",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Kamu'] = {
		ammo	=	"Crepuscular Pebble",
		head	=	"Mpaca's Cap",
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Hattori Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Sroda Ring",
		ring2	=	"Gere Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Sailfi Belt +1",
		legs	=	"Mpaca's Hose",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Kamu'].Capped = {
		ammo	=	"Crepuscular Pebble",
		head	=	"Mpaca's Cap",
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Lugra Earring +1",
		ear2	=	"Hattori Earring +1",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		ring1	=	"Sroda Ring",
		ring2	=	"Gere Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Sailfi Belt +1",
		legs	=	"Mpaca's Hose",
		feet	=	"Nyame Sollerets"
	}
	
	sets.precast.WS['Tachi: Kasha'] = {
		ammo	=	"Crepuscular Pebble",
		neck	=	"Ninja Nodowa +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Lugra Earring +1",
		head	=	"Mpaca's Cap",
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	"Mpaca's Hose",
		feet	=	{ name="Nyame Sollerets", augments={'Path: B',}},	
		ring1	=	"Gere Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Sailfi Belt +1",
	}
	
	sets.precast.WS['Tachi: Koki'] = {
		ammo	=	"Seeth. Bomblet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
		head	=	{ name="Nyame Helm", augments={'Path: B',}},
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	{ name="Nyame Sollerets", augments={'Path: B',}},	
		ring1	=	"Weatherspoon Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Orpheus's Sash",
	}
	
	sets.precast.WS['Tachi: Kagero'] = {
		ammo	=	"Seeth. Bomblet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
		head	=	{ name="Nyame Helm", augments={'Path: B',}},
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	{ name="Nyame Sollerets", augments={'Path: B',}},	
		ring1	=	"Gere Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Orpheus's Sash",
	}

	sets.precast.WS['Tachi: Jinpu'] = {
		ammo	=	"Seeth. Bomblet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
		head	=	{ name="Nyame Helm", augments={'Path: B',}},
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	{ name="Nyame Sollerets", augments={'Path: B',}},	
		ring1	=	"Gere Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Orpheus's Sash",
	}	

	sets.precast.WS['Tachi: Goten'] = {
		ammo	=	"Seeth. Bomblet +1",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Friomisi Earring",
		head	=	{ name="Nyame Helm", augments={'Path: B',}},
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	{ name="Nyame Sollerets", augments={'Path: B',}},	
		ring1	=	"Gere Ring",
		ring2	=	"Epaminondas's Ring",
		back	=	gear.wsd_jse_back ,
		waist	=	"Orpheus's Sash",
	}

	sets.precast.WS['Savage Blade'] =  {
		ammo	=	"Coiste Bodhar",
		head	=	"Mpaca's Cap",
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	{ name="Nyame Sollerets", augments={'Path: B',}},	
        neck	=	"Rep. Plat. Medal",
		ear1	=	"Moonshade Earring",
		ear2	=	"Lugra Earring +1",
        ring1	=	"Beithir Ring",
		ring2	=	"Regal Ring",
		waist	=	"Sailfi Belt +1",	
        back	=	gear.wsd_jse_back,
	}
	
	sets.precast.WS['Savage Blade'].Capped =  {
		ammo	=	"Crepuscular Pebble",
		head	=	"Mpaca's Cap",
		body	=	{ name="Nyame Mail", augments={'Path: B',}},
		hands	=	{ name="Nyame Gauntlets", augments={'Path: B',}},
		legs	=	{ name="Nyame Flanchard", augments={'Path: B',}},
		feet	=	{ name="Nyame Sollerets", augments={'Path: B',}},	
        neck	=	"Ninja Nodowa +1",
		ear1	=	"Moonshade Earring",
		ear2	=	"Hattori Earring +1",
        ring1	=	"Epaminondas's Ring",
		ring2	=	"Sroda Ring",
		waist	=	"Sailfi Belt +1",	
        back	=	gear.wsd_jse_back,
	}
	
	sets.precast.WS['Evisceration'] = {
		ammo	=	"Yetshila +1",
		head	=	"Blistering Sallet +1",
        neck	=	"Fotia Gorget",
		ear1	=	"Odr Earring",
		ear2	=	"Lugra Earring +1",
		body	=	gear.NIN_EMPY_Body,
		hands	=	"Ryuo Tekko +1",
        ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.da_jse_back,
		waist	=	"Fotia Belt",
		legs	=	"Mpaca's Hose",
		feet	=	"Ken. Sune-Ate +1"
	}
	
	sets.precast.WS['Evisceration'].Capped = {
		ammo	=	"Yetshila +1",
		head	=	"Blistering Sallet +1",
        neck	=	"Fotia Gorget",
		ear1	=	"Odr Earring",
		ear2	=	"Lugra Earring +1",
		body	=	gear.NIN_EMPY_Body,
		hands	=	"Ryuo Tekko +1",
        ring1	=	"Gere Ring",
		ring2	=	"Regal Ring",
		back	=	gear.da_jse_back,
		waist	=	"Fotia Belt",
		legs	=	"Mpaca's Hose",
		feet	=	"Ken. Sune-Ate +1"
	}	

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring",ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring",}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
        body="Dread Jupon",
		hands=gear.NIN_RELIC_Hands,
		ring1="Defending Ring",
		ring2="Kishar Ring",
        legs="Rawhide Trousers",
		feet="Malignance Boots"
	}

    sets.midcast.ElementalNinjutsu = {
		ammo="Pemphredo Tathlum",
        head=gear.NIN_RELIC_Head,
		neck="Sibyl Scarf",
		ear1="Crematio Earring",
		ear2="Friomisi Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Shiva Ring +1",
		ring2="Metamor. Ring +1",
        back="Toro Cape",
		waist="Orpheus's Sash",
		legs="Nyame Flanchard",
		feet=gear.NIN_RELIC_Feet
	}

	sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}

    sets.midcast.NinjutsuDebuff = {
		ammo="Yamarang",
        head="Malignance Chapeau",
		neck="Incanter's Torque",
		ear1="Gwati Earring",
		ear2="Digni. Earring",
        body="Malignance Tabard",
		hands="Nyame Gauntlets",
		ring1="Stikini Ring +1",
		ring2="Metamor. Ring +1",
        back="Andartia's Mantle",
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Nyame Sollerets"
	}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {body=gear.NIN_RELIC_Body,back="Mujin Mantle"})

    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    sets.midcast.RA = {
        head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Enervating Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Apate Ring",
		ring2="Regal Ring",
        back=gear.da_jse_back,
		waist="Chaac Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {
		ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
        body="Malignance Tabard",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Purity Ring",
        back="Moonlight Cape",
		waist="Engraved Belt",
		legs="Malignance Tights",
		feet="Mpaca's Boots"
	}

    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {feet=gear.NIN_AF_Feet}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		ammo="Date Shuriken",
        head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Dedition Earring",
		ear2="Telos Earring",
        body="Tatena. Harama. +1",
		hands="Adhemar Wrist. +1",
		ring1="Epona's Ring",
		ring2="Gere Ring",
        back=gear.stp_jse_back,
		waist="Sailfi Belt +1",
		legs="Samnuha Tights",
		feet="Tatenashi sune-ate +1"
	}

    sets.engaged.DT = {		
		ammo="Date Shuriken",
        head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Dedition Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Chirich Ring +1",
		ring2="Defending Ring",
        back=gear.stp_jse_back,
		waist="Sailfi Belt +1",
		legs="Malignance Tights",
		feet=gear.Herc_trip_feet
	}


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body=gear.NIN_EMPY_Body} 
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Futae = {hands=gear.NIN_EMPY_Hands}
    sets.buff.Yonin = {legs=gear.NIN_EMPY_Legs} --
    sets.buff.Innin = {head=gear.NIN_EMPY_Head} 

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Shetal Stone"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {legs="Ryuo Hakama"}

	-- Weapons sets
	--'Shun','TenHybrid','Metsu','Ku','Naegling','Hachimonji','Ei'
	sets.weapons.Shun = {main="Heishi Shorinken",sub="Gleti's Knife"}
	sets.weapons.TenHybrid = {main="Heishi Shorinken",sub="Kunimitsu"}
	sets.weapons.Metsu = {main="Kikoku",sub="Kunimitsu"}
	sets.weapons.Ku = {main="Gokotai",sub="Gleti's Knife"}
	sets.weapons.Naegling = {main="Naegling",sub="Uzura +2"}
	sets.weapons.Hachimonji = {main="Hachimonji",sub="Bloodrain Strap"}
	sets.weapons.Ei = {main="Heishi Shorinken",sub="Malevolence"}
	sets.weapons.Tauret = {main="Tauret",sub="Gleti's Knife"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 12)
    else
        set_macro_page(1, 12)
    end
end
