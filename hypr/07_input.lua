hl.config({
  input = {
    kb_layout  = "de",
    kb_variant = "",
    kb_model   = "",
    kb_options = "",
    kb_rules   = "",

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
        disable_while_typing = true,
        natural_scroll = false,
    }
  }
})

hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = "workspace",
})

hl.device({
  name = "epic-mouse-v1",
--  sensivity = -0.5,
})
