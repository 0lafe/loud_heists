local pop_up_spawn = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_clk_up_manhole"
}

local repel_into_window = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_repel_into_window"
}

local car_spawn_left = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_car_exit_to_cbt_front_l_var2"
}

local car_spawn_right = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_car_exit_to_cbt_front_r_var2"
}

local climb_wall_spawn = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_over_2_3m"
}

local rapel_in_spawn = {
  participate_to_group_ai = true,
  enabled = true,
  spawn_action = "e_sp_jump_down_heli_cbt_right",
}

local function scripted_dozer_spawn(unit_name)
  return {
    enemy = unit_name,
    trigger_times = 1,
    enabled = true,
    spawn_action = "e_sp_bulldozer_turn_chair",
  }
end

local function optsSniper(so_id, self_id)
  return {
    enemy = "units/payday2/characters/ene_sniper_1/ene_sniper_1",
    on_executed = { { id = so_id, delay = 0 }, { id = self_id, delay = 60 } },
    trigger_times = 1000,
    enabled = true,
    execute_on_startup = false,
  }
end

local first_spawn_group_add = {
  spawn_groups = {
    400034,
    400040,
    400046,
    400052,
    400081,
    400087,
  },
  execute_on_startup = true
}

local first_spawn_group_remove = {
  elements = {
    400400
  },
  execute_on_startup = false
}

local second_spawn_group = {
  spawn_groups = {
    400028,
    400058,
    400064,
    400070,
    400076
  },
  execute_on_startup = false
}

local optsSniperSO = {
  scan = true,
  needs_pos_rsrv = true,
  align_position = true,
  align_rotation = true,
  so_action = "AI_sniper",
  pose = "stand"
}

local endless_assault_options = {
  wave_mode = "hunt",
}

