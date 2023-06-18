dofile("data/scripts/lib/mod_settings.lua")

local mod_id = "gold_decay"

mod_settings_version = 1
mod_settings =
{
  {
    id = "mode",
    ui_name = "Decay Mode",
    ui_description = [[Determines how Gold Decay is applied]],
    value_default = "perk",
    values = {
      {"perk", "Replace Gold is Forever"}, {"always", "Get Perk on Spawn"},
      {"off", "Disabled"}
    },
    scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
  },
  {
    id = "multiplier",
    ui_name = "Dust Percentage",
    ui_description = [[Nuggets drop this much gold upon decay]],
    value_default = 100,
    value_min = 1,
    value_max = 100,
    scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
  },
  {
    id = "dust_trails",
    ui_name = "Dust Trails",
    ui_description = [[Nuggets will drop some of their gold in dust over time, leaving trails as they move around]],
    value_default = false,
    scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
  }
}


function ModSettingsUpdate( init_scope )
  local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
  mod_settings_update( mod_id, mod_settings, init_scope )
end


function ModSettingsGuiCount()
  return mod_settings_gui_count( mod_id, mod_settings )
end


function ModSettingsGui( gui, in_main_menu )
  mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
