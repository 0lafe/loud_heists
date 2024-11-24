local old_start = TimerGui._start
function TimerGui:_start(timer, ...)
  local tweak = tweak_data.loud_heists[managers.job:current_job_id()]
  if tweak then
    timer = tweak.pc_hack_timer
  end
  old_start(self, timer, ...)
end
