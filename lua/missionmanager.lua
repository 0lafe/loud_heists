local mission_add = LoudHeist:mission_script_add()
if mission_add then
  -- Load the elements from the file
  Hooks:PreHook(MissionScript, "init", "loud_heist_missionmanager_init", function(self, data)
    if not LoudHeist.loaded_elements and data.name == "default" then
      for _, element in ipairs(mission_add.elements) do
        table.insert(data.elements, element)
      end
      LoudHeist.loaded_elements = true
    end
  end)
end

MissionManager.mission_script_patch_funcs = {
  values = function(self, element, data)
    for k, v in pairs(data) do
      element._values[k] = v
      LoudHeist:log('%s value "%s" has been set to "%s"', element:editor_name(), k, tostring(v))
    end
  end,

  on_executed = function(self, element, data)
    for _, v in pairs(data) do
      local new_element = self:get_element_by_id(v.id)
      if new_element then
        local val, i = table.find_value(element._values.on_executed, function(val)
          return val.id == v.id
        end)
        if v.remove then
          if val then
            table.remove(element._values.on_executed, i)
            LoudHeist:log("Removed element %s from on_executed of %s", new_element:editor_name(), element:editor_name())
          end
        elseif val then
          val.delay = v.delay or 0
          val.delay_rand = v.delay_rand or 0
          LoudHeist:log("Modified element %s in on_executed of %s", new_element:editor_name(), element:editor_name())
        else
          table.insert(element._values.on_executed, v)
          LoudHeist:log("Added element %s to on_executed of %s", new_element:editor_name(), element:editor_name())
        end
      else
        LoudHeist:error("Mission script element %u could not be found", v.id)
      end
    end
  end,

  pre_func = function(self, element, data)
    Hooks:PreHook(element, "on_executed", "sh_on_executed_func_" .. element:id(), data)
    LoudHeist:log("%s hooked as pre function call trigger", element:editor_name())
  end,

  func = function(self, element, data)
    Hooks:PostHook(element, "on_executed", "sh_on_executed_func_" .. element:id(), data)
    LoudHeist:log("%s hooked as function call trigger", element:editor_name())
  end,

  spawn_instigator_ids = function(self, element, data)
    for _, v in pairs(data) do
      local new_element = self:get_element_by_id(v)
      if new_element then
        table.insert(element._values.spawn_instigator_ids, v)
        LoudHeist:log(string.format("Added element %s to spawn_instigator_ids of %s", new_element:editor_name(),
          element:editor_name()))
      else
        LoudHeist:error(string.format("Mission script element %u could not be found", v))
      end
    end
  end,

  chance = function(self, element, data)
    element._values.chance = data
    element._chance = data
  end,
}

Hooks:PreHook(MissionManager, "_activate_mission", "sh__activate_mission", function(self)
  local mission_script_elements = LoudHeist:mission_script_patches()
  if not mission_script_elements then
    return
  end

  for element_id, data in pairs(mission_script_elements) do
    local element = self:get_element_by_id(element_id)
    if not element then
      LoudHeist:error("Mission script element %u could not be found", element_id)
    else
      for patch_name, patch_data in pairs(data) do
        if self.mission_script_patch_funcs[patch_name] then
          self.mission_script_patch_funcs[patch_name](self, element, patch_data)
        else
          LoudHeist:warn("MissionManager.mission_script_patch_funcs.%s does not exist", patch_name)
        end
      end
    end
  end
end)
