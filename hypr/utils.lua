local function layout_bind(bind_table)
  return function()
    local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

    if not workspace then
      return
    end

    local layout = workspace.tiled_layout

    if bind_table[layout] then
      hl.dispatch(bind_table[layout])
    end
  end
end

return { layout_bind = layout_bind }
