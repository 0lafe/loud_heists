local function loud_heist_overwrite()
  local heists = {
    cage = true
  }

  return heists[managers.job:current_job_id()]
end

Hooks:PostHook(PlayerStandard, "init", "toggle_forced_loud", function(self, unit)
  if Network:is_server() and loud_heist_overwrite() then
    -- managers.groupai:state():set_whisper_mode(false)
    managers.player:set_player_state("standard")
  end
end)
