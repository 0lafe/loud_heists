Hooks:PostHook(WeaponTweakData, "init", "init_loud_heist_tweak_data", function(self, tweak_data)
  tweak_data.loud_heists = LoudHeistTweakData:new(tweak_data, self)
end)

LoudHeistTweakData = LoudHeistTweakData or class()

function LoudHeistTweakData:init(tweak_data)
  self.cage = {
    ponr_timer = 1200,
    pc_hack_timer = 400
  }
end
