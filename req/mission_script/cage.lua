return {
  -- alarm
  [100022] = {
    on_executed = {
      { id = 106772, remove = true },
      { id = 105040, remove = true },
      { id = 400700, delay = 0 },
      { id = 400500, delay = 60 },
      { id = 400502, delay = 60 },
      { id = 400504, delay = 60 },
    }
  },
  -- top keypad door opened
  [102340] = {
    on_executed = {
      { id = 400601, delay = 0 },
      { id = 400602, delay = 0 },
      { id = 400603, delay = 0 },
      { id = 400604, delay = 0 },
    }
  },
  -- bottom keypad door opened
  [100027] = {
    on_executed = {
      { id = 400605, delay = 0 },
      { id = 400606, delay = 0 },
      { id = 400607, delay = 0 },
      { id = 400608, delay = 0 },
    }
  },

  -- Hack Success
  [100216] = {
    on_executed = {
      { id = 400401, delay = 0 },
      { id = 400402, delay = 0 },
      { id = 105040, delay = 0 },
    }
  },

  -- PONR timer
  [105040] = {
    values = {
      time_easy = 360,
      time_normal = 360,
      time_hard = 360,
      time_overkill = 360,
      time_overkill_145 = 360,
      time_easy_wish = 360,
      time_overkill_290 = 360,
      time_sm_wish = 360,
    }
  }
}
