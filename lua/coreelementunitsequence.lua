core:module("CoreElementUnitSequence")
core:import("CoreMissionScriptElement")
core:import("CoreCode")
core:import("CoreUnit")

function ElementUnitSequence:on_executed(instigator)
  if not self._values.enabled then
    return
  end

  local run_sequence = true

  if self._values.only_for_local_player then
    run_sequence = not managers.player:player_unit() or instigator == managers.player:player_unit()
  end

  if run_sequence then
    self._unit:damage():run_sequence_simple("run_sequence")
  end

  ElementUnitSequence.super.on_executed(self, instigator)
end

local ids = {
  133605
}

local pc_ids = {
  133601
}
