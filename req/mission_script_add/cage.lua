local popUpSpawn = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_clk_up_manhole"
}

local rapelInSpawn = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_jump_down_heli_cbt_right",
}

local function scripted_dozer_spawn(unit_name)
  return {
    enemy = unit_name,
    trigger_times = 1,
    enabled = true,
  }
end

local function optsSniper(so_id, self_id)
  return {
    enemy = "units/payday2/characters/ene_sniper_1/ene_sniper_1",
    on_executed = { { id = so_id, delay = 0 }, { id = self_id, delay = 60 } },
    trigger_times = 1000,
    enabled = true,
    execute_on_startup = true,
  }
end

local first_spawn_group = {
  spawn_groups = {
    400028,
    400034,
    400040
  },
  execute_on_startup = true
}

local optsSniperSO = {
  scan = true,
  needs_pos_rsrv = true,
  align_position = true,
  align_rotation = true,
  so_action = "AI_sniper",
  pose = "stand"
}

local function incrase_pc_time(pc_id)
  return {
    trigger_list = {
      [1] = {
        id = 1,
        time = 0,
        notify_unit_id = 133601,
        name = "run_sequence",
        notify_unit_sequence = "set_hack_time_state_3"
      }
    },
    execute_on_startup = true,
    instance_name = "cag_computer_013"
  }
end

return {
  elements = {
    LoudHeist:gen_dummy(
      400023,
      "loud_heists_besiege_swat_01",
      Vector3(-3000, 3000, -200),
      Rotation(0, 0, 0),
      popUpSpawn
    ),
    LoudHeist:gen_dummy(
      400024,
      "loud_heists_besiege_swat_02",
      Vector3(-3000, 3200, -200),
      Rotation(0, 0, 0),
      popUpSpawn
    ),
    LoudHeist:gen_dummy(
      400025,
      "loud_heists_besiege_swat_03",
      Vector3(-3000, 3400, -200),
      Rotation(0, 0, 0),
      popUpSpawn
    ),
    LoudHeist:gen_dummy(
      400026,
      "loud_heists_besiege_swat_04",
      Vector3(-3000, 3600, -200),
      Rotation(0, 0, 0),
      popUpSpawn
    ),
    LoudHeist:gen_dummy(
      400027,
      "loud_heists_besiege_swat_05",
      Vector3(-3000, 3800, -200),
      Rotation(0, 0, 0),
      popUpSpawn
    ),
    LoudHeist:gen_spawngroup(
      400028,
      "loud_heists_initial_spawn_01",
      { 400023, 400024, 400025, 400026, 400027 },
      5
    ),
    LoudHeist:gen_dummy(
      400029,
      "loud_heists_besiege_swat_06",
      Vector3(800, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400030,
      "loud_heists_besiege_swat_07",
      Vector3(1000, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400031,
      "loud_heists_besiege_swat_08",
      Vector3(1200, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400032,
      "loud_heists_besiege_swat_09",
      Vector3(1400, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400033,
      "loud_heists_besiege_swat_10",
      Vector3(1600, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_spawngroup(
      400034,
      "loud_heists_initial_spawn_02",
      { 400029, 400030, 400031, 400032, 400033 },
      5
    ),
    LoudHeist:gen_dummy(
      400035,
      "loud_heists_besiege_swat_11",
      Vector3(950, 1200, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400036,
      "loud_heists_besiege_swat_12",
      Vector3(750, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400037,
      "loud_heists_besiege_swat_13",
      Vector3(550, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400038,
      "loud_heists_besiege_swat_14",
      Vector3(350, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_dummy(
      400039,
      "loud_heists_besiege_swat_15",
      Vector3(150, -400, 176),
      Rotation(0, 0, 0),
      rapelInSpawn
    ),
    LoudHeist:gen_spawngroup(
      400040,
      "loud_heists_initial_spawn_03",
      { 400035, 400036, 400037, 400038, 400039 },
      5
    ),
    LoudHeist:gen_preferedadd(
      400400,
      "spawn_the_first_spawn_group",
      first_spawn_group
    ),

    LoudHeist:gen_dummy(
      400500,
      "sniper_spawn_point_1",
      Vector3(-6675, -2575, 1100),
      Rotation(-90, 0, 0),
      optsSniper(400501, 400500)
    ),
    LoudHeist:gen_so(
      400501,
      "sniper_spawn_point_1_so",
      Vector3(-6300, -2575, 1100),
      Rotation(-90, 0, 0),
      optsSniperSO
    ),
    LoudHeist:gen_dummy(
      400502,
      "sniper_spawn_point_2",
      Vector3(-6675, -2075, 1100),
      Rotation(-90, 0, 0),
      optsSniper(400503, 400502)
    ),
    LoudHeist:gen_so(
      400503,
      "sniper_spawn_point_2_so",
      Vector3(-6300, -2075, 1100),
      Rotation(-90, 0, 0),
      optsSniperSO
    ),
    LoudHeist:gen_dummy(
      400504,
      "sniper_spawn_point_3",
      Vector3(1825, -5525, 825),
      Rotation(45, 0, 0),
      optsSniper(400505, 400504)
    ),
    LoudHeist:gen_so(
      400505,
      "sniper_spawn_point_3_so",
      Vector3(1500, -5200, 825),
      Rotation(45, 0, 0),
      optsSniperSO
    ),

    LoudHeist:gen_dummy(
      400601,
      "upstairs_key_dozer_1",
      Vector3(200, 575, 174.964),
      Rotation(0, 0, 0),
      scripted_dozer_spawn("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")
    ),
    LoudHeist:gen_dummy(
      400602,
      "upstairs_key_dozer_2",
      Vector3(50, 575, 174.964),
      Rotation(0, 0, 0),
      scripted_dozer_spawn("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")
    ),
    LoudHeist:gen_dummy(
      400603,
      "upstairs_key_dozer_3",
      Vector3(200, 775, 174.964),
      Rotation(0, 0, 0),
      scripted_dozer_spawn("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
    ),
    LoudHeist:gen_dummy(
      400604,
      "upstairs_key_dozer_4",
      Vector3(50, 775, 174.964),
      Rotation(0, 0, 0),
      scripted_dozer_spawn("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
    ),
    LoudHeist:gen_dummy(
      400605,
      "downstairs_key_dozer_1",
      Vector3(1025, -375, -175.036),
      Rotation(0, 180, 0),
      scripted_dozer_spawn("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")
    ),
    LoudHeist:gen_dummy(
      400606,
      "downstairs_key_dozer_2",
      Vector3(850, -375, -175.036),
      Rotation(0, 180, 0),
      scripted_dozer_spawn("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")
    ),
    LoudHeist:gen_dummy(
      400607,
      "downstairs_key_dozer_3",
      Vector3(1025, -600, -175.036),
      Rotation(0, 180, 0),
      scripted_dozer_spawn("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
    ),
    LoudHeist:gen_dummy(
      400608,
      "downstairs_key_dozer_4",
      Vector3(850, -600, -175.036),
      Rotation(0, 180, 0),
      scripted_dozer_spawn("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
    ),
  }
}