return {
  elements = {
    LoudHeist:gen_dummy(
      400023,
      "loud_heists_besiege_swat_01",
      Vector3(-2950, 3000, -175),
      Rotation(90, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400024,
      "loud_heists_besiege_swat_02",
      Vector3(-2950, 3200, -175),
      Rotation(90, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400025,
      "loud_heists_besiege_swat_03",
      Vector3(-2950, 3400, -175),
      Rotation(90, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400026,
      "loud_heists_besiege_swat_04",
      Vector3(-2950, 3600, -175),
      Rotation(90, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400027,
      "loud_heists_besiege_swat_05",
      Vector3(-2950, 3800, -175),
      Rotation(90, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_spawngroup(
      400028,
      "loud_heists_initial_spawn_01",
      { 400023, 400024, 400025, 400026, 400027 },
      5
    ),

    LoudHeist:gen_dummy(
      400053,
      "loud_heists_besiege_swat_26",
      Vector3(-2775, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400054,
      "loud_heists_besiege_swat_27",
      Vector3(-2700, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400055,
      "loud_heists_besiege_swat_28",
      Vector3(-2575, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400056,
      "loud_heists_besiege_swat_29",
      Vector3(-2475, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400057,
      "loud_heists_besiege_swat_30",
      Vector3(-2375, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_spawngroup(
      400058,
      "loud_heists_second_spawn_02",
      { 400053, 400054, 400055, 400056, 400057 },
      5
    ),

    LoudHeist:gen_dummy(
      400059,
      "loud_heists_besiege_swat_31",
      Vector3(-2775, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400060,
      "loud_heists_besiege_swat_32",
      Vector3(-2700, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400061,
      "loud_heists_besiege_swat_33",
      Vector3(-2575, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400062,
      "loud_heists_besiege_swat_34",
      Vector3(-2475, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400063,
      "loud_heists_besiege_swat_35",
      Vector3(-2375, 2925, -178.204),
      Rotation(180, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_spawngroup(
      400064,
      "loud_heists_second_spawn_03",
      { 400059, 400060, 400061, 400062, 400063 },
      5
    ),

    LoudHeist:gen_dummy(
      400065,
      "loud_heists_besiege_swat_36",
      Vector3(-1050, -4175, -178.204),
      Rotation(0, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400066,
      "loud_heists_besiege_swat_37",
      Vector3(-975, -4175, -178.204),
      Rotation(0, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400067,
      "loud_heists_besiege_swat_38",
      Vector3(-900, -4175, -178.204),
      Rotation(0, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400068,
      "loud_heists_besiege_swat_39",
      Vector3(-825, -4175, -178.204),
      Rotation(0, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_dummy(
      400069,
      "loud_heists_besiege_swat_40",
      Vector3(-750, -4175, -178.204),
      Rotation(0, 0, 0),
      climb_wall_spawn
    ),
    LoudHeist:gen_spawngroup(
      400070,
      "loud_heists_second_spawn_04",
      { 400065, 400066, 400067, 400068, 400069 },
      5
    ),

    LoudHeist:gen_dummy(
      400071,
      "loud_heists_besiege_swat_41",
      Vector3(-6475, -4900, -174.996),
      Rotation(0, 0, 0),
      pop_up_spawn
    ),
    LoudHeist:gen_dummy(
      400072,
      "loud_heists_besiege_swat_42",
      Vector3(-6550, -4900, -174.996),
      Rotation(0, 0, 0),
      pop_up_spawn
    ),
    LoudHeist:gen_dummy(
      400073,
      "loud_heists_besiege_swat_43",
      Vector3(-6625, -4900, -174.996),
      Rotation(0, 0, 0),
      pop_up_spawn
    ),
    LoudHeist:gen_dummy(
      400074,
      "loud_heists_besiege_swat_44",
      Vector3(-6700, -4900, -174.996),
      Rotation(0, 0, 0),
      pop_up_spawn
    ),
    LoudHeist:gen_dummy(
      400075,
      "loud_heists_besiege_swat_45",
      Vector3(-6775, -4900, -174.996),
      Rotation(0, 0, 0),
      pop_up_spawn
    ),
    LoudHeist:gen_spawngroup(
      400076,
      "loud_heists_second_spawn_05",
      { 400071, 400072, 400073, 400074, 400075 },
      5
    ),

    LoudHeist:gen_dummy(
      400029,
      "loud_heists_besiege_swat_06",
      Vector3(900, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400030,
      "loud_heists_besiege_swat_07",
      Vector3(1000, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400031,
      "loud_heists_besiege_swat_08",
      Vector3(1100, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400032,
      "loud_heists_besiege_swat_09",
      Vector3(1225, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400033,
      "loud_heists_besiege_swat_10",
      Vector3(1325, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
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
      Vector3(2100, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400036,
      "loud_heists_besiege_swat_12",
      Vector3(1975, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400037,
      "loud_heists_besiege_swat_13",
      Vector3(1825, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400038,
      "loud_heists_besiege_swat_14",
      Vector3(1700, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400039,
      "loud_heists_besiege_swat_15",
      Vector3(1600, -400, 175.004),
      Rotation(0, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_spawngroup(
      400040,
      "loud_heists_initial_spawn_03",
      { 400035, 400036, 400037, 400038, 400039 },
      5
    ),

    LoudHeist:gen_dummy(
      400041,
      "loud_heists_besiege_swat_16",
      Vector3(925, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400042,
      "loud_heists_besiege_swat_17",
      Vector3(825, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400043,
      "loud_heists_besiege_swat_18",
      Vector3(700, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400044,
      "loud_heists_besiege_swat_19",
      Vector3(600, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400045,
      "loud_heists_besiege_swat_20",
      Vector3(475, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_spawngroup(
      400046,
      "loud_heists_initial_spawn_04",
      { 400041, 400042, 400043, 400044, 400045 },
      5
    ),

    LoudHeist:gen_dummy(
      400047,
      "loud_heists_besiege_swat_21",
      Vector3(250, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400048,
      "loud_heists_besiege_swat_22",
      Vector3(100, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400049,
      "loud_heists_besiege_swat_23",
      Vector3(-50, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400050,
      "loud_heists_besiege_swat_24",
      Vector3(-175, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_dummy(
      400051,
      "loud_heists_besiege_swat_25",
      Vector3(-325, 1225, 175.004),
      Rotation(180, 0, 0),
      rapel_in_spawn
    ),
    LoudHeist:gen_spawngroup(
      400052,
      "loud_heists_initial_spawn_05",
      { 400047, 400048, 400049, 400050, 400051 },
      5
    ),

    LoudHeist:gen_dummy(
      400077,
      "car_spawn_01",
      Vector3(614.645, 1206.07, -225.036),
      Rotation(-135, 0, 0),
      car_spawn_left
    ),
    LoudHeist:gen_dummy(
      400078,
      "car_spawn_02",
      Vector3(685.355, 1135.35, -225.036),
      Rotation(-135, 0, 0),
      car_spawn_left
    ),
    LoudHeist:gen_dummy(
      400079,
      "car_spawn_03",
      Vector3(190.381, 887.868, -225.036),
      Rotation(-135, 0, 0),
      car_spawn_right
    ),
    LoudHeist:gen_dummy(
      400080,
      "car_spawn_04",
      Vector3(278.769, 799.479, -225.036),
      Rotation(-135, 0, 0),
      car_spawn_right
    ),
    LoudHeist:gen_spawngroup(
      400081,
      "car_spawn_group_1",
      { 400077, 400078, 400079, 400080 },
      5
    ),

    LoudHeist:gen_dummy(
      400082,
      "window_spawn_01",
      Vector3(-1400, 100, 175.004),
      Rotation(-90, 0, 0),
      repel_into_window
    ),
    LoudHeist:gen_dummy(
      400083,
      "window_spawn_02",
      Vector3(-1400, 175, 175.004),
      Rotation(-90, 0, 0),
      repel_into_window
    ),
    LoudHeist:gen_dummy(
      400084,
      "window_spawn_03",
      Vector3(-1400, 250, 175.004),
      Rotation(-90, 0, 0),
      repel_into_window
    ),
    LoudHeist:gen_dummy(
      400085,
      "window_spawn_04",
      Vector3(-1400, 325, 175.004),
      Rotation(-90, 0, 0),
      repel_into_window
    ),
    LoudHeist:gen_dummy(
      400086,
      "window_spawn_05",
      Vector3(-1400, 400, 175.004),
      Rotation(-90, 0, 0),
      repel_into_window
    ),
    LoudHeist:gen_spawngroup(
      400087,
      "window_spawn_group_01",
      { 400082, 400083, 400084, 400085, 400086 },
      5
    ),

    LoudHeist:gen_preferedadd(
      400400,
      "spawn_the_first_spawn_group",
      first_spawn_group_add
    ),

    LoudHeist:gen_preferedremove(
      400401,
      "stop_spawn_the_first_spawn_group",
      first_spawn_group_remove
    ),

    LoudHeist:gen_preferedadd(
      400402,
      "spawn_the_second_spawn_group",
      second_spawn_group
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

    LoudHeist:gen_aiglobalevent(
      400700,
      "loud_heist_carshop_endless",
      endless_assault_options
    ),
  }
}
