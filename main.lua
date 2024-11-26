if not LoudHeist then
  LoudHeist = {
    mod_path = ModPath,
    required = {},
    loaded_elements = false
  }

  function LoudHeist:require(file)
    local path = self.mod_path .. "req/" .. file .. ".lua"
    return io.file_is_readable(path) and blt.vm.dofile(path)
  end

  function LoudHeist:log(...)
    if self.logging then
      log("[StreamlinedHeistingAI] " .. table.concat({ ... }, " "))
    end
  end

  function LoudHeist:warn(...)
    log("[StreamlinedHeistingAI][Warning] " .. table.concat({ ... }, " "))
  end

  function LoudHeist:error(...)
    log("[StreamlinedHeistingAI][Error] " .. table.concat({ ... }, " "))
  end

  function LoudHeist:mission_script_patches()
    if self._mission_script_patches == nil then
      local level_id = Global.game_settings and Global.game_settings.level_id
      if level_id then
        self._mission_script_patches = self:require("mission_script/" .. level_id:gsub("_night$", ""):gsub("_day$", "")) or
            false
      end
    end
    return self._mission_script_patches
  end

  function LoudHeist:mission_script_add()
    LoudHeist.loaded_elements = false
    if self._mission_script_add == nil then
      local level_id = Global.game_settings and Global.game_settings.level_id
      if level_id then
        self._mission_script_add = self:require("mission_script_add/" .. level_id:gsub("_night$", ""):gsub("_day$", "")) or
            false
      end
    end
    return self._mission_script_add
  end

  function LoudHeist:gen_dummy(id, name, pos, rot, opts)
    opts = opts or {}
    return {
      id = id,
      editor_name = name,
      class = "ElementSpawnEnemyDummy",
      values = {
        execute_on_startup = opts.execute_on_startup or false,
        participate_to_group_ai = opts.participate_to_group_ai or false,
        position = pos,
        force_pickup = opts.force_pickup or "none",
        voice = opts.voice or 0,
        enemy = opts.enemy or "units/payday2/characters/ene_swat_1/ene_swat_1",
        trigger_times = opts.trigger_times or 0,
        spawn_action = opts.spawn_action or "none",
        accessibility = opts.accessibility or "any",
        on_executed = opts.on_executed or {},
        rotation = rot,
        team = opts.team or "default",
        base_delay = opts.base_delay or 0,
        enabled = opts.enabled or false,
        amount = opts.amount or 0,
        interval = opts.interval or 5,
      },
    }
  end

  function LoudHeist:gen_spawngroup(id, name, elements, interval)
    return {
      id = id,
      editor_name = name,
      class = "ElementSpawnEnemyGroup",
      values = {
        on_executed = {},
        trigger_times = 0,
        base_delay = 0,
        ignore_disabled = false,
        amount = 0,
        spawn_type = "ordered",
        team = "default",
        execute_on_startup = false,
        enabled = true,
        preferred_spawn_groups = {
          "tac_shield_wall_charge",
          "FBI_spoocs",
          "tac_tazer_charge",
          "tac_tazer_flanking",
          "tac_shield_wall",
          "tac_swat_rifle_flank",
          "tac_shield_wall_ranged",
          "tac_bull_rush",
        },
        elements = elements,
        interval = interval or 0,
      },
    }
  end

  function LoudHeist:gen_preferedadd(id, name, opts)
    opts = opts or {}
    return {
      id = id,
      editor_name = name,
      class = "ElementEnemyPreferedAdd",
      values = {
        execute_on_startup = opts.execute_on_startup or false,
        base_delay = opts.base_delay or 0,
        trigger_times = opts.trigger_times or 0,
        spawn_groups = opts.spawn_groups or {},
        on_executed = opts.on_executed or {},
        enabled = true
      },
    }
  end

  function LoudHeist:gen_preferedremove(id, name, opts)
    opts = opts or {}
    return {
      id = id,
      editor_name = name,
      class = "ElementEnemyPreferedRemove",
      values = {
        execute_on_startup = opts.execute_on_startup or false,
        elements = opts.elements or false,
        base_delay = opts.base_delay or 0,
        trigger_times = opts.trigger_times or 0,
        spawn_groups = opts.spawn_groups or {},
        on_executed = opts.on_executed or {},
        enabled = true
      },
    }
  end

  function LoudHeist:gen_unit_sequence(id, name, opts)
    opts = opts or {}
    return {
      id = id,
      editor_name = name,
      class = "ElementUnitSequence",
      module = "CoreElementUnitSequence",
      values = {
        execute_on_startup = opts.execute_on_startup or true,
        rotation = Rotation(0, 0, 0),
        position = Vector3(0, 0, 0),
        on_executed = opts.on_executed or {},
        base_delay = opts.base_delay or 0,
        enabled = true,
        trigger_list = opts.trigger_list or {},
        trigger_times = opts.trigger_times or 0,
        instance_name = opts.instance_name or nil
      },
    }
  end

  function LoudHeist:gen_so(id, name, pos, rot, opts)
    opts = opts or {}
    return {
      id = id,
      editor_name = name,
      class = "ElementSpecialObjective",
      values = {
        path_style = opts.path_style or "destination",
        align_position = opts.align_position or false,
        ai_group = "enemies",
        is_navigation_link = opts.is_navigation_link or false,
        position = pos,
        scan = opts.scan or false,
        needs_pos_rsrv = opts.needs_pos_rsrv or false,
        enabled = true,
        execute_on_startup = false,
        rotation = rot,
        base_delay = 0,
        action_duration_min = 0,
        search_position = pos,
        use_instigator = true,
        trigger_times = 0,
        trigger_on = "none",
        search_distance = 0,
        so_action = opts.so_action or "none",
        path_stance = opts.path_stance or "hos",
        path_haste = "run",
        repeatable = false,
        attitude = "engage",
        interval = 2,
        action_duration_max = 0,
        align_rotation = opts.align_rotation or false,
        pose = opts.pose or "none",
        forced = true,
        base_chance = 1,
        interaction_voice = "none",
        SO_access = opts.SO_access or "512", -- default to sniper
        chance_inc = 0,
        interrupt_dmg = 1,
        interrupt_objective = false,
        on_executed = {},
        interrupt_dis = opts.interrupt_dis or 1,
        patrol_path = "none",
      },
    }
  end

  function LoudHeist:gen_aiglobalevent(id, name, opts)
    opts = opts or {}
    return {
      id = id,
      editor_name = name,
      class = "ElementAiGlobalEvent",
      values = {
        on_executed = opts.on_executed or {},
        trigger_times = 1,
        base_delay = 0,
        execute_on_startup = false,
        enabled = true,
        wave_mode = opts.wave_mode or "none",
        AI_event = opts.AI_event or "none",
        blame = opts.blame or "empty"
      },
    }
  end

  function LoudHeist:gen_fakeassaultstate(id, name, state)
    return {
      id = id,
      editor_name = name,
      class = "ElementFakeAssaultState",
      values = {
        on_executed = {},
        trigger_times = 1,
        base_delay = 0,
        execute_on_startup = false,
        enabled = true,
        state = state or false
      },
    }
  end

  function LoudHeist:gen_playsound(id, name, rot, pos, opts)
    return {
      id = id,
      editor_name = name,
      class = "ElementPlaySound",
      module = "CoreElementPlaySound",
      values = {
        execute_on_startup = opts.execute_on_startup or false,
        rotation = rot,
        position = pos,
        use_instigator = opts.use_instigator or false,
        base_delay = opts.base_delay or 0,
        elements = opts.elements or {},
        append_prefix = opts.append_prefix or false,
        interrupt = opts.interrupt or false,
        trigger_times = opts.trigger_times or 0,
        enabled = opts.enabled or true,
        on_executed = opts.on_executed or {},
        sound_event = opts.sound_event
      }
    }
  end
end

if RequiredScript and not LoudHeist.required[RequiredScript] then
  local fname = LoudHeist.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
  if io.file_is_readable(fname) then
    dofile(fname)
  end

  LoudHeist.required[RequiredScript] = true
end
