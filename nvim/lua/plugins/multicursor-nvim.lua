return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    vim.keymap.set({ "n", "v" }, "<A-up>", function()
      mc.addCursor("k")
    end, { desc = "Add cursor above current cursor" })
    vim.keymap.set({ "n", "v" }, "<A-down>", function()
      mc.addCursor("j")
    end, { desc = "Add cursor below current cursor" })

    -- -- Add a cursor and jump to the next word under cursor.
    -- vim.keymap.set({ "n", "v" }, "<A-n>", function()
    --   mc.addCursor("*")
    -- end)

    -- -- Jump to the next word under cursor but do not add a cursor.
    -- vim.keymap.set({ "n", "v" }, "<A-s>", function()
    --   mc.skipCursor("*")
    -- end)

    -- Rotate the main cursor.
    vim.keymap.set({ "n", "v" }, "<A-left>", mc.nextCursor)
    vim.keymap.set({ "n", "v" }, "<A-right>", mc.prevCursor)

    -- Delete the main cursor.
    vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

    -- Add and remove cursors with control + left click.
    vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add cursor by clicking" })

    vim.keymap.set({ "n", "v" }, "<c-q>", function()
      if mc.cursorsEnabled() then
        -- Stop other cursors from moving.
        -- This allows you to reposition the main cursor.
        mc.disableCursors()
      else
        mc.addCursor()
      end
    end, { desc = "Remove cursors, reposition the main cursor" })

    vim.keymap.set("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end)

    vim.keymap.set("n", "<leader>ba", mc.alignCursors, { desc = "Align cursor columns" })

    -- Split visual selections by regex.
    vim.keymap.set("v", "S", mc.splitCursors)

    -- Append/insert for each line of visual selections.
    vim.keymap.set("v", "I", mc.insertVisual)
    vim.keymap.set("v", "A", mc.appendVisual)

    -- match new cursors within visual selections by regex.
    vim.keymap.set("v", "M", mc.matchCursors)

    -- Rotate visual selection contents.
    vim.keymap.set("v", "<leader>t", function()
      mc.transposeCursors(1)
    end)
    vim.keymap.set("v", "<leader>T", function()
      mc.transposeCursors(-1)
    end)

    -- Customize how cursors look.
    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
  end,
}
