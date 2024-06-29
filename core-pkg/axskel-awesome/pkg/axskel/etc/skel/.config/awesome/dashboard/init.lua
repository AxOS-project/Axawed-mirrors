local wid = require("dashboard.wid")
local sli = require("dashboard.sli")
local batval
awesome.connect_signal('bat::value', function(val)
  batval = val
end)


local sliders = wibox.widget {
  {
    {
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.snd,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.temp,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.mem,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.bat,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      {
        {
          font = beautiful.icofont,
          text = '',
          widget = wibox.widget.textbox,
        },
        sli.cpu,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
      },
      --{
      --  {
      --    font = beautiful.icofont,
      --    text = '',
      --    widget = wibox.widget.textbox,
      --  },
      --  sli.fs,
      --  spacing = dpi(10),
      --  layout = wibox.layout.fixed.horizontal
      --},
      spacing = dpi(10),
      layout = wibox.layout.fixed.vertical,
    },
    widget = wibox.container.margin,
    margins = dpi(20),
  },
  bg = beautiful.bg2,
  shape = help.rrect(beautiful.br),
  widget = wibox.container.background,
}

local buttons = wibox.widget {
  {
    {
      wid.wifi,
      wid.blu,
      spacing = dpi(10),
      layout = wibox.layout.flex.horizontal,
    },
    top = dpi(20),
    bottom = dpi(20),
    right = dpi(15),
    left = dpi(15),
    widget = wibox.container.margin
  },
  shape = help.rrect(beautiful.br),
  widget = wibox.container.background,
  bg = beautiful.bg2,
}

local buttons2 = wibox.widget {
  {
    {
      wid.vol,
      wid.nig,
      wid.eco,
      wid.dnd,
      spacing = dpi(10),
      layout = wibox.layout.flex.horizontal,
    },
    top = dpi(20),
    bottom = dpi(20),
    right = dpi(15),
    left = dpi(15),
    widget = wibox.container.margin
  },
  shape = help.rrect(beautiful.br),
  widget = wibox.container.background,
  bg = beautiful.bg2,
}


local dashboard = awful.popup {
  widget = {
    {
      {
        require('dashboard.oth').cal,
        layout = wibox.layout.flex.vertical,
        spacing = dpi(20),
      },
      require("dashboard.play"),
      sliders,
      buttons,
      buttons2,
      spacing = dpi(20),
      layout = wibox.layout.fixed.vertical,
    },
    margins = dpi(20),
    forced_width = dpi(300),
    widget = wibox.container.margin
  },
  shape = help.rrect(beautiful.br),
  visible = false,
  bg = beautiful.bg,
  ontop = true,
  placement = function(c)
    (awful.placement.bottom_right)(c, { margins = { right = 10, bottom = 60 } })
  end,
}


dashboard.toggle = function()
  dashboard.visible = not dashboard.visible
end

return dashboard

