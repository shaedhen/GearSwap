function user_job_setup()
	include('Shaedhen-Items.lua')
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','Enspell')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Normal','Acc')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','DT')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','Sequence','DualWeapons','DualWeaponsAcc','DualEvisceration','DualClubs','DualAeolian','DualProcDaggers','EnspellOnly')

	----RDM
	--Atrophy
	gear.RDM_AF_Head		=	{ name	=	"Atrophy Chapeau +2"}
    gear.RDM_AF_Body		=	{ name	=	"Atrophy Tabard +3"}
    gear.RDM_AF_Hands		=	{ name	=	"Atrophy Gloves +3"}
    gear.RDM_AF_Legs		=	{ name	=	"Atrophy Tights +3"}
    gear.RDM_AF_Feet		=	{ name	=	"Atrophy Boots +2"}
    --Vitiation
    gear.RDM_RELIC_Head		=	{ name	=	"Vitiation Chapeau +3"}
    gear.RDM_RELIC_Body		=	{ name	=	"Vitiation Tabard +3"}
    gear.RDM_RELIC_Hands 	=	{ name	=	"Vitiation Gloves +3"}
    gear.RDM_RELIC_Legs		=	{ name	=	"Vitiation Tights +3"}
    gear.RDM_RELIC_Feet		=	{ name	=	"Vitiation Boots +3"}
    --Lethargy
    gear.RDM_EMPY_Head		=	{ name	=	"Lethargy Chappel +1"}
    gear.RDM_EMPY_Body		=	{ name	=	"Lethargy Sayon +1"}
    gear.RDM_EMPY_Hands		=	{ name	=	"Lethargy Gantherots +1"}
    gear.RDM_EMPY_Legs		=	{ name	=	"Lethargy Fuseau +1"}
    gear.RDM_EMPY_Feet		=	{ name	=	"Lethargy Houseaux +1"}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = "Toro Cape"
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = "Toro Cape"
	gear.obi_high_nuke_waist = "Refoccilation Stone"

    gear.RDM_MND_Cape = {name	=	"Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}} --*
	gear.RDM_INT_Cape ={name	=	"Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10',}} --*
	gear.RDM_TP_Cape ={name	=	"Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Damage taken-5%',}} --*
    gear.RDM_WS1_Cape ={name	=	"Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+2','Weapon skill damage +10%',}} --*
	gear.RDM_WS2_Cape ={name	=	"Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10',}} --*
	gear.RDM_WS3_Cape ={name	=	"Sucellos's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}} --*

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
--	send_command('bind ^@!` input /ja "Accession" <me>')
--	send_command('bind ^backspace input /ja "Saboteur" <me>')
--	send_command('bind !backspace input /ja "Spontaneity" <t>')
--	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
--	send_command('bind != input /ja "Penury" <me>')
--	send_command('bind @= input /ja "Parsimony" <me>')
--	send_command('bind ^delete input /ja "Dark Arts" <me>')
--	send_command('bind !delete input /ja "Addendum: Black" <me>')
--	send_command('bind @delete input /ja "Manifestation" <me>')
--	send_command('bind ^\\\\ input /ma "Protect V" <t>')
--	send_command('bind @\\\\ input /ma "Shell V" <t>')
--	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
--	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
--	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
--	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
--	send_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcDaggers;gs c set weaponskillmode proc')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body	=	gear.RDM_RELIC_Body}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = 
	{
		head	=	gear.Taeon_Phalanx_head, 
		body	=	gear.Taeon_Phalanx_body, 
        hands	=	gear.Taeon_PhalWalz_hands, 
        legs	=	gear.Taeon_PhalWalz_legs, 
        feet	=	gear.Taeon_PhalWalz_feet, 
		neck	=	"Phalaina Locket",
		ring1	=	"Asklepian Ring",
        waist	=	"Gishdubar Sash"		
	}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz']=  {}

	-- Fast cast sets for spells
	
	sets.precast.FC = 
	{
		main	=	gear.grioavolr_fc_staff,
		sub		=	"Clerisy Strap +1",
		range	=	empty,
		ammo	=	"Impatiens",
		head	=	gear.RDM_AF_Head,
		neck	=	"Voltsurge Torque",
		ear1	=	"Enchntr. Earring +1",
		ear2	=	"Malignance Earring",
		body	=	gear.RDM_RELIC_Body,
		hands	=	"Gende. Gages +1",
		ring1	=	"Kishar Ring",
		ring2	=	"Lebeche Ring",
		back	=	"Perimede Cape",
		waist	=	"Witful Belt",
		legs	=	"Psycloth Lappas",
		feet	=	gear.merlinic_aspir_feet
	}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body	=	"Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main	=	"Daybreak",sub	=	"Ammurapi Shield"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = 
	{
        ammo	=	"Ginsen",
		head	=	gear.RDM_RELIC_Head,
		body 	=	gear.RDM_RELIC_Body,
        hands	=	gear.RDM_AF_Hands,
		legs	=	gear.Jhakri_Legs,
		feet	=	gear.Jhakri_Feet,
        neck	=	"Caro Necklace",
		ear1	=	"Moonshade Earring",
		ear2	=	"Sherida Earring",
        ring1	=	"Karieyh Ring",
		ring2	=	"Rufescent Ring",
		back	=	gear.RDM_WS1_Cape,
		waist	=	"Sailfi Belt +1",	
	}
		
	sets.precast.WS.Acc = 
		set_combine(sets.precast.WS, 
		{
			ear2	=	"Telos Earring",
			waist	=	"Grunfeld Rope",
		}
	)
		
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = 
	{
		ammo	=	"Regal Gem",
		head	=	"Carmine Mask +1",
		body	=	gear.RDM_RELIC_Body,
		hands	=	gear.RDM_AF_Hands,
		legs	=	gear.RDM_AF_Legs,
		feet	=	gear.Jhakri_Feet,
		neck	=	"Fotia Gorget",
		waist	=	"Fotia Belt",
		ear1	=	"Moonshade Earring",
		ear2	= 	"Sherida Earring",
		ring1	=	"Petrov Ring",
		ring2	=	"Rufescent Ring",
		back	=	gear.RDM_WS1_Cape,
	}
	
	sets.precast.WS['Chant Du Cygne'] = 
	{
		ammo	=	"Yetshila",
		head	=	gear.Taeon_Crit_head,
		body	=	"Malignance Tabard",
		hands	=	gear.RDM_AF_Hands,
		legs 	=	gear.RDM_RELIC_Legs,
		feet	=	"Thereoid Greaves",
		neck	=	"Fotia Gorget",
		ear1	=	"Moonshade Earring",
		ear2	=	"Sherida Earring",
		ring1	=	"Ilabrat Ring",
		ring2	=	"Begrudging Ring", 	
		back	=	gear.RDM_WS2_Cape,
		waist	=	"Fotia Belt"
	}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = 
	{
		ammo	=	"Regal Gem",
		head	=	gear.RDM_RELIC_Head,
		body 	=	gear.RDM_RELIC_Body,
        hands	=	gear.RDM_AF_Hands,
		legs	=	gear.Jhakri_Legs,
		feet	=	gear.Jhakri_Feet,		
        neck	=	"Caro Necklace",
		ear1	=	"Moonshade Earring",		
        ear2	=	"Regal Earring",
        ring1	=	"Karieyh Ring",		
		ring2	=	"Rufescent Ring",
		back	=	gear.RDM_WS1_Cape,
		waist	=	"Sailfi Belt +1"	
	}
		
	sets.precast.WS['Sanguine Blade'] = 
	{
		ammo	=	"Ghastly Tathlum",
        head	=	"Pixie Hairpin +1",
		body	=	gear.Merli_WSD_body,
		hands	=	gear.Jhakri_Hands,
        legs	=	gear.Jhakri_Legs,
		feet	=	gear.Jhakri_Feet,
        neck	=	"Sanctity Necklace",
        ear1	=	"Regal Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Karieyh Ring",
		ring2	=	"Archon Ring",
        back	=	gear.RDM_INT_Cape,
        waist	=	"Refoccilation Stone"
	}
		
	sets.precast.WS['Seraph Blade'] = 
	{
		ammo	=	"Regal Gem",
        head	=	gear.RDM_RELIC_Head,
		body	=	gear.Merli_WSD_body,
		hands	=	gear.Jhakri_Hands,
        legs	=	gear.Jhakri_Legs,
		feet	=	gear.Jhakri_Feet,
        neck	=	"Sanctity Necklace",
        ear1	=	"Moonshade Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Karieyh Ring",
		ring2	=	"Shiva Ring +1",
        back	=	gear.RDM_INT_Cape,
        waist	=	"Refoccilation Stone"
	}
		
	sets.precast.WS['Aeolian Edge'] = 
	{
		ammo	=	"Ghastly Tathlum",
        head	=	gear.RDM_RELIC_Head,
		body	=	gear.Merli_WSD_body,
		hands	=	gear.Jhakri_Hands,
        legs	=	gear.Jhakri_Legs,
		feet	=	gear.Jhakri_Feet,
        neck	=	"Sanctity Necklace",
        ear1	=	"Moonshade Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Karieyh Ring",
		ring2	=	"Shiva Ring +1",
        back	=	gear.RDM_INT_Cape,
        waist	=	"Refoccilation Stone"
	}
	
	sets.precast.WS['Empyreal Arrow'] = 
	{
		range	=	"Ullr",
		ammo	=	"Demon Arrow",
		head	=	"Malignance Chapeau",
		body	=	"Malignance Tabard",
		hands	=	gear.Taeon_Trip_hands,
		legs	=	"Malignance Tights",
		feet	=	gear.Taeon_Trip_feet,
		neck	=	"Sanctity Necklace",
		waist	=	"Eschan Stone",
		ear1	=	"Moonshade Earring",
		ear2	=	"Telos Earring",
		ring1	=	"Paqichikaji Ring",
		ring2	=	"Bellona's Ring",
		back 	=	gear.RDM_WS3_Cape
    }

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter)
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body	=	"Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = 
	{
		head	=	gear.Merli_Burst_head,
		hands	=	"Ea Cuffs",
		ring2	=	"Mujin Band",
		legs	=	gear.Merli_Burst_legs,
		feet	=	gear.Chiro_Burst_feet
	}
	
	sets.midcast.FastRecast = 
	{
		main	=	gear.grioavolr_fc_staff,
		sub	=	"Clerisy Strap +1",
		range	=	empty,
		ammo	=	"Hasty Pinion +1",
		head	=	gear.RDM_AF_Head,
		neck	=	"Voltsurge Torque",
		ear1	=	"Enchntr. Earring +1",
		ear2	=	"Malignance Earring",
		body	=	"Zendik Robe",
		hands	=	"Gende. Gages +1",
		ring1	=	"Kishar Ring",
		ring2	=	"Prolix Ring",
		back	=	"Swith Cape +1",
		waist	=	"Witful Belt",
		legs	=	"Psycloth Lappas",
		feet	=	"Medium's Sabots"
	}
	
	
    sets.midcast.SpellInterrupt = 
	{
		ammo	=	"Staunch Tathlum", --10
		hands	=	"Chironic Gloves", 
        legs	=	"Carmine Cuisses +1", --20
		ring1	=	"Evanescence Ring", --5
		--   waist="Rumination Sash", --10
    }

    sets.midcast.Cure = 
	{
        main	=	"Daybreak", 
        sub		=	"Sors Shield", 
        ammo	=	"Regal Gem", 
        head	=	"Vanya Hood", 
        body	=	gear.RDM_RELIC_Body, 
        hands	=	"Vanya Cuffs", 
        legs	=	gear.RDM_AF_Legs, 
        feet	=	"Vanya Clogs", 
        neck	=	"Incanter's Torque",
        ear2	=	"Mendi. Earring", 
        ear1	=	"Roundel Earring", 
        ring1	=	"Menelaus's Ring", 
        ring2	=	"Sirona's Ring",
        back	=	"Pahtli Cape", 
        waist	=	"Pythia Sash"
    }
		
    sets.midcast.LightWeatherCure = 
	{
		main	=	"Chatoyant Staff",
		sub		=	"Enki Strap", 
        ammo	=	"Regal Gem", 
        head	=	"Vanya Hood", 
        body	=	gear.RDM_RELIC_Body, 
        hands	=	"Vanya Cuffs", 
        legs	=	gear.RDM_AF_Legs, 
        feet	=	"Vanya Clogs", 
        neck	=	"Incanter's Torque",
        ear2	=	"Mendi. Earring", 
        ear1	=	"Roundel Earring", 
        ring1	=	"Menelaus's Ring", 
        ring2	=	"Sirona's Ring",
        back	=	"Pahtli Cape", 
        waist	=	"Pythia Sash"
    }
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = 
	{
		main	=	"Chatoyant Staff",
		sub		=	"Enki Strap", 
        ammo	=	"Regal Gem", 
        head	=	"Vanya Hood", 
        body	=	gear.RDM_RELIC_Body, 
        hands	=	"Vanya Cuffs", 
        legs	=	gear.RDM_AF_Legs, 
        feet	=	"Vanya Clogs", 
        neck	=	"Incanter's Torque",
        ear2	=	"Mendi. Earring", 
        ear1	=	"Roundel Earring", 
        ring1	=	"Menelaus's Ring", 
        ring2	=	"Sirona's Ring",
        back	=	"Pahtli Cape", 
        waist	=	"Pythia Sash"
    }
		
    sets.midcast.StatusRemoval = 
	{
		head	=	"Vanya Hood",
		--  body=	"Vanya Robe",
        legs	=	"Atrophy Tights +2",
        feet	=	"Vanya Clogs",
        neck	=	"Incanter's Torque",
		--  ear2="Healing Earring",
        ring1	=	"Menelaus's Ring",
		ring2	=	"Ephedra Ring",
        back	=	gear.RDM_MND_Cape,
		--  waist="Bishop's Sash",
    }

    sets.midcast.Cursna = 
		set_combine(sets.midcast.StatusRemoval, 
		{
			--   hands="Hieros Mittens",
			neck	=	"Malison Medallion",
			--   ear1="Beatific Earring",
			--   back="Oretan. Cape +1",
		})
	
	sets.midcast.Curaga = sets.midcast.Cure
	
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
	
--	sets.Self_Refresh {back	=	"Grapevine Cape",waist	=	"Gishdubar Sash"}  -- to test

    sets.midcast['Enhancing Magic'] = 
	{
		main	=	gear.Colada_ENH,
        sub		=	"Ammurapi Shield",
        ammo	=	"Regal Gem",
        head	=	"Befouled Crown",
        body	=	gear.RDM_RELIC_Body,
        hands	=	gear.RDM_RELIC_Hands, 
        legs	=	gear.RDM_AF_Legs, 
        feet	=	gear.RDM_EMPY_Feet,
        neck	=	"Incanter's Torque",
        ear1	=	"Malignance Earring",
        ear2	=	"Andoaa Earring",
        ring1	=	"Stikini Ring",
        ring2	=	"Stikini Ring",
        back	=	"Ghostfyre Cape",
        waist	=	"Olympus Sash",
    }
	
	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = 
	{
		head="Lethargy Chappel +1",
		neck="Duelist's Torque",
		body=gear.RDM_RELIC_Body,
		hands=gear.RDM_AF_Hands,
		legs="Lethargy Fuseau +1",
		feet="Lethargy Houseaux +1"
	}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = 
	{
		main	=	"Pukulatmuj +1",head	=	"Befouled Crown",neck	=	"Incanter's Torque",ear2	=	"Mimir Earring",hands	=	gear.RDM_RELIC_Hands,back	=	"Ghostfyre Cape",waist	=	"Olympus Sash",legs	=	"Atrophy Tights +3"}
		sets.midcast.EnhancingDuration = 
		set_combine(sets.midcast['Enhancing Magic'], 
		{
			head	=	"Telchine Cap",
			neck	=	"Duelist's Torque",
			hands	=	gear.RDM_AF_Hands, 
			legs	=	"Telchine Braconi",
			waist	=	"Embla Sash",			
		})

    sets.midcast.EnhancingSkill = 
		set_combine(sets.midcast['Enhancing Magic'], 
		{
			main	=	"Pukulatmuj +1",
			sub		=	"Pukulatmuj",
			hands	=	gear.RDM_RELIC_Hands, 
		})
	
	sets.midcast['Haste II'] = 
		set_combine(sets.midcast.EnhancingDuration, {
		})

    sets.midcast.Regen = 
		set_combine(sets.midcast.EnhancingDuration, 
		{
			main	=	"Bolelabunga",
			body	=	"Telchine Chas.",
        })

    sets.midcast.Refresh = 
		set_combine(sets.midcast.EnhancingDuration, 
		{
			head	=	"Amalric Coif +1", -- +1
			body	=	gear.RDM_AF_Body, -- +3
			legs	=	gear.RDM_EMPY_Legs, -- +2
		})

    sets.midcast.RefreshSelf = 
		set_combine(sets.midcast.Refresh, 
		{
			waist	=	"Gishdubar Sash",
			-- back="Grapevine Cape"
		})

    sets.midcast.Stoneskin = 
		set_combine(sets.midcast.EnhancingSkill, 
		{
			head	=	"Umuthi Hat",
			neck	=	"Nodens Gorget",
			legs	=	"Haven Hose",
			ear1	=	"Earthcry Earring",
			waist	=	"Siegel Sash",
		})

    sets.midcast['Phalanx'] = set_combine(sets.midcast.EnhancingSkill, {
        head=gear.Taeon_Phalanx_head, --3
		body=gear.Taeon_Phalanx_body, --1
        hands=gear.Taeon_PhalWalz_hands, --2
        legs=gear.Taeon_PhalWalz_legs, --3
        feet=gear.Taeon_PhalWalz_feet, --3
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        head="Amalric Coif +1",
        waist="Emphatikos Rope",
    })

    sets.midcast.Storm = sets.midcast.EnhancingDuration	sets.midcast.BarElement =
	{
		legs	=	"Shedir Seraweels"}
		
	sets.midcast.Temper = sets.EnhancingSkill
	
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub	=	"Pukulatmuj"})
	
	sets.midcast.Enspell = sets.midcast.Temper
	
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub	=	"Pukulatmuj"})
	
	sets.midcast.BoostStat = 
	{
		hands	=	gear.RDM_RELIC_Hands
	}
	
	sets.midcast.Protect = 
	{
		ring2	=	"Sheltered Ring"}
	sets.midcast.Shell = 
	{
		ring2	=	"Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = 
	{
        main	=	"Grioavolr",
        sub		=	"Enki Strap",
        ammo	=	"Regal Gem",
        head	=	gear.RDM_RELIC_Head,
		body	=	gear.RDM_EMPY_Body,
		hands	=	"Kaykaus Cuffs +1",
        legs	=	"Chironic Hose",
        feet	=	gear.RDM_RELIC_Feet,
        neck	=	"Duelist's Torque",
        ear1	=	"Regal Earring",
        ear2	=	"Snotra Earring",
        ring1	=	"Kishar Ring",
        ring2	=	"Stikini Ring",
        back	=	gear.RDM_MND_Cape,
        waist	=	"Luminary Sash"
	}
		
	sets.midcast['Enfeebling Magic'].Resistant = 
	{
		main	=	"Daybreak",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	"Amalric Coif +1",
		body	=	gear.RDM_AF_Body,
		hands	=	"Kaykaus Cuffs +1",
        legs	=	"Chironic Hose",
        feet	=	gear.RDM_RELIC_Feet,
        neck	=	"Duelist's Torque",
        ear1	=	"Regal Earring",
        ear2	=	"Snotra Earring",
        ring1	=	"Kishar Ring",
        ring2	=	"Stikini Ring",
        back	=	gear.RDM_MND_Cape,
        waist	=	"Luminary Sash"
	}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {body	=	gear.RDM_AF_Body,range	=	"Ullr"})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist	=	"Acuity Belt +1"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist	=	"Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist	=	"Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist	=	"Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist	=	"Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist	=	"Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = 
		set_combine(sets.midcast['Enfeebling Magic'], 
		{
			sub		=	"Mephitis Grip",
			ear1	=	"Vor Earring",
			hands	=	gear.RDM_EMPY_Hands,
			ring1	=	"Stikini Ring",
			legs	=	"Psycloth Lappas"
		}
	)
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {waist	=	"Chaac Belt"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head	=	gear.RDM_RELIC_Head,waist	=	"Chaac Belt"})

    sets.midcast['Elemental Magic'] = 
	{
		main	=	"Daybreak",
        sub	=	"Ammurapi Shield",
		ammo	=	"Ombre Tathlum +1",
        head	=	gear.Jhakri_Head,
        body	=	gear.Merli_DraAsp_body,
        hands	=	"Jhakri Cuffs +2",
        legs	=	"Jhakri Slops +2",
        feet	=	gear.RDM_RELIC_Feet,
        neck	=	"Sanctity Necklace",
        ear1	=	"Regal Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Shiva Ring +1",
        ring2	=	"Shiva Ring +1",
        back	=	gear.RDM_INT_Cape,
        waist	=	"Refoccilation Stone"
	}
		
    sets.midcast['Elemental Magic'].Resistant = 
	{
		main	=	"Daybreak",
        sub	=	"Ammurapi Shield",
		range	=	"Ullr",
        head	=	gear.Jhakri_Head,
        body	=	gear.Merli_DraAsp_body,
        hands	=	"Jhakri Cuffs +2",
        legs	=	"Jhakri Slops +2",
        feet	=	gear.RDM_RELIC_Feet,
        neck	=	"Erra Pendant",
        ear1	=	"Hermetic Earring",
        ear2	=	"Malignance Earring",
        ring1	=	"Metamorph Ring +1",
        ring2	=	"Shiva Ring +1",
        back	=	gear.RDM_INT_Cape,
        waist	=	"Refoccilation Stone"
	}		
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ear1	=	"Regal Earring",ring1	=	"Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ear1	=	"Regal Earring",ring1	=	"Metamor. Ring +1"})
	
	sets.midcast.Impact = 
	{
		main	=	"Daybreak",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	empty,
		neck	=	"Dls. Torque",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
		body	=	"Twilight Cloak",
		hands	=	"Jhakri Cuffs +2",
		ring1	=	"Metamor. Ring +1",
		ring2	=	"Stikini Ring +1",
		back	=	gear.RDM_INT_Cape,
		waist	=	"Luminary Sash",
        legs	=	"Jhakri Slops +2",
        feet	=	gear.RDM_RELIC_Feet,
	}

	sets.midcast['Dark Magic'] = 
	{
		main	=	"Rubicundity",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	"Amalric Coif +1",
		neck	=	"Erra Pendant",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
		body	=	gear.RDM_AF_Body,
		hands	=	"Jhakri Cuffs +2",
		ring1	=	"Metamor. Ring +1",
		ring2	=	"Stikini Ring",
		back	=	gear.RDM_INT_Cape,
		waist	=	"Luminary Sash",
		legs	=	"Psycloth Lappas",
        feet	=	gear.Jhakri_Feet
	}

    sets.midcast.Drain = 
	{
		main	=	"Rubicundity",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
        head	=	"Pixie Hairpin +1",
		neck	=	"Erra Pendant",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
        body	=	"Psycloth Vest",
		hands	=	"Helios Gloves",
		ring1	=	"Evanescence Ring",
		ring2	=	"Archon Ring",
        back	=	gear.RDM_INT_Cape,
		waist	=	"Fucho-no-obi",
		legs	=	"Chironic Hose",
        feet	=	"Merlinic Crackows"
	}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = 
	{
		main	=	"Daybreak",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	gear.RDM_AF_Head,
		neck	=	"Dls. Torque",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
		body	=	gear.RDM_AF_Body,
		hands	=	"Jhakri Cuffs +2",
		ring1	=	"Metamor. Ring +1",
		ring2	=	"Stikini Ring",
		back	=	gear.RDM_INT_Cape,
		waist	=	"Luminary Sash",
		legs	=	"Chironic Hose",
		feet	=	gear.merlinic_aspir_feet
	}
		
	sets.midcast.Stun.Resistant = 
	{
		main	=	"Daybreak",
		sub		=	"Ammurapi Shield",
		range	=	"Ullr",
		ammo	=	empty,
		head	=	gear.RDM_AF_Head,
		neck	=	"Dls. Torque",
		ear1	=	"Regal Earring",
		ear2	=	"Malignance Earring",
		body	=	gear.RDM_AF_Body,
		hands	=	"Jhakri Cuffs +2",
		ring1	=	"Metamor. Ring +1",
		ring2	=	"Stikini Ring",
		back	=	gear.RDM_INT_Cape,
		waist	=	"Luminary Sash",
		legs	=	"Chironic Hose",
		feet	=	gear.merlinic_aspir_feet
	}
	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = 
	{
		hands	=	gear.RDM_EMPY_Hands}
	
	sets.HPDown = 
	{
		head	=	"Pixie Hairpin +1",ear1	=	"Mendicant's Earring",ear2	=	"Evans Earring",
		body	=	"Jhakri Robe +2",hands	=	"Jhakri Cuffs +2",ring1	=	"Mephitas's Ring +1",ring2	=	"Mephitas's Ring",
		back	=	"Swith Cape +1",legs	=	"Shedir Seraweels",feet	=	"Jhakri Pigaches +2"}
		
    sets.HPCure = 
	{
		main	=	"Daybreak",sub	=	"Sors Shield",range=empty,ammo	=	"Hasty Pinion +1",
        head	=	"Gende. Caubeen +1",neck	=	"Unmoving Collar +1",ear1	=	"Gifted Earring",ear2	=	"Mendi. Earring",
        body	=	gear.RDM_RELIC_Body,hands	=	"Kaykaus Cuffs",ring1	=	"Gelatinous Ring +1",ring2	=	"Meridian Ring",
        back	=	"Moonlight Cape",waist	=	"Luminary Sash",legs	=	"Carmine Cuisses +1",feet	=	"Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = 
	{
		main	=	"Chatoyant Staff",sub	=	"Oneiros Grip",range=empty,ammo	=	"Impatiens",
		head	=	gear.RDM_RELIC_Head,neck	=	"Loricate Torque +1",ear1	=	"Etiolation Earring",ear2	=	"Ethereal Earring",
		body	=	"Jhakri Robe +2",hands	=	gear.merlinic_refresh_hands,ring1	=	"Defending Ring",ring2	=	"Sheltered Ring",
		back	=	"Umbra Cape",waist	=	"Flume Belt +1",legs	=	"Lengo Pants",feet	=	gear.chironic_refresh_feet}
	

	-- Idle sets
	sets.idle = 
	{
        main="Daybreak",
        sub="Beatific Shield +1",
        ammo="Staunch Tathlum",
        head=gear.RDM_RELIC_Head,
        body=gear.RDM_AF_Body,
        hands=gear.Chiro_refresh_hands, 
        legs="Carmine Cuisses +1",
        feet=gear.Chiro_refresh_feet,
        neck="Yngvi Earring",
        ear1="Hearty Earring",
        ear2="Etiolation Earring",
        ring1="Paguroidea Ring",
        ring2="Defending Ring",
        back="Moonbeam Cape",
        waist="Slipor Sash"
	}
		
	sets.idle.DT = 
	{
		main="Mafic Cudgel",	  --10/00
        sub="Beatific Shield +1", --14/25
        ammo="Staunch Tathlum", --16/27
        head="Malignance Chapeau", --22/33
        body="Malignance Tabard", --29/42
      --  hands=gear.Ayanmo_Hands, --28/39
	 -- legs=gear.Ayanmo_Legs, --33/44
		neck="Loricate Torque +1", --34/47
		feet="Gendewitha Galoshes +1", --42/52
		back="Moonbeam Cape", --47/57
      --  ear1="Genmei Earring", --2/0
       -- ring1="Jelly Ring", --7/(-1)
        ring2="Defending Ring", --10/10
      --  waist="Slipor Sash", --0/3
	 }
		
	sets.idle.Weak = 
	{
		main	=	"Bolelabunga",
		sub	=	"Sacro Bulwark",
		range=empty,
		ammo	=	"Homiliary",
		head	=	gear.RDM_RELIC_Head,
		neck	=	"Loricate Torque +1",
		ear1	=	"Etiolation Earring",
		ear2	=	"Sanare Earring",
		body	=	"Jhakri Robe +2",
		hands	=	gear.merlinic_refresh_hands,
		ring1	=	"Defending Ring",
		ring2	=	"Dark Ring",
		back	=	"Umbra Cape",
		waist	=	"Flume Belt +1",
		legs	=	"Lengo Pants",
		feet	=	gear.chironic_refresh_feet
	}
	
	sets.idle.DT = set_combine(sets.idle.PDT, {back	=	"Umbra Cape",legs	=	"Carmine Cuisses +1",feet	=	"Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = 
	{
		main	=	"Terra's Staff",sub	=	"Umbra Strap",range=empty,ammo	=	"Staunch Tathlum +1",
		head	=	"Malignance Chapeau",neck	=	"Loricate Torque +1",ear1	=	"Etiolation Earring",ear2	=	"Ethereal Earring",
		body	=	"Malignance Tabard",hands	=	"Malignance Gloves",ring1	=	"Defending Ring",ring2	=	"Dark Ring",
		back	=	"Moonlight Cape",waist	=	"Flume Belt +1",legs	=	"Malignance Tights",feet	=	"Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = 
	{
		main	=	"Bolelabunga",sub	=	"Sacro Bulwark",range=empty,ammo	=	"Staunch Tathlum +1",
		head	=	"Malignance Chapeau",neck	=	"Warder's Charm +1",ear1	=	"Etiolation Earring",ear2	=	"Ethereal Earring",
		body	=	"Malignance Tabard",hands	=	"Malignance Gloves",ring1	=	"Defending Ring",ring2	=	"Dark Ring",
		back	=	"Moonlight Cape",waist	=	"Carrier's Sash",legs	=	"Malignance Tights",feet	=	"Malignance Boots"}
		
    sets.defense.MEVA = 
	{
		main	=	"Daybreak",sub	=	"Sacro Bulwark",range=empty,ammo	=	"Staunch Tathlum +1",
		head	=	"Malignance Chapeau",neck	=	"Warder's Charm +1",ear1	=	"Etiolation Earring",ear2	=	"Ethereal Earring",
		body	=	"Malignance Tabard",hands	=	"Malignance Gloves",ring1	=	"Defending Ring",ring2	=	"Dark Ring",
		back	=	"Moonlight Cape",waist	=	"Carrier's Sash",legs	=	"Malignance Tights",feet	=	"Malignance Boots"}
		
	sets.Kiting = 
	{
		legs	=	"Carmine Cuisses +1"}
	sets.latent_refresh = 
	{
		waist	=	"Fucho-no-obi"}
	sets.latent_refresh_grip = 
	{
		sub	=	"Oneiros Grip"}
	sets.TPEat = 
	{
		neck	=	"Chrys. Torque"}
	sets.DayIdle = 
	{
		}
	sets.NightIdle = 
	{
		}
	
	-- Weapons sets
	sets.weapons.Sequence = {main	=	"Sequence",sub	=	"Ammurapi Shield"}
	sets.weapons.Naegling=  {main	=	"Naegling",sub	=	"Ammurapi Shield"}
	sets.weapons.Almace=  {main	=	"Almace",sub	=	"Ammurapi Shield"}
	sets.weapons.DualWeapons = {main	=	"Vitiation Sword",sub	=	"Tauret"}
	sets.weapons.DualWeaponsAcc = {main	=	"Naegling",sub	=	"Almace"}
	sets.weapons.DualEvisceration = {main	=	"Tauret",sub	=	"Almace"}
	sets.weapons.DualAeolian = {main	=	"Tauret",sub	=	"Daybreak"}
	sets.weapons.DualProcDaggers = {main	=	"Blurred Knife +1",sub	=	"Atoyac"}
	sets.weapons.EnspellOnly=  {main	=	"Norgish Dagger",sub	=	"Aern Dagger",range	=	"Ullr",ammo	=	"Beetle Arrow"}
	sets.weapons.DualClubs=  {main	=	"Nehushtan",sub	=	"Nehushtan"}
	sets.weapons.DualBlackHalo = {main	=	"Kaja Rod",sub	=	"Thibron"}
	sets.weapons.DualAlmace = {main	=	"Almace",sub	=	"Sequence"}
	sets.weapons.DualBow = {main	=	"Naegling",sub	=	"Tauret",range	=	"Ullr"}
	sets.weapons.BowMacc = {range	=	"Ullr",ammo=empty}
	
    sets.buff.Sublimation = {waist	=	"Embla Sash"}
    sets.buff.DTSublimation = {waist	=	"Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = 
	{
        ammo="Ginsen",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Lissome Necklace",
        ear1="Dedition Earring",
		ear2="Sherida Earring",
        ring1="Chirich Ring",
        ring2="Petrov Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
	}
		
	sets.engaged.EnspellOnly = 
	{		
	--	main="Vitiation Sword",
	--	sub="Beatific Shield +1",  -- 4  /  25
		ammo="Staunch Tathlum",  -- 6  /  27	
		head="Malignance Chapeau",  -- 9  /  30
        body="Malignance Tabard",  -- 15  /  36
		hands=gear.Ayanmo_Hands,  -- 18  /  39
        legs=gear.Ayanmo_Legs,  -- 23  /  44
		feet="Carmine Greaves +1",
		ear1="Dedition Earring",
		ear2="Sherida Earring",
		ring1="Chirich Ring",
        ring2="Ayanmo Ring",  -- 26  /  47
        neck="Loricate Torque +1",  -- 31  /  52
     --   ring2="Defending Ring", 
		back=gear.RDM_TP_Cape,
        waist="Windbuffet Belt",	
	}

	sets.engaged.Acc = 
	{		
        ammo="Ginsen",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Lissome Necklace",
        ear1="Dedition Earring",
		ear2="Sherida Earring",
        ring1="Chirich Ring",
        ring2="Ilabrat Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
	}	
		
	sets.engaged.DT = 
	{
        ammo="Ginsen",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Malignance Tights",
        feet="Carmine Greaves +1",
        neck="Lissome Necklace",
        ear1="Dedition Earring",
		ear2="Sherida Earring",
        ring1="Chirich Ring",
        ring2="Petrov Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
	}
		
	sets.engaged.Acc.DT = 
	{
		ammo	=	"Aurgelmir Orb +1",
		head	=	"Malignance Chapeau",
		neck	=	"Loricate Torque +1",
		ear1	=	"Cessance Earring",
		ear2	=	"Sherida Earring",
		body	=	"Malignance Tabard",
		hands	=	"Hagondes Cuffs +1",
		ring1	=	"Defending Ring",
		ring2	=	"Dark Ring",
		back	=	"Moonlight Cape",
		waist	=	"Flume Belt +1",
		legs	=	"Hagondes Pants +1",
		feet	=	"Battlecast Gaiters"
	}
		
	sets.engaged.DW = {
        main="Vitiation Sword",
        sub="Tauret",
        ammo="Ginsen",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Carmine Cuisses +1",
        feet="Carmine Greaves +1",
        neck="Anu Torque",
		ear2="Sherida Earring",
        ear1="Suppanomimi",
        ring1="Ilabrat Ring",
        ring2="Chirich Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
    } --41

    sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {
     --   neck="Combatant's Torque",
     --   ring2="Ilabrat Ring",
        })
		
    -- 15% Magic Haste (67% DW to cap)
    sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {
        }) --41

    sets.engaged.DW.Acc.LowHaste = set_combine(sets.engaged.DW.LowHaste,sets.engaged.DW.MidAcc)

    -- 30% Magic Haste (56% DW to cap)
    sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {
        ammo="Ginsen",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Carmine Cuisses +1",
        feet=gear.Taeon_Trip_feet,
        neck="Anu Torque",
		ear2="Eabani Earring",
        ear1="Suppanomimi",
        ring1="Ilabrat Ring",
        ring2="Chirich Ring",
        back=gear.RDM_DW_Cape,
        waist="Sailfi Belt +1",
		}) -- /42

    sets.engaged.DW.Acc.MidHaste = set_combine(sets.engaged.DW.MidHaste,sets.engaged.DW.MidAcc)


    -- 35% Magic Haste (51% DW to cap)
    sets.engaged.DW.HighHaste = set_combine(sets.engaged.DW, {
      --  ammo="Ginsen",
      --  head="Malignance Chapeau",
      --  body="Malignance Tabard",
	  --  hands="Carmine Fin. Ga. +1",
      --  legs="Carmine Cuisses +1",
      --  feet=gear.Taeon_Trip_feet,
      --  neck="Anu Torque",
		--ear2="Eabani Earring",
      --  ear1="Suppanomimi",
      --  ring1="Ilabrat Ring",
      --  ring2="Chirich Ring",
      --  back=gear.RDM_DW_Cape,
      --  waist="Sailfi Belt +1",
        }) --29/31

    sets.engaged.DW.Acc.HighHaste = set_combine(sets.engaged.DW.HighHaste,sets.engaged.DW.MidAcc)


    -- 45% Magic Haste (36% DW to cap)
    sets.engaged.DW.MaxHaste = set_combine(sets.engaged.DW, {
		main="Vitiation Sword",
        sub="Tauret",
        ammo="Ginsen",
        head="Malignance Chapeau",
        body="Malignance Tabard",
	    hands="Carmine Fin. Ga. +1",
        legs="Carmine Cuisses +1",
        feet="Carmine Greaves +1",
        neck="Anu Torque",
		ear2="Sherida Earring",
        ear1="Suppanomimi",
        ring1="Ilabrat Ring",
        ring2="Chirich Ring",
        back=gear.RDM_TP_Cape,
        waist="Sailfi Belt +1",
		}) --11/11

    sets.engaged.DW.Acc.MaxHaste = set_combine(sets.engaged.DW.MaxHaste,sets.engaged.DW.MidAcc)

		
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	set_macro_page(1, 1)
end


function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()

end